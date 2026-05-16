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


export default function closeBindSheetNullTest() {
  describe('closeBindSheetNullTest', () => {
    beforeEach(async (done: Function) => {
      console.info("closeBindSheetNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContextTest/CloseBindSheetNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get closeBindSheetNullTest state pages: " + JSON.stringify(pages));
        if (!("CloseBindSheetNullTest" == pages.name)) {
          console.info("get closeBindSheetNullTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CloseBindSheetNullTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CloseBindSheetNullTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("closeBindSheetNullTest after each called");
    });

    /**
     * @tc.name   closeBindSheet_SheetTargetNull_001
     * @tc.number SUB_ARKUI_UICONTEXT_CLOSEBINDSHEET_PARAM_001
     * @tc.desc   Test closeBindSheet with sheetTarget parameter as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('closeBindSheet_SheetTargetNull_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('closeBindSheet_SheetTargetNull_001 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_sheetTarget_null'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('closeBindSheet_SheetTargetNull_001 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('closeBindSheet_SheetTargetNull_001 END');
      done();
    });

    /**
     * @tc.name   closeBindSheet_SheetTargetUndefined_002
     * @tc.number SUB_ARKUI_UICONTEXT_CLOSEBINDSHEET_PARAM_002
     * @tc.desc   Test closeBindSheet with sheetTarget parameter as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('closeBindSheet_SheetTargetUndefined_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('closeBindSheet_SheetTargetUndefined_002 START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('test_sheetTarget_undefined'));
      await button.click();
      await CommonFunc.sleep(5000);
      let errorCodeText = await driver.findComponent(ON.id('error_code_text'));
      let errorCodeValue = await errorCodeText.getText();
      console.info('closeBindSheet_SheetTargetUndefined_002 errorCode: ' + errorCodeValue);
      expect(errorCodeValue).assertContain("0");
      console.info('closeBindSheet_SheetTargetUndefined_002 END');
      done();
    });

  })
}