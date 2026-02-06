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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import commonEvent from '@ohos.commonEventManager';
import { Driver, ON } from '@ohos.UiTest';
import display from '@ohos.display';
import base from '@ohos.base';
import StartOptions from '@ohos.app.ability.StartOptions';
import Want from '@ohos.app.ability.Want';

let displayClassId = display.getDefaultDisplaySync().id;
let driver = Driver.create();

let subscriber: commonEvent.CommonEventSubscriber;
let subscriberInfoMultiInstance: commonEvent.CommonEventSubscribeInfo = {
  events: ["MultiInstanceStartNext", "MultiInstanceStartFinish", "TestAppOnForeground"]
};
const START_ABILITY_TIMEOUT = 5000;

class WantParameters {
  startId: number = 0;
  stepNum: number = 1;
  nextStep: number = 0;
  step: Array<string> = ['testA'];
}

export default function abilityTest() {
  describe('ActsGetDisplayIdStartAbilityTest', () => {

    beforeEach(async (done: Function) => {
      setTimeout(() => {
        done();
      }, 3000)
    })

    /**
     * @tc.name   ACTS_StartAbility_2100
     * @tc.number ACTS_StartAbility_2100
     * @tc.desc   Verify Get displayId to start Ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_2100', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_StartAbility_2100====<begin');
      let id: number = -1;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0100 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>ACTS_StartAbility_2100 Subscribe CallBack data:====>" + JSON.stringify(data));

          if (data.event == "MultiInstanceStartFinish") {
            console.info('====> ACTS_StartAbility_2100 start success=====>');
            clearTimeout(id);
            console.info('====> ACTS_StartAbility_2100=====>');
            expect(data.parameters['displayId']).assertEqual(displayClassId);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe0100 CallBack====>");
            });
            done();
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_StartAbility_2100 callBackSeq = ' + data.data);
          }
        });
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_StartAbility_2100 timeout');
      }, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2100 timer id : ' + id);

      await startAbilityProcess({
        displayId: displayClassId
      }, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"],
      });
    })

    /**
     * @tc.name   ACTS_StartAbility_2300
     * @tc.number ACTS_StartAbility_2300
     * @tc.desc   Verify that the ability to start when displayId is a string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_2300', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_StartAbility_2300====<begin');
      let id: number = -1;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0200 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>ACTS_StartAbility_2300 Subscribe CallBack data:====>" + JSON.stringify(data));

          if (data.event == "MultiInstanceStartFinish") {
            console.info('====> ACTS_StartAbility_2300 start success=====>');
            clearTimeout(id);
            console.info('====> ACTS_StartAbility_2300=====>');
            expect(data.parameters['displayId']).assertEqual(0);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe0200 CallBack====>");
            })
            done();
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_StartAbility_2300 callBackSeq = ' + data.data);
          }
        });
      })

      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_StartAbility_2300 timeout');
      }, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2300 timer id : ' + id);

      await startAbilityProcess({
        displayId: "abc"
      }, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"]
      });
    })

    /**
     * @tc.name   ACTS_StartAbility_2500
     * @tc.number ACTS_StartAbility_2500
     * @tc.desc   Verify that the ability to start when the displayId is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_2500', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_StartAbility_2500====<begin');
      let id: number = -1;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0300 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>ACTS_StartAbility_2500 Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            console.info('====> ACTS_StartAbility_2500 start success=====>');
            clearTimeout(id);
            console.info('====> ACTS_StartAbility_2500=====>');
            expect(data.parameters['displayId']).assertEqual(0);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe0300 CallBack====>");
            });
            done();
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_StartAbility_2500 callBackSeq = ' + data.data);
          }
        });
      })

      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_StartAbility_2500 timeout');
      }, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2500 timer id : ' + id);

      await startAbilityProcess({
        displayId: undefined
      }, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"],
      });
    })

    /**
     * @tc.name   ACTS_StartAbility_2700
     * @tc.number ACTS_StartAbility_2700
     * @tc.desc   Validation parameters want to filter the DISPLAY_ID of parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_2700', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_StartAbility_2700====<begin');
      let id: number = -1;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create0400 Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>ACTS_StartAbility_2700 Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            console.info('====> ACTS_StartAbility_2700 start success=====>');
            clearTimeout(id);
            console.info('====> ACTS_StartAbility_2700=====>');
            expect(data.parameters['displayId']).assertEqual(0);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe0400 CallBack====>");
            });
            done();
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_StartAbility_2700 callBackSeq = ' + data.data);
          }
        });
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_StartAbility_2700 timeout');
      }, START_ABILITY_TIMEOUT);
      console.log('Start ACTS_StartAbility_2700 timer id : ' + id);

      await startAbilityProcess({}, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["testA"]
      },10);
    })
  })
}


async function startAbilityProcess(options: StartOptions, parameters: WantParameters, displayId?: number) {
  let bundleName: string;
  let abilityName: string;

  try {
    let idx = parameters.nextStep;
    switch (parameters.step[idx]) {
      case "testA":
        bundleName = "com.example.actsspecifytesthap";
        abilityName = "com.example.actsspecifytesthap.MainAbility";
        break;
      default:
        break;
    }
    parameters.nextStep = ++idx;

    let mWant:Want = {
      bundleName: bundleName,
      abilityName: abilityName,
      parameters: {
        startId: parameters.startId,
        stepNum: parameters.stepNum,
        nextStep: parameters.nextStep,
        step: parameters.step
      },
    };
    if(displayId){
      mWant = {
        bundleName: bundleName,
        abilityName: abilityName,
        parameters: {
          startId: parameters.startId,
          stepNum: parameters.stepNum,
          nextStep: parameters.nextStep,
          step: parameters.step,
          "ohos.aafwk.param.displayId": displayId,
        },
      };
    }
    globalThis.abilityContext.startAbility(mWant, options, (error: base.BusinessError) => {
      console.log('startAbilityProcess result: ' + JSON.stringify(error))
    });
    await driver.delayMs(2000);
    let allowed = await driver.findComponent(ON.id('advanced_dialog_button_1'));
    if (allowed) {
      console.log("find button");
      let point = await allowed.getBoundsCenter();
      console.log('point.x : ' + point.x + 'point.y : ' + point.y);

      await driver.click(point.x, point.y);
    }
  } catch (err) {
    console.log('ACTS_getDisplayIdTest_0100 err: ' + err)
  }
}