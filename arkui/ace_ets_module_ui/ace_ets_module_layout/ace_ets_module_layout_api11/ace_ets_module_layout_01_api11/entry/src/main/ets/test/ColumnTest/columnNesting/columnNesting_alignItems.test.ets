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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function columnNesting_alignItems() {
  describe('columnNesting_alignItems', () => {
    beforeEach(async () => {
      console.info("columnNesting_alignItems beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/columnNesting/columnNesting_alignItems",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnNesting_alignItems state pages1:" + JSON.stringify(pages));
        if (!("columnNesting_alignItems" == pages.name)) {
          console.info("get columnNesting_alignItems pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          pages = router.getState();
          console.info("get columnNesting_alignItems state pages2:" + JSON.stringify(pages));
          console.info("push columnNesting_alignItems page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnNesting_alignItems page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("columnNesting_alignItems after each called")
    });

    /**
     * @tc.number SUB_ACE_columnNesting_alignItems_TEST_0100
     * @tc.name testColumnSpace
     * @tc.desc column_1 and column_01, column_02 settings justifyContent do not affect each other
     */
    it('SUB_ACE_columnNesting_alignItems_TEST_0100',  Level.LEVEL0, async () => {
      console.info('[SUB_ACE_columnNesting_alignItems_TEST_0100] START');
      await CommonFunc.sleep(4000);
      console.log('get Initial value')
      let columnNesting_alignItems_011: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_011');
      let columnNesting_alignItems_012: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_012');
      let columnNesting_alignItems_013: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_013');
      let columnNesting_alignItems_01: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_01');
      let columnNesting_alignItems_021: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_021');
      let columnNesting_alignItems_022: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_022');
      let columnNesting_alignItems_023: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_023');
      let columnNesting_alignItems_02: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_02');
      let columnNesting_alignItems_1: RectValue = CommonFunc.getComponentRect('columnNesting_alignItems_1');
      console.log('assert position')
      expect(Math.floor(Math.abs((columnNesting_alignItems_011.left - columnNesting_alignItems_01.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_012.left - columnNesting_alignItems_01.left))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_013.left - columnNesting_alignItems_01.left))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((columnNesting_alignItems_021.right - columnNesting_alignItems_02.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_022.right - columnNesting_alignItems_02.right))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_023.right - columnNesting_alignItems_02.right))) <= 1).assertTrue();

      expect(Math.floor(Math.abs((columnNesting_alignItems_01.top - columnNesting_alignItems_011.top))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_1.top - columnNesting_alignItems_01.top))) <= 1).assertTrue();

      console.log('assert space')
      console.log('[SUB_ACE_columnNesting_alignItems_TEST_0100] columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom', +(columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom))
      console.log('[SUB_ACE_columnNesting_alignItems_TEST_0100] columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom', +(columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom))
      console.log('[SUB_ACE_columnNesting_alignItems_TEST_0100] columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom', +(columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom))
      console.log('[SUB_ACE_columnNesting_alignItems_TEST_0100] columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom', +(columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom))
      expect(Math.floor(Math.abs((columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom) - (columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom))) <= 2)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom) - (columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom))) <= 2)
        .assertTrue();

      expect(Math.floor(Math.abs((columnNesting_alignItems_012.top - columnNesting_alignItems_011.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_013.top - columnNesting_alignItems_012.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_022.top - columnNesting_alignItems_021.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((columnNesting_alignItems_023.top - columnNesting_alignItems_022.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      console.log('[SUB_ACE_columnNesting_alignItems_TEST_0100] columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom', +(columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom))
      expect(Math.floor(Math.abs((columnNesting_alignItems_02.top - columnNesting_alignItems_01.bottom) - vp2px(30))) <= 1)
        .assertTrue();

      console.log('assert height')
      console.log('column_01 assert height')
      expect(Math.floor(Math.abs(columnNesting_alignItems_011.bottom - columnNesting_alignItems_011.top - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_012.bottom - columnNesting_alignItems_012.top - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_013.bottom - columnNesting_alignItems_013.top - vp2px(150))) <= 1)
        .assertTrue();

      console.log('column_02 assert height')
      expect(Math.floor(Math.abs(columnNesting_alignItems_021.bottom - columnNesting_alignItems_021.top - vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_022.bottom - columnNesting_alignItems_022.top - vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_023.bottom - columnNesting_alignItems_023.top - vp2px(150))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(columnNesting_alignItems_01.bottom - columnNesting_alignItems_01.top - vp2px(400))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_02.bottom - columnNesting_alignItems_02.top - vp2px(400))) <= 1)
        .assertTrue();

      console.log('assert weight')
      console.log('column_01 assert weight')
      expect(Math.floor(Math.abs(columnNesting_alignItems_011.right - columnNesting_alignItems_011.left - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_012.right - columnNesting_alignItems_012.left - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_013.right - columnNesting_alignItems_013.left - vp2px(300))) <= 1)
        .assertTrue();

      console.log('column_02 assert weight')
      expect(Math.floor(Math.abs(columnNesting_alignItems_021.right - columnNesting_alignItems_021.left - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_022.right - columnNesting_alignItems_022.left - vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_023.right - columnNesting_alignItems_023.left - vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs(columnNesting_alignItems_01.right - columnNesting_alignItems_01.left - vp2px(350))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs(columnNesting_alignItems_02.right - columnNesting_alignItems_02.left - vp2px(350))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_columnNesting_alignItems_TEST_0100] END');
    });
  })
}
