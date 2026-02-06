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

export default function columnMonopolizeFalse() {
  describe('columnMonopolizeFalse', () => {
    beforeEach(async (done: Function) => {
      console.log("columnMonopolizeFalse beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.log("get columnMonopolizeFalse state pages:" + JSON.stringify(pages));
        if (!("columnMonopolizeFalse" == pages.name)) {
          console.log("get  columnMonopolizeFalse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/columnMonopolizeFalse"
          })
          await CommonFunc.sleep(2000);
          console.log("push columnMonopolizeFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnMonopolizeFalse page error:" + err);
      }
      console.log("columnMonopolizeFalse foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.log("columnMonopolizeFalse after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_MONOPOLIZE_0160_columnMonopolize_001
     * @tc.desc columnMonopolize false->true test
     * @tc.level Level 0
     * @tc.type
     */

    it('columnMonopolizeFalse_001', Level.LEVEL0, async (done: Function) => {
      console.log('[columnMonopolizeFalse_001] START');
      // get column left and top on screen
      let str1 = getInspectorByKey("columnLongPress1");
      CommonFunc.rect_left =
        JSON.parse('[' + JSON.parse('[' + JSON.parse(str1).$rect + ']')[0] + ']')[0] + globalThis.winLeft;
      CommonFunc.rect_top =
        JSON.parse('[' + JSON.parse('[' + JSON.parse(str1).$rect + ']')[0] + ']')[1] + globalThis.winTop;
      console.info("rect_left = " + CommonFunc.rect_left + "CommonFunc.rect_top = " + CommonFunc.rect_top);
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let column2 = await driver.findComponent(ON.id('columnClick2'));
      await CommonFunc.sleep(200);
      await driver.longClick(Math.round(CommonFunc.rect_left + vp2px(33.33)), Math.round(CommonFunc.rect_top + vp2px(26.66)));
      await CommonFunc.sleep(1000);
      await column2.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('columnTextFalse');
      console.log("[columnMonopolizeFalse_001] component obj1 is: " , JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('LongPressGesture onAction success;TapGesture success');
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('buttonFalse1'));
      // change the status of monopolize Attribute
      await button.click();
      await CommonFunc.sleep(1000);
      await driver.longClick(Math.round(CommonFunc.rect_left + vp2px(33.33)), Math.round(CommonFunc.rect_top + vp2px(26.66)));
      await CommonFunc.sleep(1000);
      await column2.click();
      let strJson2 = getInspectorByKey('columnTextFalse');
      console.log("[columnMonopolizeFalse_001] component obj2 is: " , JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('LongPressGesture onAction success;');
      await CommonFunc.sleep(1000);
      console.log('[columnMonopolizeFalse_001] END');
      done();
    });
  })
}
