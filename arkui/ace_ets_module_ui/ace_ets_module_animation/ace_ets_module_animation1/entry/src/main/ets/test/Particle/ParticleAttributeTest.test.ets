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
export default function ParticleAttributeTest() {
  describe('ParticleAttributeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ParticleAttribute beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/particleAttributeTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get particleAttributeTest state pages: " + JSON.stringify(pages));
        if (!("particleAttributeTest" == pages.name)) {
          console.info("get particleAttributeTest  state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info("push particleAttributeTest  success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push particleAttributeTest page error:" + err);
      }
      console.info("particleAttributeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("particleAttributeTest after each called");
    });

    /**
     * @tc.name   ParticleAttributeTest_001
     * @tc.number ParticleAttributeTest_001
     * @tc.desc   test the particle of attribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ParticleAttributeTest_001', Level.LEVEL0, async (done: Function) => {
      console.info("[ParticleAttributeTest_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let noiseScale = getInspectorByKey("text");
      expect(JSON.parse(noiseScale).$attrs.content).assertEqual("1");
      console.info("[ParticleAttributeTest_001] END");
      done();
    });
  })
}