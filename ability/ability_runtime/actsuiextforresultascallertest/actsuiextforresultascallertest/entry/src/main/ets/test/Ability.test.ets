/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { BusinessError, Callback } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { getContext } from '../common/getContext';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let deviceType = systemParameterEnhance.getSync('const.product.devicetype');
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['0100', '0200', '0300', '0400', '0500', '0600', '0700', '0800', '0900', '1000', '1100', '1200', '1300',
    '1400', '1500', '1600', '1700', '1800', '1900', '2000', 'kill', 'killui']
};

function sleep(time: number): Promise<number> {
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
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(2000);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0100
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0100
     * @tc.desc: Call the startAbilityForResultAsCaller interface of UIExtensionAbility, and all parameters are
     * valid (want parameters). Call this application ability successfully.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0100', 0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>StartAbilityForResultAsCaller_0100 createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0100'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0100 startAbility err:' + JSON.stringify(err));
        });
      });
      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0100 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0100 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0100 subscribeCallBack ${data}`)
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('0100');
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0200
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0200
     * @tc.desc: Call the startAbilityForResultAsCaller interface of UIExtensionAbility, all parameters are
     * valid (want parameters), and call other applications successfully.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0200', 0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0200'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0200 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0200 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0200 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0200') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0200 subscribeCallBack  ${data}`)
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0200 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('0200');
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0400
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0400
     * @tc.desc: Calling the startAbilityForResultAsCaller interface of UIExtensionAbility, the want parameter is
     * invalid, and the call failed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0400', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallersyspicker',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0400'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0400 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0400 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0400 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0400') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0400 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(401);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0400 unSubscribeCallback`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallersyspicker')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 0400 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0500
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0500
     * @tc.desc: In non-system application, calling the startAbilityForResultAsCaller interface of UIExtensionAbility,
     * the parameters are valid (want and callback parameters), and the call fails.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0500', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallersyspicker',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0500'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0500 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0500 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0500 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0500') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0500 subscribeCallBack` + JSON.stringify(data))
          expect(data.parameters?.result).assertEqual(202);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0500 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallerother')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 0500 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 0500 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0600
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0600
     * @tc.desc: The method of implicit startup is used to call the startAbilityForResultAsCaller interface of
     * UIExtensionAbility, and the call is successful.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0600', 0, async (done: Function) => {
      await sleep(1000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0600'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0600 startAbility err:' + JSON.stringify(err));
        });
      })

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0600 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0600 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0600') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0600 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`)
          expect(data.parameters?.result).assertEqual(0);
          expect(data.parameters?.str).assertEqual('ACTION');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0600 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('0600');
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0700
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0700
     * @tc.desc: When the Ability permission cannot be pulled up in the background, the startAbilityForResultAsCaller
     * in UIExtensionAbility is called from the background, and the parameters are valid (want parameters), and the
     * call fails.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0700', 0, async (done: Function) => {
      await sleep(500);
      if (deviceType === '2in1') {
        done();
        return;
      }
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);

        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerbackground',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0700'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0700 startAbility err:' + JSON.stringify(err));
        });

        await sleep(2000);
        console.info('====>[UIExtensionForResultAsCallerTest] 0700 after sleep ');
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerother',
          abilityName: 'CalledAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0700'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0700 start otherAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0700 setTimeout`);
        expect().assertFail();
        done();
      }, 100000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0700 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0700') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0700 subscribeCallBack` + JSON.stringify(data))
          expect(data.parameters?.result).assertEqual(201);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
        ;
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0700 unSubscribeCallback`);
        clearTimeout(clear);
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1100
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1100
     * @tc.desc: When calling the startAbilityForResult of UIExtensionAbility to pull up the non-existent UIAbility,
     * an error is returned.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1100', 0, async (done: Function) => {
      await sleep(1000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1100'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1100 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1100 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1100 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1100') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1100 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(16000001);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1100 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('1100');
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1200
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1200
     * @tc.desc: Calling startAbilityForResult of UIExtensionAbility to pull up invisibility returns an error.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1200', 0, async (done: Function) => {
      await sleep(1000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerbackground',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1200'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1200 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1200 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = async (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1200 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1200') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1200 subscribeCallBack  ${data}`);
          expect(data.parameters?.result).assertEqual(16000004);
          await sleep(1000);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1200 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallerbackground')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1200 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1200 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1300
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1300
     * @tc.desc: An internal error is returned when the startAbilityForResult of UIExtensionAbility is called and
     * the value of the abilityName in want is not passed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1300', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerbackground',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1300'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1300 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1300 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1300 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1300') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1300 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(16000019);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1300 unSubscribeCallback`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallerbackground')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1300 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1300 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1400
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1400
     * @tc.desc: It can be started normally when the startAbilityForResult of UIExtensionAbility is called
     * and options is undefined.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1400', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallersyspicker',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1400'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1400 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1400 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1400 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1400') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1400 subscribeCallBack ${data}`)
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_1400 unSubscribeCallback`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallersyspicker')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1400 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1400 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1500
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1500
     * @tc.desc: StartAbilityForResult of UIExtensionAbility can be started normally when options is null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1500', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallersyspicker',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1500'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1500 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1500 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1500 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1500') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1500 subscribeCallBack ${data}`)
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_1500 unSubscribeCallback`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallersyspicker')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1500 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1500 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1600
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1600
     * @tc.desc: Error returned when calling startAbilityForResult of UIExtensionAbility and want is null.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1600', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallersyspicker',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1600'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1600 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1600 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1600 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1600') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1600 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(401);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1600 unSubscribeCallback`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallersyspicker')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1600 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1600 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1700
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1700
     * @tc.desc: Error returned when calling startAbilityForResult of UIExtensionAbility and want is empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1700', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallersyspicker',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1700'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1700 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1700 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1700 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1700') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1700 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(16000019);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1700 unSubscribeCallback`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallersyspicker')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1700 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1700 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1800
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1800
     * @tc.desc: An error is returned when calling the startAbilityForResult of UIExtensionAbility and
     * bundleName is not passed in want.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1800', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallersyspicker',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1800'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1800 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1800 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1800 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1800') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1800 subscribeCallBack  ${data}`)
          expect(data.parameters?.result).assertEqual(16000001);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1800 unSubscribeCallback`);
        clearTimeout(clear);
        await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallersyspicker')
        .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1800 ok' + JSON.stringify(result));
        }).catch((err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerUIAbility] 1800 ng' + JSON.stringify(err));
        })
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1900
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1900
     * @tc.desc: Call startAbilityForResult of UIExtensionAbility to pull up invisibility when you have permission
     * to pull up invisibility.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_1900', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallersyspicker',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_1900'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 1900 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1900 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 1900 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '1900') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 1900 subscribeCallBack ${data}`)
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_1900 unSubscribeCallback`);
        clearTimeout(clear);
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_2000
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_2000
     * @tc.desc: The caller receives the return value -1 when calling the startAbilityForResult of
     * UIExtensionAbility to pull up the ability and kill it.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_2000', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_2000'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 2000 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 2000 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = async (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 2000 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '2000') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 2000 subscribeCallBack ${data}`)
          expect(data.parameters?.result).assertEqual(-1);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        } else if (data.event == 'kill') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 2000 subscribeCallBack kill ${data}`)
          await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallerbackground')
            .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2000 ok' + JSON.stringify(result));
            }).catch((err: BusinessError) => {
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2000 ng' + JSON.stringify(err));
            })
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_2000 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('2000');
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_2100
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_2100
     * @tc.desc: The caller will not be pulled up again when the startAbilityForResult of UIExtensionAbility is
     * called to pull up the ability and then the caller is killed and then the pulled party is killed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_2100', 0, async (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerbackground',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_2100'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 2100 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 2100 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = async (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 2100 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == 'killui') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 2100 subscribeCallBack killui ${data}`)
          await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallerbackground')
            .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2100 killui ok' + JSON.stringify(result));
            }).catch((err: BusinessError) => {
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2100 killui ng' + JSON.stringify(err));
              expect().assertFail();
            });

          await abilityDelegator.executeShellCommand('aa force-stop com.example.uiextensionforresultascallersyspicker')
            .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2100 killui2 ok' + JSON.stringify(result));
            }).catch((err: BusinessError) => {
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2100 killui2 ng' + JSON.stringify(err));
              expect().assertFail();
            });
          await sleep(1000);
          await abilityDelegator.executeShellCommand('aa dump -a')
            .then((result: AbilityDelegatorRegistry.ShellCmdResult) => {
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2100 aa dump  ok' + JSON.stringify(result));
              let judgement = JSON.stringify(result).split('com.example.uiextensionforresultascallerbackground');
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2100 aa dump  judgement' +
              JSON.stringify(judgement[1]));
              expect(judgement[1]).assertUndefined();
              commonEvent.unsubscribe(subscriber, unSubscribeCallback);
            }).catch((err: BusinessError) => {
              console.info('====>[UIExtensionForResultAsCallerUIAbility] 2100 aa dump  ng' + JSON.stringify(err));
              expect().assertFail();
            });
        }
      };

      let unSubscribeCallback = () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_2100 unSubscribeCallback`);
        clearTimeout(clear);
        done();
      };
    })

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0800
    * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0800
    * @tc.desc: Call startAbilityforresultscaler in UIExtensionAbility from the background when you have the
    * permission to pull up the ability from the background. All parameters are valid (want parameters), and the
    * call is successful.
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level1
    */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0800', 0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);

        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0800'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0800 startAbility err:' + JSON.stringify(err));
        });

        await sleep(2000);
        console.info('====>[UIExtensionForResultAsCallerTest] 0800 after sleep ');
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascallerother',
          abilityName: 'CalledAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0800'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0800 start otherAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0800 setTimeout`);
        expect().assertFail();
        done();
      }, 100000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0800 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0800') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0800 subscribeCallBack` + JSON.stringify(data))
          expect(data.code).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0800 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        clearTimeout(clear);
        await globalThis.terminate('0800');
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0900
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0900
     * @tc.desc: Pull up UIExtensibility through the component, call the startAbilityForResult of UIExtensibility to
     * pull up UIExtensibility, and the want obtained by UIExtensibility is the information for pulling up
     * UIExtensibility application.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0900', 0, async (done: Function) => {
      await sleep(1000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);

        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0900'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0900 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0900 setTimeout`);
        expect().assertFail();
        done();
      }, 100000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0900 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0900') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0900 subscribeCallBack` + JSON.stringify(data))
          expect(data.parameters?.str).assertEqual('com.example.uiextensionforresultascaller');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0900 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        clearTimeout(clear);
        await globalThis.terminate('0900');
        await sleep(1000);
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0300
     * @tc.name: SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0300
     * @tc.desc: Call the startAbilityForResultAsCaller interface of UIExtensionAbility, all parameters are
     * valid (want parameters), the calling ability is successful, and the parameters returned by
     * terminateSelfWithResult can be received.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionStartAbilityForResultAsCaller_0300', 0, async (done: Function) => {
      await sleep(2000);
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        abilityDelegator.startAbility({
          bundleName: 'com.example.uiextensionforresultascaller',
          abilityName: 'EntryAbility',
          parameters: {
            parameter: 'StartAbilityForResultAsCaller_0300'
          }
        }, (err: BusinessError) => {
          console.info('====>[UIExtensionForResultAsCallerTest] 0300 startAbility err:' + JSON.stringify(err));
        });
      });

      let clear = setTimeout(() => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0300 setTimeout`);
        expect().assertFail();
        done();
      }, 10000);

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0300 subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0300') {
          console.info(`====>[UIExtensionForResultAsCallerTest] 0300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`)
          expect(data.parameters?.result).assertEqual(0);
          expect(data.parameters?.str).assertEqual('ACTION');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[UIExtensionForResultAsCallerTest] 0300 unSubscribeCallback`);
        clearTimeout(clear);
        await globalThis.terminate('0300');
        done();
      };
    })
  })
}