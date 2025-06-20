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

export default function List_aspectRatio_height() {
  describe('List_aspectRatio_height', () => {
    beforeEach(async (done: Function) => {
      console.info("List_aspectRatio_height beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_aspectRatio/List_aspectRatio/List_aspectRatio_height',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_aspectRatio_height state pages:" + JSON.stringify(pages));
        if (!("List_aspectRatio_height" == pages.name)) {
          console.info("get List_aspectRatio_height pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_aspectRatio_height page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_aspectRatio_height page error:" + err);
      }
      console.info("List_aspectRatio_height beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("List_aspectRatio_height after each called");
    });


    /**
     * @tc.number SUB_ACE_List_aspectRatio_height_0100
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of list to '0'
     */
    it('SUB_ACE_List_aspectRatio_height_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_aspectRatio_height_0100] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_01');
      let column01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_column');
      let item01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_001');
      let width: number = column01.right - column01.left;
      let height: number = column01.bottom - column01.top;

      let itemwidth: number = item01.right - item01.left;
      let itemheight: number = item01.bottom - item01.top;

      expect(Math.abs(Math.round(List01.right - List01.left) - Math.round(itemwidth)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List01.bottom - List01.top) - Math.round(height * 0.4)) <= 1).assertTrue();

      console.info('[SUB_ACE_List_aspectRatio_height_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_List_aspectRatio_height_0200
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of list to '0.5'
     */
    it('SUB_ACE_List_aspectRatio_height_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_aspectRatio_height_0200] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0.5'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_01');
      let lwidth: number = List01.right - List01.left;
      let lheight: number = List01.bottom - List01.top;
      
      let column01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_column');
      let width: number = column01.right - column01.left;
      let height: number = column01.bottom - column01.top;

      expect(Math.abs(Math.round(List01.right - List01.left) - Math.round(lheight * 0.5)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List01.bottom - List01.top) - Math.round(height * 0.4)) <= 1).assertTrue();

      console.info('[SUB_ACE_List_aspectRatio_height_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_List_aspectRatio_height_0300
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of list to '2'
     */
    it('SUB_ACE_List_aspectRatio_height_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_aspectRatio_height_0300] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '2'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_01');
      let lwidth: number = List01.right - List01.left;
      let lheight: number = List01.bottom - List01.top;

      let column01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_column');
      let width: number = column01.right - column01.left;
      let height: number = column01.bottom - column01.top;

      expect(Math.abs(Math.round(List01.right - List01.left) - Math.round(lheight * 2)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List01.bottom - List01.top) - Math.round(height * 0.4)) <= 1).assertTrue();

      console.info('[SUB_ACE_List_aspectRatio_height_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_List_aspectRatio_height_0400
     * @tc.name testListAspectRatio
     * @tc.desc set the aspectRatio of list to '-1'
     */
    it('SUB_ACE_List_aspectRatio_height_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_aspectRatio_height_0400] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '-1'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_01');
      let column01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_column');
      let item01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_height_001');
      let width: number = column01.right - column01.left;
      let height: number = column01.bottom - column01.top;

      let itemwidth: number = item01.right - item01.left;
      let itemheight: number = item01.bottom - item01.top;

      expect(Math.abs(Math.round(List01.right - List01.left) - Math.round(itemwidth)) <= 1).assertTrue();
      expect(Math.abs(Math.round(List01.bottom - List01.top) - Math.round(height * 0.4)) <= 1).assertTrue();

      console.info('[SUB_ACE_List_aspectRatio_height_0400] END');
      done();
    });


  })
}
