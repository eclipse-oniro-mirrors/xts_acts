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

export default function GridIrregular1Jsunit() {
  describe('GridIrregular1Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("GridIrregular1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/GridIrregular1",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridIrregular1Jsunit state pages: " + JSON.stringify(pages));
        if (!("GridIrregular1" == pages.name)) {
          console.info("get GridIrregular1Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridIrregular1Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridIrregular1Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /**
     * @tc.name   GridIrregular1Jsunit_0001
     * @tc.number SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
     * @tc.desc   irregularIndexes: [1], items with index 1 are custom dimensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GridIrregular1Jsunit_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('[GridIrregular1Jsunit_0000] START');
      let GridItem1: RectValue = CommonFunc.getComponentRect('GridIrr1');
      let Grid: RectValue = CommonFunc.getComponentRect('gridIrregular1')
      await CommonFunc.sleep(1000);
      expect(Math.round(px2vp(GridItem1.right - GridItem1.left))).assertEqual(400);
      console.info('[GridIrregular1Jsunit_0000] END');
      done();
    });
  })
}
