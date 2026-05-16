/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';

export default function List_divider_resource() {
  describe('List_divider_resource', () => {
    beforeEach(async (done: Function) => {
      console.info("List_divider_resource beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_divider/List_divider_resource',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_divider_resource state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get List_divider_resource pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_divider_resource page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_divider_resource page error:" + err);
      }
      console.info("List_divider_resource beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("List_divider_resource after each called");
    });


    /**
     * @tc.name   SUB_ACE_List_divider_resource_0100
     * @tc.number SUB_ACE_List_divider_resource_0100
     * @tc.desc   StrokeWidth is set through digital resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_divider_resource_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_divider_resource_0100] START');
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01: RectValue = CommonFunc.getComponentRect('List_divider_resource_listItem_01');
      let ListItem_02: RectValue = CommonFunc.getComponentRect('List_divider_resource_listItem_02');
      let List_01: RectValue = CommonFunc.getComponentRect('List_divider_resource_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(vp2px(20)));

      console.info('[SUB_ACE_List_divider_resource_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_List_divider_resource_0200
     * @tc.number SUB_ACE_List_divider_resource_0200
     * @tc.desc   StrokeWidth is set through floating-point type resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_divider_resource_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_divider_resource_0200] START');
      globalThis.value.message.notify({
        name: 'strokeWidth', value: $r('app.float.strokeWidth')
      });
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let ListItem_01: RectValue = CommonFunc.getComponentRect('List_divider_resource_listItem_01');
      let ListItem_02: RectValue = CommonFunc.getComponentRect('List_divider_resource_listItem_02');
      let List_01: RectValue = CommonFunc.getComponentRect('List_divider_resource_list_01');

      console.log('get divider width')
      expect(Math.round(ListItem_02.top - ListItem_01.bottom)).assertEqual(Math.round(vp2px(20)));

      console.info('[SUB_ACE_List_divider_resource_0200] END');
      done();
    });


  })
}
