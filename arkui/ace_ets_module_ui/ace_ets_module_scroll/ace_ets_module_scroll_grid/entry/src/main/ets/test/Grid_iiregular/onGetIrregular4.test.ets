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
import CommonFunc from '../../MainAbility/common/Common';

export default function onGetIrregular4Jsunit() {
  describe('onGetIrregular4Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("onGetIrregular4Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid_iiregular/onGetIrregular4",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular4Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular4" == pages.name)) {
          console.info("get onGetIrregular4Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular4Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular4Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   onGetIrregular4Jsunit_0001
     * @tc.number onGetIrregular4Jsunit_0001
     * @tc.desc   Set onGetIrregularSizeByIndex[2,1], columns Template layout only supports rows1, according to the row and column layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onGetIrregular4Jsunit_0001',  Level.LEVEL0, async (done: Function) => {

      console.info('[onGetIrregular4Jsunit_0000] START');
      await CommonFunc.sleep(1000);
      let Grid = CommonFunc.getComponentRect('GridItem4');

      let GridItem0 = CommonFunc.getComponentRect('text_Grid0');
      let GridItem1 = CommonFunc.getComponentRect('text_Grid1');
      let GridItem2 = CommonFunc.getComponentRect('text_Grid2');
      let GridItem3 = CommonFunc.getComponentRect('text_Grid3');
      let GridItem4 = CommonFunc.getComponentRect('text_Grid4');

      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem0.right - GridItem0.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem1.right - GridItem1.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem2.right - GridItem2.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem3.right - GridItem3.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem4.right - GridItem4.left))) <= 1).assertTrue();

      console.info('[onGetIrregular4Jsunit_0000] END');
      done();
    });
  })
}
