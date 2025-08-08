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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium";
import router from "@ohos.router";
import CommonFunc from '../../MainAbility/utils/Common';
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
} from "@ohos.UiTest";
export default function ParticleTest() {
  describe("ParticleTest", () => {
    beforeEach(async (done: Function) => {
      console.info("ParticleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/Particle",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ParticleTest state pages:" + JSON.stringify(pages));
        if (!("Particle" == pages.name)) {
          console.info("get ParticleTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ParticleTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParticleTest page error:" + err);
      }
      console.info("ParticleTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParticleTest after each called");
    });
    /**
     * @tc.number ParticleTest
     * @tc.name testBack
     * @tc.desc Return specified page by index value
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it("ParticleTest_001", Level.LEVEL0, async (done: Function) => {
      console.info("[ParticleTest_001] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let noiseScale = getInspectorByKey("noiseScale");
      expect(JSON.parse(noiseScale).$attrs.content).assertEqual("10");
      console.info("[ParticleTest_001] END");
      done();
    });
    it("ParticleTest_002", Level.LEVEL0, async (done: Function) => {
      console.info("[ParticleTest_002] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let noiseFrequency = getInspectorByKey("noiseFrequency");
      expect(JSON.parse(noiseFrequency).$attrs.content).assertEqual("15");
      console.info("[ParticleTest_002] END");
      done();
    });
    it("ParticleTest_003", Level.LEVEL0, async (done: Function) => {
      console.info("[ParticleTest_003] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let noiseAmplitude = getInspectorByKey("noiseAmplitude");
      expect(JSON.parse(noiseAmplitude).$attrs.content).assertEqual("5");
      console.info("[ParticleTest_003] END");
      done();
    });
    it("ParticleTest_004", Level.LEVEL0, async (done: Function) => {
      console.info("[ParticleTest_004] START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let shape = getInspectorByKey("shape");
      expect(JSON.parse(shape).$attrs.content).assertEqual("RECT");
      console.info("[ParticleTest_004] END");
      done();
    });
  })
}