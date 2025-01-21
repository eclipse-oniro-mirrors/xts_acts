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

export default function List_ListSize() {

  describe('List_ListSizeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("List_ListSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_ListSize',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_ListSize state pages:" + JSON.stringify(pages));
        if (!("List_ListSize" == pages.name)) {
          console.info("get List_ListSize state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push List_ListSize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_ListSize page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_ListSizeTest beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_ListSizeTest after each called");
    });

    /**
     * @tc.number SUB_ACE_LIST_LISTSIZE_TEST_0100
     * @tc.name testListListSizeMeet
     * @tc.desc The List parent component sets the width and height to meet the layout of the child component
     */
    it('testListListSizeMeet', 0, async (done: Function) => {
      console.info('testListListSizeMeet START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_ListSize_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_ListSize_011: RectValue = CommonFunc.getComponentRect('List_ListSize_011');
      let List_ListSize_012: RectValue = CommonFunc.getComponentRect('List_ListSize_012');
      let List_ListSize_013: RectValue = CommonFunc.getComponentRect('List_ListSize_013');
      let List_ListSize_014: RectValue = CommonFunc.getComponentRect('List_ListSize_014');
      let List_ListSize_01: RectValue = CommonFunc.getComponentRect('List_ListSize_01');
      expect(List_ListSize_011.left).assertEqual(List_ListSize_01.left);
      expect(List_ListSize_012.left).assertEqual(List_ListSize_01.left);
      expect(List_ListSize_013.left).assertEqual(List_ListSize_01.left);
      expect(List_ListSize_014.left).assertEqual(List_ListSize_01.left);
      expect(List_ListSize_011.top).assertEqual(List_ListSize_01.top);

      expect(Math.round(List_ListSize_012.top - List_ListSize_011.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_ListSize_013.top - List_ListSize_012.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_ListSize_014.top - List_ListSize_013.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_ListSize_01.bottom - List_ListSize_014.bottom)).assertEqual(Math.round(vp2px(40)));

      expect(Math.round(List_ListSize_011.right - List_ListSize_011.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_ListSize_012.right - List_ListSize_012.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_ListSize_013.right - List_ListSize_013.left)).assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_ListSize_014.right - List_ListSize_014.left)).assertEqual(Math.round(vp2px(300)));

      expect(Math.round(List_ListSize_011.bottom - List_ListSize_011.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_ListSize_012.bottom - List_ListSize_012.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_ListSize_013.bottom - List_ListSize_013.top)).assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_ListSize_014.bottom - List_ListSize_014.top)).assertEqual(Math.round(vp2px(100)));

      let driver = Driver.create();
      await driver.swipe(
        Math.round(List_ListSize_013.left + ((List_ListSize_013.right - List_ListSize_013.left) / 2)),
        Math.round(List_ListSize_013.bottom),
        Math.round(List_ListSize_012.left + ((List_ListSize_012.right - List_ListSize_012.left) / 2)),
        Math.round(List_ListSize_012.bottom));
      await CommonFunc.sleep(1000);
      let List_ListSize_024: RectValue = CommonFunc.getComponentRect('List_ListSize_014');
      expect(List_ListSize_01.bottom - List_ListSize_024.bottom).assertEqual(Math.round(vp2px(40)));
      console.info('testListListSizeMeet END');
      done();
    });
  })
}