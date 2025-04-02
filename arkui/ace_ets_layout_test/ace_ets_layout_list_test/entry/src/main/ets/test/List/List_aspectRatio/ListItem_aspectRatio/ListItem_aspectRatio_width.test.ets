/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
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

export default function ListItem_aspectRatio_width() {
  describe('ListItem_aspectRatio_width', () => {
    beforeEach(async (done: Function) => {
      console.info("ListItem_aspectRatio_width beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_width',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListItem_aspectRatio_width state pages:" + JSON.stringify(pages));
        if (!("ListItem_aspectRatio_width" == pages.name)) {
          console.info("get ListItem_aspectRatio_width pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ListItem_aspectRatio_width page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListItem_aspectRatio_width page error:" + err);
      }
      console.info("ListItem_aspectRatio_width beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("ListItem_aspectRatio_width after each called");
    });


    /**
     * @tc.number SUB_ACE_ListItem_aspectRatio_width_0100
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of ListItem to '0'
     */
    it('SUB_ACE_ListItem_aspectRatio_width_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0100] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0'
      });
      await CommonFunc.sleep(1000);
      let ListItem01: RectValue = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');

      expect(Math.round(ListItem01.right - ListItem01.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(ListItem01.bottom - ListItem01.top)).assertEqual(Math.round(vp2px(20)));

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItem_aspectRatio_width_0200
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of ListItem to '0.5'
     */
    it('SUB_ACE_ListItem_aspectRatio_width_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0.5'
      });
      await CommonFunc.sleep(1000);
      let ListItem01: RectValue = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');

      expect(Math.round(ListItem01.right - ListItem01.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(ListItem01.bottom - ListItem01.top)).assertEqual(Math.round(vp2px(600)));

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItem_aspectRatio_width_0300
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of ListItem to '2'
     */
    it('SUB_ACE_ListItem_aspectRatio_width_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '2'
      });
      await CommonFunc.sleep(1000);
      let ListItem01: RectValue = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');

      expect(Math.round(ListItem01.right - ListItem01.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(ListItem01.bottom - ListItem01.top)).assertEqual(Math.round(vp2px(150)));

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ListItem_aspectRatio_width_0400
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of ListItem to '-1'
     */
    it('SUB_ACE_ListItem_aspectRatio_width_0400', 0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0400] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '-1'
      });
      await CommonFunc.sleep(1000);
      let ListItem01: RectValue = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');

      expect(Math.round(ListItem01.right - ListItem01.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(ListItem01.bottom - ListItem01.top)).assertEqual(Math.round(vp2px(20)));

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0400] END');
      done();
    });


  })
}
