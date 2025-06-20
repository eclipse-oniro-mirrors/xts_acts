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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';
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

export default function ListItemGroup_aspectRatio_all2() {
  describe('ListItemGroup_aspectRatio_all2', () => {
    beforeEach(async (done: Function) => {
      console.info("ListItemGroup_aspectRatio_all2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_aspectRatio/ListItemGroup_aspectRatio/ListItemGroup_aspectRatio_all2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListItemGroup_aspectRatio_all2 state pages:" + JSON.stringify(pages));
        if (!("ListItemGroup_aspectRatio_all2" == pages.name)) {
          console.info("get ListItemGroup_aspectRatio_all2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ListItemGroup_aspectRatio_all2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItemGroup_aspectRatio_all2 page error:" + err);
      }
      console.info("ListItemGroup_aspectRatio_all2 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("ListItemGroup_aspectRatio_all2 after each called");
    });


    /**
     * @tc.number SUB_ACE_ListItemGroup_aspectRatio_all2_0100
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of ListItem to '0'
     */
    it('SUB_ACE_ListItemGroup_aspectRatio_all2_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItemGroup_aspectRatio_all2_0100] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0'
      });
      await CommonFunc.sleep(1000);
      let ListItemGroup01: RectValue = CommonFunc.getComponentRect('ListItemGroup_aspectRatio_all2_01');

      expect(Math.round(ListItemGroup01.right - ListItemGroup01.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(ListItemGroup01.bottom - ListItemGroup01.top)).assertEqual(Math.round(vp2px(420)));

      console.info('[SUB_ACE_ListItemGroup_aspectRatio_all2_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItemGroup_aspectRatio_all2_0200
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of ListItem to '0.5'
     */
    it('SUB_ACE_ListItemGroup_aspectRatio_all2_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItemGroup_aspectRatio_all2_0200] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0.5'
      });
      await CommonFunc.sleep(1000);
      let ListItemGroup01: RectValue = CommonFunc.getComponentRect('ListItemGroup_aspectRatio_all2_01');

      expect(Math.round(ListItemGroup01.right - ListItemGroup01.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(ListItemGroup01.bottom - ListItemGroup01.top)).assertEqual(Math.round(vp2px(420)));

      console.info('[SUB_ACE_ListItemGroup_aspectRatio_all2_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItemGroup_aspectRatio_all2_0300
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of ListItem to '2'
     */
    it('SUB_ACE_ListItemGroup_aspectRatio_all2_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItemGroup_aspectRatio_all2_0300] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '2'
      });
      await CommonFunc.sleep(1000);
      let ListItemGroup01: RectValue = CommonFunc.getComponentRect('ListItemGroup_aspectRatio_all2_01');

      expect(Math.round(ListItemGroup01.right - ListItemGroup01.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(ListItemGroup01.bottom - ListItemGroup01.top)).assertEqual(Math.round(vp2px(420)));

      console.info('[SUB_ACE_ListItemGroup_aspectRatio_all2_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItemGroup_aspectRatio_all2_0400
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of ListItem to '-1'
     */
    it('SUB_ACE_ListItemGroup_aspectRatio_all2_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItemGroup_aspectRatio_all2_0400] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '-1'
      });
      await CommonFunc.sleep(1000);
      let ListItemGroup01: RectValue = CommonFunc.getComponentRect('ListItemGroup_aspectRatio_all2_01');

      expect(Math.round(ListItemGroup01.right - ListItemGroup01.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(ListItemGroup01.bottom - ListItemGroup01.top)).assertEqual(Math.round(vp2px(420)));

      console.info('[SUB_ACE_ListItemGroup_aspectRatio_all2_0400] END');
      done();
    });


  })
}
