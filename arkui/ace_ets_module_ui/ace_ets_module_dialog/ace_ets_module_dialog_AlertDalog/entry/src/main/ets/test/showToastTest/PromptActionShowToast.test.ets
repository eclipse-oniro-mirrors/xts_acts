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
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';

export default function PromptActionShowToastTest() {
  beforeEach(async (done: Function) => {
    console.info('PromptActionShowToastTest beforeEach start');
    let options: router.RouterOptions = {
      url: 'MainAbility/pages/promptaction/PromptActionShowToastTest',
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info('get PromptActionShowToastTest state pages:' + JSON.stringify(pages));
      if (!('AlertDialogLife' == pages.name)) {
        console.info('get PromptActionShowToastTest pages.name:' + JSON.stringify(pages.name));
        let result = await router.push(options);
        await Utils.sleep(2500);
        console.info('push PromptActionShowToastTest page result:' + JSON.stringify(result));
      }
    } catch (err) {
      console.error('push PromptActionShowToastTest page error:' + err);
    }
    console.info('PromptActionShowToastTest beforeEach end');
    done();
  });

    /**
     * @tc.name   promptActionShowToastBottomEmpty_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_BOTTOM_0100
     * @tc.desc   Test promptAction.showToast with bottom property set to empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastBottomEmpty_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastBottomEmpty_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('btn_toast_bottom_empty'));
      await button.click();
      await CommonFunc.sleep(1000);

      // Verify the test result from page state
      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowToastBottomEmpty_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: bottom empty string: SUCCESS');
      console.info('[promptActionShowToastBottomEmpty_0100] END');
    })

    /**
     * @tc.name   promptActionShowToastShowModeDefault_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_SHOWMODE_0100
     * @tc.desc   Test promptAction.showToast with showMode set to DEFAULT(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastShowModeDefault_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastShowModeDefault_0100] START'); 
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('btn_toast_showmode_default'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowToastShowModeDefault_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: showMode DEFAULT: SUCCESS');
      console.info('[promptActionShowToastShowModeDefault_0100] END');
      
    })

    /**
     * @tc.name   promptActionShowToastShowModeTopMost_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_SHOWMODE_0200
     * @tc.desc   Test promptAction.showToast with showMode set to TOP_MOST(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastShowModeTopMost_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastShowModeTopMost_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('btn_toast_showmode_topmost'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowToastShowModeTopMost_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: showMode TOP_MOST: SUCCESS');
      console.info('[promptActionShowToastShowModeTopMost_0100] END');
      
    })

    /**
     * @tc.name   promptActionShowToastEnableHoverModeTrue_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_ENABLEHOVERMODE_0100
     * @tc.desc   Test promptAction.showToast with enableHoverMode set to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastEnableHoverModeTrue_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastEnableHoverModeTrue_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('btn_toast_enablehovermode_true'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowToastEnableHoverModeTrue_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: enableHoverMode true: SUCCESS');
      console.info('[promptActionShowToastEnableHoverModeTrue_0100] END');
      
    })

    /**
     * @tc.name   promptActionShowToastEnableHoverModeFalse_0100
     * @tc.number SUB_ARKUI_PROMPTACTION_SHOWTOAST_ENABLEHOVERMODE_0200
     * @tc.desc   Test promptAction.showToast with enableHoverMode set to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastEnableHoverModeFalse_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastEnableHoverModeFalse_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('btn_toast_enablehovermode_false'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowToastEnableHoverModeFalse_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: enableHoverMode false: SUCCESS');
      console.info('[promptActionShowToastEnableHoverModeFalse_0100] END');
    })

    /**
     * @tc.name   promptActionShowToastOptionNull_0100
     * @tc.number promptActionShowToastOptionNull_0100
     * @tc.desc   promptActionShowToastOptionNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastOptionNull_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastOptionNull_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('btn_toast_options_null'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowToastOptionNull_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: options null: FAILED');
      console.info('[promptActionShowToastOptionNull_0100] END');
    })

    /**
     * @tc.name   promptActionShowToastOptionUndefined_0100
     * @tc.number promptActionShowToastOptionUndefined_0100
     * @tc.desc   promptActionShowToastOptionUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('promptActionShowToastOptionUndefined_0100', Level.LEVEL1, async () => {
      console.info('[promptActionShowToastOptionUndefined_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let button = await driver.findComponent(ON.id('btn_toast_options_undefined'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson: string = getInspectorByKey('toast_test_result');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let resultText: string = JSON.stringify(obj.$attrs.content)

      console.info("[promptActionShowToastOptionUndefined_0100] result: " + resultText);
      expect(resultText).assertEqual('Test Result: options undefined: FAILED');
      console.info('[promptActionShowToastOptionUndefined_0100] END');
    })
}
