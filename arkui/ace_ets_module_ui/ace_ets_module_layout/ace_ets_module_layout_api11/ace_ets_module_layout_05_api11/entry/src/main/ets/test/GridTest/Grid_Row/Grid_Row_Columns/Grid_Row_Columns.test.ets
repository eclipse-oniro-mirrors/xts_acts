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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function Grid_Row_Columns() {
  describe('Grid_Row_Columns', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Columns beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Columns/Grid_Row_Columns",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Columns state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Columns" == pages.name)) {
          console.info("get Grid_Row_Columns pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Columns page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Columns page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Columns after each called")
    });

    /**
     * @tc.number SUB_ACE_Grid_Row_Columns_TEST_0100
     * @tc.name testGridColOffset
     * @tc.desc GridCol set offset to -2
     */
    it('SUB_ACE_Grid_Row_Columns_TEST_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '40vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.top - Grid_Row_Columns_00.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.top - Grid_Row_Columns_01.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.top - Grid_Row_Columns_02.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.top - Grid_Row_Columns_03.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_04.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_05.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_06.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();


      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0100] END');
      done();
    });


    /**
     * @tc.number SUB_ACE_Grid_Row_Columns_TEST_0200
     * @tc.name testGridColOffset
     * @tc.desc GridCol set offset to 0
     */
    it('SUB_ACE_Grid_Row_Columns_TEST_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '80vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.left - Grid_Row_Columns_02.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.left - Grid_Row_Columns_04.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.left - Grid_Row_Columns_06.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_02.top - Grid_Row_Columns_00.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.top - Grid_Row_Columns_01.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_04.top - Grid_Row_Columns_02.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_03.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_04.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_05.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();


      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Row_Columns_TEST_0300
     * @tc.name testGridColOffset
     * @tc.desc GridCol set offset to 0
     */
    it('SUB_ACE_Grid_Row_Columns_TEST_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '120vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.left - Grid_Row_Columns_01.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.left - Grid_Row_Columns_03.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.left - Grid_Row_Columns_04.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_03.top - Grid_Row_Columns_00.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.top - Grid_Row_Columns_01.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_02.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Row_Columns_TEST_0400
     * @tc.name testGridColOffset
     * @tc.desc GridCol set offset to 0
     */
    it('SUB_ACE_Grid_Row_Columns_TEST_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0400] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '170vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.left - Grid_Row_Columns_01.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.left - Grid_Row_Columns_02.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.left - Grid_Row_Columns_04.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.left - Grid_Row_Columns_05.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.left - Grid_Row_Columns_06.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_04.top - Grid_Row_Columns_00.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_01.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_02.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_03.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Row_Columns_TEST_0500
     * @tc.name testGridColOffset
     * @tc.desc GridCol set offset to 0
     */
    it('SUB_ACE_Grid_Row_Columns_TEST_0500',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0500] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '220vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.left - Grid_Row_Columns_01.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.left - Grid_Row_Columns_02.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.left - Grid_Row_Columns_03.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.left - Grid_Row_Columns_05.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.left - Grid_Row_Columns_06.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_05.top - Grid_Row_Columns_00.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_01.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_02.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Row_Columns_TEST_0600
     * @tc.name testGridColOffset
     * @tc.desc GridCol set offset to 0
     */
    it('SUB_ACE_Grid_Row_Columns_TEST_0600',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0600] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '320vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Row_Columns_00: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_00');
      let Grid_Row_Columns_01: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_01');
      let Grid_Row_Columns_02: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_02');
      let Grid_Row_Columns_03: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_03');
      let Grid_Row_Columns_04: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_04');
      let Grid_Row_Columns_05: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_05');
      let Grid_Row_Columns_06: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_06');
      let Grid_Row_Columns_07: RectValue = CommonFunc.getComponentRect('Grid_Row_Columns_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Grid_Row_Columns_01.left - Grid_Row_Columns_00.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_02.left - Grid_Row_Columns_01.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_03.left - Grid_Row_Columns_02.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_04.left - Grid_Row_Columns_03.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_05.left - Grid_Row_Columns_04.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.left - Grid_Row_Columns_06.right) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Grid_Row_Columns_06.top - Grid_Row_Columns_00.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid_Row_Columns_07.top - Grid_Row_Columns_01.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_Columns_TEST_0600] END');
      done();
    });

  })
}