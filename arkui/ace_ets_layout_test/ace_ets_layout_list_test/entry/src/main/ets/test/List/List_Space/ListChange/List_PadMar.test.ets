/*
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

export default function List_PadMar() {

  describe('List_PadMar', () => {
    beforeEach(async (done: Function) => {
      console.info("List_PadMar beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_PadMar',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_PadMar state pages:" + JSON.stringify(pages));
        if (!("List_PadMar" == pages.name)) {
          console.info("get List_PadMar state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push List_PadMar page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_PadMar page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_PadMar beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_PadMar after each called");
    });

    /**
     * @tc.number SUB_ACE_LIST_List_PadMar_TEST_0100
     * @tc.name testListPadMar
     * @tc.desc List parent component binding padding and margin property and padding set to 10,margin set to 5
     */
    it('testListPadMar', 0, async (done: Function) => {
      console.info('testListPadMar START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_PadMar_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_PadMar_011: RectValue = CommonFunc.getComponentRect('List_PadMar_011');
      let List_PadMar_012: RectValue = CommonFunc.getComponentRect('List_PadMar_012');
      let List_PadMar_013: RectValue = CommonFunc.getComponentRect('List_PadMar_013');
      let List_PadMar_014: RectValue = CommonFunc.getComponentRect('List_PadMar_014');
      let List_PadMar_01: RectValue = CommonFunc.getComponentRect('List_PadMar_01');
      let List_PadMar_01_Box: RectValue = CommonFunc.getComponentRect('List_PadMar_01_Box');

      expect(Math.abs(Math.round(List_PadMar_011.left - List_PadMar_01.left) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_012.left - List_PadMar_01.left) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_013.left - List_PadMar_01.left) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_014.left - List_PadMar_01.left) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_011.top - List_PadMar_01.top) - Math.round(vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_PadMar_012.top - List_PadMar_011.bottom) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_013.top - List_PadMar_012.bottom) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_014.top - List_PadMar_013.bottom) - Math.round(vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_PadMar_01.top - List_PadMar_01_Box.top) * 10) / 10 - Math.round(vp2px(5) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round((List_PadMar_01.left - List_PadMar_01_Box.left) * 10) / 10 - Math.round(vp2px(5) * 10) / 10) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(List_PadMar_011.right - List_PadMar_011.left) - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_012.right - List_PadMar_012.left) - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_013.right - List_PadMar_013.left) - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_014.right - List_PadMar_014.left) - Math.round(vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(List_PadMar_011.bottom - List_PadMar_011.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_012.bottom - List_PadMar_012.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_013.bottom - List_PadMar_013.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_014.bottom - List_PadMar_014.top) - Math.round(vp2px(100))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(List_PadMar_01.bottom - List_PadMar_01.top) - Math.round(vp2px(520))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_PadMar_01.right - List_PadMar_01.left) - Math.round(vp2px(350))) <= 1)
        .assertTrue();
      let driver = Driver.create();
      await driver.swipe(360, 690, 360, 30);
      let List_PadMar_014Again: RectValue = CommonFunc.getComponentRect('List_PadMar_014');
      expect(Math.abs(List_PadMar_014.top - List_PadMar_014Again.top) <= 1).assertTrue();
      console.info('testListPadMar END');
      done();
    });
  })
}