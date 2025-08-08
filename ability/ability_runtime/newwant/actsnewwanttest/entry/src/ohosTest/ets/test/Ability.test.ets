/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import backgroundTaskManager from '@ohos.backgroundTaskManager';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import {Driver, ON} from '@ohos.UiTest';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let driver = Driver.create();
let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let subscriberInfo:commonEventManager.CommonEventSubscribeInfo = {
  events: ['onCreateMain_To_Test_CommonEvent',
    'onWindowStageCreateMain_To_Test_CommonEvent',
    'onForegroundMain_To_Test_CommonEvent',
    'onNewWantMain_To_Test_CommonEvent',
    'onNewWantMain1_To_Test_CommonEvent',
    'onNewWantMain2_To_Test_CommonEvent',
    'onCreateSecond_To_Test_CommonEvent',
    'onWindowStageCreateSecond_To_Test_CommonEvent',
    'onForegroundSecond_To_Test_CommonEvent',
    'onNewWantSecond_To_Test_CommonEvent',
    'onNewWantSecond1_To_Test_CommonEvent',
    'onNewWantSecond2_To_Test_CommonEvent',
    'onNewWantSecond3_To_Test_CommonEvent',
  ],
};

let flagNewWant = false;

export default function abilityTest() {
  describe('ActsNewWantTest', () => {
    let TAG1 = 'ACTS_NewWant_Test : '
    let id:number | undefined = undefined;

    beforeEach(async (done:Function) => {
      setTimeout(() => { done(); }, 3000)
    })

    beforeAll(async (done:Function) => {
        console.log(TAG1 + "beforeAll called");
        let myReason = 'test ActsNewWantTest';
        let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.log(TAG1 + "Request suspension delay will time out.");
        })
        id = delayInfo.requestId;
        console.log(TAG1 + "requestId is : " + id);
        setTimeout(() => {
            console.log(TAG1 + "beforeAll end");
            done();
        }, 1000);
    })
        
    afterAll(async (done:Function) => {
        console.log(TAG1 + "afterAll called");
        backgroundTaskManager.cancelSuspendDelay(id);
        setTimeout(() => {
            console.log(TAG1 + "afterAll end");
            done();
        }, 1000);
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0100
     * @tc.name: Starting standard Ability for the first time does not trigger onNewWant.
     * @tc.desc: Starting standard Ability for the first time does not trigger onNewWant.
     */
    it('ACTS_NewWant_Test_0100', Level.LEVEL0, async (done:Function) => {
      console.log("ACTS_NewWant_Test_0100 --- start")
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let flagOnCreate = 0;
      let flagOnWindowStageCreate = 0;
      let flagOnForeground = 0;
      let flagOnNewWant = 0;
      
      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_NewWant_Test_0100====>UnSubscribe CallBack====>");
        expect(flagNewWant).assertTrue();
        done();
      }

      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {
        console.debug("ACTS_NewWant_Test_0100====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0100====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateMain_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateMain_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundMain_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantMain_To_Test_CommonEvent':
            flagOnNewWant++;
            break;
        }
        console.debug("ACTS_NewWant_Test_0100====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0100====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0100====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0100====>flagOnNewWant:====>"
          + flagOnNewWant)
        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 1 && flagOnNewWant == 0) {
            flagNewWant = true;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }

      await commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0100====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      await globalThis.mainAbilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.MainAbility"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_NewWant_Test_0100 - startAbility start standard: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

      await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x +'point.y : '+ point.y);
        await driver.click(point.x, point.y);
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0200
     * @tc.name: Starting singleton Ability for the first time does not trigger onNewWant.
     * @tc.desc: Starting singleton Ability for the first time does not trigger onNewWant.
     */
    it('ACTS_NewWant_Test_0200', Level.LEVEL0, async (done:Function) => {
      console.log("ACTS_NewWant_Test_0200 --- start")
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let flagOnCreate = 0;
      let flagOnWindowStageCreate = 0;
      let flagOnForeground = 0;
      let flagOnNewWant = 0;

      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_NewWant_Test_0200====>UnSubscribe CallBack====>");
        expect(flagNewWant).assertTrue();
        done();
      }

      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {

        console.debug("ACTS_NewWant_Test_0200====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0200====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateSecond_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateSecond_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundSecond_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantSecond_To_Test_CommonEvent':
            flagOnNewWant++;
            break;
        }
        console.debug("ACTS_NewWant_Test_0200====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0200====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0200====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0200====>flagOnNewWant:====>"
          + flagOnNewWant)
        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 1 && flagOnNewWant == 0) {
            flagNewWant = true;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
   
      await commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0200====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      await globalThis.mainAbilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.SecondAbility"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_NewWant_Test_0200 - startAbility start singleton: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

       await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x +'point.y : '+ point.y);
        await driver.click(point.x, point.y);
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0300
     * @tc.name: Starting standard ability the second time does not trigger onNewWant.
     * @tc.desc: Starting standard ability the second time does not trigger onNewWant.
     */
    it('ACTS_NewWant_Test_0300', Level.LEVEL0, async (done:Function) => {
      console.log("ACTS_NewWant_Test_0300 --- start")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let flagOnCreate = 0;
      let flagOnWindowStageCreate = 0;
      let flagOnForeground = 0;
      let flagOnNewWant = 0;

      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_NewWant_Test_0300====>UnSubscribe CallBack====>");
        expect(flagNewWant).assertTrue();
        done();
      }

      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {

        console.debug("ACTS_NewWant_Test_0300====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0300====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateMain_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateMain_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundMain_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantMain_To_Test_CommonEvent':
            flagOnNewWant++;
            break;
        }
        console.debug("ACTS_NewWant_Test_0300====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0300====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0300====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0300====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 2 && flagOnWindowStageCreate == 2
          && flagOnForeground == 2 && flagOnNewWant == 0) {
            flagNewWant = true;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }

      await commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0300====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      await globalThis.mainAbilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.MainAbility",
        action: "startStandard0300"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_NewWant_Test_0300 - startAbility start standard: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

       await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x +'point.y : '+ point.y);
        await driver.click(point.x, point.y);
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0400
     * @tc.name: Two abilities of the same hap
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0400', Level.LEVEL0, async (done:Function) => {
      console.log("ACTS_NewWant_Test_0400 --- start")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let flagOnCreate = 0;
      let flagOnWindowStageCreate = 0;
      let flagOnForeground = 0;
      let flagOnNewWant = 0;

      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_NewWant_Test_0400====>UnSubscribe CallBack====>");
        expect(flagNewWant).assertTrue();
        done();
      }

      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {

        console.debug("ACTS_NewWant_Test_0400====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0400====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateSecond_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateSecond_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundSecond_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantSecond1_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartSingleton');
            break;
        }
        console.debug("ACTS_NewWant_Test_0400====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0400====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0400====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0400====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 0 && flagOnWindowStageCreate == 0
          && flagOnForeground == 2 && flagOnNewWant == 1) {
            flagNewWant = true;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }

      await commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0400====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      await globalThis.mainAbilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.SecondAbility",
        action: "startSingleton0400"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_NewWant_Test_0400 - startAbility start singleton: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

       await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x +'point.y : '+ point.y);
        await driver.click(point.x, point.y);
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0500
     * @tc.name: Two haps of the same app
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0500', Level.LEVEL0, async (done:Function) => {
      console.log("ACTS_NewWant_Test_0500 --- start")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let flagOnCreate = 0;
      let flagOnWindowStageCreate = 0;
      let flagOnForeground = 0;
      let flagOnNewWant = 0;

      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_NewWant_Test_0500====>UnSubscribe CallBack====>");
        expect(flagNewWant).assertTrue();
        done();
      }
      
      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {

        console.debug("ACTS_NewWant_Test_0500====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0500====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateMain_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateMain_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundMain_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantMain1_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartHapB');
            break;
        }
        console.debug("ACTS_NewWant_Test_0500====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0500====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0500====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0500====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 2 && flagOnNewWant == 1) {
            flagNewWant = true;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }

      await commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0500====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      await globalThis.mainAbilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapb.MainAbility",
        action: "startHapB"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_NewWant_Test_0500 - startAbility start HapB: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })

       await driver.delayMs(2000);
      let allowed = await driver.findComponent(ON.text("打开"));
      if (allowed) {
        console.log("find button");
        let point = await allowed.getBoundsCenter();
        console.log('point.x : ' + point.x +'point.y : '+ point.y);
        await driver.click(point.x, point.y);
      }
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0600
     * @tc.name: Cross-application
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0600', Level.LEVEL0, async (done:Function) => {
      console.log("ACTS_NewWant_Test_0600 --- start")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let flagOnCreate = 0;
      let flagOnWindowStageCreate = 0;
      let flagOnForeground = 0;
      let flagOnNewWant = 0;

      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_NewWant_Test_0600====>UnSubscribe CallBack====>");
        expect(flagNewWant).assertTrue();
        done();
      }
      
      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {

        console.debug("ACTS_NewWant_Test_0600====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0600====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateMain_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateMain_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundMain_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantMain2_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartHapC');
            break;
        }
        console.debug("ACTS_NewWant_Test_0600====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0600====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0600====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0600====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 1 && flagOnWindowStageCreate == 1
          && flagOnForeground == 2 && flagOnNewWant == 1) {
            flagNewWant = true;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }

      await commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0600====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      await globalThis.mainAbilityContext.startAbility({
        bundleName: "com.example.newwanthapa",
        abilityName: "com.example.newwanthapc.MainAbility",
        action: "startHapC"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_NewWant_Test_0600 - startAbility start HapC: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0700
     * @tc.name: Service ability
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0700', Level.LEVEL0, async (done:Function) => {
      console.log("ACTS_NewWant_Test_0700 --- start")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let flagOnCreate = 0;
      let flagOnWindowStageCreate = 0;
      let flagOnForeground = 0;
      let flagOnNewWant = 0;

      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_NewWant_Test_0700====>UnSubscribe CallBack====>");
        expect(flagNewWant).assertTrue();
        done();
      }

      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {

        console.debug("ACTS_NewWant_Test_0700====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0700====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateSecond_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateSecond_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundSecond_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantSecond2_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartSecondAbility0700');
            break;
        }
        console.debug("ACTS_NewWant_Test_0700====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0700====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0700====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0700====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 0 && flagOnWindowStageCreate == 0
          && flagOnForeground == 2 && flagOnNewWant == 1) {
            flagNewWant = true;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }      

      await commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0700====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      await globalThis.mainAbilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.SecondAbility",
        action: "startSecondAbility0700"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_NewWant_Test_0700 - startAbility start SecondAbility: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })      
    })

    /**
     * @tc.number: ACTS_NewWant_Test_0800
     * @tc.name: API8 startup API7
     * @tc.desc: Starting singleton ability the second time does triggers onNewWant.
     */
    it('ACTS_NewWant_Test_0800', Level.LEVEL0, async (done:Function) => {
      console.log("ACTS_NewWant_Test_0800 --- start")
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let Subscriber:commonEventManager.CommonEventSubscriber;
      let flagOnCreate = 0;
      let flagOnWindowStageCreate = 0;
      let flagOnForeground = 0;
      let flagOnNewWant = 0;

      let UnSubscribeCallback = ():void => {
        console.debug("ACTS_NewWant_Test_0800====>UnSubscribe CallBack====>");
        expect(flagNewWant).assertTrue();
        done();
      }
      let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {

        console.debug("ACTS_NewWant_Test_0800====>Subscribe CallBack data:====>"
          + JSON.stringify(data));
        console.debug("ACTS_NewWant_Test_0800====>Subscribe CallBack data.event:====>"
          + JSON.stringify(data.event));
        switch (data.event) {
          case 'onCreateSecond_To_Test_CommonEvent':
            flagOnCreate++;
            break;
          case 'onWindowStageCreateSecond_To_Test_CommonEvent':
            flagOnWindowStageCreate++;
            break;
          case 'onForegroundSecond_To_Test_CommonEvent':
            flagOnForeground++;
            break;
          case 'onNewWantSecond3_To_Test_CommonEvent':
            flagOnNewWant++;
            expect(data.data).assertEqual('restartSecondAbility0800');
            break;
        }
        console.debug("ACTS_NewWant_Test_0800====>flagOnCreate:====>"
          + flagOnCreate)
        console.debug("ACTS_NewWant_Test_0800====>flagOnWindowStageCreate:====>"
          + flagOnWindowStageCreate)
        console.debug("ACTS_NewWant_Test_0800====>flagOnForeground:====>"
          + flagOnForeground)
        console.debug("ACTS_NewWant_Test_0800====>flagOnNewWant:====>"
          + flagOnNewWant)

        if (flagOnCreate == 0 && flagOnWindowStageCreate == 0
          && flagOnForeground == 2 && flagOnNewWant == 1) {
            flagNewWant = true;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }

      await commonEvent.createSubscriber(subscriberInfo).then(async (data) => {
        console.debug("ACTS_NewWant_Test_0800====>Create Subscriber====>");
        Subscriber = data;
        await commonEvent.subscribe(Subscriber, SubscribeCallBack);
      })

      await globalThis.mainAbilityContext.startAbility({
        bundleName: "com.example.newwanthap",
        abilityName: "com.example.newwanthapa.MainAbility",
        action: "startMainAbility0800"
      }, (error:BusinessError, data:common.AbilityResult) => {
        console.log('ACTS_NewWant_Test_0800 - startAbility start SecondAbility: '
          + JSON.stringify(error) + ", " + JSON.stringify(data))
      })
    })
  })
}