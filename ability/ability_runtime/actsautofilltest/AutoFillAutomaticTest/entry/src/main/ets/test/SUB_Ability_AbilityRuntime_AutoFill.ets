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
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Component, Driver, UiWindow, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';

let driver = Driver.create();
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function sleep(ms): Promise<any> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function startRelyAbility() : Promise<void> {
  await abilityDelegator.executeShellCommand('aa start -b com.ohos.passwordbox -a EntryAbility').then(data => {
    hilog.info(0x0000, 'ActsAutoFillTest', '%{public}s', 'beforeEach aa start data is: ' + data.stdResult);
  }).catch(err => {
    hilog.info(0x0000, 'ActsAutoFillTest', '%{public}s', 'beforeEach err is: ' + JSON.stringify(err));
  });
}

export default function abilityTest() {
  describe('ActsAutoFillTest', function () {
    afterEach(async function (done) {
      await abilityDelegator.executeShellCommand('aa force-stop com.ohos.passwordbox');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFill_0700
     * @tc.name: AutoSaveRequest Interface : onSaveRequestSuccess
     * @tc.desc: Implicitly call the AutoSaveRequest interface and trigger success callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0700', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFill_0700_TAG';
      await sleep(2000);
      await startRelyAbility();

      await sleep(2000);
      let pwd_input = await driver.waitForComponent(ON.id('password_input'), 3000);
      await sleep(100);
      expect(pwd_input != null).assertTrue();
      await pwd_input.click();

      await sleep(2000);
      let success_btn = await driver.waitForComponent(ON.id('success_btn'), 3000);
      await sleep(100);
      expect(success_btn != null).assertTrue();
      await success_btn.click();

      await sleep(2000);
      pwd_input = await driver.waitForComponent(ON.id('password_input'), 3000);
      await sleep(100);
      expect(pwd_input != null).assertTrue();
      await pwd_input.click();
      await pwd_input.inputText('n');
      await sleep(1000);

      let login_btn = await driver.waitForComponent(ON.id('login_btn'), 1500);
      await sleep(100);
      expect(login_btn != null).assertTrue();
      await login_btn.click();
      await sleep(2000);
      let ok_btn = await driver.waitForComponent(ON.id('ok_btn'), 3000);
      await sleep(100);
      expect(ok_btn != null).assertTrue();
      await ok_btn.click();
      await sleep(2000);
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFill_0800
     * @tc.name: AutoSaveRequest Interface : onSaveRequestFailure
     * @tc.desc: Implicitly call the RequestAutoSave interface and trigger failure callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0800', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFill_0800_TAG';
      await sleep(2000);
      await startRelyAbility();

      await sleep(2000);
      let pwd_input = await driver.waitForComponent(ON.id('password_input'), 3000);
      await sleep(100);
      expect(pwd_input != null).assertTrue();
      await pwd_input.click();

      await sleep(2000);
      let success_btn = await driver.waitForComponent(ON.id('success_btn'), 3000);
      await sleep(100);
      expect(success_btn != null).assertTrue();
      await success_btn.click();

      await sleep(1500);
      pwd_input = await driver.waitForComponent(ON.id('password_input'), 3000);
      await sleep(100);
      expect(pwd_input != null).assertTrue();
      await pwd_input.inputText('n');
      await sleep(1000);
      let login_btn = await driver.waitForComponent(ON.id('login_btn'), 1500);
      expect(login_btn != null).assertTrue();
      await sleep(1000);
      await login_btn.click();

      await sleep(2000);
      let no_btn = await driver.waitForComponent(ON.id('no_btn'), 3000);
      await sleep(100);
      expect(no_btn != null).assertTrue();
      await no_btn.click();
      await sleep(2000);
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFill_0100
     * @tc.name: RequestAutoFill Interface : onFillRequestSuccess
     * @tc.desc: Implicitly call the AutoFillRequest interface and trigger success callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0100', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFill_0100_TAG';
      console.info(TAG, 'start.');

      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let pwdTextInput = await driver.waitForComponent(ON.id('password_input'), 2500);
      expect(pwdTextInput != null).assertTrue();
      await sleep(100);
      await pwdTextInput.click();

      await sleep(1000);
      let successButton = await driver.waitForComponent(ON.id('success_btn'), 2500);
      expect(successButton != null).assertTrue();
      await sleep(500);
      await successButton.click();

      await sleep(1000);
      let userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(1000);
      let userText = await userTextInput.getText();
      console.info(TAG, 'userText is ' + userText);
      await sleep(500);
      expect(userText == '').assertFalse();
      console.info(TAG, 'end.');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFill_0200
     * @tc.name: RequestAutoFill Interface : onFillRequestFailed
     * @tc.desc: Implicitly call the AutoFillRequest interface and trigger failure callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0200', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFill_0200_TAG';
      console.info(TAG, 'start.');

      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let pwdTextInput = await driver.waitForComponent(ON.id('password_input'), 2000);
      expect(pwdTextInput != null).assertTrue();
      await sleep(100);
      await pwdTextInput.click();

      await sleep(1000);
      let failureButton = await driver.waitForComponent(ON.id('failure_btn'), 2500);
      expect(failureButton != null).assertTrue();
      await sleep(100);
      await failureButton.click();

      await sleep(1000);
      let userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(1000);
      let userText = await userTextInput.getText();
      await sleep(500);
      console.info(TAG, 'userText is ' + userText);
      expect(userText == '').assertTrue();
      console.info(TAG, 'end.');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFill_0300
     * @tc.name: RequestAutoFill Interface : onFillRequestCanceled
     * @tc.desc: Implicitly call the AutoFillRequest interface and trigger cancel callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0300', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFill_0300_TAG';
      console.info(TAG, 'start.');

      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let pwdTextInput = await driver.waitForComponent(ON.id('password_input'), 2500);
      expect(pwdTextInput != null).assertTrue();
      await sleep(100);
      await pwdTextInput.click();

      await sleep(1000);
      let cancelButton = await driver.waitForComponent(ON.id('cancel_btn'), 2500);
      expect(cancelButton != null).assertTrue();
      await sleep(500);
      await cancelButton.click();

      await sleep(1000);
      let userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(1000);
      let userText = await userTextInput.getText();
      console.info(TAG, 'userText is ' + userText);
      expect(userText == '').assertTrue();
      console.info(TAG, 'end.');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFill_0400
     * @tc.name: RequestAutoFill Interface : onFillRequestSuccess(USER_NAME textInput)
     * @tc.desc: Implicitly call the AutoFillRequest interface and trigger success callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0400', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFill_0400_TAG';
      console.info(TAG, 'start.');

      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(100);
      await userTextInput.click();

      await sleep(1000);
      let successButton = await driver.waitForComponent(ON.id('success_btn'), 2500);
      expect(successButton != null).assertTrue();
      await sleep(100);
      await successButton.click();

      await sleep(1000);
      userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(1000);
      let userText = await userTextInput.getText();
      await sleep(100);
      console.info(TAG, 'userText is ' + userText);
      expect(userText != '').assertTrue();
      console.info(TAG, 'end.');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFill_0500
     * @tc.name: RequestAutoFill Interface : onFillRequestFailed
     * @tc.desc: Implicitly call the AutoFillRequest interface and trigger failure callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0500', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFill_0500_TAG';
      console.info(TAG, 'start.');

      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(100);
      await userTextInput.click();

      await sleep(1000);
      let failureButton = await driver.waitForComponent(ON.id('failure_btn'), 2500);
      expect(failureButton != null).assertTrue();
      await sleep(100);
      await failureButton.click();

      await sleep(1000);
      userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(1000);
      let userText = await userTextInput.getText();
      await sleep(100);
      console.info(TAG, 'userText is ' + userText);
      await sleep(1000);
      expect(userText == '').assertTrue();
      console.info(TAG, 'end.');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFill_0600
     * @tc.name: RequestAutoFill Interface : onFillRequestCanceled
     * @tc.desc: Implicitly call the AutoFillRequest interface and trigger cancel callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0600', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFill_0600_TAG';
      console.info(TAG, 'start.');

      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(100);
      await userTextInput.click();

      await sleep(1000);
      let cancelButton = await driver.waitForComponent(ON.id('cancel_btn'), 2500);
      expect(cancelButton != null).assertTrue();
      await sleep(100);
      await cancelButton.click();

      await sleep(1000);
      userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(1000);
      let userText = await userTextInput.getText();
      await sleep(100);
      console.info(TAG, 'userText is ' + userText);
      await sleep(500);
      expect(userText == '').assertTrue();
      console.info(TAG, 'end.');
      done();
    })
  })
}
