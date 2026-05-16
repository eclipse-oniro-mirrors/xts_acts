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

export default function List_divider() {

  describe('List_divider', () => {
    beforeEach(async (done: Function) => {
      console.info("List_divider beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List_Space/ListChange/List_divider',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_divider state pages:" + JSON.stringify(pages));
        if (!("List_divider" == pages.name)) {
          console.info("get List_divider state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push List_divider page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_divider page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_divider beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_divider after each called");
    });

    /**
     * @tc.name   testListDividerStrokeWidthToTen
     * @tc.number SUB_ACE_LIST_LIST_DIVIDER_TEST_0100
     * @tc.desc   List parent component binding divider property and strokeWidth set to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListDividerStrokeWidthToTen',  Level.LEVEL0, async (done: Function) => {
      console.info('testListDividerStrokeWidthToTen START');
      globalThis.value.message.notify({
        name: 'strokeWidth', value: 10
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('List_divider_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_divider_011 = CommonFunc.getComponentRect('List_divider_011');
      let List_divider_012 = CommonFunc.getComponentRect('List_divider_012');
      let List_divider_013 = CommonFunc.getComponentRect('List_divider_013');
      let List_divider_014 = CommonFunc.getComponentRect('List_divider_014');
      let List_divider_01 = CommonFunc.getComponentRect('List_divider_01');
      let left = List_divider_01.left;
      let top = List_divider_01.top;
      let right = List_divider_01.right;
      let bottom = List_divider_01.bottom;
      expect(Math.abs(Math.round(List_divider_011.right - List_divider_011.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_012.right - List_divider_012.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_013.right - List_divider_013.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_014.right - List_divider_014.left) - Math.round(vp2px(300))) <= 1).assertTrue();

      expect(Math.abs(Math.round(List_divider_011.bottom - List_divider_011.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_012.bottom - List_divider_012.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_013.bottom - List_divider_013.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_014.bottom - List_divider_014.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      expect(Math.floor(Math.abs(List_divider_011.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_012.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_013.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_014.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_011.top - List_divider_01.top)) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_012.top - List_divider_011.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_013.top - List_divider_012.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_014.top - List_divider_013.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_01.bottom - List_divider_014.bottom) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_01.bottom - List_divider_01.top) - vp2px(500))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_01.right - List_divider_01.left) - vp2px(350))) <= 1).assertTrue();
      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + left + (right -left)/2), Math.round(globalThis.winTop + (bottom-top)/2 + top), Math.round(globalThis.winLeft + left + (right -left)/2), Math.round(globalThis.winTop + top));
      await CommonFunc.sleep(3000);
      let List_divider_014Again = CommonFunc.getComponentRect('List_divider_014');
      expect(Math.floor(Math.abs(List_divider_014.top - List_divider_014Again.top)) <= 1).assertTrue();
      console.info('testListDividerStrokeWidthToTen END');
      done();
    });

    /**
     * @tc.name   testListDividerStrokeWidthToForty
     * @tc.number SUB_ACE_LIST_LIST_DIVIDER_TEST_0200
     * @tc.desc   List parent component binding divider property and strokeWidth set to 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListDividerStrokeWidthToForty',  Level.LEVEL0, async (done: Function) => {
      console.info('testListDividerStrokeWidthToForty START');
      globalThis.value.message.notify({
        name: 'strokeWidth', value: 40
      })
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('List_divider_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_divider_011 = CommonFunc.getComponentRect('List_divider_011');
      let List_divider_012 = CommonFunc.getComponentRect('List_divider_012');
      let List_divider_013 = CommonFunc.getComponentRect('List_divider_013');
      let List_divider_014 = CommonFunc.getComponentRect('List_divider_014');
      let List_divider_01 = CommonFunc.getComponentRect('List_divider_01');
      let left = List_divider_01.left;
      let top = List_divider_01.top;
      let right = List_divider_01.right;
      let bottom = List_divider_01.bottom;
      expect(Math.abs(Math.round(List_divider_011.right - List_divider_011.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_012.right - List_divider_012.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_013.right - List_divider_013.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_014.right - List_divider_014.left) - Math.round(vp2px(300))) <= 1).assertTrue();

      console.info('testListDividerStrokeWidthToForty 111');
      expect(Math.abs(Math.round(List_divider_011.bottom - List_divider_011.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_012.bottom - List_divider_012.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_013.bottom - List_divider_013.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_divider_014.bottom - List_divider_014.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      console.info('testListDividerStrokeWidthToForty 222');
      expect(Math.floor(Math.abs(List_divider_011.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_012.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_013.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_014.left - List_divider_01.left)) <= 1).assertTrue();
      expect(Math.floor(Math.abs(List_divider_011.top - List_divider_01.top)) <= 1).assertTrue();
      console.info('testListDividerStrokeWidthToForty 333');
      expect(Math.floor(Math.abs((List_divider_014.bottom - List_divider_01.bottom) - vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_012.top - List_divider_011.bottom) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_013.top - List_divider_012.bottom) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_014.top - List_divider_013.bottom) - vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_01.bottom - List_divider_01.top) - vp2px(500))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((List_divider_01.right - List_divider_01.left) - vp2px(350))) <= 1).assertTrue();
      console.info('testListDividerStrokeWidthToForty 444');
      let driver = Driver.create();
      await driver.swipe(Math.round(globalThis.winLeft + left + (right -left)/2),  Math.round(globalThis.winTop + (bottom-top)*0.4 + top), Math.round(globalThis.winLeft + left + (right -left)/2), Math.round(globalThis.winTop + top));
      await CommonFunc.sleep(3000);
      let List_divider_014Again = CommonFunc.getComponentRect('List_divider_014');
      expect(Math.floor(Math.abs(List_divider_01.bottom - List_divider_014Again.bottom)) <= 1)
        .assertTrue();
      console.info('testListDividerStrokeWidthToForty END');
      done();
    });
  })
}