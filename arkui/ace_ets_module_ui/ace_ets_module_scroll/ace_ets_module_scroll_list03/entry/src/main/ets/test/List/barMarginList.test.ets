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

export default function barMarginList() {
  describe('barMarginList', () => {
    beforeEach(async (done: Function) => {
      console.info("barMarginList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/barMarginList",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get barMarginList state pages:" + JSON.stringify(pages));
        if (!("barMarginList" == pages.name)) {
          console.info("get barMarginList pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push barMarginList page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barMarginList page error:" + err);
      }
      console.info("barMarginList beforeEach end");
      done();
    });

    /**
     * @tc.name   barMarginList_0100
     * @tc.number barMarginList_001
     * @tc.desc   Set the margins for the scrollbar of the List component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('barMarginList_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[barMarginList_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('list_bar_margin');
      console.info("[barMarginList_0100] $type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[barMarginList_0100] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[barMarginList_0100] scrollBarMargin: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin));
      console.info("[barMarginList_0100] start: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin.start));
      console.info("[barMarginList_0100] end: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarMargin.end));
      expect(JSON.parse(strJson).$type).assertEqual("List");
      expect(JSON.parse(strJson).$attrs.scrollBarMargin).assertEqual("ScrollBarMargin start: 40.00px, end: 20.00vp");
      console.info('[barMarginList_0100] END');
      done();
    });
  })
}
