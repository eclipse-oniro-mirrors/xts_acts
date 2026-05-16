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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEvent from '@ohos.commonEventManager'
import {BusinessError} from "@ohos.base";
import Want from '@ohos.app.ability.Want';
import { Caller } from '@ohos.app.ability.UIAbility';

const CASE_TIME_OUT = 5000;
let ACTS_CrossCallFunction:commonEvent.CommonEventSubscribeInfo = {
  events: ['ACTS_CROSS_CALL_EVENT', 'ACTS_CROSS_RELEASE_EVENT']
};

export default function abilityTest() {
  describe('ActsCrossUserCallTest', () => {
    afterEach(async (done:Function) => {
      setTimeout(() => {
        console.info('====>afterEach called');
        done();
      }, 1000);
    })

    /**
     * @tc.name   Acts_CrossUserCall_0100
     * @tc.number Acts_CrossUserCall_0100
     * @tc.desc   Under the same account, UIAbility can call the current account Ability application with Call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0100', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_CrossUserCall_0100 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_0100 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_0100 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message != null).assertTrue();
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_0100 unSubscribeCallback');
              done();           
            });
          }          
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallability',
          abilityName: 'EntryAbility',
          parameters: {
            action: 'Acts_CrossUserCall_0100',
            accountId: -1
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_0100 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_0100 unSubscribeCallback');
            done();           
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_0200
     * @tc.number Acts_CrossUserCall_0200
     * @tc.desc   Under the same account, ServiceExtension can call the current account Ability application with Call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0200', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_CrossUserCall_0200 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_0200 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_0200 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message != null).assertTrue();
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_0200 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallability',
          abilityName: 'ServiceAbility',
          parameters: {
            action: 'Acts_CrossUserCall_0200',
            accountId: -1
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_0200 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_0200 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_0300
     * @tc.number Acts_CrossUserCall_0300
     * @tc.desc   System applications UIAbility can Call call other account Ability applications under cross-account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0300', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_CrossUserCall_0300 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_0300 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_0300 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(16000006);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_0300 unSubscribeCallback');
              done();            
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallability',
          abilityName: 'EntryAbility',
          parameters: {
            action: 'Acts_CrossUserCall_0300',
            accountId: 101
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_0300 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_0300 unSubscribeCallback');
            done();            
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_0400
     * @tc.number Acts_CrossUserCall_0400
     * @tc.desc   System applications ServiceExtension can Call call other account Ability applications under
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0400', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_CrossUserCall_0400 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_0400 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_0400 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(16000006)
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_0400 unSubscribeCallback');
              done();
            });
          }          
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallability',
          abilityName: 'ServiceAbility',
          parameters: {
            action: 'Acts_CrossUserCall_0400',
            accountId: 101
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_0400 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_0400 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_0500
     * @tc.number Acts_CrossUserCall_0500
     * @tc.desc   Normal applications UIAbility cannot Call call other account Ability applications under cross-account.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0500', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_CrossUserCall_0500 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_0500 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_0500 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(202)
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_0500 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallnormalrely',
          abilityName: 'EntryAbility',
          parameters: {
            action: 'Acts_CrossUserCall_0500',
            accountId: 101
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_0500 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_0500 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_0600
     * @tc.number Acts_CrossUserCall_0600
     * @tc.desc   Normal applications ServiceExtension cannot Call call other account Ability applications
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0600', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_CrossUserCall_0600 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_0600 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_0600 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(202);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_0600 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallnormalrely',
          abilityName: 'ServiceAbility',
          parameters: {
            action: 'Acts_CrossUserCall_0600',
            accountId: 101
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_0600 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (flag === false){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_0600 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_0700
     * @tc.number Acts_CrossUserCall_0700
     * @tc.desc   System applications without permission under cross-account UIAbility cannot Call to call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0700', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_CrossUserCall_0700 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_0700 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_0700 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(201);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_0700 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallpermissionrely',
          abilityName: 'EntryAbility',
          parameters: {
            action: 'Acts_CrossUserCall_0700',
            accountId: 101
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_0700 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (flag === false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_0700 unSubscribeCallback');
            done();
          })
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_0800
     * @tc.number Acts_CrossUserCall_0800
     * @tc.desc   System applications without permission under cross-account ServiceExtension cannot Call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0800', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info('====>Acts_CrossUserCall_0800 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_0600 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_0800 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(201);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_0800 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallpermissionrely',
          abilityName: 'ServiceAbility',
          parameters: {
            action: 'Acts_CrossUserCall_0800',
            accountId: 101
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_0800 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (flag === false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_0800 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_0900
     * @tc.number Acts_CrossUserCall_0900
     * @tc.desc   UIAbility uses a Call call with the want parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_0900', Level.LEVEL0, async (done: Function) => {
      globalThis.abilityContext.startAbilityByCallWithAccount(null, -1).then((caller:Caller) => {
        console.info("====>Acts_CrossUserCall_0900 caller: " + caller);
        done();
      }).catch((err:BusinessError) => {
        console.info("====>Acts_CrossUserCall_0900 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   Acts_CrossUserCall_1000
     * @tc.number Acts_CrossUserCall_1000
     * @tc.desc   ServiceExtension uses a Call call with the want parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1000', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      console.info("====>Acts_CrossUserCall_1000");
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_1000 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_1000 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(401);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_1000 unSubscribeCallback');
              done();
            });
          }
        });
        let want:Want = {
          bundleName: "com.acts.actscallability",
          abilityName: "ServiceAbility",
          moduleName: "entry",
          action: "Acts_CrossUserCall_1000"
        }
        globalThis.abilityContext.startAbility(want).then(() => {
          console.info("====>Acts_CrossUserCall_1000 StartServiceAbility OK");
        }).catch((err:BusinessError) => {
          console.info("====>Acts_CrossUserCall_1000 StartServiceAbility err:" + JSON.stringify(err));
        })
      })

      setTimeout(() => {
        if (flag === false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_1000 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_1100
     * @tc.number Acts_CrossUserCall_1100
     * @tc.desc   UIAbility uses a Call call with the want parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1100', Level.LEVEL0, (done:Function) => {
      globalThis.abilityContext.startAbilityByCallWithAccount(undefined, -1).then((caller:Caller) => {
        console.info("====>Acts_CrossUserCall_1100 caller:  " + caller);
        done();
      }).catch((err:BusinessError) => {
        console.info("====>Acts_CrossUserCall_1100 err: " + err.code + typeof(err.code));
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   Acts_CrossUserCall_1200
     * @tc.number Acts_CrossUserCall_1200
     * @tc.desc   ServiceExtension uses a Call call with the want parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1200', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then((data) => {
        console.info('====>Acts_CrossUserCall_1200 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_1200 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(401);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_1200 unSubscribeCallback');
              done();
            });
          }
        });
        console.info('====>Acts_CrossUserCall_1200 Create Subscribe2');
        let want:Want = {
          bundleName: "com.acts.actscallability",
          abilityName: "ServiceAbility",
          moduleName: "entry",
          action: "Acts_CrossUserCall_1200"
        }
        globalThis.abilityContext.startAbility(want).then(() => {
          console.info("====>Acts_CrossUserCall_1200 StartServiceAbility OK");
        }).catch((err:BusinessError) => {
          console.info("====>Acts_CrossUserCall_1200 StartServiceAbility err:  " + JSON.stringify((err.code)));
        })
      })

      setTimeout(()=>{
        if (flag === false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_1200 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_1300
     * @tc.number Acts_CrossUserCall_1300
     * @tc.desc   UIAbility uses the want parameter to start a Call call with error information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1300', Level.LEVEL0, () => {
      let want:Want = {
        bundleName: "com.xxxx.xxxx",
        abilityName: "xxxx",
        moduleName: "xxxxxx"
      }
      globalThis.abilityContext.startAbilityByCallWithAccount(want, 100).then((caller:Caller) => {
        console.info("====>Acts_CrossUserCall_1300 caller: " + caller);
      }).catch((err:BusinessError) => {
        console.info("====>Acts_CrossUserCall_1300 err: " + err.code + typeof(err.code));
        expect(err.code).assertEqual(16000001);
      })
    })

    /**
     * @tc.name   Acts_CrossUserCall_1400
     * @tc.number Acts_CrossUserCall_1400
     * @tc.desc   ServiceExtension uses the want parameter to start a Call call with error information.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1400', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then((data) => {
        console.info('====>Acts_CrossUserCall_1400 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_1400 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(16000001);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_1400 unSubscribeCallback');
              done();
            });
          }
        });
        let want:Want = {
          bundleName: "com.acts.actscallability",
          abilityName: "ServiceAbility",
          moduleName: "entry",
          action: "Acts_CrossUserCall_1400"
        }
        globalThis.abilityContext.startAbility(want).then(() => {
          console.info("====>Acts_CrossUserCall_1400 StartServiceAbility OK");
        }).catch((err:BusinessError) => {
          console.info("====>Acts_CrossUserCall_1400 StartServiceAbility err: " + JSON.stringify((err.code)));
        })
      })

      setTimeout(()=>{
        if (flag === false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_1400 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_1500
     * @tc.number Acts_CrossUserCall_1500
     * @tc.desc   UIAbility uses a Call call with the accountId parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1500', Level.LEVEL0, async (done: Function) => {
      let want:Want = {
        bundleName: 'com.acts.calleeabilityrely',
        abilityName: 'EntryAbility',
        moduleName: "entry",
        action: "Acts_CrossUserCall_1500"
      }
      globalThis.abilityContext.startAbilityByCallWithAccount(want, null).then((caller:Caller) => {
        console.info('====>Acts_CrossUserCall_1500 startAbilityByCallWithAccount OK:' + JSON.stringify(caller));
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        console.info('====>Acts_CrossUserCall_1500 startAbilityByCallWithAccount err:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   Acts_CrossUserCall_1600
     * @tc.number Acts_CrossUserCall_1600
     * @tc.desc   ServiceExtension uses a Call call with the accountId parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1600', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then((data) => {
        console.info('====>Acts_CrossUserCall_1600 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_1600 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(401);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_1600 unSubscribeCallback');
              done();
            });
          }
        });
        console.info('====>Acts_CrossUserCall_1600 Create Subscribe2');
        let want:Want = {
          bundleName: "com.acts.actscallability",
          abilityName: "ServiceAbility",
          moduleName: "entry",
          action: "Acts_CrossUserCall_1600"
        }
        globalThis.abilityContext.startAbility(want).then(() => {
          console.info("====>Acts_CrossUserCall_1600 StartServiceAbility OK");
        }).catch((err:BusinessError) => {
          console.info("====>Acts_CrossUserCall_1600 StartServiceAbility err: " + JSON.stringify((err.code)));
        })
      })

      setTimeout(() => {
        if (flag === false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_1600 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_1700
     * @tc.number Acts_CrossUserCall_1700
     * @tc.desc   UIAbility uses a Call call with the accountId parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1700', Level.LEVEL0, async (done: Function) => {
      let want:Want = {
        bundleName: "com.acts.actscallability",
        abilityName: "ServiceAbility",
        moduleName: "entry",
        action: "Acts_CrossUserCall_1700"
      }
      globalThis.abilityContext.startAbilityByCallWithAccount(want, undefined).then((caller:Caller) => {
        console.info('====>Acts_CrossUserCall_1700 startAbilityByCallWithAccount OK :' + JSON.stringify(caller));
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        console.info('====>Acts_CrossUserCall_1700 startAbilityByCallWithAccount err :' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   Acts_CrossUserCall_1800
     * @tc.number Acts_CrossUserCall_1800
     * @tc.desc   ServiceExtension uses a Call call with the accountId parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1800', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false;
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then((data) => {
        console.info('====>Acts_CrossUserCall_1800 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_1800 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(401);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_1800 unSubscribeCallback');
              done();
            });
          }
        });
        console.info('====>Acts_CrossUserCall_1800 Create Subscribe2');
        let want:Want = {
          bundleName: "com.acts.actscallability",
          abilityName: "ServiceAbility",
          moduleName: "entry",
          action: "Acts_CrossUserCall_1800"
        }
        globalThis.abilityContext.startAbility(want).then(() => {
          console.info("====>Acts_CrossUserCall_1800 StartServiceAbility OK");
        }).catch((err:BusinessError) => {
          console.info("====>Acts_CrossUserCall_1800 StartServiceAbility err: " + JSON.stringify((err.code)));
        })
      })

      setTimeout(()=>{
        if (flag === false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_1800 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_1900
     * @tc.number Acts_CrossUserCall_1900
     * @tc.desc   UIAbility uses the accountId parameter to call Call for which an ID value does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_1900', Level.LEVEL0, async (done: Function) => {
      let want:Want = {
        bundleName: "com.acts.actscallability",
        abilityName: "ServiceAbility",
        moduleName: "entry",
        action: "Acts_CrossUserCall_1900"
      }
      globalThis.abilityContext.startAbilityByCallWithAccount(want, 9527).then((caller:Caller) => {
        console.info('====>Acts_CrossUserCall_1900 startAbilityByCallWithAccount OK :' + JSON.stringify(caller));
        expect().assertFail();
        done();
      }).catch((err:BusinessError) => {
        console.info('====>Acts_CrossUserCall_1900 startAbilityByCallWithAccount err :' + JSON.stringify(err));
        expect(err.code).assertEqual(16000006);
        done();
      })
    })

    /**
     * @tc.name   Acts_CrossUserCall_2000
     * @tc.number Acts_CrossUserCall_2000
     * @tc.desc   ServiceExtension uses the accountId parameter to call Call for which an ID value does not exist.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_2000', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let flag = false
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then((data) => {
        console.info('====>Acts_CrossUserCall_2000 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_2000 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            flag = true;
            expect(data.parameters!.message.code).assertEqual(16000006);
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_2000 unSubscribeCallback');
              done();
            });
          }
        });
        let want:Want = {
          bundleName: "com.acts.actscallability",
          abilityName: "ServiceAbility",
          moduleName: "entry",
          action: "Acts_CrossUserCall_2000"
        }
        globalThis.abilityContext.startAbility(want).then(() => {
          console.info("====>Acts_CrossUserCall_2000 StartServiceAbility OK");
        }).catch((err:BusinessError) => {
          console.info("====>Acts_CrossUserCall_2000 StartServiceAbility err: " + JSON.stringify((err.code)));
        })
      })

      setTimeout(() => {
        if (flag === false) {
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_2000 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_2900
     * @tc.number Acts_CrossUserCall_2900
     * @tc.desc   The Caller.release interface of UIAbility under the same account executes normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_2900', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let eventCount = 0;
      console.info('====>Acts_CrossUserCall_2900 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_2900 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_2900 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            eventCount++;
            expect(data.parameters!.message.num).assertEqual(2900);
            expect(data.parameters!.message.str).assertEqual('Acts_CrossUserCall_2900 processed');
            expect(data.parameters!.message.result).assertTrue();
          }
          if (data.event === 'ACTS_CROSS_RELEASE_EVENT') {
            eventCount++;
            expect(data.parameters!.message).assertEqual('release');
          }
          if (eventCount === 2) {
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_2900 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallability',
          abilityName: 'EntryAbility',
          parameters: {
            action: 'Acts_CrossUserCall_2900',
            accountId: -1
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_2900 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (eventCount !== 2){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_2900 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })

    /**
     * @tc.name   Acts_CrossUserCall_3000
     * @tc.number Acts_CrossUserCall_3000
     * @tc.desc   The Caller.release interface of ServiceExtension under the same account executes normally.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_CrossUserCall_3000', Level.LEVEL0, async (done: Function) => {
      let subscriber:commonEvent.CommonEventSubscriber;
      let eventCount = 0;
      console.info('====>Acts_CrossUserCall_3000 start');
      commonEvent.createSubscriber(ACTS_CrossCallFunction).then(async (data) => {
        console.info('====>Acts_CrossUserCall_3000 Create Subscribe');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          console.info('====>Acts_CrossUserCall_3000 subscribeCallBack data:' + JSON.stringify(data));
          if (data.event === 'ACTS_CROSS_CALL_EVENT') {
            eventCount++;
            expect(data.parameters!.message.num).assertEqual(3000);
            expect(data.parameters!.message.str).assertEqual('Acts_CrossUserCall_3000 processed');
            expect(data.parameters!.message.result).assertTrue();
          }
          if (data.event === 'ACTS_CROSS_RELEASE_EVENT') {
            eventCount++;
            expect(data.parameters!.message).assertEqual('release');
          }
          if (eventCount === 2) {
            commonEvent.unsubscribe(subscriber, () => {
              console.info('====>Acts_CrossUserCall_3000 unSubscribeCallback');
              done();
            });
          }
        });
        globalThis.abilityContext.startAbility({
          bundleName: 'com.acts.actscallability',
          abilityName: 'ServiceAbility',
          parameters: {
            action: 'Acts_CrossUserCall_3000',
            accountId: -1
          }
        },(err:BusinessError) => {
          console.info('====>Acts_CrossUserCall_3000 startAbility err:' + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        })
      })

      setTimeout(() => {
        if (eventCount !== 2){
          expect().assertFail();
          commonEvent.unsubscribe(subscriber, () => {
            console.info('====>Acts_CrossUserCall_3000 unSubscribeCallback');
            done();
          });
        }
      },CASE_TIME_OUT)
    })
  })
}