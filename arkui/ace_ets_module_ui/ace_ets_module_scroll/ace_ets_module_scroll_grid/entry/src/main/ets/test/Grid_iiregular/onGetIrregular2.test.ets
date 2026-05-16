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

export default function onGetIrregular2Jsunit() {
  describe('onGetIrregular2Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("onGetIrregular2Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid_iiregular/onGetIrregular2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular2Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular2" == pages.name)) {
          console.info("get onGetIrregular2Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular2Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular2Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   onGetIrregular2Jsunit_0001
     * @tc.number onGetIrregular2Jsunit_0001
     * @tc.desc   Set onGetIrregularSizeByIndex[1,2], and the custom size of the obtained index setting is laid out in 1 row and 2 columns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('onGetIrregular2Jsunit_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('[onGetIrregular2Jsunit_0000] START');
      await CommonFunc.sleep(1000);
      let Grid = CommonFunc.getComponentRect('GridItem2');

      let GridItem0 = CommonFunc.getComponentRect('onGetText0');
      let GridItem1 = CommonFunc.getComponentRect('onGetText1');
      let GridItem3 = CommonFunc.getComponentRect('onGetText3');

      await CommonFunc.sleep(1000);
      expect(Math.round(px2vp(GridItem0.right - GridItem0.left))).assertEqual(195);
      expect(Math.round(px2vp(GridItem3.right - GridItem3.left))).assertEqual(195);
      console.info('[onGetIrregular2Jsunit_0000] END');
      done();
    });
  })
}
