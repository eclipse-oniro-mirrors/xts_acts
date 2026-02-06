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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEvent from '@ohos.commonEvent';
import commonEventManager from '@ohos.commonEventManager';

let subscriberInfo_MainAbility: commonEventManager.CommonEventSubscribeInfo = {
  events: ["ACTS_Start_CommonEvent"]
};
const START_ABILITY_TIMEOUT = 4000;

export default function abilityTest() {
  describe('ACTS_TestApi', () => {
    /**
     * @tc.name   ACTS_TestRunner_0100
     * @tc.number ACTS_TestRunner_0100
     * @tc.desc   Starting mainability2 with startability succeeded.(promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_TestRunner_0100', Level.LEVEL0, async (done: Function) => {
      let data = AbilityDelegatorRegistry.getAbilityDelegator();
      expect(typeof (data)).assertEqual('object');
      done();
    })

    /**
     * @tc.name   ACTS_TestRunner_0200
     * @tc.number ACTS_TestRunner_0200
     * @tc.desc   Starting mainability2 with startability succeeded.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_TestRunner_0200', Level.LEVEL0, async (done: Function) => {
      let AbilityDelegatorArgs = AbilityDelegatorRegistry.getArguments();
      console.log("====>getArguments is====>" + JSON.stringify(AbilityDelegatorArgs));
      expect(AbilityDelegatorArgs.bundleName).assertEqual('com.example.actsstartyunnertest');
      expect(AbilityDelegatorArgs.parameters['-b']).assertEqual('com.example.actsstartyunnertest');
      expect(AbilityDelegatorArgs.parameters['-s unittest']).assertEqual('OpenHarmonyTestRunner');
      expect(AbilityDelegatorArgs.testRunnerClassName).assertEqual('OpenHarmonyTestRunner');
      done();
    })

    /**
     * @tc.name   ACTS_StartAbility_Callback_0100
     * @tc.number ACTS_StartAbility_Callback_0100
     * @tc.desc   Starting mainability2 with startability succeeded.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_Callback_0100', Level.LEVEL0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let startresult = false;
      let Delegator = AbilityDelegatorRegistry.getAbilityDelegator();

      await commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_Start_CommonEvent").assertTrue();
                console.log("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
                if (data.event == "ACTS_Start_CommonEvent") {
                  startresult = true;
                }
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log("====>UnSubscribeCallback====>");
                  flag = false;
                  expect(startresult).assertEqual(true);
                  done();
                });
              });
              console.log("====>start startAbility====>");
              Delegator.startAbility(
                {
                  bundleName: 'com.example.actsstartyunnertest',
                  abilityName: 'MainAbility2'
                }, () => {
                console.log("====>startAbility end====>");
              })
            })
        })
      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_StartAbility_Callback_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            expect(startresult).assertEqual(true);
            done();
          })
        }
      }, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_StartAbility_Callback_0200
     * @tc.number ACTS_StartAbility_Callback_0200
     * @tc.desc   Starting mainability2 with startability failed.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_Callback_0200', Level.LEVEL0, async (done: Function) => {
      let Delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let Subscriber: commonEventManager.CommonEventSubscriber;
      await commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect().assertFail();
                console.log("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log("====>UnSubscribeCallback====>");
                  done();
                });
              });
              console.log("====>start startAbility====>");
              Delegator.startAbility(
                {
                  bundleName: 'com.example.error',
                  abilityName: 'MainAbility2'
                }, () => {
                console.log("====>startAbility end====>");
              })
            })
        })
      setTimeout(() => {
        console.log('ACTS_StartAbility_Callback_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, () => {
          console.log("====>UnSubscribeCallback====>");
          done();
        })
      }, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_StartAbility_Promise_0100
     * @tc.number ACTS_StartAbility_Promise_0100
     * @tc.desc   Starting mainability2 with startability succeeded.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_Promise_0100', Level.LEVEL0, async (done: Function) => {
      let Delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let startresult = false;

      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_Start_CommonEvent").assertTrue();
                console.log("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
                if (data.event == "ACTS_Start_CommonEvent") {
                  startresult = true;
                }
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log("====>UnSubscribeCallback====>");
                  flag = false;
                  expect(startresult).assertEqual(true);
                  done();
                });
              });
              console.log("====>start startAbility====>");
              await Delegator.startAbility(
                {
                  bundleName: 'com.example.actsstartyunnertest',
                  abilityName: 'MainAbility3'
                })
                .then(() => {
                  console.log("====>startAbility end====>");
                })
            })
        })
      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_StartAbility_Promise_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            expect(startresult).assertEqual(true);
            done();
          })
        }
      }, START_ABILITY_TIMEOUT);
    })

    /**
     * @tc.name   ACTS_StartAbility_Promise_0200
     * @tc.number ACTS_StartAbility_Promise_0200
     * @tc.desc   Starting mainability2 with startability failed.(callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_StartAbility_Promise_0200', Level.LEVEL0, async (done: Function) => {
      let Delegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let Subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then(async (SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect().assertFail();
                console.log("====>0200 Subscribe CallBack data:====>" + JSON.stringify(data));
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log("====>UnSubscribeCallback====>");
                  done();
                });
              });
              console.log("====>start startAbility====>");
              await Delegator.startAbility(
                {
                  bundleName: 'com.example.error',
                  abilityName: 'MainAbility2'
                })
                .then(() => {
                  console.log("====>startAbility end====>");
                })
            })
        })
      setTimeout(() => {
        console.log('ACTS_StartAbility_Promise_0200 - timeout');
        commonEvent.unsubscribe(Subscriber, () => {
          console.log("====>UnSubscribeCallback====>");
          done();
        })
      }, START_ABILITY_TIMEOUT);
    })
  })
}