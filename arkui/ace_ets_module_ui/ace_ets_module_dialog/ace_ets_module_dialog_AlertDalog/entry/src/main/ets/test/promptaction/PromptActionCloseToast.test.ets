/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { Driver, ON, Component } from '@ohos.UiTest';
import promptAction from '@ohos.promptAction';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function PromptActionCloseToastTest() {
  const driver = Driver.create();

  beforeEach(async (done: Function) => {
    console.info('PromptActionCloseToastTest beforeEach start');
    let options: router.RouterOptions = {
      url: 'MainAbility/pages/promptaction/PromptActionCloseToastTest',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info('get PromptActionCloseToastTest state pages:' + JSON.stringify(pages));
      if (!('AlertDialogLife' == pages.name)) {
        console.info('get PromptActionCloseToastTest pages.name:' + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2500);
        console.info('push PromptActionCloseToastTest page result:' + JSON.stringify(result));
      }
    } catch (err) {
      console.error('push PromptActionCloseToastTest page error:' + err);
    }
    console.info('PromptActionCloseToastTest beforeEach end');
    done();
  });

    /**
     * @tc.name   promptActionCloseToastValidId_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSETOAST_VALID_0100
     * @tc.desc   Test promptAction.closeToast with valid toast ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionCloseToastValidId_0100', Level.LEVEL1, async () => {
      console.info('[promptActionCloseToastValidId_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      // First create a toast
      let createButton = await driver.findComponent(ON.id('btn_create_toast'));
      await createButton.click();
      await CommonFunc.sleep(1000);
      
      // Then close it
      let button = await driver.findComponent(ON.id('btn_closetoast_valid'));
      await button.click();
      await CommonFunc.sleep(1000);

      // Verify test result from page state
      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionCloseToastValidId_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: Toast created');
      console.info('[promptActionCloseToastValidId_0100] END');
    })

    /**
     * @tc.name   promptActionCloseToastInvalidId_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSETOAST_INVALID_0100
     * @tc.desc   Test promptAction.closeToast with invalid toast ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionCloseToastInvalidId_0100', Level.LEVEL1, async () => {
      console.info('[promptActionCloseToastInvalidId_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_closetoast_invalid'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionCloseToastInvalidId_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: closeToast valid ID: FAILED');
      console.info('[promptActionCloseToastInvalidId_0100] END');
      
    })

    /**
     * @tc.name   promptActionCloseToastNullId_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSETOAST_NULL_0100
     * @tc.desc   Test promptAction.closeToast with null toast ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionCloseToastNullId_0100', Level.LEVEL1, async () => {
      console.info('[promptActionCloseToastNullId_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_closetoast_null'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionCloseToastNullId_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: closeToast null: FAILED');
      console.info('[promptActionCloseToastNullId_0100] END');
    })

    /**
     * @tc.name   promptActionCloseToastUndefinedId_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_CLOSETOAST_UNDEFINED_0100
     * @tc.desc   Test promptAction.closeToast with undefined toast ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionCloseToastUndefinedId_0100', Level.LEVEL1, async () => {
      console.info('[promptActionCloseToastUndefinedId_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_closetoast_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionCloseToastUndefinedId_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: closeToast undefined: FAILED');
      console.info('[promptActionCloseToastUndefinedId_0100] END');
    })
  
}