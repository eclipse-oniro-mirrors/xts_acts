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

export default function List_aspectRatio_all() {
  describe('List_aspectRatio_all', () => {
    beforeEach(async (done: Function) => {
      console.info("List_aspectRatio_all beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_aspectRatio/List_aspectRatio/List_aspectRatio_all',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get List_aspectRatio_all state pages:" + JSON.stringify(pages));
        if (!("List_aspectRatio_all" == pages.name)) {
          console.info("get List_aspectRatio_all pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push List_aspectRatio_all page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_aspectRatio_all page error:" + err);
      }
      console.info("List_aspectRatio_all beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      router.clear()
      console.info("ListItem_Delete_End after each called");
    });


    /**
     * @tc.name   SUB_ACE_List_aspectRatio_all_0100
     * @tc.number SUB_ACE_List_aspectRatio_all_0100
     * @tc.desc   set the aspectRatio of list to '0'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_aspectRatio_all_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_aspectRatio_all_0100] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_all_01');

	  expect(Math.abs(Math.round(List01.right - List01.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List01.bottom - List01.top) - Math.round(vp2px(700))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_aspectRatio_all_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_List_aspectRatio_all_0200
     * @tc.number SUB_ACE_List_aspectRatio_all_0200
     * @tc.desc   set the aspectRatio of list to '0.5'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_aspectRatio_all_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_aspectRatio_all_0200] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '0.5'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_all_01');

	  expect(Math.abs(Math.round(List01.right - List01.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List01.bottom - List01.top) - Math.round(vp2px(700))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_aspectRatio_all_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_List_aspectRatio_all_0300
     * @tc.number SUB_ACE_List_aspectRatio_all_0300
     * @tc.desc   set the aspectRatio of list to '2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_aspectRatio_all_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_aspectRatio_all_0300] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '2'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_all_01');

	  expect(Math.abs(Math.round(List01.right - List01.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List01.bottom - List01.top) - Math.round(vp2px(175))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_aspectRatio_all_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_List_aspectRatio_all_0400
     * @tc.number SUB_ACE_List_aspectRatio_all_0400
     * @tc.desc   set the aspectRatio of list to '-1'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_List_aspectRatio_all_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_List_aspectRatio_all_0400] START');
      globalThis.value.message.notify({
        name: 'aspectRatio1', value: '-1'
      });
      await CommonFunc.sleep(1000);
      let List01: RectValue = CommonFunc.getComponentRect('List_aspectRatio_all_01');

	  expect(Math.abs(Math.round(List01.right - List01.left) - Math.round(vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(List01.bottom - List01.top) - Math.round(vp2px(700))) <= 1).assertTrue();

      console.info('[SUB_ACE_List_aspectRatio_all_0400] END');
      done();
    });


  })
}
