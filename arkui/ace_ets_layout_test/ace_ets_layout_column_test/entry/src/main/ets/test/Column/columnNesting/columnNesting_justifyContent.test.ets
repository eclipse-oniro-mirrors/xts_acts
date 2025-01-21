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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import RectValue from '../../../MainAbility/common/Rect';
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager, Callback, Message } from '../../../MainAbility/common/MessageManager';

export default function columnNesting_justifyContent() {
  describe('columnNesting_justifyContent', () => {
    beforeEach(async () => {
      console.info("columnNesting_justifyContent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/columnNesting/columnNesting_justifyContent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnNesting_justifyContent state pages1:" + JSON.stringify(pages));
        if (!("columnNesting_justifyContent" == pages.name)) {
          console.info("get columnNesting_justifyContent pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          pages = router.getState();
          console.info("get columnNesting_justifyContent state pages2:" + JSON.stringify(pages));
          console.info("push columnNesting_justifyContent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnNesting_justifyContent page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("columnNesting_justifyContent after each called")
    });

    /**
     * @tc.number SUB_ACE_columnNesting_justifyContent_TEST_0100
     * @tc.name testColumnSpace
     * @tc.desc column_1 and column_01, column_02 settings justifyContent do not affect each other
     */
    it('SUB_ACE_columnNesting_justifyContent_TEST_0100', 0, async () => {
      console.info('[SUB_ACE_columnNesting_justifyContent_TEST_0100] START');
      await CommonFunc.sleep(4000);
      console.log('get Initial value')
      let columnNesting_justifyContent_011: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_011');
      let columnNesting_justifyContent_012: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_012');
      let columnNesting_justifyContent_013: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_013');
      let columnNesting_justifyContent_01: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_01');
      let columnNesting_justifyContent_021: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_021');
      let columnNesting_justifyContent_022: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_022');
      let columnNesting_justifyContent_023: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_023');
      let columnNesting_justifyContent_02: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_02');
      let columnNesting_justifyContent_1: RectValue = CommonFunc.getComponentRect('columnNesting_justifyContent_1');
      console.log('assert position')
      expect(Math.abs((columnNesting_justifyContent_011.left - columnNesting_justifyContent_01.left) - (columnNesting_justifyContent_01.right - columnNesting_justifyContent_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_justifyContent_012.left - columnNesting_justifyContent_01.left) - (columnNesting_justifyContent_01.right - columnNesting_justifyContent_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_justifyContent_013.left - columnNesting_justifyContent_01.left) - (columnNesting_justifyContent_01.right - columnNesting_justifyContent_013.right)) <= 1)
        .assertTrue();

      expect(Math.abs((columnNesting_justifyContent_021.left - columnNesting_justifyContent_02.left) - (columnNesting_justifyContent_02.right - columnNesting_justifyContent_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_justifyContent_022.left - columnNesting_justifyContent_02.left) - (columnNesting_justifyContent_02.right - columnNesting_justifyContent_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_justifyContent_023.left - columnNesting_justifyContent_02.left) - (columnNesting_justifyContent_02.right - columnNesting_justifyContent_023.right)) <= 1)
        .assertTrue();

      expect(Math.abs((columnNesting_justifyContent_01.top - columnNesting_justifyContent_011.top)) <= 1).assertTrue();
      expect(Math.abs((columnNesting_justifyContent_1.top - columnNesting_justifyContent_01.top)) <= 1).assertTrue();

      console.log('assert space')
      expect(Math.abs((columnNesting_justifyContent_012.top - columnNesting_justifyContent_011.bottom) - (columnNesting_justifyContent_013.top - columnNesting_justifyContent_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_justifyContent_022.top - columnNesting_justifyContent_021.bottom) - (columnNesting_justifyContent_023.top - columnNesting_justifyContent_022.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs((columnNesting_justifyContent_012.top - columnNesting_justifyContent_011.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      console.log('columnNesting_justifyContent_012.top - columnNesting_justifyContent_011.bottom', +(columnNesting_justifyContent_012.top - columnNesting_justifyContent_011.bottom))
      expect(Math.abs((columnNesting_justifyContent_013.top - columnNesting_justifyContent_012.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      console.log('columnNesting_justifyContent_013.top - columnNesting_justifyContent_012.bottom', +(columnNesting_justifyContent_013.top - columnNesting_justifyContent_012.bottom))
      expect(Math.abs((columnNesting_justifyContent_022.top - columnNesting_justifyContent_021.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      console.log('columnNesting_justifyContent_012.top - columnNesting_justifyContent_011.bottom', +(columnNesting_justifyContent_012.top - columnNesting_justifyContent_011.bottom))
      expect(Math.abs((columnNesting_justifyContent_023.top - columnNesting_justifyContent_022.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      console.log('columnNesting_justifyContent_013.top - columnNesting_justifyContent_012.bottom', +(columnNesting_justifyContent_013.top - columnNesting_justifyContent_012.bottom))
      expect(Math.abs((columnNesting_justifyContent_02.top - columnNesting_justifyContent_01.bottom) - vp2px(100)) <= 1)
        .assertTrue();
      console.log('columnNesting_justifyContent_02.top - columnNesting_justifyContent_01.bottom', +(columnNesting_justifyContent_02.top - columnNesting_justifyContent_01.bottom))

      console.log('assert height')
      console.log('column_01 assert height')
      expect(Math.abs(columnNesting_justifyContent_011.bottom - columnNesting_justifyContent_011.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_012.bottom - columnNesting_justifyContent_012.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_013.bottom - columnNesting_justifyContent_013.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      console.log('column_02 assert height')
      expect(Math.abs(columnNesting_justifyContent_021.bottom - columnNesting_justifyContent_021.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_022.bottom - columnNesting_justifyContent_022.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_023.bottom - columnNesting_justifyContent_023.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(columnNesting_justifyContent_01.bottom - columnNesting_justifyContent_01.top - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_02.bottom - columnNesting_justifyContent_02.top - Math.round(vp2px(300))) <= 1)
        .assertTrue();

      console.log('assert weight')
      console.log('column_01 assert weight')
      expect(Math.abs(columnNesting_justifyContent_011.right - columnNesting_justifyContent_011.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_012.right - columnNesting_justifyContent_012.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_013.right - columnNesting_justifyContent_013.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();

      console.log('column_02 assert weight')
      expect(Math.abs(columnNesting_justifyContent_021.right - columnNesting_justifyContent_021.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_022.right - columnNesting_justifyContent_022.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_023.right - columnNesting_justifyContent_023.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.abs(columnNesting_justifyContent_01.right - columnNesting_justifyContent_01.left - Math.round(vp2px(350))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_justifyContent_02.right - columnNesting_justifyContent_02.left - Math.round(vp2px(350))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_columnNesting_justifyContent_TEST_0100] END');
    });
  })
}