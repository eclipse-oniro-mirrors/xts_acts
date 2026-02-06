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

export default function barMarginFlow() {
  describe('barMarginFlow', () => {
    beforeEach(async (done: Function) => {
      console.info("barMarginFlow beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/barMarginFlow",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get barMarginFlow state pages:" + JSON.stringify(pages));
        if (!("barMarginFlow" == pages.name)) {
          console.info("get barMarginFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push barMarginFlow page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barMarginFlow page error:" + err);
      }
      console.info("barMarginFlow beforeEach end");
      done();
    });

    /**
     * @tc.name   barMarginFlow_0100
     * @tc.number barMarginFlow_001
     * @tc.desc   Set the margins for the scrollbar of the WaterFlow component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('barMarginFlow_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[barMarginFlow_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('flow_bar_margin');
      console.info("[barMarginFlow_0100] $type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[barMarginFlow_0100] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[barMarginFlow_0100] scrollBarMargin: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin));
      console.info("[barMarginFlow_0100] start: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin.start));
      console.info("[barMarginFlow_0100] end: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin.end));
      expect(JSON.parse(strJson).$type).assertEqual("WaterFlow");
      expect(JSON.parse(strJson).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 40.00px, end: 20.00vp");
      console.info('[barMarginFlow_0100] END');
      done();
    });
  })
}
