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

export default function onGetIrregular3Jsunit() {

  describe('onGetIrregular3Jsunit', function () {
    beforeEach(async function (done) {
      console.info("onGetIrregular3Jsunit beforeEach start");
      let options = {
        uri: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular3Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular3" == pages.name)) {
          console.info("get onGetIrregular3Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular3Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular3Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : onGetIrregular3Jsunit_0001
    * @tc.desc  : Set onGetIrregularSizeByIndex[1,3], and the custom size of the obtained index is set in 1 row and 3 columns
    * @tc.level : Level 2
    */
    it('onGetIrregular3Jsunit_0001', 0, async function (done) {
      console.info('[onGetIrregular3Jsunit_0000] START');
      await CommonFunc.sleep(1000);
      let Grid = CommonFunc.getComponentRect('GridItem3');

      let GridItem0 = CommonFunc.getComponentRect('onGetItem0');
      let GridItem4 = CommonFunc.getComponentRect('onGetItem4');
      let GridItem1 = CommonFunc.getComponentRect('onGetItem1');


      await CommonFunc.sleep(1000);
      expect(Math.round(px2vp(GridItem0.right - GridItem0.left))).assertEqual(236);
      expect(Math.round(px2vp(GridItem4.right - GridItem4.left))).assertEqual(236);
      console.info('[onGetIrregular3Jsunit_0000] END');
      done();
    });

  })
}
