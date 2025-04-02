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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function Grid_Col_Offset_GridColColumnOption() {
  describe('Grid_Col_Offset_GridColColumnOption', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Col_Offset_GridColColumnOption beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GridCol/Grid_Col_Offset/Grid_Col_Offset_GridColColumnOption",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Col_Offset_GridColColumnOption state pages:" + JSON.stringify(pages));
        if (!("Grid_Col_Offset_GridColColumnOption" == pages.name)) {
          console.info("get Grid_Col_Offset_GridColColumnOption pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Col_Offset_GridColColumnOption page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Col_Offset_GridColColumnOption page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Offset_GridColColumnOption after each called")
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0100
     * @tc.name testGridColOffset
     * @tc.desc Set the width of the cloumn to 40vp
     */
    it('SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '40vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_00');
      let Grid_Col_Offset_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_01');
      let Grid_Col_Offset_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_02');
      let Grid_Col_Offset_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_03');
      let Grid_Col_Offset_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_04');
      let Grid_Col_Offset_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_05');
      let Grid_Col_Offset_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_06');
      let Grid_Col_Offset_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_07');
      let Grid_Col_Offset_GridColColumnOption_G1: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_G1');

      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_01.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.top - Grid_Col_Offset_GridColColumnOption_02.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_04.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.top - Grid_Col_Offset_GridColColumnOption_05.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0200
     * @tc.name testGridColOffset
     * @tc.desc Set the width of the cloumn to 90vp
     */
    it('SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '80vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_00');
      let Grid_Col_Offset_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_01');
      let Grid_Col_Offset_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_02');
      let Grid_Col_Offset_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_03');
      let Grid_Col_Offset_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_04');
      let Grid_Col_Offset_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_05');
      let Grid_Col_Offset_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_06');
      let Grid_Col_Offset_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_07');
      let Grid_Col_Offset_GridColColumnOption_G1: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_G1');

      console.log('assert position')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_00.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_00.right - Grid_Col_Offset_GridColColumnOption_00.left + vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.left - Grid_Col_Offset_GridColColumnOption_G1.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.left - Grid_Col_Offset_GridColColumnOption_01.right) - (Grid_Col_Offset_GridColColumnOption_02.right - Grid_Col_Offset_GridColColumnOption_02.left + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_03.right - Grid_Col_Offset_GridColColumnOption_03.left + vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.left - Grid_Col_Offset_GridColColumnOption_G1.left))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.left - Grid_Col_Offset_GridColColumnOption_04.right) - (Grid_Col_Offset_GridColColumnOption_05.right - Grid_Col_Offset_GridColColumnOption_05.left + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_06.right - Grid_Col_Offset_GridColColumnOption_06.left + vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.left - Grid_Col_Offset_GridColColumnOption_G1.left))) <= 1)
        .assertTrue();

      console.log('assert space')

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_01.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_02.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_04.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_05.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.top - Grid_Col_Offset_GridColColumnOption_06.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0200] END');
      done();
    });


    /**
     * @tc.number SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0300
     * @tc.name testGridColOffset
     * @tc.desc Set the width of the cloumn to 120vp
     */
    it('SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '130vp'
      });
      globalThis.value.message.notify({
        name: 'addSpan', value: 1
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_00');
      let Grid_Col_Offset_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_01');
      let Grid_Col_Offset_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_02');
      let Grid_Col_Offset_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_03');
      let Grid_Col_Offset_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_04');
      let Grid_Col_Offset_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_05');
      let Grid_Col_Offset_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_06');
      let Grid_Col_Offset_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_07');
      let Grid_Col_Offset_GridColColumnOption_G1: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_G1');

      console.log('assert position')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_00.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_00.right - Grid_Col_Offset_GridColColumnOption_00.left) * 3) + vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_01.right - Grid_Col_Offset_GridColColumnOption_01.left + vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.left - Grid_Col_Offset_GridColColumnOption_01.right) - (Math.round((Grid_Col_Offset_GridColColumnOption_02.right - Grid_Col_Offset_GridColColumnOption_02.left) * 3) + vp2px(40)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_03.right - Grid_Col_Offset_GridColColumnOption_03.left) * 3) + vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_04.right - Grid_Col_Offset_GridColColumnOption_04.left + vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.left - Grid_Col_Offset_GridColColumnOption_04.right) - (Math.round((Grid_Col_Offset_GridColColumnOption_05.right - Grid_Col_Offset_GridColColumnOption_05.left) * 3) + vp2px(40)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_06.right - Grid_Col_Offset_GridColColumnOption_06.left) * 3) + vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_07.right - Grid_Col_Offset_GridColColumnOption_07.left + vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_01.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_02.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_04.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_05.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.top - Grid_Col_Offset_GridColColumnOption_06.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0400
     * @tc.name testGridColOffset
     * @tc.desc Set the width of the cloumn to 180vp
     */
    it('SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0400', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0400] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '180vp'
      });
      globalThis.value.message.notify({
        name: 'addSpan', value: 2
      });


      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_00');
      let Grid_Col_Offset_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_01');
      let Grid_Col_Offset_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_02');
      let Grid_Col_Offset_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_03');
      let Grid_Col_Offset_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_04');
      let Grid_Col_Offset_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_05');
      let Grid_Col_Offset_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_06');
      let Grid_Col_Offset_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_07');
      let Grid_Col_Offset_GridColColumnOption_G1: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_G1');

      console.log('assert position')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_00.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_00.right - Grid_Col_Offset_GridColColumnOption_00.left) * 2) + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_01.right - Grid_Col_Offset_GridColColumnOption_01.left) * 2) + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_02.right - Grid_Col_Offset_GridColColumnOption_02.left) * 2) + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_03.right - Grid_Col_Offset_GridColColumnOption_03.left) * 2) + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_04.right - Grid_Col_Offset_GridColColumnOption_04.left) * 2) + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_05.right - Grid_Col_Offset_GridColColumnOption_05.left) * 2) + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_06.right - Grid_Col_Offset_GridColColumnOption_06.left) * 2) + vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_07.right - Grid_Col_Offset_GridColColumnOption_07.left) * 2) + vp2px(20)))) <= 1)
        .assertTrue();

      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.top - Grid_Col_Offset_GridColColumnOption_01.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_02.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.top - Grid_Col_Offset_GridColColumnOption_04.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_05.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.top - Grid_Col_Offset_GridColColumnOption_06.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0500
     * @tc.name testGridColOffset
     * @tc.desc Set the width of the cloumn to 220vp
     */
    it('SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0500', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0500] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '230vp'
      });
      globalThis.value.message.notify({
        name: 'addSpan', value: 1
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_00');
      let Grid_Col_Offset_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_01');
      let Grid_Col_Offset_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_02');
      let Grid_Col_Offset_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_03');
      let Grid_Col_Offset_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_04');
      let Grid_Col_Offset_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_05');
      let Grid_Col_Offset_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_06');
      let Grid_Col_Offset_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_07');
      let Grid_Col_Offset_GridColColumnOption_G1: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_G1');

      console.log('assert position')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_00.left - Grid_Col_Offset_GridColColumnOption_G1.left) - Math.round((Grid_Col_Offset_GridColColumnOption_00.right - Grid_Col_Offset_GridColColumnOption_00.left) * 5 + vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.left - Grid_Col_Offset_GridColColumnOption_G1.left) - Math.round((Grid_Col_Offset_GridColColumnOption_01.right - Grid_Col_Offset_GridColColumnOption_01.left) * 5 + vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.left - Grid_Col_Offset_GridColColumnOption_G1.left) - Math.round((Grid_Col_Offset_GridColColumnOption_02.right - Grid_Col_Offset_GridColColumnOption_02.left) * 5 + vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.left - Grid_Col_Offset_GridColColumnOption_G1.left) - Math.round((Grid_Col_Offset_GridColColumnOption_03.right - Grid_Col_Offset_GridColColumnOption_03.left) * 5 + vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.left - Grid_Col_Offset_GridColColumnOption_G1.left) - Math.round((Grid_Col_Offset_GridColColumnOption_04.right - Grid_Col_Offset_GridColColumnOption_04.left) * 5 + vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.left - Grid_Col_Offset_GridColColumnOption_G1.left) - Math.round((Grid_Col_Offset_GridColColumnOption_05.right - Grid_Col_Offset_GridColColumnOption_05.left) * 5 + vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.left - Grid_Col_Offset_GridColColumnOption_G1.left) - Math.round((Grid_Col_Offset_GridColColumnOption_06.right - Grid_Col_Offset_GridColColumnOption_06.left) * 5 + vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.left - Grid_Col_Offset_GridColColumnOption_G1.left) - Math.round((Grid_Col_Offset_GridColColumnOption_07.right - Grid_Col_Offset_GridColColumnOption_07.left) * 5 + vp2px(50)))) <= 1)
        .assertTrue();


      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.top - Grid_Col_Offset_GridColColumnOption_01.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_02.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.top - Grid_Col_Offset_GridColColumnOption_04.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_05.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.top - Grid_Col_Offset_GridColColumnOption_06.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0600
     * @tc.name testGridColOffset
     * @tc.desc Set the width of the cloumn to 320vp
     */
    it('SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0600', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0600] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '330vp'
      });
      globalThis.value.message.notify({
        name: 'addSpan', value: 1
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_00');
      let Grid_Col_Offset_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_01');
      let Grid_Col_Offset_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_02');
      let Grid_Col_Offset_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_03');
      let Grid_Col_Offset_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_04');
      let Grid_Col_Offset_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_05');
      let Grid_Col_Offset_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_06');
      let Grid_Col_Offset_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_07');
      let Grid_Col_Offset_GridColColumnOption_G1: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_GridColColumnOption_G1');

      console.log('assert position')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_00.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_00.right - Grid_Col_Offset_GridColColumnOption_00.left) * 3) + vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_01.right - Grid_Col_Offset_GridColColumnOption_01.left + vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.left - Grid_Col_Offset_GridColColumnOption_01.right) - (Math.round((Grid_Col_Offset_GridColColumnOption_02.right - Grid_Col_Offset_GridColColumnOption_02.left) * 3) + vp2px(40)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_03.right - Grid_Col_Offset_GridColColumnOption_03.left) * 3) + vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_04.right - Grid_Col_Offset_GridColColumnOption_04.left + vp2px(10)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.left - Grid_Col_Offset_GridColColumnOption_04.right) - (Math.round((Grid_Col_Offset_GridColColumnOption_05.right - Grid_Col_Offset_GridColColumnOption_05.left) * 3) + vp2px(40)))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Math.round((Grid_Col_Offset_GridColColumnOption_06.right - Grid_Col_Offset_GridColColumnOption_06.left) * 3) + vp2px(30)))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.left - Grid_Col_Offset_GridColColumnOption_G1.left) - (Grid_Col_Offset_GridColColumnOption_07.right - Grid_Col_Offset_GridColColumnOption_07.left + vp2px(10)))) <= 1)
        .assertTrue();


      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_01.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_02.top - Grid_Col_Offset_GridColColumnOption_00.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_01.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_03.top - Grid_Col_Offset_GridColColumnOption_02.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_04.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_05.top - Grid_Col_Offset_GridColColumnOption_03.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_04.bottom) - vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_06.top - Grid_Col_Offset_GridColColumnOption_05.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      expect(Math.floor(Math.abs((Grid_Col_Offset_GridColColumnOption_07.top - Grid_Col_Offset_GridColColumnOption_06.bottom) - vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_GridColColumnOption_TEST_0600] END');
      done();
    });

  })
}