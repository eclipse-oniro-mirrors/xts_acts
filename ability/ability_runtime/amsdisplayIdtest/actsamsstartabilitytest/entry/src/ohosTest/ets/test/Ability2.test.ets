/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, beforeAll, Level } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent';
import {Driver, ON} from '@ohos.UiTest';
import display from '@ohos.display';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import StartOptions from '@ohos.app.ability.StartOptions';

let displayClassId = display.getDefaultDisplaySync().id;
let driver = Driver.create();
let abilityContext:common.UIAbilityContext;

let subscriberInfoMultiInstance:CommonEventManager.CommonEventSubscribeInfo = {
  events: ["MultiInstanceStartNext", "MultiInstanceStartFinish", "TestAppOnForeground"]
};
const START_ABILITY_TIMEOUT = 5000;

async function startAbilityProcess(abilityContext:common.UIAbilityContext, options:StartOptions, parameters:Record<string, Object>) {
  let bundleName:string = "";
  let abilityName:string = "";

  try {
    let idx:number = parameters.nextStep as number;
    switch (Object(parameters.step)[idx]) {
      case "testA":
        bundleName = "com.example.actsspecifytesthap";
        abilityName = "com.example.actsspecifytesthap.MainAbility";
        break;
      default:
        break;
    }
    parameters.nextStep = ++idx;
    await abilityContext.startAbility({
      bundleName: bundleName,
      abilityName: abilityName,
      parameters: parameters,
    }, options, (error, data) => {
      console.log('startAbilityProcess result: ' + JSON.stringify(error) + ", " + JSON.stringify(data))
    })
    await driver.delayMs(2000);
    let allowed = await driver.findComponent(ON.text("打开"));
    if (allowed) {
      console.log("find button");
      let point = await allowed.getBoundsCenter();
      console.log('point.x : ' + point.x +'point.y : '+ point.y);

      await driver.click(point.x, point.y);
    }
  } catch (err) {
    console.log('ACTS_getDisplayIdTest_0100 err: ' + err)
  }
}


export default function abilityTest() {
  describe('ActsGetDisplayIdStartAbilityTest', () => {
    beforeAll(async (done:Function) => {
      abilityContext = AppStorage.get("abilityContext") as common.UIAbilityContext;
      setTimeout(() => { done(); }, 3000)
    })

    beforeEach(async (done:Function) => {
      setTimeout(() => { done(); }, 3000)
    })


    /*
    * @tc.number: ACTS_StartAbility_2100
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Verify Get displayId to start Ability
    */
    it('ACTS_StartAbility_2100', Level.LEVEL0, async (done:Function) => {
      console.log('ACTS_StartAbility_2100====<begin');
      let subscriber:CommonEventManager.CommonEventSubscriber;
      let id:number;

      let subscribeCallBack = (err:BusinessError, data:CommonEventManager.CommonEventData) => {
        console.debug("====>ACTS_StartAbility_2100 Subscribe CallBack data:====>" + JSON.stringify(data));

        let processInfoCheck = async (data:CommonEventManager.CommonEventData):Promise<void> => {
          console.info('====> ACTS_StartAbility_2100=====>');
          expect(data.parameters!['displayId']).assertEqual(displayClassId);
          done();
        }

        if (data.event == "MultiInstanceStartFinish") {
          console.info('====> ACTS_StartAbility_2100 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        } else if (data.event == "MultiInstanceStartNext") {
          console.log('ACTS_StartAbility_2100 callBackSeq = ' + data.data);
        }
      }

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0100 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
      })

      let unSubscribeCallback = ():void => {
        console.debug("====>UnSubscribe0100 CallBack====>");
      }

      let timeout= ():void => {
        expect().assertFail();
        console.log('ACTS_StartAbility_2100 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2100 timer id : ' + id);

      await startAbilityProcess(abilityContext, {
        displayId: displayClassId
      }, {
        "startId": 0,
        "stepNum": 1,
        "nextStep": 0,
        "step": ["testA"],
      } as Record<string, Object>);
    })

    /*
    * @tc.number: ACTS_StartAbility_2500
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Verify that the ability to start when the displayId is undefined
    */
    it('ACTS_StartAbility_2500', Level.LEVEL0, async (done:Function) => {
      console.log('ACTS_StartAbility_2500====<begin');
      let subscriber:CommonEventManager.CommonEventSubscriber;
      let id:number;

      let subscribeCallBack = (err:BusinessError, data:CommonEventManager.CommonEventData) => {
        console.debug("====>ACTS_StartAbility_2500 Subscribe CallBack data:====>" + JSON.stringify(data));

        let processInfoCheck = async (data:CommonEventManager.CommonEventData):Promise<void> => {
          console.info('====> ACTS_StartAbility_2500=====>');
          expect(data.parameters!['displayId']).assertEqual(0);
          done();
        }

        if (data.event == "MultiInstanceStartFinish") {
          console.info('====> ACTS_StartAbility_2500 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        } else if (data.event == "MultiInstanceStartNext") {
          console.log('ACTS_StartAbility_2500 callBackSeq = ' + data.data);
        }
      }

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0300 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
      })

      let unSubscribeCallback = ():void => {
        console.debug("====>UnSubscribe0300 CallBack====>");
      }

      let timeout= ():void => {
        expect().assertFail();
        console.log('ACTS_StartAbility_2500 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2500 timer id : ' + id);

      await startAbilityProcess(abilityContext, {
        displayId: undefined
      }, {
        "startId": 0,
        "stepNum": 1,
        "nextStep": 0,
        "step": ["testA"],
      }as Record<string, Object>);
    })

    /*
    * @tc.number: ACTS_StartAbility_2700
    * @tc.name: Get the specified displayId to start Ability
    * @tc.desc: Validation parameters want to filter the DISPLAY_ID of parameters
    */
    it('ACTS_StartAbility_2700', Level.LEVEL0, async (done:Function) => {
      console.log('ACTS_StartAbility_2700====<begin');
      let subscriber:CommonEventManager.CommonEventSubscriber;
      let id:number;

      let subscribeCallBack = (err:BusinessError, data:CommonEventManager.CommonEventData) => {
        console.debug("====>ACTS_StartAbility_2700 Subscribe CallBack data:====>" + JSON.stringify(data));

        let processInfoCheck = async (data:CommonEventManager.CommonEventData):Promise<void> => {
          console.info('====> ACTS_StartAbility_2700=====>');
          expect(data.parameters!['displayId']).assertEqual(0);
          done();
        }

        if (data.event == "MultiInstanceStartFinish") {
          console.info('====> ACTS_StartAbility_2700 start success=====>');
          clearTimeout(id);
          processInfoCheck(data);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        } else if (data.event == "MultiInstanceStartNext") {
          console.log('ACTS_StartAbility_2700 callBackSeq = ' + data.data);
        }
      }

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0400 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, subscribeCallBack);
      })

      let unSubscribeCallback = ():void => {
        console.debug("====>UnSubscribe0400 CallBack====>");
      }

      let timeout= ():void => {
        expect().assertFail();
        console.log('ACTS_StartAbility_2700 timeout');
      }

      id = setTimeout(timeout, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2700 timer id : ' + id);

      await startAbilityProcess(abilityContext, {}, {
        "startId": 0,
        "stepNum": 1,
        "nextStep": 0,
        "step": ["testA"],
        "ohos.aafwk.param.displayId": 10,
      }as Record<string, Object>);
    })
  })
}