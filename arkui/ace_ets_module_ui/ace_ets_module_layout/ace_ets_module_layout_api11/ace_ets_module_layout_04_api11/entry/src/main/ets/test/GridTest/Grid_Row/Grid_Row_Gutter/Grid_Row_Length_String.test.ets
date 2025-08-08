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

export default function Grid_Row_Length_String() {
  describe('Grid_Row_Length_String', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Row_Length_String beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Length_String",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Row_Length_String state pages:" + JSON.stringify(pages));
        if (!("Grid_Row_Length_String" == pages.name)) {
          console.info("get Grid_Row_Length_String pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Row_Length_String page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Row_Length_String page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Row_Length_String after each called")
    });

    /**
     * @tc.number SUB_ACE_Grid_Row_GutterStr_TEST_0100
     * @tc.name testGridColOffset
     * @tc.desc GridCol set offset to -2
     */
    it('SUB_ACE_Grid_Row_GutterStr_TEST_0100', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Row_GutterStr_TEST_0100] START');
      globalThis.value.message.notify({
        name: 'addLength', value: '30%'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Length_String_00: RectValue = CommonFunc.getComponentRect('Length_String_00');
      let Length_String_01: RectValue = CommonFunc.getComponentRect('Length_String_01');
      let Length_String_02: RectValue = CommonFunc.getComponentRect('Length_String_02');
      let Length_String_03: RectValue = CommonFunc.getComponentRect('Length_String_03');
      let Length_String_04: RectValue = CommonFunc.getComponentRect('Length_String_04');
      let Length_String_05: RectValue = CommonFunc.getComponentRect('Length_String_05');
      let Length_String_06: RectValue = CommonFunc.getComponentRect('Length_String_06');
      let Length_String_07: RectValue = CommonFunc.getComponentRect('Length_String_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Length_String_01.left - Length_String_00.right) - Math.round(vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_02.left - Length_String_01.right) - Math.round(vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_03.left - Length_String_02.right) - Math.round(vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_04.left - Length_String_03.right) - Math.round(vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_05.left - Length_String_04.right) - Math.round(vp2px(0))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_07.left - Length_String_06.right) - Math.round(vp2px(0))) <= 1)
        .assertTrue();

      expect(Math.abs(Length_String_06.top - Length_String_00.bottom - vp2px(10)) <= 1).assertTrue();
      expect(Math.abs(Length_String_07.top - Length_String_01.bottom - vp2px(10)) <= 1).assertTrue();


      console.info('[SUB_ACE_Grid_Row_GutterStr_TEST_0100] END');
      done();
    });


    /**
     * @tc.number SUB_ACE_Grid_Row_GutterStr_TEST_0200
     * @tc.name testGridColOffset
     * @tc.desc GridCol set offset to 0
     */
    it('SUB_ACE_Grid_Row_GutterStr_TEST_0200', 0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Row_GutterStr_TEST_0200] START');
      globalThis.value.message.notify({
        name: 'addLength', value: '50px'
      });

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Length_String_00: RectValue = CommonFunc.getComponentRect('Length_String_00');
      let Length_String_01: RectValue = CommonFunc.getComponentRect('Length_String_01');
      let Length_String_02: RectValue = CommonFunc.getComponentRect('Length_String_02');
      let Length_String_03: RectValue = CommonFunc.getComponentRect('Length_String_03');
      let Length_String_04: RectValue = CommonFunc.getComponentRect('Length_String_04');
      let Length_String_05: RectValue = CommonFunc.getComponentRect('Length_String_05');
      let Length_String_06: RectValue = CommonFunc.getComponentRect('Length_String_06');
      let Length_String_07: RectValue = CommonFunc.getComponentRect('Length_String_07');

      console.log('assert space')
      expect(Math.abs(Math.round(Length_String_01.left - Length_String_00.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_02.left - Length_String_01.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_03.left - Length_String_02.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_04.left - Length_String_03.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_05.left - Length_String_04.right) - Math.round(50)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Length_String_07.left - Length_String_06.right) - Math.round(50)) <= 1).assertTrue();

      expect(Math.abs(Math.round(Length_String_06.top - Length_String_00.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Length_String_07.top - Length_String_01.bottom) - Math.round(vp2px(10))) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Row_GutterStr_TEST_0200] END');
      done();
    });


  })
}