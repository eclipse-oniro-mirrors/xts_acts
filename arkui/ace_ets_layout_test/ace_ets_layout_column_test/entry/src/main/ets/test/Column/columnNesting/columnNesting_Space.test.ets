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

export default function columnNesting_Space() {
  describe('columnNesting_Space', () => {
    beforeEach(async () => {
      console.info("columnNesting_Space beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Column/columnNesting/columnNesting_Space",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get columnNesting_Space state pages1:" + JSON.stringify(pages));
        if (!("columnNesting_Space" == pages.name)) {
          console.info("get columnNesting_Space pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          pages = router.getState();
          console.info("get columnNesting_Space state pages2:" + JSON.stringify(pages));
          console.info("push columnNesting_Space page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnNesting_Space page error " + JSON.stringify(err));
        expect().assertFail();
      }
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("columnNesting_Space after each called")
    });

    /**
     * @tc.number SUB_ACE_columnNesting_Space_TEST_0100
     * @tc.name testColumnSpace
     * @tc.desc column_1 and column_01, column_02 settings space do not affect each other
     */
    it('SUB_ACE_columnNesting_Space_TEST_0100', 0, async () => {
      console.info('[SUB_ACE_columnNesting_Space_TEST_0100] START');
      await CommonFunc.sleep(4000);
      console.log('get Initial value')
      let columnNesting_Space_011: RectValue = CommonFunc.getComponentRect('columnNesting_Space_011');
      let columnNesting_Space_012: RectValue = CommonFunc.getComponentRect('columnNesting_Space_012');
      let columnNesting_Space_013: RectValue = CommonFunc.getComponentRect('columnNesting_Space_013');
      let columnNesting_Space_01: RectValue = CommonFunc.getComponentRect('columnNesting_Space_01');
      let columnNesting_Space_021: RectValue = CommonFunc.getComponentRect('columnNesting_Space_021');
      let columnNesting_Space_022: RectValue = CommonFunc.getComponentRect('columnNesting_Space_022');
      let columnNesting_Space_023: RectValue = CommonFunc.getComponentRect('columnNesting_Space_023');
      let columnNesting_Space_02: RectValue = CommonFunc.getComponentRect('columnNesting_Space_02');
      let columnNesting_Space_1: RectValue = CommonFunc.getComponentRect('columnNesting_Space_1');
      console.log('assert position')
      expect(Math.abs((columnNesting_Space_011.left - columnNesting_Space_01.left) - (columnNesting_Space_01.right - columnNesting_Space_011.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_Space_012.left - columnNesting_Space_01.left) - (columnNesting_Space_01.right - columnNesting_Space_012.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_Space_013.left - columnNesting_Space_01.left) - (columnNesting_Space_01.right - columnNesting_Space_013.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_Space_012.top - columnNesting_Space_011.bottom) - (columnNesting_Space_013.top - columnNesting_Space_012.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs((columnNesting_Space_021.left - columnNesting_Space_02.left) - (columnNesting_Space_02.right - columnNesting_Space_021.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_Space_022.left - columnNesting_Space_02.left) - (columnNesting_Space_02.right - columnNesting_Space_022.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_Space_023.left - columnNesting_Space_02.left) - (columnNesting_Space_02.right - columnNesting_Space_023.right)) <= 1)
        .assertTrue();
      expect(Math.abs((columnNesting_Space_022.top - columnNesting_Space_021.bottom) - (columnNesting_Space_023.top - columnNesting_Space_022.bottom)) <= 1)
        .assertTrue();

      expect(Math.abs((columnNesting_Space_01.top - columnNesting_Space_011.top)) <= 1).assertTrue();

      console.log('assert space')
      expect(Math.abs((columnNesting_Space_012.top - columnNesting_Space_011.bottom) - vp2px(10)) <= 1).assertTrue();
      console.log('columnNesting_Space_012.top - columnNesting_Space_011.bottom', +(columnNesting_Space_012.top - columnNesting_Space_011.bottom))
      expect(Math.abs((columnNesting_Space_013.top - columnNesting_Space_012.bottom) - vp2px(10)) <= 1).assertTrue();
      console.log('columnNesting_Space_013.top - columnNesting_Space_012.bottom', +(columnNesting_Space_013.top - columnNesting_Space_012.bottom))
      expect(Math.abs((columnNesting_Space_022.top - columnNesting_Space_021.bottom) - vp2px(10)) <= 1).assertTrue();
      console.log('columnNesting_Space_012.top - columnNesting_Space_011.bottom', +(columnNesting_Space_012.top - columnNesting_Space_011.bottom))
      expect(Math.abs((columnNesting_Space_023.top - columnNesting_Space_022.bottom) - vp2px(10)) <= 1).assertTrue();
      console.log('columnNesting_Space_013.top - columnNesting_Space_012.bottom', +(columnNesting_Space_013.top - columnNesting_Space_012.bottom))
      expect(Math.abs((columnNesting_Space_02.top - columnNesting_Space_01.bottom) - vp2px(30)) <= 1).assertTrue();
      console.log('columnNesting_Space_02.top - columnNesting_Space_01.bottom', +(columnNesting_Space_02.top - columnNesting_Space_01.bottom))

      console.log('assert height')
      console.log('column_01 assert height')
      expect(Math.abs(columnNesting_Space_011.bottom - columnNesting_Space_011.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_012.bottom - columnNesting_Space_012.top - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_013.bottom - columnNesting_Space_013.top - Math.round(vp2px(150))) <= 1)
        .assertTrue();

      console.log('column_02 assert height')
      expect(Math.abs(columnNesting_Space_021.bottom - columnNesting_Space_021.top - Math.round(vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_022.bottom - columnNesting_Space_022.top - Math.round(vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_023.bottom - columnNesting_Space_023.top - Math.round(vp2px(150))) <= 1)
        .assertTrue();

      expect(Math.abs(columnNesting_Space_01.bottom - columnNesting_Space_01.top - Math.round(vp2px(400))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_02.bottom - columnNesting_Space_02.top - Math.round(vp2px(400))) <= 1)
        .assertTrue();

      console.log('assert weight')
      expect(Math.abs(columnNesting_Space_011.right - columnNesting_Space_011.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_012.right - columnNesting_Space_012.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_013.right - columnNesting_Space_013.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.abs(columnNesting_Space_021.right - columnNesting_Space_021.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_022.right - columnNesting_Space_022.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_023.right - columnNesting_Space_023.left - Math.round(vp2px(300))) <= 1)
        .assertTrue();

      expect(Math.abs(columnNesting_Space_01.right - columnNesting_Space_01.left - Math.round(vp2px(350))) <= 1)
        .assertTrue();
      expect(Math.abs(columnNesting_Space_02.right - columnNesting_Space_02.left - Math.round(vp2px(350))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_columnNesting_Space_TEST_0100] END');
    });
  })
}