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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function setCursorNullAndUndefinedTest() {
  describe('setCursorNullAndUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("setCursorNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/cursorControl/setCursorNullAndUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setCursorNullAndUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("setCursorNullAndUndefined" == pages.name)) {
          console.info("get setCursorNullAndUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setCursorNullAndUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setCursorNullAndUndefinedTest page error:" + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("setCursorNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_001
     * @tc.number  SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_001
     * @tc.desc   Test setCursor with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_001] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('testNull'));
      await button.click();
      await CommonFunc.sleep(1000);
      
      console.info('[SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_001] setCursorNullResult: ' + AppStorage.get('setCursorNullResult'));
      
      expect(AppStorage.get('setCursorNullResult')).assertEqual("SUCCESS");
      console.info('[SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_002
     * @tc.number  SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_002
     * @tc.desc   Test setCursor with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_002] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('testUndefined'));
      await button.click();
      await CommonFunc.sleep(1000);
      
      console.info('[SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_002] setCursorUndefinedResult: ' + AppStorage.get('setCursorUndefinedResult'));
      
      expect(AppStorage.get('setCursorUndefinedResult')).assertEqual("SUCCESS");
      console.info('[SUB_ARKUI_CURSORCONTROL_SETCURSOR_PARAM_002] END');
      done();
    });
  })
}