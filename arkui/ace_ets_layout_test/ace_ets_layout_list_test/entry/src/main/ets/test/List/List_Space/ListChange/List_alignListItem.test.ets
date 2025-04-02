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

export default function List_alignListItem() {

  describe('List_alignListItem', () => {
    beforeEach(async (done: Function) => {
      console.info("List_alignListItem beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListChange/List_alignListItem',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get List_alignListItem state pages:" + JSON.stringify(pages));
        if (!("List_alignListItem" == pages.name)) {
          console.info("get List_alignListItem state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push List_alignListItem page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push List_alignListItem page error:" + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("List_alignListItem beforeEach end");
      done()
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("List_alignListItem after each called");
    });

    /**
     * @tc.number SUB_ACE_LIST_ALIGNLISTITEM_TEST_0100
     * @tc.name testListAlignListItemStart
     * @tc.desc The List parent component binds the alignListItem property ListItemAlign.Start
     */
    it('testListAlignListItemStart', 0, async (done: Function) => {
      console.info('testListAlignListItemStart START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_alignListItem_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_alignListItem_011: RectValue = CommonFunc.getComponentRect('List_alignListItem_011');
      let List_alignListItem_012: RectValue = CommonFunc.getComponentRect('List_alignListItem_012');
      let List_alignListItem_013: RectValue = CommonFunc.getComponentRect('List_alignListItem_013');
      let List_alignListItem_014: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      let List_alignListItem_01: RectValue = CommonFunc.getComponentRect('List_alignListItem_01');
      expect(List_alignListItem_011.left).assertEqual(List_alignListItem_01.left);
      expect(List_alignListItem_012.left).assertEqual(List_alignListItem_01.left);
      expect(List_alignListItem_013.left).assertEqual(List_alignListItem_01.left);
      expect(List_alignListItem_014.left).assertEqual(List_alignListItem_01.left);
      expect(List_alignListItem_011.top).assertEqual(List_alignListItem_01.top);

      expect(Math.round(List_alignListItem_012.top - List_alignListItem_011.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_013.top - List_alignListItem_012.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_014.top - List_alignListItem_013.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_01.bottom - List_alignListItem_014.bottom))
        .assertEqual(Math.round(vp2px(60)));


      expect(Math.round(List_alignListItem_011.right - List_alignListItem_011.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_012.right - List_alignListItem_012.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_013.right - List_alignListItem_013.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_014.right - List_alignListItem_014.left))
        .assertEqual(Math.round(vp2px(300)));

      expect(Math.round(List_alignListItem_011.bottom - List_alignListItem_011.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_012.bottom - List_alignListItem_012.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_013.bottom - List_alignListItem_013.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_014.bottom - List_alignListItem_014.top))
        .assertEqual(Math.round(vp2px(100)));

      let driver = Driver.create();
      await driver.swipe(
        Math.round(List_alignListItem_013.left + ((List_alignListItem_013.right - List_alignListItem_013.left) / 2)),
        Math.round(List_alignListItem_013.bottom),
        Math.round(List_alignListItem_012.left + ((List_alignListItem_012.right - List_alignListItem_012.left) / 2)),
        Math.round(List_alignListItem_012.bottom));
      await CommonFunc.sleep(1000);
      let List_alignListItem_024: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      expect(List_alignListItem_01.bottom - List_alignListItem_024.bottom).assertEqual(vp2px(60));

      console.info('testListAlignListItemStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_LIST_ALIGNLISTITEM_TEST_0200
     * @tc.name testListAlignListItemCenter
     * @tc.desc The List parent component binds the alignListItem property ListItemAlign.Center
     */
    it('testListAlignListItemCenter', 0, async (done: Function) => {
      console.info('testListAlignListItemCenter START');
      globalThis.value.message.notify({
        name: 'addAlignListItem', value: ListItemAlign.Center
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_alignListItem_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_alignListItem_011: RectValue = CommonFunc.getComponentRect('List_alignListItem_011');
      let List_alignListItem_012: RectValue = CommonFunc.getComponentRect('List_alignListItem_012');
      let List_alignListItem_013: RectValue = CommonFunc.getComponentRect('List_alignListItem_013');
      let List_alignListItem_014: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      let List_alignListItem_01: RectValue = CommonFunc.getComponentRect('List_alignListItem_01');
      expect(Math.abs(Math.round(List_alignListItem_011.left - List_alignListItem_01.left) - Math.round(List_alignListItem_01.right - List_alignListItem_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_alignListItem_012.left - List_alignListItem_01.left) - Math.round(List_alignListItem_01.right - List_alignListItem_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_alignListItem_013.left - List_alignListItem_01.left) - Math.round(List_alignListItem_01.right - List_alignListItem_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(List_alignListItem_014.left - List_alignListItem_01.left) - Math.round(List_alignListItem_01.right - List_alignListItem_014.right)) <= 1)
        .assertTrue();
      expect(Math.abs(List_alignListItem_011.top - List_alignListItem_01.top) <= 1).assertTrue();

      expect(Math.round(List_alignListItem_012.top - List_alignListItem_011.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_013.top - List_alignListItem_012.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_014.top - List_alignListItem_013.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_01.bottom - List_alignListItem_014.bottom))
        .assertEqual(Math.round(vp2px(60)));

      expect(Math.round(List_alignListItem_011.right - List_alignListItem_011.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_012.right - List_alignListItem_012.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_013.right - List_alignListItem_013.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_014.right - List_alignListItem_014.left))
        .assertEqual(Math.round(vp2px(300)));

      expect(Math.round(List_alignListItem_011.bottom - List_alignListItem_011.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_012.bottom - List_alignListItem_012.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_013.bottom - List_alignListItem_013.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_014.bottom - List_alignListItem_014.top))
        .assertEqual(Math.round(vp2px(100)));

      let driver = Driver.create();
      await driver.swipe(
        Math.round(List_alignListItem_013.left + ((List_alignListItem_013.right - List_alignListItem_013.left) / 2)),
        Math.round(List_alignListItem_013.bottom),
        Math.round(List_alignListItem_012.left + ((List_alignListItem_012.right - List_alignListItem_012.left) / 2)),
        Math.round(List_alignListItem_012.bottom));
      await CommonFunc.sleep(1000);
      let List_alignListItem_024: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      expect(List_alignListItem_01.bottom - List_alignListItem_024.bottom).assertEqual(vp2px(60));

      console.info('testListAlignListItemCenter END');
      done();
    });
    /**
     * @tc.number SUB_ACE_LIST_ALIGNLISTITEM_TEST_0300
     * @tc.name testListAlignListItemEnd
     * @tc.desc The List parent component binds the alignListItem property ListItemAlign.End
     */
    it('testListAlignListItemEnd', 0, async (done: Function) => {
      console.info('testListAlignListItemEnd START');
      globalThis.value.message.notify({
        name: 'addAlignListItem', value: ListItemAlign.End
      })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('List_alignListItem_01');

      expect(JSON.parse(strJson).$type).assertEqual('List');
      let List_alignListItem_011: RectValue = CommonFunc.getComponentRect('List_alignListItem_011');
      let List_alignListItem_012: RectValue = CommonFunc.getComponentRect('List_alignListItem_012');
      let List_alignListItem_013: RectValue = CommonFunc.getComponentRect('List_alignListItem_013');
      let List_alignListItem_014: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      let List_alignListItem_01: RectValue = CommonFunc.getComponentRect('List_alignListItem_01');
      expect(List_alignListItem_011.right).assertEqual(List_alignListItem_01.right);
      expect(List_alignListItem_012.right).assertEqual(List_alignListItem_01.right);
      expect(List_alignListItem_013.right).assertEqual(List_alignListItem_01.right);
      expect(List_alignListItem_014.right).assertEqual(List_alignListItem_01.right);
      expect(List_alignListItem_011.top).assertEqual(List_alignListItem_01.top);

      expect(Math.round(List_alignListItem_012.top - List_alignListItem_011.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_013.top - List_alignListItem_012.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_014.top - List_alignListItem_013.bottom)).assertEqual(Math.round(vp2px(20)));
      expect(Math.round(List_alignListItem_01.bottom - List_alignListItem_014.bottom))
        .assertEqual(Math.round(vp2px(60)));

      expect(Math.round(List_alignListItem_011.right - List_alignListItem_011.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_012.right - List_alignListItem_012.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_013.right - List_alignListItem_013.left))
        .assertEqual(Math.round(vp2px(300)));
      expect(Math.round(List_alignListItem_014.right - List_alignListItem_014.left))
        .assertEqual(Math.round(vp2px(300)));

      expect(Math.round(List_alignListItem_011.bottom - List_alignListItem_011.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_012.bottom - List_alignListItem_012.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_013.bottom - List_alignListItem_013.top))
        .assertEqual(Math.round(vp2px(100)));
      expect(Math.round(List_alignListItem_014.bottom - List_alignListItem_014.top))
        .assertEqual(Math.round(vp2px(100)));

      let driver = Driver.create();
      await driver.swipe(
        Math.round(List_alignListItem_013.left + ((List_alignListItem_013.right - List_alignListItem_013.left) / 2)),
        Math.round(List_alignListItem_013.bottom),
        Math.round(List_alignListItem_012.left + ((List_alignListItem_012.right - List_alignListItem_012.left) / 2)),
        Math.round(List_alignListItem_012.bottom));
      await CommonFunc.sleep(1000);
      let List_alignListItem_024: RectValue = CommonFunc.getComponentRect('List_alignListItem_014');
      expect(List_alignListItem_01.bottom - List_alignListItem_024.bottom).assertEqual(vp2px(60));
      console.info('testListAlignListItemEnd END');
      done();
    });
  })
}