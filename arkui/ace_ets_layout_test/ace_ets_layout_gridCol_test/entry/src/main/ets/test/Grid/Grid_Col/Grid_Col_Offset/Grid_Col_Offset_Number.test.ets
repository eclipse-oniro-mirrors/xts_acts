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
import CommonFunc from '../../../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../../../MainAbility/common/MessageManager';

export default function Grid_Col_Offset_Number() {
  describe('Grid_Col_Offset_Number', function () {
    beforeEach(async function (done) {
      console.info("Grid_Col_Offset_Number beforeEach start");
      let options = {
        url: "MainAbility/pages/Grid/Grid_Col/Grid_Col_Offset/Grid_Col_Offset_Number",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Col_Offset_Number state pages:" + JSON.stringify(pages));
        if (!("Grid_Col_Offset_Number" == pages.name)) {
          console.info("get Grid_Col_Offset_Number pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Col_Offset_Number page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Col_Offset_Number page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Offset_Number after each called")
    });

    /**
     * @tc.number    SUB_ACE_Grid_Col_Offset_Number_TEST_0100
     * @tc.name      testGridColOffset
     * @tc.desc      GridCol set offset to -2
     */
    it('SUB_ACE_Grid_Col_Offset_Number_TEST_0100', 0, async function (done) {
      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] START');
      globalThis.value.message.notify({name:'addOffset', value:-2});

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_Number_00 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_00');
      let Grid_Col_Offset_Number_01 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_01');
      let Grid_Col_Offset_Number_02 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_02');
      let Grid_Col_Offset_Number_03 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_03');
      let Grid_Col_Offset_Number_04 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_04');
      let Grid_Col_Offset_Number_05 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_05');
      let Grid_Col_Offset_Number_06 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_06');
      let Grid_Col_Offset_Number_07 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_07');
      let Grid_Col_Offset_Number_G1 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_G1');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Offset_Number_01.left - Grid_Col_Offset_Number_00.right) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_02.left - Grid_Col_Offset_Number_01.right) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_04.left - Grid_Col_Offset_Number_03.right) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_05.left - Grid_Col_Offset_Number_04.right) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_07.left - Grid_Col_Offset_Number_06.right) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_03.top - Grid_Col_Offset_Number_00.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_04.top - Grid_Col_Offset_Number_01.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_05.top - Grid_Col_Offset_Number_02.bottom) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_06.top - Grid_Col_Offset_Number_03.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_07.top - Grid_Col_Offset_Number_04.bottom) - vp2px(10)) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0100] END');
      done();
    });


    /**
     * @tc.number    SUB_ACE_Grid_Col_Offset_Number_TEST_0200
     * @tc.name      testGridColOffset
     * @tc.desc      GridCol set offset to 0
     */
    it('SUB_ACE_Grid_Col_Offset_Number_TEST_0200', 0, async function (done) {
      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0200] START');
      globalThis.value.message.notify({name:'addOffset', value:0});

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_Number_00 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_00');
      let Grid_Col_Offset_Number_01 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_01');
      let Grid_Col_Offset_Number_02 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_02');
      let Grid_Col_Offset_Number_03 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_03');
      let Grid_Col_Offset_Number_04 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_04');
      let Grid_Col_Offset_Number_05 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_05');
      let Grid_Col_Offset_Number_06 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_06');
      let Grid_Col_Offset_Number_07 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_07');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Offset_Number_01.left - Grid_Col_Offset_Number_00.right) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_02.left - Grid_Col_Offset_Number_01.right) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_04.left - Grid_Col_Offset_Number_03.right) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_05.left - Grid_Col_Offset_Number_04.right) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_07.left - Grid_Col_Offset_Number_06.right) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_03.top - Grid_Col_Offset_Number_00.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_04.top - Grid_Col_Offset_Number_01.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_05.top - Grid_Col_Offset_Number_02.bottom) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_06.top - Grid_Col_Offset_Number_03.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_07.top - Grid_Col_Offset_Number_04.bottom) - vp2px(10)) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0200] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_Grid_Col_Offset_Number_TEST_0300
     * @tc.name      testGridColOffset
     * @tc.desc      GridCol set offset to 1
     */
    it('SUB_ACE_Grid_Col_Offset_Number_TEST_0300', 0, async function (done) {
      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0300] START');
      globalThis.value.message.notify({name:'addOffset', value:1});

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Offset_Number_00 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_00');
      let Grid_Col_Offset_Number_01 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_01');
      let Grid_Col_Offset_Number_02 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_02');
      let Grid_Col_Offset_Number_03 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_03');
      let Grid_Col_Offset_Number_04 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_04');
      let Grid_Col_Offset_Number_05 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_05');
      let Grid_Col_Offset_Number_06 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_06');
      let Grid_Col_Offset_Number_07 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_07');
      let Grid_Col_Offset_Number_G1 = CommonFunc.getComponentRect('Grid_Col_Offset_Number_G1');

      console.log('assert space')

      expect(Math.abs((Grid_Col_Offset_Number_02.top - Grid_Col_Offset_Number_00.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_03.top - Grid_Col_Offset_Number_01.bottom) - vp2px(10)) <= 1).assertTrue();
     
      expect(Math.abs((Grid_Col_Offset_Number_04.top - Grid_Col_Offset_Number_02.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_05.top - Grid_Col_Offset_Number_03.bottom) - vp2px(10)) <= 1).assertTrue();

      expect(Math.abs((Grid_Col_Offset_Number_06.top - Grid_Col_Offset_Number_04.bottom) - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs((Grid_Col_Offset_Number_07.top - Grid_Col_Offset_Number_05.bottom) - vp2px(10)) <= 1).assertTrue();

      console.info('[SUB_ACE_Grid_Col_Offset_Number_TEST_0300] END');
      done();
    });

  })
}