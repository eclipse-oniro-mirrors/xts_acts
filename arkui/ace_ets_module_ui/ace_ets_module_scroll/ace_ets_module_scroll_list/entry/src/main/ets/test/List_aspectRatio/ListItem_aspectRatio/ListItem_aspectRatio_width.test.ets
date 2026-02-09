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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';
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
        url: 'MainAbility/pages/List_aspectRatio/ListItem_aspectRatio/ListItem_aspectRatio_width',
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
     * @tc.name   SUB_ACE_ListItem_aspectRatio_width_0100
     * @tc.number SUB_ACE_ListItem_aspectRatio_width_0100
     * @tc.desc   set the aspectRatio of ListItem to '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ListItem_aspectRatio_width_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0100] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0'
      });
      await CommonFunc.sleep(1000);
      let ListItem01 = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - Math.round(vp2px(160))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(vp2px(20))) <= 1).assertTrue();

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ListItem_aspectRatio_width_0200
     * @tc.number SUB_ACE_ListItem_aspectRatio_width_0200
     * @tc.desc   set the aspectRatio of ListItem to '0.5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ListItem_aspectRatio_width_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0.5'
      });
      await CommonFunc.sleep(1000);
      let ListItem01 = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');
      console.info('[vp2px]' + Math.round(vp2px(10)));
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200_1]' + Math.round(ListItem01.right - ListItem01.left));
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200_2]' + Math.round(ListItem01.bottom - ListItem01.top));

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - Math.round(vp2px(160))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(vp2px(320))) <= 1).assertTrue();

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ListItem_aspectRatio_width_0300
     * @tc.number SUB_ACE_ListItem_aspectRatio_width_0300
     * @tc.desc   set the aspectRatio of ListItem to '2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ListItem_aspectRatio_width_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '2'
      });
      await CommonFunc.sleep(1000);
      let ListItem01 = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300_1]' + Math.round(ListItem01.right - ListItem01.left));
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300_2]' + Math.round(ListItem01.bottom - ListItem01.top));

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - Math.round(vp2px(160))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(vp2px(80))) <= 1).assertTrue();

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_ListItem_aspectRatio_width_0400
     * @tc.number SUB_ACE_ListItem_aspectRatio_width_0400
     * @tc.desc   set the aspectRatio of ListItem to '-1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_ListItem_aspectRatio_width_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_ListItem_aspectRatio_width_0400] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '-1'
      });
      await CommonFunc.sleep(1000);
      let ListItem01 = CommonFunc.getComponentRect('ListItem_aspectRatio_width_01');

      expect(Math.abs(Math.round(ListItem01.right - ListItem01.left) - Math.round(vp2px(160))) <= 1).assertTrue();
      expect(Math.abs(Math.round(ListItem01.bottom - ListItem01.top) - Math.round(vp2px(20))) <= 1).assertTrue();

      console.info('[SUB_ACE_ListItem_aspectRatio_width_0400] END');
      done();
    });

  })
}
