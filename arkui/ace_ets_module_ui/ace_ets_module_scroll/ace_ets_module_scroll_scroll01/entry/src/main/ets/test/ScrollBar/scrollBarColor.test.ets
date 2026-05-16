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

export default function scrollBarColor() {
  describe('scrollBarColor', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollBarColor beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ScrollBar/scrollBarColor",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollBarColor state pages:" + JSON.stringify(pages));
        if (!("scrollBarColor" == pages.name)) {
          console.info("get scrollBarColor pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollBarColor page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBarColor page error:" + err);
      }
      console.info("scrollBarColor beforeEach end");
      done();
    });

    /**
     * @tc.name   scrollBarColor_0100
     * @tc.number scrollBarColor_001
     * @tc.desc   Set the color of the scrollbar slider.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollBarColor_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scrollBar_color_text');
      console.info("[scrollBarColor_0100] $type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[scrollBarColor_0100] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[scrollBarColor_0100] scrollBarColor: " + JSON.stringify(JSON.parse(strJson).$attrs.scrollBarColor));
      expect(JSON.parse(strJson).$type).assertEqual("ScrollBar");
      expect(JSON.parse(strJson).$attrs.scrollBarColor).assertEqual("#66182330");
      console.info('[scrollBarColor_0100] END');
      done();
    });
  })
}
