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

export default function onGetIrregular7Jsunit() {

  describe('onGetIrregular7Jsunit', () => {


    beforeEach(async (done: Function) => {
      console.info("onGetIrregular7Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Grid/Grid_iiregular/onGetIrregular7",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onGetIrregular7Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular7" == pages.name)) {
          console.info("get onGetIrregular7Jsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push onGetIrregular7Jsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onGetIrregular7Jsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });


    /* *
      * @tc.number: SUB_ACE_TS_COMPONENT_SR000IFDKV_0001
      * @tc.name  : onGetIrregular7Jsunit_0001
      * @tc.desc  : onGetIrregular[1,2], rowsTemplate layout case supports column 1, row by row layout
      * @tc.level : Level 2
      */


    it('onGetIrregular7Jsunit_0001', 0, async (done: Function) => {
      console.info('[onGetIrregular7Jsunit_0001] START');
      await CommonFunc.sleep(1000);
      let GridItem0: RectValue = CommonFunc.getComponentRect('onTextTemplate0');
      await CommonFunc.sleep(1000);
      expect(Math.round(px2vp(GridItem0.right - GridItem0.left))).assertEqual(400);
      await CommonFunc.sleep(1000);
      console.info('[onGetIrregular7Jsunit_0001] END');
      done();
    });

  })
}

