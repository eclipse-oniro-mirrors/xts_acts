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


export default function showActionSheetNullTest() {
  describe('showActionSheetNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("showActionSheetNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContextTest/ShowActionSheetNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get showActionSheetNullTest state pages: " + JSON.stringify(pages));
        if (!("ShowActionSheetNullTest" == pages.name)) {
          console.info("get showActionSheetNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ShowActionSheetNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ShowActionSheetNullTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("showActionSheetNullTest after each called");
    });

    /**
     * @tc.name   showActionSheet_OptionsNull_001
     * @tc.number SUB_ARKUI_UICONTEXT_SHOWACTIONSHEET_PARAM_001
     * @tc.desc   Test showActionSheet with options parameter as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showActionSheet_OptionsNull_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showActionSheet_OptionsNull_001 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_options_null'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('showActionSheet_OptionsNull_001 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('showActionSheet_OptionsNull_001 END');
      done();
    });

    /**
     * @tc.name   showActionSheet_OptionsUndefined_002
     * @tc.number SUB_ARKUI_UICONTEXT_SHOWACTIONSHEET_PARAM_002
     * @tc.desc   Test showActionSheet with options parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('showActionSheet_OptionsUndefined_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('showActionSheet_OptionsUndefined_002 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_options_undefined'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('showActionSheet_OptionsUndefined_002 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('showActionSheet_OptionsUndefined_002 END');
      done();
    });

  })
}