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
  describe('ActsAutoFillPasswordTest', function () {
    afterEach(async function (done) {
      await abilityDelegator.executeShellCommand('aa force-stop com.ohos.passwordbox');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFillPassword_0100
     * @tc.name: AutoFillRequest Interface: new password request
     * @tc.desc: Implicitly call AutoFillRequest( AutoFillType: NEW_PASSWORD) and trigger success callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFillPassword_0100', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFillPassword_0100_TAG';
      console.info(TAG, 'start.');
      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let setPwdTextInput = await driver.waitForComponent(ON.id('new_password_input'), 2500);
      expect(setPwdTextInput != null).assertTrue();
      await sleep(100);
      await setPwdTextInput.click();

      await sleep(1000);
      let successButton = await driver.waitForComponent(ON.id('success_btn'), 2500);
      expect(successButton != null).assertTrue();
      await sleep(100);
      await successButton.click();

      await sleep(1000);
      let userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(userTextInput != null).assertTrue();
      await sleep(1000);
      let userText = await userTextInput.getText();
      await sleep(100);
      console.info(TAG, 'userText is ' + userText);
      await sleep(500);
      expect(userText != '').assertTrue();
      console.info(TAG, 'end.');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFillPassword_0200
     * @tc.name: AutoFillRequest Interface: new password request
     * @tc.desc: Implicitly call AutoFillRequest( AutoFillType: NEW_PASSWORD) and trigger failure callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFillPassword_0200', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFillPassword_0200_TAG';
      console.info(TAG, 'start.');

      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let setPwdTextInput = await driver.waitForComponent(ON.id('new_password_input'), 2500);
      expect(setPwdTextInput != null).assertTrue();
      await sleep(100);
      await setPwdTextInput.click();

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
      await sleep(100);
      console.info(TAG, 'userText is ' + userText);
      await sleep(500);
      expect(userText == '').assertTrue();
      console.info(TAG, 'end.');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoFillPassword_0300
     * @tc.name: AutoFillRequest Interface: new password request
     * @tc.desc: Implicitly call AutoFillRequest( AutoFillType: NEW_PASSWORD) and trigger cancel callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoFillPassword_0300', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoFillPassword_0300_TAG';
      console.info(TAG, 'start.');

      await sleep(2000);
      await startRelyAbility();

      await sleep(1000);
      let setPwdTextInput = await driver.waitForComponent(ON.id('new_password_input'), 2500);
      expect(setPwdTextInput != null).assertTrue();
      await sleep(100);
      await setPwdTextInput.click();

      await sleep(1000);
      let cancelButton = await driver.waitForComponent(ON.id('cancel_btn'), 2500);
      expect(cancelButton != null).assertTrue();
      await sleep(100);
      await cancelButton.click();

      await sleep(1000);
      let userTextInput = await driver.waitForComponent(ON.id('username_input'), 2500);
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
