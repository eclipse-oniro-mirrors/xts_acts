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
import CommonFunc from '../../MainAbility/common/Common';
import bundle from '@ohos.bundle.bundleManager';

export default function backgroundEffectJsunit() {
  describe('backgroundEffectJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("backgroundEffectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/backgroundEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backgroundEffectJsunit state pages: " + JSON.stringify(pages));
        if (!("backgroundEffect" == pages.name)) {
          console.info("get backgroundEffectJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push backgroundEffectJsunit page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backgroundEffectJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number backgroundEffectJsunit_0100
     * @tc.name backgroundEffectJsunit_0100
     * @tc.desc set api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('backgroundEffectJsunit_0100', 0, async (done: Function) => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0100] START');
      let strJson = getInspectorByKey('backgroundEffect_id1');
      console.info("[backgroundEffectJsunit_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[backgroundEffectJsunit_0100] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson)
        .$attrs
        .backgroundEffect
        .options
        .saturation).assertEqual(10);
      console.info('[backgroundEffectJsunit_0100] END');
      done();
    });

    /**
     * @tc.number backgroundEffectJsunit_0200
     * @tc.name backgroundEffectJsunit_0200
     * @tc.desc set api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('backgroundEffectJsunit_0200', 0, async (done: Function) => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0200] START');
      let strJson = getInspectorByKey('backgroundEffect_id1');
      console.info("[backgroundEffectJsunit_0200] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson)
        .$attrs
        .backgroundEffect
        .options
        .adaptiveColor).assertEqual("AdaptiveColor.Default");
      console.info('[backgroundEffectJsunit_0200] END');
      done();
    });

    /**
     * @tc.number backgroundEffectJsunit_0300
     * @tc.name backgroundEffectJsunit_0300
     * @tc.desc set api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('backgroundEffectJsunit_0300', 0, async (done: Function) => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0300] START');
      let strJson = getInspectorByKey('backgroundEffect_id1');
      console.info("[backgroundEffectJsunit_0300] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson)
        .$attrs
        .backgroundEffect
        .options
        .blurOption).assertEqual("[1.000000,1.000000]");
      console.info('[backgroundEffectJsunit_0300] END');
      done();
    });

    /**
     * @tc.number backgroundEffectJsunit_0400
     * @tc.name backgroundEffectJsunit_0400
     * @tc.desc set api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('backgroundEffectJsunit_0400', 0, async (done: Function) => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0400] START');
      let strJson = getInspectorByKey('backgroundEffect_id1');
      console.info("[backgroundEffectJsunit_0400] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson)
        .$attrs
        .backgroundEffect
        .options
        .radius).assertEqual(10);
      console.info('[backgroundEffectJsunit_0400] END');
      done();
    });

    /**
     * @tc.number backgroundEffectJsunit_0500
     * @tc.name backgroundEffectJsunit_0500
     * @tc.desc set api
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('backgroundEffectJsunit_0500', 0, async (done: Function) => {
      // Get the information of the backgroundEffect component
      console.info('[backgroundEffectJsunit_0500] START');
      let strJson = getInspectorByKey('backgroundEffect_id2');
      console.info("[backgroundEffectJsunit_0500] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      expect(JSON.parse(strJson)
        .$attrs
        .backgroundEffect
        .options
        .adaptiveColor).assertEqual("AdaptiveColor.Average");
      console.info('[backgroundEffectJsunit_0500] END');
      done();
    });
  })
}
