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

export default function listScrollbarColor() {
  describe('listScrollbarColor', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollbarColor beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ListItemGroup/listScrollbarColor",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get listScrollbarColor state pages:" + JSON.stringify(pages));
        if (!("listScrollbarColor" == pages.name)) {
          console.info("get listScrollbarColor pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
          console.info("push listScrollbarColor page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listScrollbarColor page error:" + err);
      }
      console.info("listScrollbarColor beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("listLevel1 after each called");
    });

    /**
     * @tc.name   test_list_scrollBarColor_001
     * @tc.number test_list_scrollBarColor_001
     * @tc.desc   input type resource[#FFFFFF00] ,return #FFFFFF00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_list_scrollBarColor_001', Level.LEVEL0, async (done: Function) => {
      console.info('test_list_scrollBarColor_001 START');
      let strJson: string = getInspectorByKey('List1111');
      console.info('ACE_ListItemSwipeActionManager_0010 text: ' + JSON.stringify(JSON.parse(strJson)));
      expect(JSON.parse(strJson).$type).assertEqual('List');
      console.info("ACE_ListItemSwipeActionManager_0010 content: " + JSON.parse(strJson).$attrs.scrollBarColor);
      expect(JSON.parse(strJson).$attrs.scrollBarColor).assertEqual('#FFFFFF00');
      done();
    });
  })
}