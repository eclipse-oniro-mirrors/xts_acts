/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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

import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import commonEvent from '@ohos.commonEvent';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let deviceSupport  = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

class Params {
  startId: number = 0
  stepNum: number = 0
  nextStep: number = 0
  step: string[] = []
}

let subscriberInfoMultiInstance: commonEventManager.CommonEventSubscribeInfo = {
  events: ["MultiInstanceStartNext", "MultiInstanceStartFinish"]
}
const START_ABILITY_TIMEOUT = 9000;
const ONACCEPTWANT_KEY_NOTSET_ID = -1;
const ONACCEPTWANT_KEY_UNDEFINED_ID = -2;
const UNSUBSCRIBE_TIMEOUT = 5000;

async function startAbilityProcess(testAbilityContext: common.UIAbilityContext, parameters: Params) {
  let bundleName = "com.acts.abilitymultiinstancea";
  let abilityName = "com.acts.abilitymultiinstancea.MainAbility";

  let idx: number = parameters.nextStep;
  switch (parameters.step![idx]) {
    case "StartA1":
      parameters.startId = 1;
      break;
    case "StartA2":
      parameters.startId = 2;
      break;
    case "StartA3":
      parameters.startId = 3;
      break;
    case "StartANS":
      parameters.startId = ONACCEPTWANT_KEY_NOTSET_ID;
      break;
    case "StartAUD":
      parameters.startId = ONACCEPTWANT_KEY_UNDEFINED_ID;
      break;
    case "StartB":
      bundleName = "com.acts.abilitymultiinstanceb";
      abilityName = "com.acts.abilitymultiinstanceb.MainAbility";
      break;
    case "StartC":
      bundleName = "com.acts.abilitymultiinstancec";
      abilityName = "com.acts.abilitymultiinstancec.MainAbility";
      break;
    case "StartDMain1":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.MainAbility";
      parameters.startId = 1;
      break;
    case "StartDMain2":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.MainAbility";
      parameters.startId = 2;
      break;
    case "StartDSec":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.SecondAbility";
      break;
    case "StartDThd":
      bundleName = "com.acts.abilitymultiinstanced";
      abilityName = "com.acts.abilitymultiinstanced.ThirdAbility";
      break;
    case "StartE":
      bundleName = "com.acts.abilitymultiinstancee";
      abilityName = "com.acts.abilitymultiinstancee.MainAbility";
      break;
    default:
      break;
  }
  parameters.nextStep = ++idx;
  testAbilityContext.startAbility({
    bundleName: bundleName,
    abilityName: abilityName,
    parameters: {
      startId: parameters.startId,
      stepNum: parameters.stepNum,
      nextStep: parameters.nextStep,
      step: parameters.step
    }
  }, (error, data) => {
    console.log('startAbilityProcess result: ' + JSON.stringify(error) + ", " + JSON.stringify(data));
  })
}

export default function abilityTest(testAbilityContext: common.UIAbilityContext) {
  describe('ActsAbilityTest', () => {
    let TAG1 = "ACTS_AbilityMultiInstance_Single == ";
    afterEach(async (done: Function) => {
      console.log(TAG1 + "afterEach called");

      await abilityDelegator.executeShellCommand('aa start -b com.example.abilitymultiinstance -a com.example.abilitymultiinstance.MainAbility');

      setTimeout(() => {
        console.log(TAG1 + "afterEach end");
        done();
      }, 500);
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_0100
     * @tc.number ACTS_AbilityMultiInstance_Multi_0100
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_0100', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_0100====<begin');
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onCreateonForegroundonAcceptWantCalledId1", "AppB:onCreateonForeground",
        "AppA:onForegroundonAcceptWantCalledId1"];
      let checkIndex = 0;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_0100 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(3);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_0100 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            if (checkIndex === 2 && deviceSupport === 'false') {
              clearTimeout(id);
                commonEvent.unsubscribe(subscriber, () => {
                  console.debug("====>UnSubscribe CallBack====>");
                  setTimeout(() => {
                    done();
                  }, 700)
                })
            }
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('StartAbilityMultiInstanceTester timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_0100 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 3,
        nextStep: 0,
        step: ["StartA1", "StartB", "StartA1"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_0200
     * @tc.number ACTS_AbilityMultiInstance_Single_0200
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_0200', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_0200====<begin');
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onCreateonForegroundonAcceptWantCalledId3", "AppB:onCreateonForeground",
        "AppA:onCreateonForegroundonAcceptWantCalledId2"];
      let checkIndex = 0;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_0200 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(3);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_0200 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_0200 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            if (checkIndex === 2 && deviceSupport === 'false') {
              clearTimeout(id);
                commonEvent.unsubscribe(subscriber, () => {
                  console.debug("====>UnSubscribe CallBack====>");
                  setTimeout(() => {
                    done();
                  }, 700)
                })
            }
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('StartAbilityMultiInstanceTester timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_0200 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 3,
        nextStep: 0,
        step: ["StartA3", "StartB", "StartA2"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_0300
     * @tc.number ACTS_AbilityMultiInstance_Single_0300
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_0300', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_0300====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onForegroundonAcceptWantCalledId1", "AppC:onCreateonForeground",
        "AppA:onForegroundonAcceptWantCalledId1"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_0300 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(3);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_0300 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_0300 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_0300 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_0300 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 3,
        nextStep: 0,
        step: ["StartA1", "StartC", "StartA1"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_0400
     * @tc.number ACTS_AbilityMultiInstance_Single_0400
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_0400', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_0400====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onForegroundonAcceptWantCalledId3", "AppC:onForeground",
        "AppA:onForegroundonAcceptWantCalledId2"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (error, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_0400 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(2);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_0400 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_0400 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_0400 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_0400 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 3,
        nextStep: 0,
        step: ["StartA3", "StartC", "StartA2"]
      });
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_0600
     * @tc.number ACTS_AbilityMultiInstance_Single_0600
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_0600', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_0600====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onForegroundonAcceptWantCalledId1",
        "AppA:onForegroundonAcceptWantCalledId2"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_0600 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(2);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            });
            console.log('ACTS_AbilityMultiInstance_Single_0600 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_0600 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_0600 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT)
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_0600 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 2,
        nextStep: 0,
        step: ["StartA1", "StartA2"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_0700
     * @tc.number ACTS_AbilityMultiInstance_Single_0700
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_0700', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_0700====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onForegroundonAcceptWantCalledId1", "AppB:onCreateonForeground",
        "AppC:onForeground", "AppA:onForegroundonAcceptWantCalledId1"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_0700 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(3);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_0700 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_0700 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_0700 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_0700 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 4,
        nextStep: 0,
        step: ["StartA1", "StartB", "StartC", "StartA1"]
      });
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_0800
     * @tc.number ACTS_AbilityMultiInstance_Single_0800
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_0800', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_0800====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onForegroundonAcceptWantCalledId3", "AppB:onCreateonForeground",
        "AppC:onForeground", "AppA:onCreateonForegroundonAcceptWantCalledId2"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_0800 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(3);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_0800 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_0800 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_0800 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_0800 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 4,
        nextStep: 0,
        step: ["StartA3", "StartB", "StartC", "StartA2"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_0900
     * @tc.number ACTS_AbilityMultiInstance_Single_0900
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_0900', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_0900====<begin');
      let subscriber: commonEventManager.CommonEventSubscriber;
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let id: number;
      let checkEventResults = ["AppB:onCreateonForeground", "AppA:onForegroundonAcceptWantCalledId1",
        "AppC:onForeground", "AppA:onForegroundonAcceptWantCalledId1"];
      let checkIndex = 0;

      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_0900 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(3);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_0900 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_0900 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_0900 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_0900 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 4,
        nextStep: 0,
        step: ["StartB", "StartA1", "StartC", "StartA1"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_1000
     * @tc.number ACTS_AbilityMultiInstance_Single_1000
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_1000', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_1000====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppB:onCreateonForeground", "AppA:onForegroundonAcceptWantCalledId1",
        "AppC:onForeground", "AppA:onForegroundonAcceptWantCalledId2"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_1000 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(3);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_1000 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_1000 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })

      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_1000 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_1000 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 4,
        nextStep: 0,
        step: ["StartB", "StartA1", "StartC", "StartA2"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_1100
     * @tc.number ACTS_AbilityMultiInstance_Single_1100
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_1100', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_1100====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppD:onCreateonForegroundonAcceptWantCalledId1", "AppD:onCreateonForeground",
        "AppD:onCreateonForeground", "AppD:onForegroundonAcceptWantCalledId1"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_1100 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(4);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_1100 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_1100 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_1100 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_1100 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 4,
        nextStep: 0,
        step: ["StartDMain1", "StartDSec", "StartDThd", "StartDMain1"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_1200
     * @tc.number ACTS_AbilityMultiInstance_Single_1200
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_1200', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_1200====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppD:onCreateonForegroundonAcceptWantCalledId2", "AppD:onCreateonForeground",
        "AppD:onForeground", "AppD:onForegroundonAcceptWantCalledId1"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_1200 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(4);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_1200 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_1200 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_1200 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_1200 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 4,
        nextStep: 0,
        step: ["StartDMain2", "StartDSec", "StartDThd", "StartDMain1"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_1300
     * @tc.number ACTS_AbilityMultiInstance_Single_1300
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_1300', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_1300====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppB:onCreateonForeground", "AppB:onCreateonForeground"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_1300 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(2);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_1300 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_1300 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_1300 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_1300 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 2,
        nextStep: 0,
        step: ["StartB", "StartB"]
      });
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_1400
     * @tc.number ACTS_AbilityMultiInstance_Single_1400
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_1400', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_1400====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppE:onInit", "AppA:onForegroundonAcceptWantCalledId1"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));

          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_1400 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(2);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            });
            console.log('ACTS_AbilityMultiInstance_Single_1400 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_1400 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_1400 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_1400 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 2,
        nextStep: 0,
        step: ["StartE", "StartA1"]
      });
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_1500
     * @tc.number ACTS_AbilityMultiInstance_Single_1500
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_1500', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_1500====<begin');
      if (deviceSupport === 'false') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onForegroundonAcceptWantCalledId2", "AppE:onInit"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_1500 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(2);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_1500 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_1500 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_1500 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_1500 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 2,
        nextStep: 0,
        step: ["StartA2", "StartE"]
      })
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_1600
     * @tc.number ACTS_AbilityMultiInstance_Single_1600
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_1600', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_1600====<begin');
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onCreateonForegroundonAcceptWantCalledId-1"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_1600 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(1);
            commonEvent.unsubscribe(subscriber, () => {
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_1600 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_1600 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_1600 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_1600 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["StartANS"]
      });
    })

    /**
     * @tc.name   ACTS_AbilityMultiInstance_Single_1700
     * @tc.number ACTS_AbilityMultiInstance_Single_1700
     * @tc.desc   Check the event data of executor page ability publishes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_AbilityMultiInstance_Single_1700', Level.LEVEL0, async (done: Function) => {
      console.log('ACTS_AbilityMultiInstance_Single_1700====<begin');
      let subscriber: commonEventManager.CommonEventSubscriber;
      let id: number;
      let checkEventResults = ["AppA:onCreateonForegroundonAcceptWantCalledId-2"];
      let checkIndex = 0;
      commonEvent.createSubscriber(subscriberInfoMultiInstance).then(async (data) => {
        console.debug("====>Create Subscriber====>");
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug("====>Subscribe CallBack data:====>" + JSON.stringify(data));
          if (data.event == "MultiInstanceStartFinish") {
            clearTimeout(id);
            console.log('ACTS_AbilityMultiInstance_Single_1700 finish callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
            expect(checkIndex).assertEqual(1);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug("====>UnSubscribe CallBack====>");
              setTimeout(() => {
                done();
              }, 1500)
            })
            console.log('ACTS_AbilityMultiInstance_Single_1700 finish');
          } else if (data.event == "MultiInstanceStartNext") {
            console.log('ACTS_AbilityMultiInstance_Single_1700 callBackSeq = ' + data.data);
            expect(data.data).assertEqual(checkEventResults[checkIndex++]);
          }
        })
      })
      id = setTimeout(() => {
        expect().assertFail();
        console.log('ACTS_AbilityMultiInstance_Single_1700 timeout');
        commonEvent.unsubscribe(subscriber, () => {
          console.debug("====>UnSubscribe CallBack====>");
          setTimeout(() => {
            done();
          }, UNSUBSCRIBE_TIMEOUT)
        })
      }, START_ABILITY_TIMEOUT);
      console.log('Start AbilityMultiInstanceTester ACTS_AbilityMultiInstance_Single_1700 timer id : ' + id);

      startAbilityProcess(testAbilityContext, {
        startId: 0,
        stepNum: 1,
        nextStep: 0,
        step: ["StartAUD"]
      })
    })
  })
}