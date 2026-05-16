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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function hasAxisNullAndUndefinedTest() {
  describe('hasAxisNullAndUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("hasAxisNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AxisEvent/hasAxisNullAndUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get hasAxisNullAndUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("hasAxisNullAndUndefined" == pages.name)) {
          console.info("get hasAxisNullAndUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push hasAxisNullAndUndefinedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push hasAxisNullAndUndefinedTest page error:" + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("hasAxisNullAndUndefinedTest after each called");
    });

    

    /**
     * @tc.name   SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_001
     * @tc.number  SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_001
     * @tc.desc   Test hasAxis with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_001] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('testNull'));
      let center = await button.getBoundsCenter();
      await CommonFunc.sleep(500);
      // 垂直滚动鼠标滚轮触发事件
      await driver.mouseScroll({ x: center.x, y: center.y }, true, 30);
      await CommonFunc.sleep(1000);
      
      // 验证null参数处理
      console.info('[SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_001] nullAxis result: ' + AppStorage.get('nullAxisResult'));
      
      expect(AppStorage.get('nullAxisResult')).assertEqual(false);
      console.info('[SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_002
     * @tc.number  SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_002
     * @tc.desc   Test hasAxis with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_002] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('testUndefined'));
      let center = await button.getBoundsCenter();
      await CommonFunc.sleep(500);
      // 垂直滚动鼠标滚轮触发事件
      await driver.mouseScroll({ x: center.x, y: center.y }, true, 30);
      await CommonFunc.sleep(1000);
      
      // 验证undefined参数处理
      console.info('[SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_002] undefinedAxis result: ' + AppStorage.get('undefinedAxisResult'));
      
      expect(AppStorage.get('undefinedAxisResult')).assertEqual(false);
      console.info('[SUB_ARKUI_AXISEVENT_HASAXIS_PARAM_002] END');
      done();
    });

    
  })
}