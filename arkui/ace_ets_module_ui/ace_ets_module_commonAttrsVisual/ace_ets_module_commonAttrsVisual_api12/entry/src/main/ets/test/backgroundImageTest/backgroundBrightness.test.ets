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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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

export default function backgroundBrightness() {

  describe('backgroundBrightness', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/backgroundImage/backgroundBrightness",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backgroundBrightness state pages: " + JSON.stringify(pages));
        if (!("backgroundBrightness" == pages.name)) {
          console.info("get backgroundBrightness state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push backgroundBrightness success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backgroundBrightness page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("backgroundBrightness after each called");
    });

    /**
     * @tc.name   backgroundBrightness_0100
     * @tc.number backgroundBrightness_0100
     * @tc.desc   test api of systemBarEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('backgroundBrightness_0100', Level.LEVEL2, async (done: Function) => {
      console.info('backgroundBrightness_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundBrightness');
      console.info("[backgroundBrightness_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[backgroundBrightness_0100] backgroundBrightness obj is: " + JSON.stringify(JSON.parse(strJson)
        .$attrs
        .BackgroundBrightness));
      expect(JSON.stringify(JSON.parse(strJson).$attrs.BackgroundBrightness))
        .assertEqual('{"dynamicLightUpRate":0.5,"dynamicLightUpDegree":0.5}');
      console.info('[backgroundBrightness_0100] END');
      done();
    });
  })
}
