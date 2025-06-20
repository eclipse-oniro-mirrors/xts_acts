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

export default function btnClick() {
  describe('btnClick', () => {
    beforeEach(async (done: Function) => {
      console.info("btnClick beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get btnClick state pages:" + JSON.stringify(pages));
        if (!("gestureClick" == pages.name)) {
          console.info("get  btnClick pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/gestureClick"
          })
          await CommonFunc.sleep(2000);
          console.info("push btnClick page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push btnClick page error:" + err);
      }
      console.info("btnClick foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("btnClick after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_JUDGE_0260_btnMonoTouch_001
     * @tc.desc button click test
     * @tc.level Level 0
     * @tc.type
     */

    it('btnClick_001', Level.LEVEL0, async (done: Function) => {
      console.info('[btnClick_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let button1 = await driver.findComponent(ON.id("gesture_click_button"));
      await button1.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey("gesture_click_text");
      await CommonFunc.sleep(200);
      console.info("[btnClick_001] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('点击事件成功响应--GestureType为CLICK');
      await CommonFunc.sleep(1000);
      console.info('[btnClick_001] END');
      done();
    });


  })
}
