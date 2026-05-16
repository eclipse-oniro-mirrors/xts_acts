/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
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
export default function RippleFields() {
  describe('RippleFields', () => {
    beforeEach(async (done: Function) => {
      console.info("ParticleAttribute beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/RippleFields",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RippleFields state pages: " + JSON.stringify(pages));
        if (!("RippleFields" == pages.name)) {
          console.info("get RippleFields  state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info("push RippleFields  success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RippleFields page error:" + err);
      }
      console.info("RippleFields beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RippleFields after each called");
    });

    /**
     * @tc.number RippleFields_001
     * @tc.name RippleFields_001
     * @tc.desc test the particle of attribute
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('RippleFields_001', Level.LEVEL0, async (done: Function) => {
      console.info("[RippleFields_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let callbackJson = getInspectorByKey('particleId');
      let obj: ESObject = JSON.parse(callbackJson);
      console.info("InspectorLayoutCallback001 component obj is: " + JSON.stringify(obj));
      let rippleFields: Array<RippleFieldOptions> = obj?.$attrs?.rippleFields;
      console.log('RippleFields_001 rippleFields is : ',  JSON.stringify(rippleFields))
      let amplitude: number | undefined = rippleFields[0]?.amplitude;
      expect(amplitude).assertEqual(120)
      let wavelength: number | undefined = rippleFields[0]?.wavelength;
      expect(wavelength).assertEqual(500)
      let attenuation: number | undefined = rippleFields[0]?.attenuation;
      expect(attenuation).assertEqual(0)
      let waveSpeed: number | undefined = rippleFields[0]?.waveSpeed;
      expect(waveSpeed).assertEqual(220)
      let center: PositionT<number> | undefined = rippleFields[0]?.center;
      expect(JSON.stringify(center)).assertEqual('{"x":"150.00vp","y":"150.00vp"}');
      let region: FieldRegion | undefined = rippleFields[0]?.region;
      expect(JSON.stringify(region)).assertEqual('{"shape":"RECT","size":{"width":"300.00vp","height":"300.00vp"},"position":{"x":"150.00vp","y":"150.00vp"}}');
      console.info("[RippleFields_001] END");
      done();
    });
  })
}