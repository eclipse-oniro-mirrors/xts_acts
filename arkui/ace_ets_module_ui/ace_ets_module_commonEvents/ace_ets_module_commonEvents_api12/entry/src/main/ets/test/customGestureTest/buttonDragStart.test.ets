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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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

export default function btnDragStart() {
  describe('btnDragStart', () => {
    beforeEach(async (done: Function) => {
      console.info("btnDragStart beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get btnDragStart state pages:" + JSON.stringify(pages));
        if (!("buttonDragStart" == pages.name)) {
          console.info("get  btnDragStart pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/buttonDragStart"
          })
          await CommonFunc.sleep(2000);
          console.info("push btnDragStart page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push btnDragStart page error:" + err);
      }
      console.info("btnDragStart foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("btnDragStart after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_JUDGE_0280_btnDragStart_001
     * @tc.desc button click test
     * @tc.level Level 0
     * @tc.type
     */

    it('btnDragStart_001', Level.LEVEL0, async (done: Function) => {
      console.info('[btnDragStart_001] START');
      let str1 = getInspectorByKey("bttonDrag_key1");
      // get column left and top on screen
      CommonFunc.rect_left =
        JSON.parse('[' + JSON.parse('[' + JSON.parse(str1).$rect + ']')[0] + ']')[0] + globalThis.winLeft;
      CommonFunc.rect_top =
        JSON.parse('[' + JSON.parse('[' + JSON.parse(str1).$rect + ']')[0] + ']')[1] + globalThis.winTop;
      console.info("rect_left = " + CommonFunc.rect_left + "CommonFunc.rect_top = " + CommonFunc.rect_top);
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.drag(Math.round(CommonFunc.rect_left + vp2px(33.33)), Math.round(CommonFunc.rect_top + vp2px(26.66)), 200, 200, 600);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey("buttonDrag_2");
      await CommonFunc.sleep(200);
      console.info("[btnDragStart_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('拖拽事件响应成功--GestureControl.GestureType.DRAG is true');
      await CommonFunc.sleep(1000);
      console.info('[btnDragStart_001] END');
      done();
    });
  })
}

function getComponentRectOnScreen(arg0: string) {
  throw new Error('Function not implemented.');
}
