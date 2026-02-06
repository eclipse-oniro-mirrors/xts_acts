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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function onScrollIndexFlow1() {
  describe('onScrollIndexFlow1', () => {
    beforeEach(async (done: Function) => {
      console.info("onScrollIndexFlow1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/onScrollIndexFlow1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onScrollIndexFlow1 state pages:" + JSON.stringify(pages));
        if (!("onScrollIndexFlow1" == pages.name)) {
          console.info("get onScrollIndexFlow1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onScrollIndexFlow1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onScrollIndexFlow1 page error:" + err);
      }
      console.info("onScrollIndexFlow1 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("onScrollIndexFlow1 after each called");
    });

    /**
     * @tc.name   onScrollIndexFlow1_0100
     * @tc.number onScrollIndexFlow1_001
     * @tc.desc   Scroll the FlowItem with the mouse wheel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('onScrollIndexFlow1_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[onScrollIndexFlow1_0100] START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('onScrollIndexFlow1');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("onScrollIndexFlow1_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.mouseScroll({x:Math.round(left + width/2), y: Math.round(top + height*0.3)}, true ,20)
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('onScrollIndex_flow');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[onScrollIndexFlow1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[onScrollIndexFlow1_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('onScrollIndex:succ5');
      console.info('[onScrollIndexFlow1_0100] END');
      done();
    });
  })
}
