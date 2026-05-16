/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function updateBindSheetNullTest() {
  describe('updateBindSheetNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("updateBindSheetNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContextTest/UpdateBindSheetNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get updateBindSheetNullTest state pages: " + JSON.stringify(pages));
        if (!("UpdateBindSheetNullTest" == pages.name)) {
          console.info("get updateBindSheetNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push UpdateBindSheetNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UpdateBindSheetNullTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("updateBindSheetNullTest after each called");
    });

    /**
     * @tc.name   updateBindSheet_SheetTargetNull_001
     * @tc.number SUB_ARKUI_UICONTEXT_UPDATEBINDSHEET_PARAM_001
     * @tc.desc   Test updateBindSheet with sheetTarget parameter as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateBindSheet_SheetTargetNull_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('updateBindSheet_SheetTargetNull_001 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_sheetTarget_null'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('updateBindSheet_SheetTargetNull_001 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('updateBindSheet_SheetTargetNull_001 END');
      done();
    });

    /**
     * @tc.name   updateBindSheet_SheetTargetUndefined_002
     * @tc.number SUB_ARKUI_UICONTEXT_UPDATEBINDSHEET_PARAM_002
     * @tc.desc   Test updateBindSheet with sheetTarget parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateBindSheet_SheetTargetUndefined_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('updateBindSheet_SheetTargetUndefined_002 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_sheetTarget_undefined'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('updateBindSheet_SheetTargetUndefined_002 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('updateBindSheet_SheetTargetUndefined_002 END');
      done();
    });

    /**
     * @tc.name   updateBindSheet_OptionsNull_003
     * @tc.number SUB_ARKUI_UICONTEXT_UPDATEBINDSHEET_PARAM_003
     * @tc.desc   Test updateBindSheet with options parameter as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateBindSheet_OptionsNull_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('updateBindSheet_OptionsNull_003 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_options_null'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('updateBindSheet_OptionsNull_003 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('updateBindSheet_OptionsNull_003 END');
      done();
    });

    /**
     * @tc.name   updateBindSheet_OptionsUndefined_004
     * @tc.number SUB_ARKUI_UICONTEXT_UPDATEBINDSHEET_PARAM_004
     * @tc.desc   Test updateBindSheet with options parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateBindSheet_OptionsUndefined_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('updateBindSheet_OptionsUndefined_004 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_options_undefined'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('updateBindSheet_OptionsUndefined_004 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('updateBindSheet_OptionsUndefined_004 END');
      done();
    });

    /**
     * @tc.name   updateBindSheet_CallbackNull_005
     * @tc.number SUB_ARKUI_UICONTEXT_UPDATEBINDSHEET_PARAM_005
     * @tc.desc   Test updateBindSheet with callback parameter as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateBindSheet_CallbackNull_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('updateBindSheet_CallbackNull_005 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_callback_null'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('updateBindSheet_CallbackNull_005 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('updateBindSheet_CallbackNull_005 END');
      done();
    });

    /**
     * @tc.name   updateBindSheet_CallbackUndefined_006
     * @tc.number SUB_ARKUI_UICONTEXT_UPDATEBINDSHEET_PARAM_006
     * @tc.desc   Test updateBindSheet with callback parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('updateBindSheet_CallbackUndefined_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('updateBindSheet_CallbackUndefined_006 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_callback_undefined'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('updateBindSheet_CallbackUndefined_006 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('updateBindSheet_CallbackUndefined_006 END');
      done();
    });

  })
}