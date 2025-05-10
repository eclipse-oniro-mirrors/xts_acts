/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function gestureParallelTest() {
  describe('gestureParallelTest', () => {
    beforeEach(async (done: Function) => {
      console.info("gestureParallelTest beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get gestureParallelTest state pages:" + JSON.stringify(pages));
        if (!("gestureParallel" == pages.name)) {
          console.info("get  gestureParallelTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/gestureParallel"
          })
          await CommonFunc.sleep(2000);
          console.info("push gestureParallelTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gestureParallelTest page error:" + err);
      }
      console.info("gestureParallelTest foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("gestureParallelTest after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_JUDGE_0250_gestureParallelTest_001
     * @tc.desc gesture Parallel test
     * @tc.level Level 0
     * @tc.type
     */

    it('gestureParallelTest_001', 0, async (done: Function) => {
      console.info('[gestureParallelTest_001] START');
      let str1 = getInspectorByKey("parallelGestureKey");
      // get column left and top on screen
      CommonFunc.rect_left =
        JSON.parse('[' + JSON.parse('[' + JSON.parse(str1).$rect + ']')[0] + ']')[0] + globalThis.winLeft;
      CommonFunc.rect_top =
        JSON.parse('[' + JSON.parse('[' + JSON.parse(str1).$rect + ']')[0] + ']')[1] + globalThis.winTop;
      console.info("rect_left = " + CommonFunc.rect_left + "CommonFunc.rect_top = " + CommonFunc.rect_top);
      let driver = Driver.create();
      await driver.longClick(Math.round(CommonFunc.rect_left + vp2px(66.66)), Math.round(CommonFunc.rect_top + vp2px(133.33)));
      await driver.doubleClick(Math.round(CommonFunc.rect_left + vp2px(66.66)), Math.round(CommonFunc.rect_top + vp2px(133.33)));
      let strJson1 = getInspectorByKey("longPressMsg");
      await CommonFunc.sleep(200);
      console.info("[gestureParallelTest_001] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('LongPress onActionEnd');
      await CommonFunc.sleep(200);
      let strJson2 = getInspectorByKey("tapGestureMsg");
      await CommonFunc.sleep(200);
      console.info("[gestureParallelTest_001] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('tapGesture onAction');
      await CommonFunc.sleep(1000);
      console.info('[gestureParallelTest_001] END');
      done();
    });
  })
}
