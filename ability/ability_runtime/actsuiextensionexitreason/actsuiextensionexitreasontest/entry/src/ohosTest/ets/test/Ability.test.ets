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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

import commonEvent from '@ohos.commonEventManager';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, Callback } from '@ohos.base';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['0100']
};

function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(500);
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0100
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's share type is correct
     * (compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0100', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s1SUB_Ability_AbilityRuntime_UIEXTensionExitReason_share_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'share',
            'UIExtensionAbilityName': 'UIExtAbility1'
          }
        }, (err: BusinessError) => {
          console.info('====>[s1UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s1UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s1UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s1UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0200
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's action type is correct
     * (compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0200', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s2SUB_Ability_AbilityRuntime_UIEXTensionExitReason_action_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'action',
            'UIExtensionAbilityName': 'UIExtAbility2'
          }
        }, (err: BusinessError) => {
          console.info('====>[s2UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s2UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s2UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s2UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0300
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysDialog/common type
     * is correct
     * (compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0300', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s3SUB_Ability_AbilityRuntime_UIEXTensionExitReason_common_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysDialog/common',
            'UIExtensionAbilityName': 'UIExtAbility3'
          }
        }, (err: BusinessError) => {
          console.info('====>[s3UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s3UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s3UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s3UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0400
    * @tc.name: UIExtension launches LaunchParam for the first time
    * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysDialog/atomicServicePanel
    * type is correct(compared to the default value)
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level1
    */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0400', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s4SUB_Ability_AbilityRuntime_UIEXTensionExitReason_atomicServicePanel_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysDialog/atomicServicePanel',
            'UIExtensionAbilityName': 'UIExtAbility4'
          }
        }, (err: BusinessError) => {
          console.info('====>[s4UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s4UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s4UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s4UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0500
    * @tc.name: UIExtension launches LaunchParam for the first time
    * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysDialog/power
    * type is correct(compared to the default value)
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level1
    */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0500', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s5SUB_Ability_AbilityRuntime_UIEXTensionExitReason_power_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysDialog/power',
            'UIExtensionAbilityName': 'UIExtAbility5'
          }
        }, (err: BusinessError) => {
          console.info('====>[s5UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s5UIExtensionForResultAsCallerTest] 0100——0004 subscribeCallBack
          ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s5UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s5UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0600
    * @tc.name: UIExtension launches LaunchParam for the first time
    * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysPicker/share
    * type is correct(compared to the default value)
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level1
    */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0600', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s6SUB_Ability_AbilityRuntime_UIEXTensionExitReason_Share_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysPicker/share',
            'UIExtensionAbilityName': 'UIExtAbility6'
          }
        }, (err: BusinessError) => {
          console.info('====>[s6UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s6UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s6UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s6UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0700
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's hms/account type is correct
     * (compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0700', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s7SUB_Ability_AbilityRuntime_UIEXTensionExitReason_account_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'hms/account',
            'UIExtensionAbilityName': 'UIExtAbility7'
          }
        }, (err: BusinessError) => {
          console.info('====>[s7UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s7UIExtensionForResultAsCallerTest] 0100——0004 subscribeCallBack
          ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s7UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s7UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0800
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's ads type is correct
     * (compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0800', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s8SUB_Ability_AbilityRuntime_UIEXTensionExitReason_ads_0100——0001 createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'ads',
            'UIExtensionAbilityName': 'UIExtAbility8'
          }
        }, (err: BusinessError) => {
          console.info('====>[s8UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s8UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s8UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s8UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })


    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0900
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's voip type is correct
     * (compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */

    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0900', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s9SUB_Ability_AbilityRuntime_UIEXTensionExitReason_voip_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'voip',
            'UIExtensionAbilityName': 'UIExtAbility9'
          }
        }, (err: BusinessError) => {
          console.info('====>[s9UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s9UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s9UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' + JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s9UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01000
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysDialog/meetimeCall
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01000', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s10SUB_Ability_AbilityRuntime_UIEXTensionExitReason_meetimeCall_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysDialog/meetimeCall',
            'UIExtensionAbilityName': 'UIExtAbility10'
          }
        }, (err: BusinessError) => {
          console.info('====>[s10UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s10UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s10UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s10UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01100
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysDialog/meetimeContact
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01100', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s11SUB_Ability_AbilityRuntime_UIEXTensionExitReason_meetimeContact_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysDialog/meetimeContact',
            'UIExtensionAbilityName': 'UIExtAbility11'
          }
        }, (err: BusinessError) => {
          console.info('====>[s11UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s11UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s11UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s11UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01200
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysDialog/meetimeMessage
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01200', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s12SUB_Ability_AbilityRuntime_UIEXTensionExitReason_meetimeMessage_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysDialog/meetimeMessage',
            'UIExtensionAbilityName': 'UIExtAbility12'
          }
        }, (err: BusinessError) => {
          console.info('====>[s12UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s12UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s12UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s12UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01300
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysDialog/print
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01300', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s13SUB_Ability_AbilityRuntime_UIEXTensionExitReason_print_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysDialog/print',
            'UIExtensionAbilityName': 'UIExtAbility13'
          }
        }, (err: BusinessError) => {
          console.info('====>[s13UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s13UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s13UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s13UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01400
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysPicker/meetimeContact
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01400', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s14SUB_Ability_AbilityRuntime_UIEXTensionExitReason_meetimeContact_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysPicker/meetimeContact',
            'UIExtensionAbilityName': 'UIExtAbility14'
          }
        }, (err: BusinessError) => {
          console.info('====>[s14UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s14UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s14UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s14UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01500
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysPicker/meetimeCallLog
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01500', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s15SUB_Ability_AbilityRuntime_UIEXTensionExitReason_meetimeCallLog_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysPicker/meetimeCallLog',
            'UIExtensionAbilityName': 'UIExtAbility15'
          }
        }, (err: BusinessError) => {
          console.info('====>[s15UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s15UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s15UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s15UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_0160
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysPicker/photoPicker
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01600', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s16SUB_Ability_AbilityRuntime_UIEXTensionExitReason_photoPicker_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysPicker/photoPicker',
            'UIExtensionAbilityName': 'UIExtAbility16'
          }
        }, (err: BusinessError) => {
          console.info('====>[s16UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s16UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s16UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s16UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01700
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sys/commonUI
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01700', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s17SUB_Ability_AbilityRuntime_UIEXTensionExitReason_commonUI_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sys/commonUI',
            'UIExtensionAbilityName': 'UIExtAbility17'
          }
        }, (err: BusinessError) => {
          console.info('====>[s17UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s17UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s17UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s17UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01800
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysPicker/navigation
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01800', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s18SUB_Ability_AbilityRuntime_UIEXTensionExitReason_navigation_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysPicker/navigation',
            'UIExtensionAbilityName': 'UIExtAbility18'
          }
        }, (err: BusinessError) => {
          console.info('====>[s18UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s18UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s18UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s18UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01900
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysPicker/appSelector
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_01900', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s19SUB_Ability_AbilityRuntime_UIEXTensionExitReason_appSelector_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysPicker/appSelector',
            'UIExtensionAbilityName': 'UIExtAbility19'
          }
        }, (err: BusinessError) => {
          console.info('====>[s19UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s19UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s19UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s19UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_02000
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysPicker/camera
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_02000', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s20SUB_Ability_AbilityRuntime_UIEXTensionExitReason_camera_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysPicker/camera',
            'UIExtensionAbilityName': 'UIExtAbility20'
          }
        }, (err: BusinessError) => {
          console.info('====>[s20UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s20UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s20UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s20UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIEXTensionExitReason_02100
     * @tc.name: UIExtension launches LaunchParam for the first time
     * @tc.desc: Verify if the LaunchParam carried during the first startup of UIExtension's sysDialog/userAuth
     * type is correct(compared to the default value)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('SUB_Ability_AbilityRuntime_UIEXTensionExitReason_02100', 0, (done: Function) => {
      let subscriber: commonEvent.CommonEventSubscriber;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>s21SUB_Ability_AbilityRuntime_UIEXTensionExitReason_userAuth_0100——0001
          createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        abilityDelegator.startAbility({
          bundleName: 'com.example.actsuiextensionexitreasontest',
          abilityName: 'EntryAbility',
          action: 'StartAbilityForResultAsCaller_0100',
          parameters: {
            'UIExtensionType': 'sysDialog/userAuth',
            'UIExtensionAbilityName': 'UIExtAbility21'
          }
        }, (err: BusinessError) => {
          console.info('====>[s21UIExtensionForResultAsCallerTest] 0100——0002 startAbility err:' + JSON.stringify(err));
        });
      });


      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>[s21UIExtensionForResultAsCallerTest] 0100——0004
          subscribeCallBack ACTS_CallFunction  ${data}`);
        if (data.event == '0100') {
          console.info('====>[s21UIExtensionForResultAsCallerTest] 0100——0005 subscribeCallBack ' +
          JSON.stringify(data))

          expect(data.code).assertEqual(0);
          expect(data.parameters?.launchReason).assertEqual(AbilityConstant.LaunchReason.START_ABILITY);
          expect(data.parameters?.lastExitReason).assertEqual(AbilityConstant.LastExitReason.NORMAL);
          expect(data.parameters?.lastExitMessage).assertEqual('');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = async () => {
        console.info(`====>[s21UIExtensionForResultAsCallerTest] StartAbilityForResultAsCaller_0100——0006
          unSubscribeCallback`);
        done();
      };

    })
  })
}