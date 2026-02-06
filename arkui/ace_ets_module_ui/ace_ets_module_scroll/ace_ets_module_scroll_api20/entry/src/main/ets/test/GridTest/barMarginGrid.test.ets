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

export default function barMarginGrid() {
  describe('barMarginGrid', () => {
    beforeEach(async (done: Function) => {
      console.info("barMarginGrid beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/barMarginGrid",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get barMarginGrid state pages:" + JSON.stringify(pages));
        if (!("barMarginGrid" == pages.name)) {
          console.info("get barMarginGrid pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push barMarginGrid page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barMarginGrid page error:" + err);
      }
      console.info("barMarginGrid beforeEach end");
      done();
    });

    /**
     * @tc.number    barMarginGrid_001
     * @tc.name      barMarginGrid_0100
     * @tc.desc      Set the margins for the scrollbar of the Grid component.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('barMarginGrid_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[barMarginGrid_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('grid_bar_margin');
      console.info("[barMarginGrid_0100] $type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[barMarginGrid_0100] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[barMarginGrid_0100] scrollBarMargin: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin));
      console.info("[barMarginGrid_0100] start: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin.start));
      console.info("[barMarginGrid_0100] end: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin.end));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      expect(JSON.parse(strJson).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 40.00px, end: 20.00vp");
      console.info('[barMarginGrid_0100] END');
      done();
    });
  })
}
