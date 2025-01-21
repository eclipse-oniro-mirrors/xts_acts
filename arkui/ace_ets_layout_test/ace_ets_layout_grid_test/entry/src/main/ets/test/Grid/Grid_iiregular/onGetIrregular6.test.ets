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

export default function onGetIrregular6Jsunit() {

  describe('onGetIrregular6Jsunit', function () {


    beforeEach(async function (done) {
      console.info("onGetIrregular6Jsunit beforeEach start");
      let options = {
        uri: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular6",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular6Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular6" == pages.name)) {
          console.info("get onGetIrregular6Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular6Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular6Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : onGetIrregular6Jsunit_0001
    * @tc.desc  : SonGetIrregular[0,1], the custom size of the obtained index setting is laid out in 1 row and 1 column
    * @tc.level : Level 2
    */
    it('onGetIrregular6Jsunit_0001', 0, async function (done) {

      console.info('[onGetIrregular6Jsunit_0001] START');


      await CommonFunc.sleep(1000);
      let Grid = CommonFunc.getComponentRect('GridInfo');
      let GridItem0 = CommonFunc.getComponentRect('GridLog0');
      let GridItem1 = CommonFunc.getComponentRect('GridLog1');
      await CommonFunc.sleep(1000);
      expect(Math.round(Grid.right -Grid.left)).assertEqual(Math.round(GridItem0.right -GridItem0.left ));
      expect(Math.round(Grid.right -Grid.left)).assertEqual(Math.round(GridItem1.right -GridItem1.left ));
      console.info('[onGetIrregular6Jsunit_0001] END');
      done();
    });

  })
}

