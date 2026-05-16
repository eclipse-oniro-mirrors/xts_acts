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
export default function VelocityFields() {
  describe('VelocityFields', () => {
    beforeEach(async (done: Function) => {
      console.info("ParticleAttribute beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/VelocityFields",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get VelocityFields state pages: " + JSON.stringify(pages));
        if (!("VelocityFields" == pages.name)) {
          console.info("get VelocityFields  state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info("push VelocityFields  success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push VelocityFields page error:" + err);
      }
      console.info("VelocityFields beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VelocityFields after each called");
    });

    /**
     * @tc.number VelocityFields_001
     * @tc.name VelocityFields_001
     * @tc.desc test the particle of attribute
     * @tc.level Level 0
     * @tc.type
     * @tc.size
     */
    it('VelocityFields_001', Level.LEVEL0, async (done: Function) => {
      console.info("[VelocityFields_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let callbackJson = getInspectorByKey('particleId2');
      let obj: ESObject = JSON.parse(callbackJson);
      let velocityFields: Array<VelocityFieldOptions> = obj?.$attrs?.velocityFields;
      console.log('VelocityFields_001 velocityFields is : ',  JSON.stringify(velocityFields))
      let velocity: Vector2T<number> | undefined = velocityFields[0]?.velocity;
      expect(JSON.stringify(velocity)).assertEqual('{"x":100,"y":0}')
      let region: FieldRegion | undefined = velocityFields[0]?.region;
      let shape: DisturbanceFieldShape | undefined = region?.shape;
      let position: PositionT<number> | undefined = region?.position;
      let size: SizeT<number> | undefined = region?.size;
      expect(shape).assertEqual('RECT');
      expect(JSON.stringify(size)).assertEqual('{"width":"200.00vp","height":"200.00vp"}');
      expect(JSON.stringify(position)).assertEqual('{"x":"150.00vp","y":"150.00vp"}');
      console.info("[VelocityFields_001] END");
      done();
    });
  })
}