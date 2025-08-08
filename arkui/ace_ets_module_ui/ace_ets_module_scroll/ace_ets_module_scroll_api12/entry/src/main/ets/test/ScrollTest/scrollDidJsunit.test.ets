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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function scrollDidJsunit() {
  describe('scrollDidJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollDidJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollDid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollDidJsunit state pages:" + JSON.stringify(pages));
        if (!("scrollDid" == pages.name)) {
          console.info("get scrollDidJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollDidJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollDidJsunit page error:" + err);
      }
      console.info("scrollDidJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("scrollDidJsunit after each called");
    });

    /**
     * @tc.number    SCROLL_ONDIDSCROLL_001
     * @tc.name      scrollDidJsunit_001
     * @tc.desc      The scroll component triggers the onDidScroll event
     * @tc.level     Level 2
     * @tc.type
     * @tc.size
     */
    it('scrollDidJsunit_0100', 0, async (done: Function) => {
      console.info('[scrollDidJsunit_0100] START');
      let scrollRect = CommonFunc.getComponentRectOnScreen('scrollSource_scroll')
      let driver = Driver.create()
      await driver.fling({
        x: Number.parseInt(`${(scrollRect.right - scrollRect.left) * 0.5 + scrollRect.left}`),
        y: Number.parseInt(`${(scrollRect.bottom - scrollRect.top) * 0.6 + scrollRect.top}`)
      },
        {
          x: Number.parseInt(`${(scrollRect.right - scrollRect.left) * 0.5 + scrollRect.left}`),
          y: Number.parseInt(`${(scrollRect.bottom - scrollRect.top) * 0.2 + scrollRect.top}`)
        }, 5, 1000);
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('scroll_onDidScroll');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollDidJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[scrollDidJsunit_0100] content: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual('scrollState: 0');
      console.info('[scrollDidJsunit_0100] END');
      done();
    });
  })
}
