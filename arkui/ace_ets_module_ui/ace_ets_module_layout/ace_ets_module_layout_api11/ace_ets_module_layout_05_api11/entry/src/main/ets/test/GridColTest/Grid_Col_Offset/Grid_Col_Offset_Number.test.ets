/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function Grid_Col_Offset_Number() {
  describe('Grid_Col_Offset_Number', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Col_Offset_Number beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GridCol/Grid_Col_Offset/Grid_Col_Offset_Number",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Col_Offset_Number state pages:" + JSON.stringify(pages));
        if (!("Grid_Col_Offset_Number" == pages.name)) {
          console.info("get Grid_Col_Offset_Number pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Col_Offset_Number page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Col_Offset_Number page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Offset_Number after each called")
    });

    /**
     * @tc.name   SUB_ACE_Grid_Col_Offset_Number_TEST_0100
     * @tc.number SUB_ACE_Grid_Col_Offset_Number_TEST_0100
     * @tc.desc   GridCol set offset to -2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Grid_Col_Offset_Number_TEST_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addOffset', value: -2
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_Number_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_00');
      let Grid_Col_Offset_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_01');
      let Grid_Col_Offset_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_02');
      let Grid_Col_Offset_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_03');
      let Grid_Col_Offset_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_04');
      let Grid_Col_Offset_Number_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_05');
      let Grid_Col_Offset_Number_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_06');
      let Grid_Col_Offset_Number_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_07');
      let Grid_Col_Offset_Number_G1: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_G1');

      console.log('assert space')
      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_01.left - Grid_Col_Offset_Number_00.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference1 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_01.left - Grid_Col_Offset_Number_00.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_02.left - Grid_Col_Offset_Number_01.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference2 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_02.left - Grid_Col_Offset_Number_01.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_04.left - Grid_Col_Offset_Number_03.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference3 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_04.left - Grid_Col_Offset_Number_03.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_05.left - Grid_Col_Offset_Number_04.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference4 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_05.left - Grid_Col_Offset_Number_04.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_07.left - Grid_Col_Offset_Number_06.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference5 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_07.left - Grid_Col_Offset_Number_06.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_03.top - Grid_Col_Offset_Number_00.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference6 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_03.top - Grid_Col_Offset_Number_00.bottom) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_04.top - Grid_Col_Offset_Number_01.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference7 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_04.top - Grid_Col_Offset_Number_01.bottom) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_05.top - Grid_Col_Offset_Number_02.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference8 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_05.top - Grid_Col_Offset_Number_02.bottom) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_06.top - Grid_Col_Offset_Number_03.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference9 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_06.top - Grid_Col_Offset_Number_03.bottom) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_07.top - Grid_Col_Offset_Number_04.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference10 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_07.top - Grid_Col_Offset_Number_04.bottom) - vp2px(10))));

      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] END');
      done();
    });


    /**
     * @tc.name   SUB_ACE_Grid_Col_Offset_Number_TEST_0200
     * @tc.number SUB_ACE_Grid_Col_Offset_Number_TEST_0200
     * @tc.desc   GridCol set offset to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Grid_Col_Offset_Number_TEST_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addOffset', value: 0
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_Number_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_00');
      let Grid_Col_Offset_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_01');
      let Grid_Col_Offset_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_02');
      let Grid_Col_Offset_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_03');
      let Grid_Col_Offset_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_04');
      let Grid_Col_Offset_Number_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_05');
      let Grid_Col_Offset_Number_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_06');
      let Grid_Col_Offset_Number_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_07');

      console.log('assert space')

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_01.left - Grid_Col_Offset_Number_00.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference1 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_01.left - Grid_Col_Offset_Number_00.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_02.left - Grid_Col_Offset_Number_01.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference2 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_02.left - Grid_Col_Offset_Number_01.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_04.left - Grid_Col_Offset_Number_03.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference3 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_04.left - Grid_Col_Offset_Number_03.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_05.left - Grid_Col_Offset_Number_04.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference4 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_05.left - Grid_Col_Offset_Number_04.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_07.left - Grid_Col_Offset_Number_06.right) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference5 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_07.left - Grid_Col_Offset_Number_06.right) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_03.top - Grid_Col_Offset_Number_00.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference6 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_03.top - Grid_Col_Offset_Number_00.bottom) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_04.top - Grid_Col_Offset_Number_01.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference7 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_04.top - Grid_Col_Offset_Number_01.bottom) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_05.top - Grid_Col_Offset_Number_02.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference8 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_05.top - Grid_Col_Offset_Number_02.bottom) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_06.top - Grid_Col_Offset_Number_03.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference9 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_06.top - Grid_Col_Offset_Number_03.bottom) - vp2px(10))));

      expect(Math.floor(Math.abs((Grid_Col_Offset_Number_07.top - Grid_Col_Offset_Number_04.bottom) - vp2px(10))) <= 1).assertTrue();
      console.info("[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] difference10 is: " + Math.floor(Math.abs((Grid_Col_Offset_Number_07.top - Grid_Col_Offset_Number_04.bottom) - vp2px(10))));

      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ACE_Grid_Col_Offset_Number_TEST_0300
     * @tc.number SUB_ACE_Grid_Col_Offset_Number_TEST_0300
     * @tc.desc   GridCol set offset to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_Grid_Col_Offset_Number_TEST_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0300] START');
      globalThis.value.message.notify({
        name: 'addOffset', value: 1
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_Number_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_00');
      let Grid_Col_Offset_Number_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_01');
      let Grid_Col_Offset_Number_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_02');
      let Grid_Col_Offset_Number_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_03');
      let Grid_Col_Offset_Number_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_04');
      let Grid_Col_Offset_Number_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_05');
      let Grid_Col_Offset_Number_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_06');
      let Grid_Col_Offset_Number_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_07');
      let Grid_Col_Offset_Number_G1: RectValue = CommonFunc.getComponentRect('Grid_Col_Offset_Number_G1');

      console.log('assert space')

      expect(Math.abs((Grid_Col_Offset_Number_02.top - Grid_Col_Offset_Number_00.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_03.top - Grid_Col_Offset_Number_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_04.top - Grid_Col_Offset_Number_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_05.top - Grid_Col_Offset_Number_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_06.top - Grid_Col_Offset_Number_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_07.top - Grid_Col_Offset_Number_05.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0300] END');
      done();
    });

  })
}