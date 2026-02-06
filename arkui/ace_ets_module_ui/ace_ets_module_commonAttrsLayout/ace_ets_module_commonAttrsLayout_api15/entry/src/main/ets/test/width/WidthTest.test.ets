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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';

export default function WidthTest() {
  describe('WidthTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WidthTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/width/WidthPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WidthTest state pages: " + JSON.stringify(pages));
        if (!("WidthTest" == pages.name)) {
          console.info("get WidthTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push WidthTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WidthTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0030
    * @tc.name  : WidthTest_0100
    * @tc.desc  : To test that the width supports LayoutPolicy.MATCH_PARENT. 
    * @tc.level : Level 2
    */
    it('WidthTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('WidthTest_0100 START');
      await CommonFunc.sleep(1000);

      let column_parent = CommonFunc.getComponentRect('WidthTest_0100_Column_Parent');
      let column_parent_width = column_parent.right - column_parent.left;
      let column_parent_height = column_parent.bottom - column_parent.top;
      let column_child = CommonFunc.getComponentRect('WidthTest_0100_Column_Child');
      let column_child_width = column_child.right - column_child.left;
      let column_child_height = column_child.bottom - column_child.top;
      console.log('[WidthTest_0100] column_parent_width is:' + column_parent_width);
      console.log('[WidthTest_0100] column_parent_height is:' + column_parent_height);
      console.log('[WidthTest_0100] column_child_width is:' + column_child_width);
      console.log('[WidthTest_0100] column_child_height is:' + column_child_height);
      
      expect(Math.floor(Math.abs(column_parent_width - column_child_width)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(column_parent_height - column_child_height)) <= 1).assertTrue();

      console.info('[WidthTest_0100] END');
      done();
    });

  })
}

