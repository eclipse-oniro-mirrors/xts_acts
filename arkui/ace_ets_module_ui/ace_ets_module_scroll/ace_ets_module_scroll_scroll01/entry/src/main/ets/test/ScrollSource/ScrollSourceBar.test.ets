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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ScrollSourceBar() {
  describe('ScrollSourceBar', () => {
    beforeEach(async (done: Function) => {
      console.info("ScrollSourceBar beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollSource/ScrollSourceBar",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScrollSourceBar state pages: " + JSON.stringify(pages));
        if (!("ScrollSourceBar" == pages.name)) {
          console.info("get ScrollSourceBar state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push ScrollSourceBar success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScrollSourceBar page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ScrollSourceBar_0100
     * @tc.number ScrollSourceBar_0100
     * @tc.desc   frameNode: The sliding speed after the scroll bar drag ends
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ScrollSourceBar_0100', Level.LEVEL2, async (done: Function) => {
      console.info('ScrollSourceBar_0100 START');
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('scroller_scrollbar_bar');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("ScrollSourceBar_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(
        Math.round(left + width/2),
        Math.round(top + height*0.1),
        Math.round(left + width/2),
        Math.round(top + height*0.6),
        600);
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('scrollSource_4');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[ScrollSourceBar_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollSourceBar_0100] content obj is: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual('ScrollSource.SCROLL_BAR'); //SCROLL_BAR

      let strJson2 = getInspectorByKey('scrollSource_5');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[ScrollSourceBar_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ScrollSourceBar_0100] content obj2 is: " + JSON.stringify(obj2.$attrs.label));
      expect(obj2.$attrs.label).assertEqual('ScrollSource.SCROLL_BAR_FLING'); //SCROLL_BAR_FLING
      console.info('[ScrollSourceBar_0100] END');
      done();
    });

  })
}

