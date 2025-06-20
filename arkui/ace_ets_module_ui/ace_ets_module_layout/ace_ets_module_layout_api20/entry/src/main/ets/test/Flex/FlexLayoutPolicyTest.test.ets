/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function FlexLayoutPolicyTest() {
  describe('FlexLayoutPolicyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("FlexLayoutPolicyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexLayoutPolicyPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FlexLayoutPolicyTest state pages:" + JSON.stringify(pages));
        if (!("FlexLayoutPolicyPage" == pages.name)) {
          console.info("get FlexLayoutPolicyTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FlexLayoutPolicyTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexLayoutPolicyTest page error:" + err);
      }
      console.info("FlexLayoutPolicyTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.number    FlexLayoutPolicyTest_0100
     * @tc.name      FlexLayoutPolicyTest_0100
     * @tc.desc      test Flex LayoutPolicy.matchParent
     * @tc.level:    Level 1
     * @tc.type :    FlexLayoutPolicy
     * @tc.size :
     */
    it('FlexLayoutPolicyTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[FlexLayoutPolicyTest_0100] START');
      await CommonFunc.sleep(1000);

      let flex_parent: RectValue = CommonFunc.getComponentRect('FlexLayoutPolicyTest_0100_Flex_parent');
      let flex_child: RectValue = CommonFunc.getComponentRect('FlexLayoutPolicyTest_0100_Flex_child');

      // padding(20) + border(5) + safeAreaPadding(10)
      console.log('[FlexLayoutPolicyTest_0100] flex_child.left - flex_parent.left - vp2px(35) is:' + (flex_child.left - flex_parent.left - vp2px(35)));
      console.log('[FlexLayoutPolicyTest_0100] flex_parent.right - flex_child.right - vp2px(35) is:' + (flex_parent.right - flex_child.right - vp2px(35)));
      console.log('[FlexLayoutPolicyTest_0100] flex_child.top - flex_parent.top - vp2px(35) is:' + (flex_child.top - flex_parent.top - vp2px(35)));
      console.log('[FlexLayoutPolicyTest_0100] flex_parent.bottom - flex_child.bottom - vp2px(35) is:' + (flex_parent.bottom - flex_child.bottom - vp2px(35)));
      expect(Math.floor(Math.abs(flex_child.left - flex_parent.left - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flex_parent.right - flex_child.right - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flex_child.top - flex_parent.top - vp2px(35))) <= 1).assertTrue();
      expect(Math.floor(Math.abs(flex_parent.bottom - flex_child.bottom - vp2px(35))) <= 1).assertTrue();

      console.info('[FlexLayoutPolicyTest_0100] END');
      done();
    });
  })
}