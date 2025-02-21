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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';

import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';

export default function onGetIrregular4Jsunit() {

  describe('onGetIrregular4Jsunit', function () {


    beforeEach(async function (done) {
      console.info("onGetIrregular4Jsunit beforeEach start");
      let options = {
        uri: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular4",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular4Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular4" == pages.name)) {
          console.info("get onGetIrregular4Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular4Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular4Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : onGetIrregular4Jsunit_0001
    * @tc.desc  : Set onGetIrregularSizeByIndex[2,1], columns Template layout only supports rows1, according to the row and column layout
    * @tc.level : Level 2
    */
    it('onGetIrregular4Jsunit_0001', 0, async function (done) {

      console.info('[onGetIrregular4Jsunit_0000] START');
      await CommonFunc.sleep(1000);
      let Grid = CommonFunc.getComponentRect('GridItem4');

      let GridItem0 = CommonFunc.getComponentRect('text_Grid0');
      let GridItem1 = CommonFunc.getComponentRect('text_Grid1');
      let GridItem2 = CommonFunc.getComponentRect('text_Grid2');
      let GridItem3 = CommonFunc.getComponentRect('text_Grid3');
      let GridItem4 = CommonFunc.getComponentRect('text_Grid4');


      await CommonFunc.sleep(1000);
      expect(Math.round(Grid.right - Grid.left)).assertEqual(Math.round(GridItem0.right -GridItem0.left ));
      expect(Math.round(Grid.right - Grid.left)).assertEqual(Math.round(GridItem1.right -GridItem1.left ));
      expect(Math.round(Grid.right - Grid.left)).assertEqual(Math.round(GridItem2.right -GridItem2.left ));
      expect(Math.round(Grid.right - Grid.left)).assertEqual(Math.round(GridItem3.right -GridItem3.left ));
      expect(Math.round(Grid.right - Grid.left)).assertEqual(Math.round(GridItem4.right -GridItem4.left ));

      console.info('[onGetIrregular4Jsunit_0000] END');
      done();
    });

  })
}
