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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import commonEvent from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['ACTS_CALL_EVENT', 'ACTS_CALL_EVENT_ANOTHER']
};

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      // setTimeout(() => {
      //   console.info(`====>beforeEach setTimeout'`)
      // }, 2000)
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0100
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:The startAbilityForResult interface of UIExtensionAbility is called in AsyncCallback mode,
     * and all parameters are valid (want and callback parameters), so the application ability is successfully called.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0100', 0, async (done: Function) => {
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>AsyncCallback_0100 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>AsyncCallback_0100 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              expect(data.parameters.str).assertEqual('ACTION');
              expect(data.parameters.result).assertEqual(0);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>AsyncCallback_0100 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                globalThis.terminate('AsyncCallback_0100');
                done();
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.mainhap',
            abilityName: 'EntryAbility',
            action: 'AsyncCallback_0100'
          }, (err) => {
            console.info('====>startAbility err:' + JSON.stringify(err));
          })
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0200
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startAbilityForResult interface of UIExtensionAbility in AsyncCallback mode, and all
     * parameters are valid (want and callback parameters), and call other application capabilities successfully.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0200', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>AsyncCallback_0200 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>AsyncCallback_0200 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              expect(data.parameters.str).assertEqual('ACTION');
              expect(data.parameters.result).assertEqual(0);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>AsyncCallback_0200 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                setTimeout(() => {
                  abilityDelegator.executeShellCommand('aa force-stop com.example.forresulttestsecond')
                    .then(result => {
                      console.info('====>AsyncCallback_0200 unSubscribeCallback pkill ok' + JSON.stringify(result));
                      done();
                    })
                    .catch((err: BusinessError) => {
                      console.info('====>AsyncCallback_0200 unSubscribeCallback pkill ng' + JSON.stringify(err));
                      done();
                    })
                }, 2000)
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.forresulttestsecond',
            abilityName: 'EntryAbility',
            action: 'AsyncCallback_0200'
          }, (err) => {
            console.info('====>startAbility err:' + JSON.stringify(err));
          })
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0300
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startAbilityForResult interface of UIExtensionAbility in AsyncCallback mode, and the
     * parameters are valid (want and callback parameters). After calling for many times, only the normal result is
     * returned to the last caller, and other callers return abnormal information, in which the resultCode is -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0300', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0300 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            console.log(`====>ActsActionExtensionAbility deviceType: ${deviceType}`);
            if (deviceType === '2in1') {
              if (data.event == 'ACTS_CALL_EVENT') {
                console.info(`====>AsyncCallback_0300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
                expect(data.parameters.result).assertEqual(0);
              }
            } else {
              if (data.event == 'ACTS_CALL_EVENT') {
                console.info(`====>AsyncCallback_0300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
                expect(data.parameters.result).assertEqual(-1);
              }
            }
            if (data.event == 'ACTS_CALL_EVENT_ANOTHER') {
              console.info(`====>AsyncCallback_0300 subscribeCallBack 'ACTS_CALL_EVENT_ANOTHER'  ${data}`);
              expect(data.parameters.str).assertEqual('ACTION');
              expect(data.parameters.result).assertEqual(0);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>AsyncCallback_0300 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                setTimeout(() => {
                  globalThis.terminate('AsyncCallback_0300');
                  abilityDelegator.executeShellCommand('aa force-stop com.example.forresulttestsecond')
                    .then((result) => {
                      console.info('====>AsyncCallback_0300 unSubscribeCallback pkill ok' + JSON.stringify(result));
                      done();
                    })
                    .catch((err: BusinessError) => {
                      console.info('====>AsyncCallback_0300 unSubscribeCallback pkill ng' + JSON.stringify(err));
                      done();
                    })
                }, 1000)
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.mainhap',
            abilityName: 'EntryAbility',
            action: 'AsyncCallback_0300'
          }, (err) => {
            console.info('====>start Own Ability err:' + JSON.stringify(err));
          })
          setTimeout(() => {
            AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
              bundleName: 'com.example.forresulttestsecond',
              abilityName: 'EntryAbility',
              action: 'AsyncCallback_0300'
            }, (err) => {
              console.info('====>start Another Ability err:' + JSON.stringify(err));
            })
          }, 2500);
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0400
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startAbilityForResult interface of UIExtensionAbility in AsyncCallback mode, and all
     * parameters are valid (want and callback parameters). After the call is successful, kill the target Ability and
     * return an exception message to the caller, in which the resultCode is -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0400', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>AsyncCallback_0400 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            console.info(`====>AsyncCallback_0400 subscribeCallBack all  ${data.event}`);
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>AsyncCallback_0400 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              expect(data.parameters.result).assertEqual(-1);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>AsyncCallback_0400 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                setTimeout(() => {
                  globalThis.terminate('AsyncCallback_0400');
                  done();
                }, 1000)
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.mainhap',
            abilityName: 'EntryAbility',
            action: 'AsyncCallback_0400'
          }, (err) => {
            console.info('====>start Own Ability err:' + JSON.stringify(err));
          })

          setTimeout(() => {
            abilityDelegator.executeShellCommand('aa force-stop com.example.forresulttestsecond')
              .then(result => {
                console.info('====>AsyncCallback_0400 pkill ok' + JSON.stringify(result));
              })
              .catch((err: BusinessError) => {
                console.info('====>AsyncCallback_0400 pkill ng' + JSON.stringify(err));
              })
          }, 2000)
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0500
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startable interface of the extensible result by asynchronous callback, and the call fails if
     * the parameter is invalid.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0500', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>AsyncCallback_0500 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            console.info(`====>AsyncCallback_0500 subscribeCallBack all  ${data.event}`);
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>AsyncCallback_0500 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              expect(data.parameters.num).assertEqual(16000001);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>AsyncCallback_0500 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                setTimeout(() => {
                  globalThis.terminate('AsyncCallback_0500');
                  done();
                }, 2000)
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.mainhap',
            abilityName: 'EntryAbility',
            action: 'AsyncCallback_0500'
          }, (err) => {
            console.info('====>start Own Ability err:' + JSON.stringify(err));
          })
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0600
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Calling the startAbilityForResult interface of UIExtensionAbility in AsyncCallback mode, all
     * parameters are valid (want and callback parameters), and the call fails because there is no system authority.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_AsyncCallback_0600', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>AsyncCallback_0600 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            console.info(`====>AsyncCallback_0600 subscribeCallBack all  ${data.event}`);
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>AsyncCallback_0600 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              console.info(`====>AsyncCallback_0600 subscribeCallBack  ${data.parameters.num}`);
              expect(data.parameters.num).assertEqual(16000004);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>AsyncCallback_0600 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                setTimeout(() => {
                  abilityDelegator.executeShellCommand('aa force-stop com.example.forresulttestthrid')
                    .then(result => {
                      console.info('====>AsyncCallback_0600 unSubscribeCallback pkill ok' + JSON.stringify(result));
                      done();
                    })
                    .catch((err: BusinessError) => {
                      console.info('====>AsyncCallback_0600 unSubscribeCallback pkill ng' + JSON.stringify(err));
                      done();
                    })
                }, 1000)
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.forresulttestthrid',
            abilityName: 'EntryAbility',
            action: 'AsyncCallback_0600'
          }, (err) => {
            console.info('====>start Own Ability err:' + JSON.stringify(err));
          })
        })
    })


    /*
 * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0100
 * @tc.name:The parameters are valid (want and callback parameters),
 * and the startAbilityForResult of UIExtensionAbility is called.
 * @tc.desc:Call the startAbilityForResult interface of UIExtensionAbility in the way of Promise.
 * All parameters are valid (want and callback parameters), and the call is successful.
 * @tc.size: MediumTest
 * @tc.type: Function
 * @tc.level Level 1
 */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0100', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>Promise_0100 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>Promise_0100 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              expect(data.parameters.str).assertEqual('ACTION');
              expect(data.parameters.result).assertEqual(0);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>Promise_0100 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                globalThis.terminate('Promise_0100');
                done();
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.mainhap',
            abilityName: 'EntryAbility',
            action: 'Promise_0100'
          }, (err) => {
            console.info('====>startAbility err:' + JSON.stringify(err));
          })
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0200
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startAbilityForResult interface of UIExtensionAbility in the way of Promise, and all
     * parameters are valid (want and callback parameters), and call other application ability successfully.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0200', 0, async (done: Function) => {
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>Promise_0200 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>Promise_0200 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              expect(data.parameters.str).assertEqual('ACTION');
              expect(data.parameters.result).assertEqual(0);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>Promise_0200 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                abilityDelegator.executeShellCommand('aa force-stop com.example.forresulttestsecond')
                  .then(result => {
                    console.info('====>Promise_0200 unSubscribeCallback pkill ok' + JSON.stringify(result));
                    done();
                  })
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.forresulttestsecond',
            abilityName: 'EntryAbility',
            action: 'Promise_0200'
          }, (err) => {
            console.info('====>startAbility err:' + JSON.stringify(err));
          })
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0300
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startAbilityForResult interface of UIExtensionAbility in the way of Promise, and the
     * parameters are valid (want and callback parameters). After repeated calls, only the normal result is returned
     * to the last caller, and other callers return abnormal information, in which the resultCode is -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0300', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      await commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>Promise_0300 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            console.log(`====>ActsActionExtensionAbility deviceType: ${deviceType}`);
            if (deviceType === '2in1') {
              if (data.event == 'ACTS_CALL_EVENT') {
                console.info(`====>Promise_0300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
                expect(data.parameters.result).assertEqual(0);
              }
            } else {
              if (data.event == 'ACTS_CALL_EVENT') {
                console.info(`====>Promise_0300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
                expect(data.parameters.result).assertEqual(-1);
              }
            }
            if (data.event == 'ACTS_CALL_EVENT_ANOTHER') {
              console.info(`====>Promise_0300 subscribeCallBack 'ACTS_CALL_EVENT_ANOTHER'  ${data}`);
              expect(data.parameters.str).assertEqual('ACTION');
              expect(data.parameters.result).assertEqual(0);
            }
            globalThis.terminate('Promise_0300');
            abilityDelegator.executeShellCommand('aa force-stop com.example.forresulttestsecond')
              .then(result => {
                console.info('====>Promise_0300 unSubscribeCallback pkill ok' + JSON.stringify(result));
                commonEvent.unsubscribe(subscriber, () => {
                  console.info(`====>Promise_0300 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                  done();
                })
              })
              .catch((err: BusinessError) => {
                console.info('====>Promise_0300 unSubscribeCallback pkill ng' + JSON.stringify(err));
                commonEvent.unsubscribe(subscriber, () => {
                  console.info(`====>Promise_0300 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                  done();
                })
              })
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.mainhap',
            abilityName: 'EntryAbility',
            action: 'Promise_0300'
          }, (err) => {
            console.info('====>start Own Ability err:' + JSON.stringify(err));
          })
          setTimeout(() => {
            AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
              bundleName: 'com.example.forresulttestsecond',
              abilityName: 'EntryAbility',
              action: 'Promise_0300'
            }, (err) => {
              console.info('====>start Another Ability err:' + JSON.stringify(err));
            })
          }, 2000);
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0400
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startAbilityForResult interface of UIExtensionAbility in the way of Promise, and all
     * parameters are valid (want and callback parameters). After the call is successful, kill the target Ability
     * and return an exception message to the caller, in which the resultCode is -1.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0400', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>Promise_0400 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            console.info(`====>Promise_0400 subscribeCallBack all  ${data.event}`);
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>Promise_0400 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              expect(data.parameters.result).assertEqual(-1);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>Promise_0400 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                setTimeout(() => {
                  globalThis.terminate('Promise_0400');
                  done();
                }, 1000)
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.mainhap',
            abilityName: 'EntryAbility',
            action: 'Promise_0400'
          }, (err) => {
            console.info('====>start Own Ability err:' + JSON.stringify(err));
          })

          setTimeout(() => {
            abilityDelegator.executeShellCommand('aa force-stop com.example.forresulttestsecond')
              .then(result => {
                console.info('====>Promise_0400 pkill ok' + JSON.stringify(result));
              })
              .catch((err: BusinessError) => {
                console.info('====>Promise_0400 pkill ng' + JSON.stringify(err));
              })
          }, 2000)
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0500
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startAbilityForResult interface of UIAbilityContext in the way of Promise, the want
     * parameter is invalid, and the call fails.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0500', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>Promise_0500 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            console.info(`====>Promise_0500 subscribeCallBack all  ${data.event}`);
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>Promise_0500 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              expect(data.parameters.num).assertEqual(16000001);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>Promise_0500 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                globalThis.terminate('Promise_0500');
                setTimeout(() => {
                  done();
                }, 1000)
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.mainhap',
            abilityName: 'EntryAbility',
            action: 'Promise_0500'
          }, (err) => {
            console.info('====>start Own Ability err:' + JSON.stringify(err));
          })
        })
    })

    /*
     * @tc.number:ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0600
     * @tc.name:The parameters are valid (want and callback parameters),
     * and the startAbilityForResult of UIExtensionAbility is called.
     * @tc.desc:Call the startAbilityForResult interface of UIExtensionAbility in the way of Promise. The parameters
     * are valid (want and callback parameters), and the call fails because there is no system authority.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('ACTS_UIExtensionAbility_StartAbilityForResult_Promise_0600', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEventManager.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction)
        .then(async (data) => {
          console.info(`====>Promise_0600 createSubscriber  ${data}`);
          subscriber = data;
          commonEvent.subscribe(data, (err, data) => {
            console.info(`====>Promise_0600 subscribeCallBack all  ${data.event}`);
            if (data.event == 'ACTS_CALL_EVENT') {
              console.info(`====>Promise_0600 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
              console.info(`====>Promise_0600 subscribeCallBack  ${data.parameters.num}`);
              expect(data.parameters.num).assertEqual(16000004);
              commonEvent.unsubscribe(subscriber, () => {
                console.info(`====>Promise_0600 unSubscribeCallback 'ACTS_CALL_EVENT'`);
                setTimeout(() => {
                  abilityDelegator.executeShellCommand('aa force-stop com.example.forresulttestthrid')
                    .then(result => {
                      console.info('====>AsyncCallback_0600 unSubscribeCallback pkill ok' + JSON.stringify(result));
                      done();
                    })
                    .catch((err: BusinessError) => {
                      console.info('====>AsyncCallback_0600 unSubscribeCallback pkill ng' + JSON.stringify(err));
                      done();
                    })
                }, 2000)
              })
            }
          });
          AppStorage.get<common.UIAbilityContext>("context")!.startAbility({
            bundleName: 'com.example.forresulttestthrid',
            abilityName: 'EntryAbility',
            action: 'Promise_0600'
          }, (err) => {
            console.info('====>start Own Ability err:' + JSON.stringify(err));
          })
        })
    })
  })
}