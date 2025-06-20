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
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';

export default function Grid_Col_Order_Default() {
  describe('Grid_Col_Order_Default', () => {
    beforeEach(async (done: Function) => {
      console.info("Grid_Col_Order_Default beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/GridCol/Grid_Col_Order/Grid_Col_Order_Default",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Grid_Col_Order_Default state pages:" + JSON.stringify(pages));
        if (!("Grid_Col_Order_Default" == pages.name)) {
          console.info("get Grid_Col_Order_Default pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push Grid_Col_Order_Default page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Grid_Col_Order_Default page error " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("Grid_Col_Order_Default after each called")
    });
    /**
     * @tc.number SUB_ACE_Grid_Col_Order_Default_TEST_0100
     * @tc.name testGridColOrder
     * @tc.desc GridCol does not set order
     */
    it('SUB_ACE_Grid_Col_Order_Default_TEST_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ACE_Grid_Col_Order_Default_TEST_0100] START');

      await CommonFunc.sleep(3000);

      console.log('get Initial value')
      let Grid_Col_Order_Default_00: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Default_00');
      let Grid_Col_Order_Default_01: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Default_01');
      let Grid_Col_Order_Default_02: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Default_02');
      let Grid_Col_Order_Default_03: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Default_03');
      let Grid_Col_Order_Default_04: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Default_04');
      let Grid_Col_Order_Default_05: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Default_05');
      let Grid_Col_Order_Default_06: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Default_06');
      let Grid_Col_Order_Default_07: RectValue = CommonFunc.getComponentRect('Grid_Col_Order_Default_07');

      console.log('assert space')
      expect(Math.abs((Grid_Col_Order_Default_01.top - Grid_Col_Order_Default_00.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_Default_02.top - Grid_Col_Order_Default_01.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_Default_03.top - Grid_Col_Order_Default_02.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_Default_04.top - Grid_Col_Order_Default_03.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_Default_05.top - Grid_Col_Order_Default_04.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_Default_06.top - Grid_Col_Order_Default_05.bottom) - vp2px(10)) <= 1)
        .assertTrue();
      expect(Math.abs((Grid_Col_Order_Default_07.top - Grid_Col_Order_Default_06.bottom) - vp2px(10)) <= 1)
        .assertTrue();

      console.info('[SUB_ACE_Grid_Col_Order_Default_TEST_0100] END');
      done();
    });

  })
}