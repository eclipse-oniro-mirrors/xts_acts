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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function listScrollerBar() {
  describe('listScrollerBar', () => {
    beforeEach(async (done: Function) => {
      console.info("listScrollerBar beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollBar/listScrollerBar",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listScrollerBar state pages:" + JSON.stringify(pages));
        if (!("listScrollerBar" == pages.name)) {
          console.info("get listScrollerBar pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listScrollerBar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listScrollerBar page error:" + err);
      }
      console.info("listScrollerBar beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("listScrollerBar after each called");
    });

    /**
     * @tc.number    listScrollerBar_001
     * @tc.name      listScrollerBar_0100
     * @tc.desc      Dragging the scrollBar component triggers a callback.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('listScrollerBar_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[listScrollerBar_0100] START');
      let driver = await Driver.create()
      let swiperBar = CommonFunc.getComponentRectOnScreen('scroller_list_scrollbar');
      let top = swiperBar.top;
      let bottom = swiperBar.bottom;
      let right = swiperBar.right;
      let left = swiperBar.left;
      let widthBar = right - left;
      console.info("listScrollerBar_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.swipe(Math.round(left + widthBar/2),Math.round(top + vp2px(10)),Math.round(left + widthBar/2),Math.round(bottom - vp2px(10)),1000);
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('list_scrollBar_onText');
      console.info("[listScrollerBar_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[listScrollerBar_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content)
        .assertEqual('bar: reachStart3-reachStart1-scrollStart3-scrollStart1-reachEnd1-reachEnd3-scrollStop1-scrollStop3-');
      console.info('[listScrollerBar_0100] END');
      done();
    });
  })
}
