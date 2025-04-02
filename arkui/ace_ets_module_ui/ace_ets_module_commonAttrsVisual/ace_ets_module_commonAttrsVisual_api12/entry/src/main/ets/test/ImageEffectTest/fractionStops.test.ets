/*
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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function fractionStops() {

  describe('fractionStops', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ImageEffect/fractionStops",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get fractionStops state pages: " + JSON.stringify(pages));
        if (!("fractionStops" == pages.name)) {
          console.info("get fractionStops state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push fractionStops success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push fractionStops page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("fractionStops after each called");
    });

    /**
     * @tc.number fractionStops_0100
     * @tc.name fractionStops_0100
     * @tc.desc test api of systemBarEffect
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('fractionStops_0100', 0, async (done: Function) => {
      console.info('fractionStops_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('fractionStops');
      console.info("[fractionStops_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[fractionStops_0100] content obj is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .linearGradientBlur));
      console.info("[fractionStops_0100] content fractionStops is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .linearGradientBlur
        .options
        .fractionStops));
      expect(JSON.stringify(JSON.parse(strJson)
        .$attrs
        .linearGradientBlur
        .options
        .fractionStops))
        .assertEqual('["0.000000,0.000000","0.000000,0.330000","1.000000,0.660000","1.000000,1.000000"]');
      console.info('[fractionStops_0100] END');
      done();
    });
  })
}
