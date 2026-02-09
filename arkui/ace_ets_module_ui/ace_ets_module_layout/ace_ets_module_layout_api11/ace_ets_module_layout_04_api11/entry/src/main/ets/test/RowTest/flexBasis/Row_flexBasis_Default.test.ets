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

export default function Row_flexBasis_Default() {
  describe('Row_flexBasis_Default', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_flexBasis_Default beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/flexBasis/Row_flexBasis_Default",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_flexBasis_Default state pages:" + JSON.stringify(pages));
        if (!("Row_flexBasis_Default" == pages.name)) {
          console.info("get Row_flexBasis_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_flexBasis_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_flexBasis_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_flexBasis_Default after each called")
    });
    /**
     * @tc.name   SUB_ACE_Row_flexBasis_Default_TEST_0100
     * @tc.number SUB_ACE_Row_flexBasis_Default_TEST_0100
     * @tc.desc   row1 is set to flexBasis(null) , the width of row1 is  the original width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Row_flexBasis_Default_TEST_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addflexBasis', value: null
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Default_011: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_011');
      let Row_flexBasis_Default_012: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_012');
      let Row_flexBasis_Default_013: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_013');
      let Row_flexBasis_Default_01: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Default_011.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Default_012.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Default_013.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right', Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)
      console.log('Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right', Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top', Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top', Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top', Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Default_011.right - Row_flexBasis_Default_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.right - Row_flexBasis_Default_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.right - Row_flexBasis_Default_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_Row_flexBasis_Default_TEST_0200
     * @tc.number SUB_ACE_Row_flexBasis_Default_TEST_0200
     * @tc.desc   row1 is set to flexBasis(undefined) , the width of row1 is  the original width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Row_flexBasis_Default_TEST_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addflexBasis', value: undefined
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Default_011: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_011');
      let Row_flexBasis_Default_012: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_012');
      let Row_flexBasis_Default_013: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_013');
      let Row_flexBasis_Default_01: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Default_011.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Default_012.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Default_013.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right', Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)
      console.log('Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right', Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top', Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top', Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top', Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Default_011.right - Row_flexBasis_Default_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.right - Row_flexBasis_Default_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.right - Row_flexBasis_Default_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0200] END');
      done();
    });
    /**
     * @tc.name   SUB_ACE_Row_flexBasis_Default_TEST_0300
     * @tc.number SUB_ACE_Row_flexBasis_Default_TEST_0300
     * @tc.desc   row1 is set to flexBasis(-5) , the width of row1 is  the original width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Row_flexBasis_Default_TEST_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addflexBasis', value: -5
      });

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Default_011: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_011');
      let Row_flexBasis_Default_012: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_012');
      let Row_flexBasis_Default_013: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_013');
      let Row_flexBasis_Default_01: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Default_011.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Default_012.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Default_013.top - Row_flexBasis_Default_01.top) - Math.round(Row_flexBasis_Default_01.bottom - Row_flexBasis_Default_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right', Row_flexBasis_Default_012.left - Row_flexBasis_Default_011.right)
      console.log('Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right', Row_flexBasis_Default_013.left - Row_flexBasis_Default_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top', Row_flexBasis_Default_011.bottom - Row_flexBasis_Default_011.top)
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top', Row_flexBasis_Default_012.bottom - Row_flexBasis_Default_012.top)
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top', Row_flexBasis_Default_013.bottom - Row_flexBasis_Default_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Default_011.right - Row_flexBasis_Default_011.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_012.right - Row_flexBasis_Default_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_013.right - Row_flexBasis_Default_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexBasis_Default_TEST_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_flexBasis_Type_TEST_0400
     * @tc.number SUB_ACE_flexBasis_Type_TEST_0400
     * @tc.desc   row1、row2 and row3 do not set  flexBasis, the width of column1 is  the original width
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_flexBasis_Type_TEST_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] START');

      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexBasis_Default_021: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_021');
      let Row_flexBasis_Default_022: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_022');
      let Row_flexBasis_Default_023: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_023');
      let Row_flexBasis_Default_02: RectValue = CommonFunc.getComponentRect('Row_flexBasis_Default_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexBasis_Default_021.top - Row_flexBasis_Default_02.top) - Math.round(Row_flexBasis_Default_02.bottom - Row_flexBasis_Default_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Default_022.top - Row_flexBasis_Default_02.top) - Math.round(Row_flexBasis_Default_02.bottom - Row_flexBasis_Default_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexBasis_Default_023.top - Row_flexBasis_Default_02.top) - Math.round(Row_flexBasis_Default_02.bottom - Row_flexBasis_Default_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexBasis_Default_022.left - Row_flexBasis_Default_021.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_023.left - Row_flexBasis_Default_022.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexBasis_Default_021.bottom - Row_flexBasis_Default_021.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_021.bottom - Row_flexBasis_Default_021.top', Row_flexBasis_Default_021.bottom - Row_flexBasis_Default_021.top)
      expect(Math.abs((Math.round(Row_flexBasis_Default_022.bottom - Row_flexBasis_Default_022.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_022.bottom - Row_flexBasis_Default_022.top', Row_flexBasis_Default_022.bottom - Row_flexBasis_Default_022.top)
      expect(Math.abs((Math.round(Row_flexBasis_Default_023.bottom - Row_flexBasis_Default_023.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexBasis_Default_023.bottom - Row_flexBasis_Default_023.top', Row_flexBasis_Default_023.bottom - Row_flexBasis_Default_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexBasis_Default_021.right - Row_flexBasis_Default_021.left)) - (Math.round(vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_022.right - Row_flexBasis_Default_022.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexBasis_Default_023.right - Row_flexBasis_Default_023.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_flexBasis_Type_TEST_0400] END');
      done();
    });
  })
}