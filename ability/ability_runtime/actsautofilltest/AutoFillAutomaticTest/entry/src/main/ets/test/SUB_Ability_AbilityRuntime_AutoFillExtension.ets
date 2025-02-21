/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Component, Driver, UiWindow, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';

let driver = Driver.create();
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let SubscribeList = {
  events: [
    'AutoFillExtensionTest0100',
    'AutoFillExtensionTest0200',
    'AutoFillExtensionTest0300',
    'AutoFillExtensionTest0400',
  ]
};

function sleep(ms): Promise<any> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function startRelyAbility() : Promise<void> {
  await abilityDelegator.executeShellCommand('aa start -b com.ohos.passwordbox -a EntryAbility').then(data => {
    hilog.info(0x0000, 'ActsAutoFillExtensionTest', '%{public}s', 'beforeEach aa start data is: ' + data.stdResult);
  }).catch(err => {
    hilog.info(0x0000, 'ActsAutoFillExtensionTest', '%{public}s', 'beforeEach err is: ' + JSON.stringify(err));
  });
}

export default function abilityTest() {
  describe('ActsAutoFillExtensionTest', function () {
    afterEach(async function (done) {
      await abilityDelegator.executeShellCommand('aa force-stop com.ohos.passwordbox');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFillExtension_0100
     * @tc.name: AutoFillExtensionAbility: onCreate, onFillRequest, onForeground
     * @tc.desc: verify onCreate, onFillRequest and onForeground lifecycle of AutoFillExtensionAbility.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFillExtension_0100', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFillExtension_0100_TAG';
      console.info(TAG, 'start.');
      await sleep(2000);
      let subscriber;

      function subscribeCallBack(err, data) {
        console.info(TAG, 'enter subscribe callback' + JSON.stringify(data));
        if (data.event == 'AutoFillExtensionTest0100') {
          expect(data.parameters.onCreate).assertEqual(1);
          expect(data.parameters.onFillRequest).assertEqual(1);
          expect(data.parameters.onForeground).assertEqual(1);
          commonEventManager.unsubscribe(subscriber, () => {
            console.info(TAG, 'enter subscribe callback oncreate' + data.parameters.onCreate);
            done();
        });
        }
      }

      commonEventManager.createSubscriber(SubscribeList).then(async (data) => {
        console.info(TAG, 'create subscribee');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        await sleep(2000);
        await startRelyAbility();
        await sleep(1000);
        let pwdTextInput = await driver.waitForComponent(ON.id('password_input'), 2500);
        await sleep(500);
        expect(pwdTextInput != null).assertTrue();
        let userTextInput = await driver.waitForComponent(ON.id('username_input'), 1000);
        await sleep(500);
        expect(userTextInput != null).assertTrue();
        let setPwdTextInput = await driver.waitForComponent(ON.id('new_password_input'), 1000);
        await sleep(500);
        expect(setPwdTextInput != null).assertTrue();
        await pwdTextInput.click();
        await sleep(2500);
        console.info(TAG, 'end.');
      })
      console.info(TAG, 'end.');
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFillExtension_0200
     * @tc.name: AutoFillExtensionAbility: onSaveRequest, onSessionDestroy, onDestroy
     * @tc.desc: verify onSaveRequest, onSessionDestroy and onDestroy lifecycle of AutoFillExtensionAbility.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFillExtension_0200', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFillExtension_0200_TAG';
      console.info(TAG, 'start.');
      await sleep(2000);
      let subscriber;

      function subscribeCallBack(err, data) {
        console.info(TAG, 'enter subscribe callback' + JSON.stringify(data));
        if (data.event == 'AutoFillExtensionTest0200' && data.parameters.onSaveRequest == 1) {
          expect(data.parameters.onSessionDestroy).assertEqual(1);
          expect(data.parameters.onDestroy).assertEqual(1);
          commonEventManager.unsubscribe(subscriber, () => {
            console.info(TAG, 'enter subscribe callback onSaveRequest, onSessionDestroy and onDestroy');
            done();
          });
        }
      }

      commonEventManager.createSubscriber(SubscribeList).then(async (data) => {
        console.info(TAG, 'create subscriber.');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        await sleep(1000);
        await startRelyAbility();
        await sleep(1000);
        let pwdTextInput = await driver.waitForComponent(ON.id('password_input'), 2000);
        await sleep(100);
        expect(pwdTextInput != null).assertTrue();
        await pwdTextInput.click();
        await sleep(1000);
        let successButton = await driver.waitForComponent(ON.id('success_btn'), 2000);
        await sleep(100);
        expect(successButton != null).assertTrue();
        await successButton.click();
        await sleep(1000);
        let pwdTextInputAgain = await driver.waitForComponent(ON.id('password_input'), 2000);
        await sleep(100);
        expect(pwdTextInputAgain != null).assertTrue();
        await pwdTextInputAgain.inputText('u');
        await sleep(1000);
        let saveButton = await driver.waitForComponent(ON.id('save_btn'), 1000);
        await sleep(100);
        expect(saveButton != null).assertTrue();
        await saveButton.click();
        await sleep(1000);
        let noButton = await driver.waitForComponent(ON.id('no_btn'), 2000);
        await sleep(100);
        expect(noButton != null).assertTrue();
        await noButton.click();
        await sleep(3000);
        console.info(TAG, 'end.');
      })
      console.info(TAG, 'end.');
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFillExtension_0300
     * @tc.name: AutoFillExtensionAbility: onBackground
     * @tc.desc: verify onBackground lifecycle of AutoFillExtensionAbility.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFillExtension_0300', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFillExtension_0300_TAG';
      console.info(TAG, 'start.');
      await sleep(2000);
      let subscriber;

      function subscribeCallBack(err, data) {
        if (data.event == 'AutoFillExtensionTest0300') {
          expect(data.parameters.onBackground).assertEqual(1);
          commonEventManager.unsubscribe(subscriber, () => {
            console.info(TAG, 'enter subscribe callback onBackground' + data.parameters.onBackground);
            done();
          });
        }
      }

      commonEventManager.createSubscriber(SubscribeList).then(async (data) => {
        console.info(TAG, 'create subscriber');
        subscriber = data;
        commonEventManager.subscribe(subscriber, subscribeCallBack);
        await sleep(2000);
        await startRelyAbility();
        await sleep(1000);
        let pwdTextInput = await driver.waitForComponent(ON.id('password_input'), 2000);
        await sleep(100);
        expect(pwdTextInput != null).assertTrue();
        await pwdTextInput.click();
        await sleep(1000);
	      let successButton = await driver.waitForComponent(ON.id('success_btn'), 2500);
        await sleep(100);
        expect(successButton != null).assertTrue();
        await driver.pressHome();
        await sleep(2000);
        console.info(TAG, 'Wait For End.');
	      await sleep(2000);
	      console.info(TAG, 'end.');
      })
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFillExtension_0400
     * @tc.name: AutoFillContext properties verification
     * @tc.desc: verify properties and functions of AutoFillExtensionContext can be normally accessed and called.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFillExtension_0400', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFillExtension_0400_TAG';
      console.info(TAG, 'start.');
      await sleep(2000);
      let subscriber;

      function SubscribeCallback(err, data) {
        console.info(TAG, 'SubScribeCallback err: ' + JSON.stringify(err));
        console.info(TAG, 'SubscribeCallback data: ' + JSON.stringify(data));
        if (data.event == 'AutoFillExtensionTest0400') {
          console.info('enter verify');
          VerifyContext(data.parameters);
        }
      }

      commonEventManager.createSubscriber(SubscribeList).then(async (data) => {
        console.debug(TAG, 'Create Subscriber');
        subscriber = data;
        commonEventManager.subscribe(subscriber, SubscribeCallback);
        await sleep(2000);
        await startRelyAbility();
        await sleep(1000);
        let pwd_input = await driver.waitForComponent(ON.id('password_input'), 2000);
        await sleep(100);
        expect(pwd_input != null).assertTrue();
        await pwd_input.click();

        await sleep(1000);
        let success_btn = await driver.waitForComponent(ON.id('success_btn'), 2000);
        await sleep(100);
        expect(success_btn != null).assertTrue();
        await success_btn.click();
        await sleep(2000);
        console.log("waitForEnd.");
        await sleep(2000);
        console.info(TAG, 'end.');
      })

      function VerifyContext(context) {
        try {
          expect(context != null).assertTrue();
          console.info('out verify begin');
          expect(context.currentHapModuleInfoName == 'entry').assertTrue();
          expect(context.configLanguage == 'zh-Hans').assertTrue();
          expect(context.extensionAbilityInfoBundleName == 'com.ohos.passwordbox').assertTrue();
          expect(context.applicationInfoName == 'com.ohos.passwordbox').assertTrue();
          console.info('out verify middle1');
          expect(context.applicationContextCacheDir.indexOf('/cache') != -1).assertTrue();
          expect(context.applicationContextTempDir.indexOf('/temp') != -1).assertTrue();
          expect(context.applicationContextFilesDir.indexOf('/files') != -1).assertTrue();
          expect(context.applicationContextDatabaseDir.indexOf('/database') != -1).assertTrue();
          expect(context.applicationContextPreferencesDir.indexOf('/preferences') != -1).assertTrue();
          expect(context.applicationContextBundleCodeDir.indexOf('/bundle') != -1).assertTrue();
          expect(context.applicationContextDistributedFilesDir.indexOf('/distributedfiles') != -1).assertTrue();
          expect(context.applicationContextArea == 1).assertTrue();
          expect(context.eventHubEventMessage == '').assertFalse();
          console.info('out verify middle2');
          expect(context.bundleContextApplicationInfo == '').assertFalse();
          expect(context.moduleContextApplicationInfoSecond == '').assertFalse();
          expect(context.moduleContextApplicationInfoFirst == '').assertFalse();
          console.info('out verify middle3');
          expect(context.stageMode == true).assertTrue();
          console.info('out verify end');
        } catch (err) {
          hilog.error(0x0000, 'testTAG', 'context verification caught an error: %{public}s', JSON.stringify(err));
        }
        done();
      }
    })
  })
}
