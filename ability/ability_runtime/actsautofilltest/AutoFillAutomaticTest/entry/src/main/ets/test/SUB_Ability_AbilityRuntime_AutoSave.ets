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
import autoFillManager from '@ohos.app.ability.autoFillManager';
import commonEventManager from '@ohos.commonEventManager';

let driver = Driver.create();
let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function sleep(ms): Promise<any> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function startRelyAbility() : Promise<void> {
  await abilityDelegator.executeShellCommand('aa start -b com.ohos.passwordbox -a EntryAbility').then(data => {
    hilog.info(0x0000, 'ActsAutoSaveTest', '%{public}s', 'beforeEach aa start data is: ' + data.stdResult);
  }).catch(err => {
    hilog.info(0x0000, 'ActsAutoSaveTest', '%{public}s', 'beforeEach err is: ' + JSON.stringify(err));
  });
}

export default function abilityTest() {
  describe('ActsAutoSaveTest', function () {
    afterEach(async function (done) {
      await abilityDelegator.executeShellCommand('aa force-stop com.ohos.passwordbox');
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoSave_0100
     * @tc.name: RequestAutoSave Interface : onSaveRequestSuccess
     * @tc.desc: Manually call the RequestAutoSave interface and trigger success callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoSave_0100', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoSave_0100_TAG';
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
      await pwd_input.inputText('n');
      await sleep(1000);
      
      let uiContext: UIContext;
      console.info("uiContext: ", uiContext);
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          console.log("save request on success");
        },
        onFailure: () => {
          console.log("save request on failure");
        }
      }
      console.log("callback: ", JSON.stringify(callback));
      try {
        autoFillManager.requestAutoSave(uiContext, callback);
      } catch (error) {
        console.log("requestAutoSave catch error: ", JSON.stringify(error));
      }

      let save_btn = await driver.waitForComponent(ON.id('save_btn'), 2000);
      await sleep(100);
      expect(save_btn != null).assertTrue();
      await save_btn.click();

      await sleep(2000);
      let ok_btn = await driver.waitForComponent(ON.id('ok_btn'), 3000);
      await sleep(100);
      expect(ok_btn != null).assertTrue();
      await ok_btn.click();

      await sleep(2000);
      let username_input = await driver.waitForComponent(ON.id('username_input'), 3000);
      await sleep(100);
      expect(username_input != null).assertTrue();
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoSave_0200
     * @tc.name: RequestAutoSave Interface : onSaveRequestFailed
     * @tc.desc: Manually call the RequestAutoSave interface and trigger failure callback.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoSave_0200', 0, async function (done) {
      const TAG = 'SUB_Ability_AbilityRuntime_AutoSave_0100_TAG';
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
      await pwd_input.inputText('n');
      await sleep(1000);
      let save_btn = await driver.waitForComponent(ON.id('save_btn'), 2000);
      await sleep(100);
      expect(save_btn != null).assertTrue();
      await save_btn.click();

      await sleep(2000);
      let no_btn = await driver.waitForComponent(ON.id('no_btn'), 3000);
      await sleep(100);
      expect(no_btn != null).assertTrue();
      await no_btn.click();

      await sleep(2000);
      let username_input = await driver.waitForComponent(ON.id('username_input'), 3000);
      await sleep(100);
      expect(username_input != null).assertTrue();
      
      done();
    })

    /**
     * @tc.number: SUB_Ability_AbilityRuntime_AutoSave_0300
     * @tc.name: RequestAutoSave Interface : onSaveRequest error
     * @tc.desc: verify incorrect use of RequestAutoSave interface which triggers error.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     */
    it('SUB_Ability_AbilityRuntime_AutoSave_0300', 0, async function (done) {
      await sleep(2000);
      await startRelyAbility();
      await sleep(1000);
      let username_input = await driver.waitForComponent(ON.id('username_input'), 2500);
      expect(username_input != null).assertTrue();
      await sleep(1000);
      let save_btn = await driver.waitForComponent(ON.id('save_btn'), 1000);
      expect(save_btn != null).assertTrue();
      await save_btn.click();
      await sleep(1000);
      let ok_btn = await driver.waitForComponent(ON.id('ok_btn'), 2500);
      expect(ok_btn != null).assertFalse();
      await sleep(1000);
      let username_text = await username_input.getText();
      expect(username_text == '').assertTrue();
      done();
    })
  })
}
