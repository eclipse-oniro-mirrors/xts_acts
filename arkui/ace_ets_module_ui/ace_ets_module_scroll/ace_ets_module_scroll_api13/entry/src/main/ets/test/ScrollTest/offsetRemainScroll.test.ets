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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import RectValue from '../../MainAbility/common/Rect';

export default function offsetRemainScroll() {
  describe('offsetRemainScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("offsetRemainScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/offsetRemainScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get offsetRemainScroll state pages:" + JSON.stringify(pages));
        if (!("offsetRemainScroll" == pages.name)) {
          console.info("get offsetRemainScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push offsetRemainScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push offsetRemainScroll page error:" + err);
      }
      console.info("offsetRemainScroll beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("offsetRemainScroll after each called");
    });

    /**
     * @tc.number    offsetRemainScroll_001
     * @tc.name      offsetRemainScroll_0100
     * @tc.desc      Actual sliding amount of the Scroll, unit vp.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('offsetRemainScroll_0100', 0, async (done: Function) => {
      console.info('[offsetRemainScroll_0100] START');
      await CommonFunc.sleep(1000);
      let swiperTabs: RectValue = CommonFunc.getComponentRectOnScreen('scroll_offsetRemain');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("waterFlow6Jsunit_001 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.8),Math.round(left + width/2),Math.round(top + height*0.2));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('scroll_offsetRemain_text');
      console.info("[offsetRemainScroll_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[offsetRemainScroll_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual('scrollPosition: 1');
      console.info('[offsetRemainScroll_0100] END');
      done();
    });
  })
}
