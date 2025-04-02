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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc, { RectValue } from '../../../MainAbility/common/Common';

export default function GridIrregularJsunit() {
  describe('GridIrregularJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("GridIrregularJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/GridIrregular",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridIrregularJsunit state pages: " + JSON.stringify(pages));
        if (!("GridIrregular" == pages.name)) {
          console.info("get GridIrregularJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridIrregularJsunit page result: " + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push GridIrregularJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : GridIrregularJsunit_0001
    * @tc.desc  : irregularIndexes: [-1], items are all rule sizes
    * @tc.level : Level 2
    */
    it('GridIrregularJsunit_0001', 0, async (done: Function) => {
      console.info('[GridIrregularJsunit_0000] START');
      let GridItem0: RectValue = CommonFunc.getComponentRect('GridIrregular0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('GridIrregular1');
      let GridItem2: RectValue = CommonFunc.getComponentRect('GridIrregular2');
      let GridItem3: RectValue = CommonFunc.getComponentRect('GridIrregular3');
      let GridItem4: RectValue = CommonFunc.getComponentRect('GridIrregular4');
      let GridItem5: RectValue = CommonFunc.getComponentRect('GridIrregular5');


      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem1.top - GridItem1.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem2.top - GridItem2.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem3.top - GridItem3.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem4.top - GridItem4.bottom)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) - Math.round(GridItem5.top - GridItem5.bottom)) <= 1)
        .assertTrue();


      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem1.right - GridItem1.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem2.right - GridItem2.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem3.right - GridItem3.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem4.right - GridItem4.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) - Math.round(GridItem5.right - GridItem5.left)) <= 1)
        .assertTrue();

      console.info('[GridIrregularJsunit_0000] END');
      done();
    });

  })
}
