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

export default function groupStickyBoth() {
  describe('groupStickyBoth', () => {
    beforeEach(async (done: Function) => {
      console.info("groupStickyBoth beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/groupStickyBoth",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get groupStickyBoth state pages:" + JSON.stringify(pages));
        if (!("groupStickyBoth" == pages.name)) {
          console.info("get groupStickyBoth pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push groupStickyBoth page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push groupStickyBoth page error:" + err);
      }
      console.info("groupStickyBoth beforeEach end");
      done();
    });

    /**
     * @tc.number    groupStickyBoth_001
     * @tc.name      groupStickyBoth_0100
     * @tc.desc      The header is pinned to the top and the footer is pinned to the bottom.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('groupStickyBoth_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[groupStickyBoth_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('group_sticky_both');
      console.info("[groupStickyBoth_0100] $type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[groupStickyBoth_0100] sticky: " + JSON.stringify(JSON.parse(strJson).$attrs.sticky));
      expect(JSON.parse(strJson).$type).assertEqual("List");

      let listRect = CommonFunc.getComponentRectOnScreen('group_sticky_both');
      let top = listRect.top;
      let bottom = listRect.bottom;
      console.info("groupStickyBoth_0100 value is" + " top: " + top + "bottom: " + bottom);

      let itemHead = CommonFunc.getComponentRectOnScreen('sticky_both_head');
      let itemFoot = CommonFunc.getComponentRectOnScreen('sticky_both_foot');
      let itemTop = itemHead.top;
      let itemBottom = itemFoot.bottom;
      console.info("groupStickyBoth_0100 itemTop is" + itemTop);
      console.info("groupStickyBoth_0100 itemBottom is" + itemBottom);

      expect(Math.floor(Math.abs(itemTop - top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(bottom - itemBottom)) <= 1).assertTrue();
      console.info('[groupStickyBoth_0100] END');
      done();
    });
  })
}
