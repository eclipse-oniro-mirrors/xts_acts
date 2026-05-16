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
import { router } from '@kit.ArkUI';
import promptAction from '@ohos.promptAction';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function PromptActionShowDialogTest() {
  beforeEach(async (done: Function) => {
    console.info('PromptActionShowDialogTest beforeEach start');
    let options: router.RouterOptions = {
      url: 'MainAbility/pages/promptaction/PromptActionShowDialogTest',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info('get PromptActionShowDialogTest state pages:' + JSON.stringify(pages));
      if (!('AlertDialogLife' == pages.name)) {
        console.info('get PromptActionShowDialogTest pages.name:' + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2500);
        console.info('push PromptActionShowDialogTest page result:' + JSON.stringify(result));
      }
    } catch (err) {
      console.error('push PromptActionShowDialogTest page error:' + err);
    }
    console.info('PromptActionShowDialogTest beforeEach end');
    done();
  });

    /**
     * @tc.name   promptActionShowDialogButtonsEmpty_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_BUTTONS_0100
     * @tc.desc   Test promptAction.showDialog with buttons set to empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogButtonsEmpty_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogButtonsEmpty_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_buttons_empty'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogButtonsEmpty_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: buttons empty: SUCCESS');
      console.info('[promptActionShowDialogButtonsEmpty_0100] END');
    })

    /**
     * @tc.name   promptActionShowDialogButtonsPrimaryTrue_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_BUTTONS_0200
     * @tc.desc   Test promptAction.showDialog with buttons.primary set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogButtonsPrimaryTrue_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogButtonsPrimaryTrue_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_buttons_primary_true'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogButtonsPrimaryTrue_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: buttons primary true: SUCCESS');
      console.info('[promptActionShowDialogButtonsPrimaryTrue_0100] END');
    })

    /**
     * @tc.name   promptActionShowDialogButtonsPrimaryFalse_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_BUTTONS_0300
     * @tc.desc   Test promptAction.showDialog with buttons.primary set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogButtonsPrimaryFalse_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogButtonsPrimaryFalse_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_buttons_primary_false'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogButtonsPrimaryFalse_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: buttons primary false: SUCCESS');
      console.info('[promptActionShowDialogButtonsPrimaryFalse_0100] END');
    })

    /**
     * @tc.name   promptActionShowDialogShowInSubWindowTrue_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_SHOWINSUBWINDOW_0100
     * @tc.desc   Test promptAction.showDialog with showInSubWindow set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogShowInSubWindowTrue_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogShowInSubWindowTrue_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_showinsubwindow_true'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogShowInSubWindowTrue_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: showInSubWindow true: SUCCESS');
      console.info('[promptActionShowDialogShowInSubWindowTrue_0100] END');
    })

    /**
     * @tc.name   promptActionShowDialogShowInSubWindowFalse_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_SHOWINSUBWINDOW_0200
     * @tc.desc   Test promptAction.showDialog with showInSubWindow set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogShowInSubWindowFalse_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogShowInSubWindowFalse_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_showinsubwindow_false'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogShowInSubWindowFalse_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: showInSubWindow false: SUCCESS');
      console.info('[promptActionShowDialogShowInSubWindowFalse_0100] END');
    })

    /**
     * @tc.name   promptActionShowDialogEnableHoverModeTrue_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_ENABLEHOVERMODE_0100
     * @tc.desc   Test promptAction.showDialog with enableHoverMode set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogEnableHoverModeTrue_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogEnableHoverModeTrue_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_enablehovermode_true'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogEnableHoverModeTrue_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: enableHoverMode true: SUCCESS');
      console.info('[promptActionShowDialogEnableHoverModeTrue_0100] END');
    })

    /**
     * @tc.name   promptActionShowDialogEnableHoverModeFalse_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_ENABLEHOVERMODE_0200
     * @tc.desc   Test promptAction.showDialog with enableHoverMode set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogEnableHoverModeFalse_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogEnableHoverModeFalse_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_enablehovermode_false'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogEnableHoverModeFalse_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: enableHoverMode false: SUCCESS');
      console.info('[promptActionShowDialogEnableHoverModeFalse_0100] END');
    })

    /**
     * @tc.name   promptActionShowDialogOptionsNull_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_OPTIONS_0100
     * @tc.desc   Test promptAction.showDialog with null options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogOptionsNull_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_options_null'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogOptionsNull_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: options null: FAILED');
      console.info('[promptActionShowDialogOptionsNull_0100] END');
    })

    /**
     * @tc.name   promptActionShowDialogOptionsUndefined_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWDIALOG_OPTIONS_0200
     * @tc.desc   Test promptAction.showDialog with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowDialogOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowDialogOptionsUndefined_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      
      const button = await driver.findComponent(ON.id('btn_dialog_options_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('dialog_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowDialogOptionsUndefined_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: options undefined: FAILED');
      console.info('[promptActionShowDialogOptionsUndefined_0100] END');
    })
  
}