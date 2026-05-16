/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, it, expect, Level } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import eventBusPlus from '../lib/EventBusPlus';
import { Driver, ON } from '@ohos.UiTest';

let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let subscriberInfo_MainAbility:CommonEventManager.CommonEventSubscribeInfo = {
  events: ["ACTS_DoAbility_Event"]
};
let mainability:UIAbility;
const START_ABILITY_TIMEOUT = 10000;
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 2000;
const START_ABILITY_TIMEOUT_THOUSAND = 1000;
function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function abilityTest() {

  describe('ActsChangeAbilityStagetest', () => {
    beforeAll(async (done:Function) => {
      console.info('beforeAll called');
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      let delay = 3000;
      let start = new Date().getTime();
      while (true) {
        if (globalThis.onWindowStageActive) {
          console.log(`ActsApiTest getWindwoStageActive is success`)
          break;
        }
        if (new Date().getTime() - start > delay) {
          console.log(`ActsApiTest getWindwoStageActive is failed`)
            break;
        }
    }
      await globalThis.abilitydelegator.getCurrentTopAbility().then((data:UIAbility) => {
        mainability = data
        done()
      })
    })
    console.log('====>in describe====>');

    /**
     * @tc.name   ACTS_DoAbilityForeground_0100
     * @tc.number ACTS_DoAbilityForeground_0100
     * @tc.desc   Use doAbilityForeground to change the abilitystage to foreground.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityForeground_0100', Level.LEVEL0, async (done:Function) => {
      console.log("====>in ACTS_DoAbilityForeground_0100====>");

      let mainAb2OnBacPromise = eventBusPlus.onWait('MainAbility2_onBackground');
      let mainAb2OnDesPromise = eventBusPlus.onWait('MainAbility2_onDestroy');

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let ability:UIAbility
      let UnSubscribeCallback = ():void => {
        console.log("====>UnSubscribeCallback====>");
        flag = false
        done();
      }
      let SubscribeCallBack = (err:BusinessError, data:CommonEventManager.CommonEventData):void => {
        expect(data.event == "ACTS_DoAbility_Event").assertTrue();
        console.log("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        let testAbilityState:number = globalThis.testAbilityState;
        globalThis.abilitydelegator.doAbilityForeground(ability, async (err:BusinessError) => {
          console.log("====>ACTS_DoAbilityForeground_0100 data:====>" + JSON.stringify(err));
          expect(err.code).assertEqual(0);
          if(testAbilityState !== 2) {
            await mainAb2OnBacPromise;
          }
          let num:number = globalThis.abilitydelegator.getAbilityState(ability);
          if(num !== 2) {
            await sleep(1000);
            num = globalThis.abilitydelegator.getAbilityState(ability);
          }
          console.log("====>ACTS_DoAbilityForeground_0100 getAbilityState:====>" + JSON.stringify(num));
          expect(num).assertEqual(2);
          globalThis.abilityContextMainAbility2.terminateSelf();
          await mainAb2OnDesPromise;
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          console.log("====>ACTS_DoAbilityForeground_0100 MainAbility2 terminateSelf");
        })
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          globalThis.abilitydelegator.getCurrentTopAbility().then((data:UIAbility) => {
            ability = data
            console.log("===>SubscribeInfo is====>" + JSON.stringify(ability));
            console.log("====>start startAbility====>");
            globalThis.abilitydelegator.startAbility(
              {
                bundleName: 'com.example.testapi',
                abilityName: 'MainAbility2'
              }).then(() => {
                console.log("====>startAbility end====>");
              })
          })
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          console.log('ACTS_DoAbilityForeground_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_DoAbilityForeground_0200
     * @tc.number ACTS_DoAbilityForeground_0200
     * @tc.desc   Use doAbilityForeground to change the abilitystage to foreground.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityForeground_0200', Level.LEVEL0, async (done:Function) => {
      let testAbOnForPromise = eventBusPlus.onWait('TestAbility_onForeground');
      let ability:UIAbility
      globalThis.abilitydelegator.getCurrentTopAbility().then((data:UIAbility) => {
        ability = data
        expect(JSON.stringify(data) == JSON.stringify(mainability)).assertTrue();
        console.log("====>ACTS_DoAbilityForeground_0200 getCurrentTopAbility ability data:====>" + JSON.stringify(ability));
        let testAbilityState:number = globalThis.testAbilityState;
        globalThis.abilitydelegator.doAbilityForeground(ability, async (err:BusinessError) => {
          console.log("====>ACTS_DoAbilityForeground_0200 ACTS_DoAbilityForeground_0200 data:====>" + JSON.stringify(err));
          expect(err.code).assertEqual(0);
          if(testAbilityState !== 2) {
            await testAbOnForPromise;
          }
          let num:number = globalThis.abilitydelegator.getAbilityState(ability);
          if(num !== 2) {
            await sleep(1000);
            num = globalThis.abilitydelegator.getAbilityState(ability);
          }
          console.log("====>ACTS_DoAbilityForeground_0200 getAbilityState:====>" + JSON.stringify(num));
          expect(num).assertEqual(2);
          done();
        })
      })
    })

    /**
     * @tc.name   ACTS_DoAbilityForeground_0400
     * @tc.number ACTS_DoAbilityForeground_0400
     * @tc.desc   Use doAbilityForeground to change the abilitystage to foreground.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityForeground_0400', Level.LEVEL0, async (done:Function) => {
      let mainAb2OnBacPromise = eventBusPlus.onWait('MainAbility2_onBackground');
      let mainAb2OnDesPromise = eventBusPlus.onWait('MainAbility2_onDestroy');

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let ability:UIAbility
      let UnSubscribeCallback = ():void => {
        console.log("====>UnSubscribeCallback====>");
        flag = false
        done();
      }
      let SubscribeCallBack = (err:BusinessError, data:CommonEventManager.CommonEventData):void => {
        expect(data.event == "ACTS_DoAbility_Event").assertTrue();
        console.log("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
        let testAbilityState:number = globalThis.testAbilityState;
        globalThis.abilitydelegator.doAbilityForeground(ability).then(async () => {
          console.log("====>ACTS_DoAbilityForeground_0400 data:====>");
          expect(true).assertTrue();
          if(testAbilityState !== 2) {
            await mainAb2OnBacPromise;
          }
          let num:number = globalThis.abilitydelegator.getAbilityState(ability);
          if(num !== 2) {
            await sleep(1000);
            num = globalThis.abilitydelegator.getAbilityState(ability);
          }
          console.log("====>ACTS_DoAbilityForeground_0400 getAbilityState:====>" + JSON.stringify(num));
          expect(num).assertEqual(2);
          console.log("====>ACTS_DoAbilityForeground_0400 MainAbility2 terminateSelf");
          globalThis.abilityContextMainAbility2.terminateSelf();
          await mainAb2OnDesPromise;
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        })
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          globalThis.abilitydelegator.getCurrentTopAbility().then((data:UIAbility) => {
            ability = data
            console.log("====>ability data:====>" + JSON.stringify(ability));
            console.log("====>start startAbility====>");
            globalThis.abilitydelegator.startAbility(
              {
                bundleName: 'com.example.testapi',
                abilityName: 'MainAbility2'
              }).then(() => {
              console.log("====>startAbility end====>");
            })
          })
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          console.log('ACTS_DoAbilityForeground_0400 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_DoAbilityForeground_0500
     * @tc.number ACTS_DoAbilityForeground_0500
     * @tc.desc   Use doAbilityForeground to change the abilitystage to foreground.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityForeground_0500', Level.LEVEL0, async (done:Function) => {
      let testAbOnForPromise = eventBusPlus.onWait('TestAbility_onForeground');
      let ability:UIAbility
      globalThis.abilitydelegator.getCurrentTopAbility().then((data:UIAbility) => {
        ability = data
        console.log("====>ACTS_DoAbilityForeground_0500 getCurrentTopAbility  data:====>" + JSON.stringify(data));
        console.log("====>ACTS_DoAbilityForeground_0500 getCurrentTopAbility  mainability:====>" + JSON.stringify(mainability));
        expect(JSON.stringify(data) == JSON.stringify(mainability)).assertTrue();
        console.log("====>ACTS_DoAbilityForeground_0500 getCurrentTopAbility ability data:====>" + JSON.stringify(ability));
        let testAbilityState:number = globalThis.testAbilityState;
        globalThis.abilitydelegator.doAbilityForeground(ability).then(async () => {
          console.log("====>ACTS_DoAbilityForeground_0500 data:====>");
          expect(true).assertTrue();
          if(testAbilityState !== 2) {
            await testAbOnForPromise;
          }
          let num:number = globalThis.abilitydelegator.getAbilityState(ability);
          if(num !== 2) {
            await sleep(1000);
            num = globalThis.abilitydelegator.getAbilityState(ability);
          }
          console.log("====>ACTS_DoAbilityForeground_0500 getAbilityState:====>" + JSON.stringify(num));
          expect(num).assertEqual(2);
          done();
        })
      })
    })

    /**
     * @tc.name   ACTS_DoAbilityBackground_0100
     * @tc.number ACTS_DoAbilityBackground_0100
     * @tc.desc   Use doAbilityBackground to change the abilitystage to background.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityBackground_0100', Level.LEVEL0, async (done:Function) => {
      let mainAb2OnBacPromise = eventBusPlus.onWait('MainAbility2_onBackground');
      let mainAb2OnDesPromise = eventBusPlus.onWait('MainAbility2_onDestroy');

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let UnSubscribeCallback = ():void => {
        console.log("====>UnSubscribeCallback====>");
        flag = false
        done();
      }
      let SubscribeCallBack = (err:BusinessError, data:CommonEventManager.CommonEventData):void => {
        expect(data.event == "ACTS_DoAbility_Event").assertTrue();
        console.log("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
        globalThis.abilitydelegator.getCurrentTopAbility().then((ability:UIAbility) => {
          console.log("====>getCurrentTopAbility ability data:====>" + JSON.stringify(ability));
          if (deviceSupport === 'false') {
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
            done();
            return;
          }
          globalThis.abilitydelegator.doAbilityBackground(ability, async (err:BusinessError) => {
            console.log("====>ACTS_DoAbilityBackground_0100 data:====>");
            expect(err.code).assertEqual(0);
            await mainAb2OnBacPromise;
            let num:number = globalThis.abilitydelegator.getAbilityState(ability);
            if(num !== 3) {
              await sleep(1000);
              num = globalThis.abilitydelegator.getAbilityState(ability);
            }
            console.log("====>ACTS_DoAbilityBackground_0100 getAbilityState:====>" + JSON.stringify(num));
            expect(num).assertEqual(3);
            console.log("====>ACTS_DoAbilityBackground_0100 MainAbility2 terminateSelf");
            globalThis.abilityContextMainAbility2.terminateSelf();
            await mainAb2OnDesPromise;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          })
        })
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.log("====>start startAbility====>");
          globalThis.abilitydelegator.getCurrentTopAbility().then((data:CommonEventManager.CommonEventSubscriber) => {
            console.log("====>getCurrentTopAbility ability data:====>" + JSON.stringify(data));
            globalThis.abilitydelegator.startAbility(
              {
                bundleName: 'com.example.testapi',
                abilityName: 'MainAbility2'
              }).then(() => {
                console.log("====>startAbility end====>");
              })
          })
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          console.log('ACTS_DoAbilityBackground_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_DoAbilityBackground_0500
     * @tc.number ACTS_DoAbilityBackground_0500
     * @tc.desc   Use doAbilityBackground to change the abilitystage to background.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityBackground_0500', Level.LEVEL0, async (done:Function) => {
      if (deviceSupport === 'false') {
        done();
        return;
      }

      let mainAb2OnBacPromise = eventBusPlus.onWait('MainAbility2_onBackground');
      let mainAb2OnDesPromise = eventBusPlus.onWait('MainAbility2_onDestroy');

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let UnSubscribeCallback = ():void => {
        console.log("====>UnSubscribeCallback====>");
        flag = false
        done();
      }
      let SubscribeCallBack = (err:BusinessError, data:CommonEventManager.CommonEventData):void => {
        expect(data.event == "ACTS_DoAbility_Event").assertTrue();
        console.log("====>0500 Subscribe CallBack data:====>" + JSON.stringify(data));
        globalThis.abilitydelegator.getCurrentTopAbility().then((ability2:UIAbility) => {
          console.log("====>getCurrentTopAbility ability2 data:====>" + JSON.stringify(ability2));
          globalThis.abilitydelegator.doAbilityBackground(ability2).then(async () => {
            console.log("====>ACTS_DoAbilityBackground_0500 data:====>");
            expect(true).assertTrue();
            await mainAb2OnBacPromise;
            let num:number = globalThis.abilitydelegator.getAbilityState(ability2);
            if(num !== 3) {
              await sleep(1000);
              num = globalThis.abilitydelegator.getAbilityState(ability2);
            }
            console.log("====>ACTS_DoAbilityBackground_0500 getAbilityState:====>" + JSON.stringify(num));
            expect(num).assertEqual(3);
            console.log("====>ACTS_DoAbilityBackground_0500 MainAbility2 terminateSelf");
            globalThis.abilityContextMainAbility2.terminateSelf();
            await mainAb2OnDesPromise;
            commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
          })
        })
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.log("====>start startAbility====>");
          globalThis.abilitydelegator.startAbility(
            {
              bundleName: 'com.example.testapi',
              abilityName: 'MainAbility2'
            }).then(() => {
              console.log("====>startAbility end====>");
            })
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          console.log('ACTS_DoAbilityBackground_0500 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_DoAbilityBackground_0700
     * @tc.number ACTS_DoAbilityBackground_0700
     * @tc.desc   Use doAbilityBackground to change the abilitystage to background.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityBackground_0700', Level.LEVEL0, async (done:Function) => {
      if (deviceSupport === 'false') {
        done();
        return;
      }

      let mainAb4OnCreatePromise = eventBusPlus.onWait('ACTS_DoAbility_Event');

      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.testapi',
          abilityName: 'MainAbility4'
        }).then(() => {
        console.log("====>startAbility end====>");
      })

      let callBackData:CommonEventManager.CommonEventData = await mainAb4OnCreatePromise;

      expect(callBackData.event == "ACTS_DoAbility_Event").assertTrue();

      let topAbility:UIAbility = await globalThis.abilitydelegator.getCurrentTopAbility()

      let mainAb4OnBacPromise = eventBusPlus.onWait('MainAbility4_onBackground');
      globalThis.abilitydelegator.doAbilityBackground(topAbility);
      await mainAb4OnBacPromise;
      let num1:number = globalThis.abilitydelegator.getAbilityState(topAbility);
      if(num1 !== 3) {
        await sleep(1000);
        num1 = globalThis.abilitydelegator.getAbilityState(topAbility);
      }
      console.log("====>ACTS_DoAbilityBackground_0700 getAbilityState1:====>" + " " + JSON.stringify(num1));
      expect(num1).assertEqual(3);

      let mainAb4OnForPromise2 = eventBusPlus.onWait('MainAbility4_onForeground');
      globalThis.abilitydelegator.doAbilityForeground(topAbility);
      await mainAb4OnForPromise2;
      let num2:number = globalThis.abilitydelegator.getAbilityState(topAbility);
      if(num2 !== 2) {
        await sleep(1000);
        num2 = globalThis.abilitydelegator.getAbilityState(topAbility);
      }
      console.log("====>ACTS_DoAbilityBackground_0700 getAbilityState2:====>" + " " + JSON.stringify(num2));
      expect(num2).assertEqual(2);

      let mainAb4OnBacPromise3 = eventBusPlus.onWait('MainAbility4_onBackground');
      globalThis.abilitydelegator.doAbilityBackground(topAbility);
      await mainAb4OnBacPromise3;
      let num3:number = globalThis.abilitydelegator.getAbilityState(topAbility);
      if(num3 !== 3) {
        await sleep(1000);
        num3 = globalThis.abilitydelegator.getAbilityState(topAbility);
      }
      console.log("====>ACTS_DoAbilityBackground_0700 getAbilityState3:====>" + " " + JSON.stringify(num3));
      expect(num3).assertEqual(3);

      let mainAb4OnForPromise4 = eventBusPlus.onWait('MainAbility4_onForeground');
      let mainAb4OnDesPromise = eventBusPlus.onWait('MainAbility4_onDestroy');
      globalThis.abilitydelegator.doAbilityForeground(topAbility);
      await mainAb4OnForPromise4;
      let num4:number = globalThis.abilitydelegator.getAbilityState(topAbility);
      if(num4 !== 2) {
        await sleep(1000);
        num4 = globalThis.abilitydelegator.getAbilityState(topAbility);
      }
      console.log("====>ACTS_DoAbilityBackground_0700 getAbilityState4:====>" + " " + JSON.stringify(num4));
      expect(num4).assertEqual(2);
      topAbility.context.terminateSelf();
      await mainAb4OnDesPromise;
      done();
    })

    /**
     * @tc.name   ACTS_DoAbilityBackground_0800
     * @tc.number ACTS_DoAbilityBackground_0800
     * @tc.desc   Use doAbilityBackground to change the abilitystage to background failed.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityBackground_0800', Level.LEVEL0, async (done:Function) => {
      if (deviceSupport === 'false') {
        done();
        return;
      }

      let mainAb5OnCreatePromise = eventBusPlus.onWait('ACTS_DoAbility_Event');

      globalThis.abilitydelegator.startAbility(
        {
          bundleName: 'com.example.testapi',
          abilityName: 'MainAbility5'
        }).then(() => {
        console.log("====>startAbility end====>");
      })

      let callBackData:CommonEventManager.CommonEventData = await mainAb5OnCreatePromise;

      expect(callBackData.event == "ACTS_DoAbility_Event").assertTrue();

      let topAbility:UIAbility = await globalThis.abilitydelegator.getCurrentTopAbility()

      let mainAb5OnBacPromise = eventBusPlus.onWait('MainAbility5_onBackground');
      globalThis.abilitydelegator.doAbilityBackground(topAbility);
      await mainAb5OnBacPromise;
      let num1:number = globalThis.abilitydelegator.getAbilityState(topAbility);
      if(num1 !== 3) {
        await sleep(1000);
        num1 = globalThis.abilitydelegator.getAbilityState(topAbility);
      }
      console.log("====>ACTS_DoAbilityBackground_0800 getAbilityState1:====>" + " " + JSON.stringify(num1));
      expect(num1).assertEqual(3);

      let mainAb5OnForPromise2 = eventBusPlus.onWait('MainAbility5_onForeground');
      globalThis.abilitydelegator.doAbilityForeground(topAbility);
      await mainAb5OnForPromise2;
      let num2:number = globalThis.abilitydelegator.getAbilityState(topAbility);
      if(num2 !== 2) {
        await sleep(1000);
        num2 = globalThis.abilitydelegator.getAbilityState(topAbility);
      }
      console.log("====>ACTS_DoAbilityBackground_0800 getAbilityState2:====>" + " " + JSON.stringify(num2));
      expect(num2).assertEqual(2);

      let mainAb5OnBacPromise3 = eventBusPlus.onWait('MainAbility5_onBackground');
      globalThis.abilitydelegator.doAbilityBackground(topAbility);
      await mainAb5OnBacPromise3;
      let num3:number = globalThis.abilitydelegator.getAbilityState(topAbility);
      if(num3 !== 3) {
        await sleep(1000);
        num3 = globalThis.abilitydelegator.getAbilityState(topAbility);
      }
      console.log("====>ACTS_DoAbilityBackground_0800 getAbilityState3:====>" + " " + JSON.stringify(num3));
      expect(num3).assertEqual(3);

      let mainAb5OnForPromise4 = eventBusPlus.onWait('MainAbility5_onForeground');
      let mainAb5OnDesPromise = eventBusPlus.onWait('MainAbility5_onDestroy');
      globalThis.abilitydelegator.doAbilityForeground(topAbility);
      await mainAb5OnForPromise4;
      let num4:number = globalThis.abilitydelegator.getAbilityState(topAbility);
      if(num4 !== 2) {
        await sleep(1000);
        num4 = globalThis.abilitydelegator.getAbilityState(topAbility);
      }
      console.log("====>ACTS_DoAbilityBackground_0800 getAbilityState4:====>" + " " + JSON.stringify(num4));
      expect(num4).assertEqual(2);
      topAbility.context.terminateSelf();
      await mainAb5OnDesPromise;
      done();
    })

    /**
     * @tc.name   ACTS_DoAbilityForeground_0300
     * @tc.number ACTS_DoAbilityForeground_0300
     * @tc.desc   Use doAbilityForeground to change the abilitystage to foreground failed.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityForeground_0300', Level.LEVEL0, async (done:Function) => {
      if (deviceSupport === 'false') {
        done();
        return;
      }

      let mainAb3OnDesPromise = eventBusPlus.onWait('MainAbility3_onDestroy');

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let result = null
      let flag = true
      let UnSubscribeCallback = ():void => {
        console.log("====>UnSubscribeCallback====>");
        flag = false
        done();
      }
      let SubscribeCallBack = async (err:BusinessError, data:CommonEventManager.CommonEventData):Promise<void> => {
        expect(data.event == "ACTS_DoAbility_Event").assertTrue();
        console.log("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        console.log("====>0300 Subscribe CallBack globalThis.ability3:====>" + JSON.stringify(globalThis.ability3));
        console.log("====>0300 ability3 name:====>" + JSON.stringify(globalThis.ability3.context.abilityInfo.name));
        await mainAb3OnDesPromise;
        result = globalThis.abilitydelegator.doAbilityForeground(globalThis.ability3, (err:BusinessError) => {
          console.log("====>ACTS_DoAbilityForeground_0300 data:====>" + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
        console.log("====>0300  result:====>" + JSON.stringify(result));
        expect(result).assertEqual(undefined);
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.log("====>start startAbility====>");
          globalThis.abilitydelegator.startAbility(
            {
              bundleName: 'com.example.testapi',
              abilityName: 'MainAbility3'
            }).then(() => {
              console.log("====>startAbility end====>");
            })
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          console.log('ACTS_DoAbilityForeground_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_DoAbilityForeground_0600
     * @tc.number ACTS_DoAbilityForeground_0600
     * @tc.desc   Use doAbilityForeground to change the abilitystage to foreground failed.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityForeground_0600', Level.LEVEL0, async (done:Function) => {
      if (deviceSupport === 'false') {
        done();
        return;
      }

      let mainAb3OnDesPromise = eventBusPlus.onWait('MainAbility3_onDestroy');

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let result = null
      let UnSubscribeCallback = ():void => {
        console.log("====>UnSubscribeCallback====>");
        flag = false
        done();
      }
      let SubscribeCallBack = async (err:BusinessError, data:CommonEventManager.CommonEventData):Promise<void> => {
        expect(data.event == "ACTS_DoAbility_Event").assertTrue();
        console.log("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
        await mainAb3OnDesPromise;
        result = await globalThis.abilitydelegator.doAbilityForeground(globalThis.ability3)
        console.log("====>globalThis.ability3" + JSON.stringify(result));
        expect(result).assertEqual(undefined);
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.log("====>start startAbility====>");
          globalThis.abilitydelegator.startAbility(
            {
              bundleName: 'com.example.testapi',
              abilityName: 'MainAbility3'
            }).then(() => {
              console.log("====>startAbility end====>");
            })
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          console.log('ACTS_DoAbilityForeground_0600 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_DoAbilityBackground_0300
     * @tc.number ACTS_DoAbilityBackground_0300
     * @tc.desc   Use doAbilityBackground to change the abilitystage to background failed.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityBackground_0300', Level.LEVEL0, async (done:Function) => {
      if (deviceSupport === 'false') {
        done();
        return;
      }

      let mainAb3OnDesPromise = eventBusPlus.onWait('MainAbility3_onDestroy');

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let result = null
      let UnSubscribeCallback = ():void => {
        console.log("====>UnSubscribeCallback====>");
        flag = false
        done();
      }
      let SubscribeCallBack = async (err:BusinessError, data:CommonEventManager.CommonEventData):Promise<void> => {
        expect(data.event == "ACTS_DoAbility_Event").assertTrue();
        console.log("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
        await mainAb3OnDesPromise;
        result = globalThis.abilitydelegator.doAbilityBackground(globalThis.ability3, (err:BusinessError) => {
          console.log("====>ACTS_DoAbilityBackground_0300 data:====>" + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
        console.log("====>DoAbilityBackground0300  result:====>" + JSON.stringify(result));
        expect(result).assertEqual(undefined);
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.log("====>start startAbility====>");
          globalThis.abilitydelegator.startAbility(
            {
              bundleName: 'com.example.testapi',
              abilityName: 'MainAbility3'
            }).then(() => {
              console.log("====>startAbility end====>");
            })
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          console.log('ACTS_DoAbilityBackground_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_DoAbilityBackground_0600
     * @tc.number ACTS_DoAbilityBackground_0600
     * @tc.desc   Use doAbilityBackground to change the abilitystage to background failed.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_DoAbilityBackground_0600', Level.LEVEL0, async (done:Function) => {
      if (deviceSupport === 'false') {
        done();
        return;
      }

      let mainAb3OnDesPromise = eventBusPlus.onWait('MainAbility3_onDestroy');

      let Subscriber:CommonEventManager.CommonEventSubscriber
      let flag = true
      let result = null
      let UnSubscribeCallback = ():void => {
        console.log("====>UnSubscribeCallback====>");
        flag = false
        done();
      }
      let SubscribeCallBack = async (err:BusinessError, data:CommonEventManager.CommonEventData):Promise<void> => {
        expect(data.event == "ACTS_DoAbility_Event").assertTrue();
        console.log("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
        await mainAb3OnDesPromise;
        result = globalThis.abilitydelegator.doAbilityBackground(globalThis.ability3)
        console.log("====>DoAbilityBackground0600  result:====>" + JSON.stringify(result));
        expect(result).assertEqual(undefined);
        commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
      }
      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data:CommonEventManager.CommonEventSubscriber) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, SubscribeCallBack);
          console.log("====>start startAbility====>");
          globalThis.abilitydelegator.startAbility(
            {
              bundleName: 'com.example.testapi',
              abilityName: 'MainAbility3'
            }).then(() => {
              console.log("====>startAbility end====>");
            })
        })
      })
      let timeout= ():void => {
        if (flag == true) {
          console.log('ACTS_DoAbilityBackground_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
        }
      }
      setTimeout(timeout, START_ABILITY_TIMEOUT);
    })
  })
}