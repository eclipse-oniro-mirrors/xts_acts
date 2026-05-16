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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
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

export default function List_Space_Percentage() {
  describe('List_Space_Percentage', () => {
    beforeEach(async (done: Function) => {
      console.info("List_Space_Percentage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List_SpaceChange/List_Space_Percentage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_SpaceChange state pages:" + JSON.stringify(pages));
        if (!("List_SpaceChange" == pages.name)) {
          console.info("get List_SpaceChange pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_SpaceChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_SpaceChange page error:" + err);
      }
      console.info("List_Space_Percentage beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.back()
      console.info("List_Space_Percentage after each called");
    });

    /**
     * @tc.name   SUB_ACE_List_Space_Percentage_0100
     * @tc.number SUB_ACE_List_Space_Percentage_0100
     * @tc.desc   set the space of list to '10%'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_Space_Percentage_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_Space_Percentage_0100] START');
      globalThis.value.message.notify({
        name: 'space', value: '10%'
      });
      await CommonFunc.sleep(1000);
      let List01 = CommonFunc.getComponentRect('List_Space_Percentage_01');
      let ListItem01 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_01');
      let ListItem02 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_02');
      let ListItem03 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_03');
      let ListItem04 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_04');

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      expect(Math.abs(Math.round(ListItem02.top - ListItem01.bottom) - Math.round(vp2px(52))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem02.right - ListItem02.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem02.bottom - ListItem02.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      expect(Math.abs(Math.round(ListItem03.top - ListItem02.bottom) - Math.round(vp2px(52))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem03.right - ListItem03.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem03.bottom - ListItem03.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      expect(Math.abs(Math.round(ListItem04.top - ListItem03.bottom) - Math.round(vp2px(52))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem04.right - ListItem04.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem04.bottom - ListItem04.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_Space_Percentage_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_List_Space_Percentage_0200
     * @tc.number SUB_ACE_List_Space_Percentage_0200
     * @tc.desc   set the space of list to '100%'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_Space_Percentage_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_Space_Percentage_0200] START');
      globalThis.value.message.notify({
        name: 'space', value: '50%'
      });
      await CommonFunc.sleep(1000);
      let List01 = CommonFunc.getComponentRect('List_Space_Percentage_01');
      let ListItem01 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_01');
      let ListItem02 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_02');
      let ListItem03 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_03');
      let ListItem04 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_04');

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      expect(Math.abs(Math.round(ListItem02.top - ListItem01.bottom) - Math.round(vp2px(260))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem02.right - ListItem02.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem02.bottom - ListItem02.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_Space_Percentage_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_List_Space_Percentage_0300
     * @tc.number SUB_ACE_List_Space_Percentage_0300
     * @tc.desc   set the space of list to '150%'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_Space_Percentage_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_Space_Percentage_0300] START');
      globalThis.value.message.notify({
        name: 'space', value: '100%'
      });
      await CommonFunc.sleep(1000);
      let List01 = CommonFunc.getComponentRect('List_Space_Percentage_01');
      let ListItem01 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_01');
      let ListItem02 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_02');
      let ListItem03 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_03');
      let ListItem04 = CommonFunc.getComponentRect('List_Space_Percentage_ListItem_04');

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      expect(Math.abs(Math.round(ListItem02.top - ListItem01.bottom) - Math.round(vp2px(0))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem02.right - ListItem02.left) - vp2px(300)) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem02.bottom - ListItem02.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_Space_Percentage_0300] END');
      done();
    });

  })
}