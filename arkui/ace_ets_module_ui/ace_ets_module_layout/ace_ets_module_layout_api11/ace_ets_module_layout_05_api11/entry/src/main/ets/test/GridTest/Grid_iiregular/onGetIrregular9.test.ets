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

export default function onGetIrregular9Jsunit() {

  describe('onGetIrregular9Jsunit', () => {


    beforeEach(async (done: Function) => {
      console.info("onGetIrregular9" +
        "Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular9",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular9Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular9" == pages.name)) {
          console.info("get onGetIrregular9Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
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
    it('onGetIrregular9Jsunit_0001',  Level.LEVEL0, async (done: Function) => {

      console.info('[onGetIrregular9Jsunit_0000] START');
      await CommonFunc.sleep(1000);

      let GridItem0: RectValue = CommonFunc.getComponentRect('GridCenter0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('GridCenter1');
      let GridItem4: RectValue = CommonFunc.getComponentRect('GridCenter4');

      await CommonFunc.sleep(1000);
      expect(Math.abs(px2vp(GridItem0.right - GridItem0.left) - 80) <= 1).assertTrue();
      expect(Math.abs(px2vp(GridItem4.right - GridItem4.left) - 80) <= 1).assertTrue();

      expect(Math.abs(px2vp(GridItem0.bottom - GridItem0.top) - 260) <= 1).assertTrue();
      expect(Math.abs(px2vp(GridItem4.bottom - GridItem4.top) - 260) <= 1).assertTrue();

      console.info('[onGetIrregular9Jsunit_0000] END');
      done();
    });

  })
}
