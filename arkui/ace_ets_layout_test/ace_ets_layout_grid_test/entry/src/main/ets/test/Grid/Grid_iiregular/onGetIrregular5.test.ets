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

export default function onGetIrregular5Jsunit() {

  describe('onGetIrregular5Jsunit', function () {


    beforeEach(async function (done) {
      console.info("onGetIrregular5Jsunit beforeEach start");
      let options = {
        uri: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular5",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular5Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular5" == pages.name)) {
          console.info("get onGetIrregular5Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular5Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular5Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : onGetIrregular5Jsunit_0001
    * @tc.desc  : Set onGetIrregularSizeByIndex[-1,1], and the custom size of the obtained index settings is laid out according to the row and column layout
    * @tc.level : Level 2
    */
    it('onGetIrregular5Jsunit_0001', 0, async function (done) {

      console.info('[onGetIrregular5Jsunit_0000] START');
      await CommonFunc.sleep(1000);
      let Grid = CommonFunc.getComponentRect('GridPages');
      let GridItem0 = CommonFunc.getComponentRect('GridLarge0');
      let GridItem1 = CommonFunc.getComponentRect('GridLarge1');
      await CommonFunc.sleep(1000);
      expect(Math.round(Grid.right - Grid.left)).assertEqual(Math.round(GridItem0.right -GridItem0.left ));
      expect(Math.round(Grid.right - Grid.left)).assertEqual(Math.round(GridItem1.right -GridItem1.left ));
      console.info('[onGetIrregular5Jsunit_0000] END');
      done();
    });

  })
}
