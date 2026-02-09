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

export default function List_ListDirection() {

  describe('List_ListDirection', () => {
    beforeEach(async (done: Function) => {
      console.info("List_ListDirection beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List_Space/ListChange/List_ListDirection',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_ListDirection state pages:" + JSON.stringify(pages));
        if (!("List_ListDirection" == pages.name)) {
          console.info("get List_ListDirection state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push List_ListDirection page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_ListDirection page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_ListDirection beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_ListDirection after each called");
    });

    /**
     * @tc.name   testListListDirectionAxisVertical
     * @tc.number SUB_ACE_LIST_LIDTDIRECTION_TEST_0100
     * @tc.desc   List parent component binding direction property and value set to Axis.Vertical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testListListDirectionAxisVertical',  Level.LEVEL0, async (done: Function) => {
      console.info('testListListDirectionAxisVertical START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_ListDirection_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_ListDirection_011: RectValue = CommonFunc.getComponentRect('List_ListDirection_011');
      let List_ListDirection_012: RectValue = CommonFunc.getComponentRect('List_ListDirection_012');
      let List_ListDirection_013: RectValue = CommonFunc.getComponentRect('List_ListDirection_013');
      let List_ListDirection_014: RectValue = CommonFunc.getComponentRect('List_ListDirection_014');
      let List_ListDirection_01: RectValue = CommonFunc.getComponentRect('List_ListDirection_01');
      expect(Math.abs(List_ListDirection_011.left - List_ListDirection_01.left) <= 1).assertTrue();
      expect(Math.abs(List_ListDirection_012.left - List_ListDirection_01.left) <= 1).assertTrue();
      expect(Math.abs(List_ListDirection_013.left - List_ListDirection_01.left) <= 1).assertTrue();
      expect(Math.abs(List_ListDirection_014.left - List_ListDirection_01.left) <= 1).assertTrue();
      expect(Math.abs(List_ListDirection_011.top - List_ListDirection_01.top) <= 1).assertTrue();

      expect(Math.abs(Math.round(List_ListDirection_012.top - List_ListDirection_011.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_013.top - List_ListDirection_012.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_014.top - List_ListDirection_013.bottom) - Math.round(vp2px(20))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_01.bottom - List_ListDirection_014.bottom) - Math.round(vp2px(60))) <= 1).assertTrue();

      expect(Math.abs(Math.round(List_ListDirection_011.right - List_ListDirection_011.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_012.right - List_ListDirection_012.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_013.right - List_ListDirection_013.left) - Math.round(vp2px(300))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_014.right - List_ListDirection_014.left) - Math.round(vp2px(300))) <= 1).assertTrue();

      expect(Math.abs(Math.round(List_ListDirection_011.bottom - List_ListDirection_011.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_012.bottom - List_ListDirection_012.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_013.bottom - List_ListDirection_013.top) - Math.round(vp2px(100))) <= 1).assertTrue();
      expect(Math.abs(Math.round(List_ListDirection_014.bottom - List_ListDirection_014.top) - Math.round(vp2px(100))) <= 1).assertTrue();

      let driver = Driver.create();
      await driver.swipe(
        Math.round(List_ListDirection_013.left + ((List_ListDirection_013.right - List_ListDirection_013.left) / 2)),
        Math.round(List_ListDirection_013.bottom),
        Math.round(List_ListDirection_012.left + ((List_ListDirection_012.right - List_ListDirection_012.left) / 2)),
        Math.round(List_ListDirection_012.bottom));
      await CommonFunc.sleep(2000);
      let List_ListDirection_024: RectValue = CommonFunc.getComponentRect('List_ListDirection_014');
      expect(Math.abs(List_ListDirection_01.bottom - List_ListDirection_024.bottom - Math.round(vp2px(60))) <= 1).assertTrue();
      console.info('testListListDirectionAxisVertical END');
      done();
    });
  })
}