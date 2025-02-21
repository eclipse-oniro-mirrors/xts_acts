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
import CommonFunc, { RectValue } from '../../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../MainAbility/common/MessageManager';

export default function Grid_Col_Span_GridColColumnOption() {
  describe('Grid_Col_Span_GridColColumnOption', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Col_Span_GridColColumnOption beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Col/Grid_Col_Span/Grid_Col_Span_GridColColumnOption",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Col_Span_GridColColumnOption state pages:" + JSON.stringify(pages));
        if (!("Grid_Col_Span_GridColColumnOption" == pages.name)) {
          console.info("get Grid_Col_Span_GridColColumnOption pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Col_Span_GridColColumnOption page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Col_Span_GridColColumnOption page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Span_GridColColumnOption after each called")
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0100
     * @tc.name testGridColSpan
     * @tc.desc Set the width of Column to 40vp
     */
    it('SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '40vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_00');
      let Grid_Col_Span_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_01');
      let Grid_Col_Span_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_02');
      let Grid_Col_Span_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_03');
      let Grid_Col_Span_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_04');
      let Grid_Col_Span_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_05');
      let Grid_Col_Span_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_06');
      let Grid_Col_Span_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_07');


      console.log('assert space')
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_06.top - Grid_Col_Span_GridColColumnOption_00.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_07.top - Grid_Col_Span_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0100] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0200
     * @tc.name testGridColSpan
     * @tc.desc Set the width of Column to 80vp
     */
    it('SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: "80vp"
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_00');
      let Grid_Col_Span_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_01');
      let Grid_Col_Span_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_02');
      let Grid_Col_Span_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_03');
      let Grid_Col_Span_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_04');
      let Grid_Col_Span_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_05');
      let Grid_Col_Span_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_06');
      let Grid_Col_Span_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_07');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_01.left - Grid_Col_Span_GridColColumnOption_00.right) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_02.left - Grid_Col_Span_GridColColumnOption_01.right) - vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs((Grid_Col_Span_GridColColumnOption_04.left - Grid_Col_Span_GridColColumnOption_03.right) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_05.left - Grid_Col_Span_GridColColumnOption_04.right) - vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs((Grid_Col_Span_GridColColumnOption_07.left - Grid_Col_Span_GridColColumnOption_06.right) - vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs((Grid_Col_Span_GridColColumnOption_03.top - Grid_Col_Span_GridColColumnOption_00.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_04.top - Grid_Col_Span_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_05.top - Grid_Col_Span_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_06.top - Grid_Col_Span_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_07.top - Grid_Col_Span_GridColColumnOption_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0200] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0300
     * @tc.name testGridColSpan
     * @tc.desc Set the width of Column to 120vp
     */
    it('SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0300', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '130vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_00');
      let Grid_Col_Span_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_01');
      let Grid_Col_Span_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_02');
      let Grid_Col_Span_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_03');
      let Grid_Col_Span_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_04');
      let Grid_Col_Span_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_05');
      let Grid_Col_Span_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_06');
      let Grid_Col_Span_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_07');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_01.left - Grid_Col_Span_GridColColumnOption_00.right) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_03.left - Grid_Col_Span_GridColColumnOption_02.right) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_05.left - Grid_Col_Span_GridColColumnOption_04.right) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_07.left - Grid_Col_Span_GridColColumnOption_06.right) - vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs((Grid_Col_Span_GridColColumnOption_02.top - Grid_Col_Span_GridColColumnOption_00.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_04.top - Grid_Col_Span_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_06.top - Grid_Col_Span_GridColColumnOption_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs((Grid_Col_Span_GridColColumnOption_03.top - Grid_Col_Span_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_05.top - Grid_Col_Span_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_07.top - Grid_Col_Span_GridColColumnOption_05.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0300] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0400
     * @tc.name testGridColSpan
     * @tc.desc Set the width of Column to 120vp
     */
    it('SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0400', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0400] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '180vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_00');
      let Grid_Col_Span_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_01');
      let Grid_Col_Span_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_02');
      let Grid_Col_Span_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_03');
      let Grid_Col_Span_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_04');
      let Grid_Col_Span_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_05');
      let Grid_Col_Span_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_06');
      let Grid_Col_Span_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_07');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_01.top - Grid_Col_Span_GridColColumnOption_00.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_02.top - Grid_Col_Span_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_03.top - Grid_Col_Span_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_04.top - Grid_Col_Span_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_05.top - Grid_Col_Span_GridColColumnOption_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_06.top - Grid_Col_Span_GridColColumnOption_05.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_07.top - Grid_Col_Span_GridColColumnOption_06.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0400] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0500
     * @tc.name testGridColSpan
     * @tc.desc Set the width of Column to 220vp
     */
    it('SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0500', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0500] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '230vp'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Span_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_00');
      let Grid_Col_Span_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_01');
      let Grid_Col_Span_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_02');
      let Grid_Col_Span_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_03');
      let Grid_Col_Span_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_04');
      let Grid_Col_Span_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_05');
      let Grid_Col_Span_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_06');
      let Grid_Col_Span_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_07');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_01.top - Grid_Col_Span_GridColColumnOption_00.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_02.top - Grid_Col_Span_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_03.top - Grid_Col_Span_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_04.top - Grid_Col_Span_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_05.top - Grid_Col_Span_GridColColumnOption_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_06.top - Grid_Col_Span_GridColColumnOption_05.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_07.top - Grid_Col_Span_GridColColumnOption_06.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0500] END');
      done();
    });

    /**
     * @tc.number SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0600
     * @tc.name testGridColSpan
     * @tc.desc Set the width of Column to 320vp
     */
    it('SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0600', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0600] START');
      globalThis.value.message.notify({
        name: 'addWidth', value: '330vp'
      });

      await CommonFunc.sleep(3000);


      console.log('get Initial value')
      let Grid_Col_Span_GridColColumnOption_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_00');
      let Grid_Col_Span_GridColColumnOption_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_01');
      let Grid_Col_Span_GridColColumnOption_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_02');
      let Grid_Col_Span_GridColColumnOption_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_03');
      let Grid_Col_Span_GridColColumnOption_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_04');
      let Grid_Col_Span_GridColColumnOption_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_05');
      let Grid_Col_Span_GridColColumnOption_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_06');
      let Grid_Col_Span_GridColColumnOption_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Span_GridColColumnOption_07');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_01.top - Grid_Col_Span_GridColColumnOption_00.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_02.top - Grid_Col_Span_GridColColumnOption_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_03.top - Grid_Col_Span_GridColColumnOption_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_04.top - Grid_Col_Span_GridColColumnOption_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_05.top - Grid_Col_Span_GridColColumnOption_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_06.top - Grid_Col_Span_GridColColumnOption_05.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Span_GridColColumnOption_07.top - Grid_Col_Span_GridColColumnOption_06.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Span_GridColColumnOption_TEST_0600] END');
      done();
    });
  })
}