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

export default function Row_flexGrow_Part() {
  describe('Row_flexGrow_Part', () => {
    beforeEach(async (done: Function) => {
      console.info("Row_flexGrow_Part beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Row/flexGrow/Row_flexGrow_Part",
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Row_flexGrow_Part state pages:" + JSON.stringify(pages));
        if (!("Row_flexGrow_Part" == pages.name)) {
          console.info("get Row_flexGrow_Part pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Row_flexGrow_Part page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Row_flexGrow_Part page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Row_flexGrow_Part after each called")
    });
    /**
     * @tc.name   SUB_ACE_Row_flexGrow_Part_TEST_0100
     * @tc.number SUB_ACE_Row_flexGrow_Part_TEST_0100
     * @tc.desc   row1 set layoutWeight(1), row2、row3 set flexGrow(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Row_flexGrow_Part_TEST_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addflexGrow2', value: 1
      });
      globalThis.value.message.notify({
        name: 'addflexGrow3', value: 1
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexGrow_Part_011: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_011');
      let Row_flexGrow_Part_012: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_012');
      let Row_flexGrow_Part_013: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_013');
      let Row_flexGrow_Part_01: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_01');

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexGrow_Part_011.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_012.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_013.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right', Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right)
      console.log('Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right', Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top', Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top', Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top', Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexGrow_Part_011.right - Row_flexGrow_Part_011.left)) - (Math.round(vp2px(250)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.right - Row_flexGrow_Part_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.right - Row_flexGrow_Part_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0100] END');
      done();
    });
    /**
     * @tc.name   SUB_ACE_Row_flexGrow_Part_TEST_0200
     * @tc.number SUB_ACE_Row_flexGrow_Part_TEST_0200
     * @tc.desc   row1 set layoutWeight(1), row2、row3 set flexGrow(2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Row_flexGrow_Part_TEST_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addflexGrow2', value: 2
      });
      globalThis.value.message.notify({
        name: 'addflexGrow3', value: 2
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexGrow_Part_011: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_011');
      let Row_flexGrow_Part_012: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_012');
      let Row_flexGrow_Part_013: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_013');
      let Row_flexGrow_Part_01: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_01');
      console.log('assert position')

      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexGrow_Part_011.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_012.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_013.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right', Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right)
      console.log('Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right', Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top', Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top', Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top', Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexGrow_Part_011.right - Row_flexGrow_Part_011.left)) - (Math.round(vp2px(250)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.right - Row_flexGrow_Part_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.right - Row_flexGrow_Part_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0200] END');
      done();
    });
    /**
     * @tc.name   SUB_ACE_Row_flexGrow_Part_TEST_0300
     * @tc.number SUB_ACE_Row_flexGrow_Part_TEST_0300
     * @tc.desc   row1 set layoutWeight(1), row、row2、row3 set flexGrow(3)、flexGrow(2)、flexGrow(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Row_flexGrow_Part_TEST_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addflexGrow2', value: 3
      });
      globalThis.value.message.notify({
        name: 'addflexGrow3', value: 3
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexGrow_Part_011: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_011');
      let Row_flexGrow_Part_012: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_012');
      let Row_flexGrow_Part_013: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_013');
      let Row_flexGrow_Part_01: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_01');
      console.log('assert position')
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexGrow_Part_011.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_012.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_013.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right', Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right)
      console.log('Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right', Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top', Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top', Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top', Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexGrow_Part_011.right - Row_flexGrow_Part_011.left)) - (Math.round(vp2px(250)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.right - Row_flexGrow_Part_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.right - Row_flexGrow_Part_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_Row_flexGrow_Part_TEST_0400
     * @tc.number SUB_ACE_Row_flexGrow_Part_TEST_0400
     * @tc.desc   row1 set layoutWeight(1), row2、row3 set flexGrow(3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Row_flexGrow_Part_TEST_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0400] START');
      globalThis.value.message.notify({
        name: 'addflexGrow1', value: 3
      });
      globalThis.value.message.notify({
        name: 'addflexGrow2', value: 2
      });
      globalThis.value.message.notify({
        name: 'addflexGrow3', value: 1
      });
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexGrow_Part_011: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_011');
      let Row_flexGrow_Part_012: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_012');
      let Row_flexGrow_Part_013: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_013');
      let Row_flexGrow_Part_01: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_01');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexGrow_Part_011.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_011.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_012.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_012.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_013.top - Row_flexGrow_Part_01.top) - Math.round(Row_flexGrow_Part_01.bottom - Row_flexGrow_Part_013.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right', Row_flexGrow_Part_012.left - Row_flexGrow_Part_011.right)
      console.log('Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right', Row_flexGrow_Part_013.left - Row_flexGrow_Part_012.right)

      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top', Row_flexGrow_Part_011.bottom - Row_flexGrow_Part_011.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top', Row_flexGrow_Part_012.bottom - Row_flexGrow_Part_012.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top', Row_flexGrow_Part_013.bottom - Row_flexGrow_Part_013.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexGrow_Part_011.right - Row_flexGrow_Part_011.left)) - (Math.round(vp2px(250)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_012.right - Row_flexGrow_Part_012.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_013.right - Row_flexGrow_Part_013.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0400] END');
      done();
    });
    /**
     * @tc.name   SUB_ACE_Row_flexGrow_Part_TEST_0500
     * @tc.number SUB_ACE_Row_flexGrow_Part_TEST_0500
     * @tc.desc   colum1 set layoutWeight('aaa'),column1, column2, and column3 are displayed according to their own height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Row_flexGrow_Part_TEST_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0500] START');
      await CommonFunc.sleep(3000);
      console.log('get Initial value')
      let Row_flexGrow_Part_021: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_021');
      let Row_flexGrow_Part_022: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_022');
      let Row_flexGrow_Part_023: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_023');
      let Row_flexGrow_Part_02: RectValue = CommonFunc.getComponentRect('Row_flexGrow_Part_02');
      console.log('assert position')
      expect(Math.abs(Math.round(Row_flexGrow_Part_021.top - Row_flexGrow_Part_02.top) - Math.round(Row_flexGrow_Part_02.bottom - Row_flexGrow_Part_021.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_022.top - Row_flexGrow_Part_02.top) - Math.round(Row_flexGrow_Part_02.bottom - Row_flexGrow_Part_022.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Row_flexGrow_Part_023.top - Row_flexGrow_Part_02.top) - Math.round(Row_flexGrow_Part_02.bottom - Row_flexGrow_Part_023.bottom)) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.abs((Math.round(Row_flexGrow_Part_022.left - Row_flexGrow_Part_021.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_023.left - Row_flexGrow_Part_022.right)) - (Math.round(vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert height')
      expect(Math.abs((Math.round(Row_flexGrow_Part_021.bottom - Row_flexGrow_Part_021.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_021.bottom - Row_flexGrow_Part_021.top', Row_flexGrow_Part_021.bottom - Row_flexGrow_Part_021.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_022.bottom - Row_flexGrow_Part_022.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_022.bottom - Row_flexGrow_Part_022.top', Row_flexGrow_Part_022.bottom - Row_flexGrow_Part_022.top)
      expect(Math.abs((Math.round(Row_flexGrow_Part_023.bottom - Row_flexGrow_Part_023.top)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.log('Row_flexGrow_Part_023.bottom - Row_flexGrow_Part_023.top', Row_flexGrow_Part_023.bottom - Row_flexGrow_Part_023.top)
      console.log('assert weight')
      expect(Math.abs((Math.round(Row_flexGrow_Part_021.right - Row_flexGrow_Part_021.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_022.right - Row_flexGrow_Part_022.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Row_flexGrow_Part_023.right - Row_flexGrow_Part_023.left)) - (Math.round(vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[SUB_ACE_Row_flexGrow_Part_TEST_0500] END');
      done();
    });
  })
}