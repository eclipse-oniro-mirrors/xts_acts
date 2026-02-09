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

const SLEEP_TIME = 1000;

export default function scrollScrollbarColor() {
  describe('scrollScrollbarColor', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollbarColor beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollScrollbarColor",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollScrollbarColor state pages:" + JSON.stringify(pages));
        if (!("scrollScrollbarColor" == pages.name)) {
          console.info("get scrollScrollbarColor pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
          console.info("push scrollScrollbarColor page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollScrollbarColor page error:" + err);
      }
      console.info("scrollScrollbarColor beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("listLevel1 after each called");
    });

    /**
     * @tc.name   test_scroll_scrollBarColor_001
     * @tc.number test_scroll_scrollBarColor_001
     * @tc.desc   input type resource[#FFFFFF00] ,return #FFFFFF00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_scroll_scrollBarColor_001', Level.LEVEL0, async (done: Function) => {
      console.info('test_scroll_scrollBarColor_001 START');
      await CommonFunc.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('Scroll');
      let obj: Record<string, Object> = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Scroll');
      expect(JSON.parse(strJson).$attrs.scrollBarColor).assertEqual('#FFFFFF00');
      done();
    });
  })
}