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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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

export default function onGetIrregular8Jsunit() {

  describe('onGetIrregular8Jsunit', () => {


    beforeEach(async (done: Function) => {
      console.info("onGetIrregular8Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular8",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular8Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular8" == pages.name)) {
          console.info("get onGetIrregular8Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular8Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular8Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
    * @tc.name  : onGetIrregular8Jsunit_0001
    * @tc.desc  : onGetIrregular[2,1], the custom size of the obtained index setting is laid out according to 2 rows and 1 column
    * @tc.level : Level 2
    */
    it('onGetIrregular8Jsunit_0001', 0, async (done: Function) => {

      console.info('[onGetIrregular8Jsunit_0000] START');
      await CommonFunc.sleep(1000);
      let GridItem0: RectValue = CommonFunc.getComponentRect('layout0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('layout1');
      let GridItem2: RectValue = CommonFunc.getComponentRect('layout2');

      await CommonFunc.sleep(1000);
      expect(Math.round(px2vp(GridItem0.right - GridItem0.left))).assertEqual(80);
      expect(Math.round(px2vp(GridItem2.right - GridItem2.left))).assertEqual(80);
      expect(Math.round(px2vp(GridItem0.bottom - GridItem0.top))).assertEqual(114);
      expect(Math.round(px2vp(GridItem2.bottom - GridItem2.top))).assertEqual(114);
      console.info('[onGetIrregular8Jsunit_0000] END');
      done();
    });

  })
}
