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
export default function scrollByJsunit() {
  describe('GridIrregular3Jsunit', function () {
    beforeEach(async function (done) {
      console.info("GridIrregular3Jsunit beforeEach start");
      let options = {
        uri: "MainAbility/pages/Grid/Grid_iiregular/GridIrregular3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GridIrregular3Jsunit state pages: " + JSON.stringify(pages));
        if (!("GridIrregular3" == pages.name)) {
          console.info("get GridIrregular3Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push GridIrregular3Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridIrregular3Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : GridIrregular31Jsunit_0001
    * @tc.desc  : irregularIndexes: [undefined], items are all rule sizes
    * @tc.level : Level 2
    */
    it('GridIrregular3Jsunit_0001', 0, async function (done) {
      console.info('[GridIrregular3Jsunit_0000] START');
      await CommonFunc.sleep(1000);

      let GridItem0 = CommonFunc.getComponentRect('GridText0');
      let GridItem1 = CommonFunc.getComponentRect('GridText1');
      let GridItem2 = CommonFunc.getComponentRect('GridText2');
      let GridItem3 = CommonFunc.getComponentRect('GridText3');
      let GridItem4 = CommonFunc.getComponentRect('GridText4');

      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) -Math.round(GridItem1.top - GridItem1.bottom)) <=1 ).assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) -Math.round(GridItem2.top - GridItem2.bottom)) <=1 ).assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) -Math.round(GridItem3.top - GridItem3.bottom)) <=1 ).assertTrue();
      expect(Math.abs(Math.round(GridItem0.top - GridItem0.bottom) -Math.round(GridItem4.top - GridItem4.bottom)) <=1 ).assertTrue();
     
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) -Math.round(GridItem1.right - GridItem1.left)) <=1 ).assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) -Math.round(GridItem2.right - GridItem2.left)) <=1 ).assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) -Math.round(GridItem3.right - GridItem3.left)) <=1 ).assertTrue();
      expect(Math.abs(Math.round(GridItem0.right - GridItem0.left) -Math.round(GridItem4.right - GridItem4.left)) <=1 ).assertTrue();
     
      console.info('[GridIrregular3Jsunit_0000] END');
      done();
    });

  })
}
