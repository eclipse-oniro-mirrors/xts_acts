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

export default function PromptActionOpenToastTest() {
  const driver = Driver.create();

  beforeEach(async (done: Function) => {
    console.info('PromptActionOpenToastTest beforeEach start');
    let options: router.RouterOptions = {
      url: 'MainAbility/pages/promptaction/PromptActionOpenToastTest',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info('get PromptActionOpenToastTest state pages:' + JSON.stringify(pages));
      if (!('AlertDialogLife' == pages.name)) {
        console.info('get PromptActionOpenToastTest pages.name:' + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2500);
        console.info('push PromptActionOpenToastTest page result:' + JSON.stringify(result));
      }
    } catch (err) {
      console.error('push PromptActionOpenToastTest page error:' + err);
    }
    console.info('PromptActionOpenToastTest beforeEach end');
    done();
  });

    /**
     * @tc.name   promptActionOpenToastBottomEmpty_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENTOAST_BOTTOM_0100
     * @tc.desc   Test promptAction.showToast with bottom property set to empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionOpenToastBottomEmpty_0100', Level.LEVEL1, async () => {
      console.info('[promptActionOpenToastBottomEmpty_0100] START');
      await CommonFunc.sleep(1000);
      
      let button = await driver.findComponent(ON.id('btn_toast_bottom_empty'));
      await button.click();
      await CommonFunc.sleep(1000);

      // Verify test result from page state
      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionOpenToastBottomEmpty_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: bottom empty string: SUCCESS');
      console.info('[promptActionOpenToastBottomEmpty_0100] END');
    })

    /**
     * @tc.name   promptActionOpenToastShowModeDefault_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENTOAST_SHOWMODE_0100
     * @tc.desc   Test promptAction.showToast with showMode set to DEFAULT(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionOpenToastShowModeDefault_0100', Level.LEVEL1, async () => {
      console.info('[promptActionOpenToastShowModeDefault_0100] START'); 
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_toast_showmode_default'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionOpenToastShowModeDefault_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: showMode DEFAULT: SUCCESS');
      console.info('[promptActionOpenToastShowModeDefault_0100] END');
      
    })

    /**
     * @tc.name   promptActionOpenToastShowModeTopMost_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENTOAST_SHOWMODE_0200
     * @tc.desc   Test promptAction.showToast with showMode set to TOP_MOST(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionOpenToastShowModeTopMost_0100', Level.LEVEL1, async () => {
      console.info('[promptActionOpenToastShowModeTopMost_0100] START');
      await CommonFunc.sleep(1000);
      const button = await driver.findComponent(ON.id('btn_toast_showmode_topmost'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionOpenToastShowModeTopMost_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: showMode TOP_MOST: SUCCESS');
      console.info('[promptActionOpenToastShowModeTopMost_0100] END');
      
    })

    /**
     * @tc.name   promptActionOpenToastEnableHoverModeTrue_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENTOAST_ENABLEHOVERMODE_0100
     * @tc.desc   Test promptAction.showToast with enableHoverMode set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionOpenToastEnableHoverModeTrue_0100', Level.LEVEL1, async () => {
      console.info('[promptActionOpenToastEnableHoverModeTrue_0100] START');
      await CommonFunc.sleep(1000);
      
      const button = await driver.findComponent(ON.id('btn_toast_enablehovermode_true'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionOpenToastEnableHoverModeTrue_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: enableHoverMode true: SUCCESS');
      console.info('[promptActionOpenToastEnableHoverModeTrue_0100] END');
      
    })

    /**
     * @tc.name   promptActionOpenToastEnableHoverModeFalse_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENTOAST_ENABLEHOVERMODE_0200
     * @tc.desc   Test promptAction.showToast with enableHoverMode set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionOpenToastEnableHoverModeFalse_0100', Level.LEVEL1, async () => {
      console.info('[promptActionOpenToastEnableHoverModeFalse_0100] START');
      await CommonFunc.sleep(1000);
      
      const button = await driver.findComponent(ON.id('btn_toast_enablehovermode_false'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionOpenToastEnableHoverModeFalse_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: enableHoverMode false: SUCCESS');
      console.info('[promptActionOpenToastEnableHoverModeFalse_0100] END');
      
    })

    /**
     * @tc.name   promptActionOpenToastOptionsNull_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENTOAST_OPTIONS_0100
     * @tc.desc   Test promptAction.showToast with null options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionOpenToastOptionsNull_0100', Level.LEVEL1, async () => {
      console.info('[promptActionOpenToastOptionsNull_0100] START');
      await CommonFunc.sleep(1000);
      
      const button = await driver.findComponent(ON.id('btn_toast_options_null'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionOpenToastOptionsNull_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: options null: FAILED');
      console.info('[promptActionOpenToastOptionsNull_0100] END');
    })

    /**
     * @tc.name   promptActionOpenToastOptionsUndefined_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_OPENTOAST_OPTIONS_0200
     * @tc.desc   Test promptAction.showToast with undefined options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionOpenToastOptionsUndefined_0100', Level.LEVEL1, async () => {
      console.info('[promptActionOpenToastOptionsUndefined_0100] START');
      await CommonFunc.sleep(1000);
      
      const button = await driver.findComponent(ON.id('btn_toast_options_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionOpenToastOptionsUndefined_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: options undefined: FAILED');
      console.info('[promptActionOpenToastOptionsUndefined_0100] END');
    })
  
}