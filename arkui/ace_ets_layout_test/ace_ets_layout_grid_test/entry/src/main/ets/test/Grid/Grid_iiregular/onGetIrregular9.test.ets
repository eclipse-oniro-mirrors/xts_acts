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

export default function onGetIrregular9Jsunit() {

  describe('onGetIrregular9Jsunit', function () {


    beforeEach(async function (done) {
      console.info("onGetIrregular9" +
      "Jsunit beforeEach start");
      let options = {
        uri: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular9",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular9Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular9" == pages.name)) {
          console.info("get onGetIrregular9Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular9Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular9Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
     * @tc.name  : onGetIrregular9Jsunit_0001
     * @tc.desc  :  onGetIrregular[3,1], the custom size of the obtained index setting is laid out according to 3 rows and 1 column
     * @tc.level : Level 2
     */
    it('onGetIrregular9Jsunit_0001', 0, async function (done) {

      console.info('[onGetIrregular9Jsunit_0000] START');
      await CommonFunc.sleep(1000);

      let GridItem0 = CommonFunc.getComponentRect('GridCenter0');
      let GridItem1 = CommonFunc.getComponentRect('GridCenter1');
      let GridItem4 = CommonFunc.getComponentRect('GridCenter4');

      await CommonFunc.sleep(1000);
      expect(px2vp(Math.round(GridItem0.right - GridItem0.left))).assertEqual(80);
      expect(px2vp(Math.round(GridItem4.right - GridItem4.left))).assertEqual(80);

      expect(Math.round(px2vp(GridItem0.bottom - GridItem0.top))).assertEqual(260);
      expect(Math.round(px2vp(GridItem4.bottom - GridItem4.top))).assertEqual(260);

      console.info('[onGetIrregular9Jsunit_0000] END');
      done();
    });

  })
}
