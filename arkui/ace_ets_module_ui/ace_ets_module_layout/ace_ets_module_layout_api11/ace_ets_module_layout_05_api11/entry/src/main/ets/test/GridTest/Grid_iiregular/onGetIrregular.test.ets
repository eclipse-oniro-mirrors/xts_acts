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

export default function onGetIrregularJsunit() {

  describe('onGetIrregularJsunit', () => {


    beforeEach(async (done: Function) => {
      console.info("onGetIrregularJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregularJsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular" == pages.name)) {
          console.info("get onGetIrregularJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregularJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregularJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : onGetIrregular1Jsunit_0001
    * @tc.desc  : Set onGetIrregularSizeByIndex[-1,1], columns Template layout only supports rows to 1, one row and one column
    * @tc.level : Level 2
    */
    it('onGetIrregularJsunit_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('[onGetIrregularJsunit_0000] START');
      let Grid: RectValue = CommonFunc.getComponentRect('GridGetIrregular');
      await CommonFunc.sleep(1000);

      let GridItem0: RectValue = CommonFunc.getComponentRect('onGetRegular0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('onGetRegular1');
      let GridItem2: RectValue = CommonFunc.getComponentRect('onGetRegular2');

      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem0.right - GridItem0.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem1.right - GridItem1.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem2.right - GridItem2.left)) <= 1)
        .assertTrue();


      console.info('[onGetIrregularJsunit_0000] END');
      done();
    });

  })
}
