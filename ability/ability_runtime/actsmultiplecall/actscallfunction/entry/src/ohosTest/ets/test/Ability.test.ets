/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEventManager';
import { BusinessError } from "@ohos.base";

const CASE_TIME_OUT = 5000;
const EXIT_TWO_CALLEE = 2;
const KILL_TWO = 2;
const CALLEE_BACK = 2;
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['ACTS_CALL_EVENT', 'ACTS_RELEASE_EVENT', 'ACTS_SECOND_CALL_EVENT']
};

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    afterEach(async (done: Function) => {
      setTimeout(() => {
        console.debug('====>afterEach called');
        done();
      }, 1000);
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0100
     * @tc.number Acts_SingleInstanceCallFunction_0100
     * @tc.desc   Caller application can call other application Ability by Call (single instance).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0100', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      console.debug('====>Acts_SingleInstanceCallFunction_0100 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0100 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0100 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CALL_EVENT') {
            expect(data.parameters!.num).assertEqual(100);
            expect(data.parameters!.str).assertEqual('Acts_SingleInstanceCallFunction_0100 processed');
            expect(data.parameters!.result).assertTrue();
            commonEvent.unsubscribe(subscriber, () => {
              console.debug('====>Acts_SingleInstanceCallFunction_0100 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_0100'
        }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0100 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0200
     * @tc.number Acts_SingleInstanceCallFunction_0200
     * @tc.desc   Caller application cannot call its own Ability by Call (single instance).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0200', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      console.debug('====>Acts_SingleInstanceCallFunction_0200 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0200 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0200 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CALL_EVENT') {
            expect(data.parameters!.num).assertEqual(16000050);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug('====>Acts_SingleInstanceCallFunction_0200 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.actscallfunction',
            abilityName: 'EntryAbility',
            action: 'Acts_SingleInstanceCallFunction_0200'
          }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0200 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0300
     * @tc.number Acts_SingleInstanceCallFunction_0300
     * @tc.desc   Caller applications can actively release AbilityCaller (single instance).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0300', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      let eventCount = 0;
      console.debug('====>Acts_SingleInstanceCallFunction_0300 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0300 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0300 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CALL_EVENT') {
            eventCount++;
            expect(data.parameters!.num).assertEqual(300);
            expect(data.parameters!.str).assertEqual('Acts_SingleInstanceCallFunction_0300 processed');
            expect(data.parameters!.result).assertTrue();
          }
          if (data.event === 'ACTS_RELEASE_EVENT') {
            eventCount++;
            expect(data.parameters!.str).assertEqual('release');
            expect(data.parameters!.result).assertTrue();
          }
          if (eventCount === 2) {
            commonEvent.unsubscribe(subscriber, () => {
              console.debug('====>Acts_SingleInstanceCallFunction_0300 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_0300'
        }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0300 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0400
     * @tc.number Acts_SingleInstanceCallFunction_0400
     * @tc.desc   The caller application can passively perceive the callee death notification of the called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0400', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      let eventCount = 0;
      console.debug('====>Acts_SingleInstanceCallFunction_0400 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0400 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0400 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CALL_EVENT') {
            eventCount++;
            expect(data.parameters!.num).assertEqual(400);
            expect(data.parameters!.str).assertEqual('Acts_SingleInstanceCallFunction_0400 processed');
            expect(data.parameters!.result).assertTrue();
          }
          if (data.event === 'ACTS_RELEASE_EVENT') {
            eventCount++;
            expect(data.parameters!.str).assertEqual('died');
            expect(data.parameters!.result).assertTrue();
          }
          if (eventCount === 2) {
            commonEvent.unsubscribe(subscriber, () => {
              console.debug('====>Acts_SingleInstanceCallFunction_0400 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_0400'
        }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0400 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0500
     * @tc.number Acts_SingleInstanceCallFunction_0500
     * @tc.desc   The Calling application can call the multi-instance Ability of other applications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0500', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      console.info('====>Acts_SingleInstanceCallFunction_0500 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info('====>Acts_SingleInstanceCallFunction_0500 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_SingleInstanceCallFunction_0500 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            expect(data.parameters!.num).assertEqual(EXIT_TWO_CALLEE);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_SingleInstanceCallFunction_0500 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.actscallfunction',
            abilityName: 'EntryAbility',
            action: 'Acts_SingleInstanceCallFunction_0500'
          }, (err: BusinessError) => {
          console.info('====>Acts_SingleInstanceCallFunction_0500 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0600
     * @tc.number Acts_SingleInstanceCallFunction_0600
     * @tc.desc   The Calling application cannot call its own multi-instance Ability.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0600', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      console.info('====>Acts_SingleInstanceCallFunction_0600 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info('====>Acts_SingleInstanceCallFunction_0600 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_SingleInstanceCallFunction_0600 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            expect(data.parameters!.num).assertEqual(16000050);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_SingleInstanceCallFunction_0600 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.thirdpartyapprely',
            abilityName: 'EntryAbility',
            action: 'Acts_SingleInstanceCallFunction_0600'
          }, (err: BusinessError) => {
          console.info('====>Acts_SingleInstanceCallFunction_0600 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0700
     * @tc.number Acts_SingleInstanceCallFunction_0700
     * @tc.desc   The caller application can actively release the multi-instance AbilityCaller.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0700', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_SingleInstanceCallFunction_0700 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info('====>Acts_SingleInstanceCallFunction_0700 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_SingleInstanceCallFunction_0700 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.str)
              .assertEqual('release the first caller successful, release the second caller successful.');
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_SingleInstanceCallFunction_0700 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.actscallfunction',
            abilityName: 'EntryAbility',
            action: 'Acts_SingleInstanceCallFunction_0700'
          }, (err: BusinessError) => {
          console.info('====>Acts_SingleInstanceCallFunction_0700 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0800
     * @tc.number Acts_SingleInstanceCallFunction_0800
     * @tc.desc   The caller application can passively perceive the service provider multi-instance callee death
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0800', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      console.info('====>Acts_SingleInstanceCallFunction_0800 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info('====>Acts_SingleInstanceCallFunction_0800 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_SingleInstanceCallFunction_0800 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            expect(data.parameters!.num).assertEqual(KILL_TWO);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_SingleInstanceCallFunction_0800 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility(
          {
            bundleName: 'com.acts.actscallfunction',
            abilityName: 'EntryAbility',
            action: 'Acts_SingleInstanceCallFunction_0800'
          }, (err: BusinessError) => {
          console.info('====>Acts_SingleInstanceCallFunction_0800 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_0900
     * @tc.number Acts_SingleInstanceCallFunction_0900
     * @tc.desc   Caller application can call other application Ability by Call (multiple instance and single instance).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_0900', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      let eventCount = 0;
      console.debug('====>Acts_SingleInstanceCallFunction_0900 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_0900 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0900 subscribeCallBack data:' +
          JSON.stringify(data));
          if (data.event === 'ACTS_CALL_EVENT') {
            eventCount++;
            expect(data.parameters!.num).assertEqual(100);
            expect(data.parameters!.str).assertEqual('Acts_SingleInstanceCallFunction_0900 processed');
            expect(data.parameters!.result).assertTrue();
          }
          if (data.event === 'ACTS_SECOND_CALL_EVENT') {
            eventCount++;
            expect(data.parameters!.num).assertEqual(EXIT_TWO_CALLEE);
          }
          if (eventCount === 2) {
            commonEvent.unsubscribe(subscriber, () => {
              console.debug('====>Acts_SingleInstanceCallFunction_0900 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_0900'
        }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_0900 startAbility err:' +
          JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_1000
     * @tc.number Acts_SingleInstanceCallFunction_1000
     * @tc.desc   Multiple Callers Call multiple instances of the same application at the same time, which does not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_1000', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      let eventCount = 0;
      console.debug('====>Acts_SingleInstanceCallFunction_1000 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_1000 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_1000 multiple subscribeCallBack data:' +
          JSON.stringify(data));
          if (data.event === 'ACTS_CALL_EVENT') {
            eventCount++;
            console.debug('====>Acts_SingleInstanceCallFunction_1000 ACTS_CALL_EVENT data:' +
            JSON.stringify(data.parameters!.num));
            expect(data.parameters!.num).assertEqual(1);
          }
          if (data.event === 'ACTS_RELEASE_EVENT') {
            eventCount++;
            console.debug('====>Acts_SingleInstanceCallFunction_1000 ACTS_RELEASE_EVENT data:' +
            JSON.stringify(data.parameters!.num));
            expect(data.parameters!.num).assertEqual(1);

          }
          if (eventCount === 2) {
            commonEvent.unsubscribe(subscriber, () => {
              console.debug('====>Acts_SingleInstanceCallFunction_1000 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_1000'
        }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_1000 single startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })

        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.callapprely',
          abilityName: 'SecondAbility',
          action: 'Acts_SingleInstanceCallFunction_1000'
        }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_1000 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_1100
     * @tc.number Acts_SingleInstanceCallFunction_1100
     * @tc.desc   Indirect Call Calls multi-instance Ability, which does not affect the call communication function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_1100', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      let eventCount = 0;
      console.debug('====>Acts_SingleInstanceCallFunction_1100 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_1100 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_1100 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CALL_EVENT') {
            eventCount++;
            console.debug('====>Acts_SingleInstanceCallFunction_1100 ACTS_CALL_EVENT data:' +
            JSON.stringify(data.parameters!.num));
            expect(data.parameters!.num).assertEqual(1);
          }
          if (data.event === 'ACTS_SECOND_CALL_EVENT') {
            eventCount++;
            expect(data.parameters!.num).assertEqual(1);
          }
          if (eventCount === 2) {
            commonEvent.unsubscribe(subscriber, () => {
              console.debug('====>Acts_SingleInstanceCallFunction_1100 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_1100'
        }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_1100 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.name   Acts_SingleInstanceCallFunction_1200
     * @tc.number Acts_SingleInstanceCallFunction_1200
     * @tc.desc   Call calls the SPECIFIED type Ability, which can return an error message.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_SingleInstanceCallFunction_1200', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      let eventCount = 0;
      console.debug('====>Acts_SingleInstanceCallFunction_1200 start');
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.debug('====>Acts_SingleInstanceCallFunction_1200 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.debug('====>Acts_SingleInstanceCallFunction_1200 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CALL_EVENT') {
            console.debug('====>Acts_SingleInstanceCallFunction_1200 ACTS_CALL_EVENT data:' +
            JSON.stringify(data.parameters!.num));
            expect(data.parameters!.num.code).assertEqual(16000002);
            commonEvent.unsubscribe(subscriber, () => {
              console.debug('====>Acts_SingleInstanceCallFunction_1200 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallfunction',
          abilityName: 'EntryAbility',
          action: 'Acts_SingleInstanceCallFunction_1200'
        }, (err: BusinessError) => {
          console.debug('====>Acts_SingleInstanceCallFunction_1200 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })
    })
  })
}