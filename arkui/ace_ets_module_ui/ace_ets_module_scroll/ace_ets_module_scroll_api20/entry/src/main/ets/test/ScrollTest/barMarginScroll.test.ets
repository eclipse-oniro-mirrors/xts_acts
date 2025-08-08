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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function barMarginScroll() {
  describe('barMarginScroll', () => {
    beforeEach(async (done: Function) => {
      console.info("barMarginScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/barMarginScroll",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get barMarginScroll state pages:" + JSON.stringify(pages));
        if (!("barMarginScroll" == pages.name)) {
          console.info("get barMarginScroll pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push barMarginScroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barMarginScroll page error:" + err);
      }
      console.info("barMarginScroll beforeEach end");
      done();
    });

    /**
     * @tc.number    barMarginScroll_001
     * @tc.name      barMarginScroll_0100
     * @tc.desc      Set the margins for the scrollbar of the Scroll component.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('barMarginScroll_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[barMarginScroll_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scroll_bar_margin');
      console.info("[barMarginScroll_0100] $type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[barMarginScroll_0100] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[barMarginScroll_0100] scrollBarMargin: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin));
      console.info("[barMarginScroll_0100] start: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin.start));
      console.info("[barMarginScroll_0100] end: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin.end));
      expect(JSON.parse(strJson).$type).assertEqual("Scroll");
      expect(JSON.parse(strJson).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 40.00px, end: 20.00vp");
      console.info('[barMarginScroll_0100] END');
      done();
    });
  })
}
