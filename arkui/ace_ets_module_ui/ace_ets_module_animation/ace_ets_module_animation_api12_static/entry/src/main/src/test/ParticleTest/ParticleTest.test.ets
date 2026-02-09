'use static';
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { startAbility, UtilsTest } from '../Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ParticleTest() {
  describe("ParticleTest", () => {
    beforeAll(() => {
      console.info("ParticleTest beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.animation12.static", "EntryAbility")
      

    });

    beforeEach(async (): Promise<void> => {
      console.info("ParticleTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/Particle",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ParticleTest state pages:" + JSON.stringify(pages));
        if (!("Particle" == pages.name)) {
          console.info("get ParticleTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParticleTest page error:" + err);
      }
      console.info("ParticleTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ParticleTest after each called");
    });

    /**
     * @tc.number   ParticleTest_static_001
     * @tc.name     ParticleTest_static_001
     * @tc.desc     ParticleTest_static_001
     * @tc.level    Level.LEVEL0
     */
    it("ParticleTest_static_001", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ParticleTest_static_001] START");
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('test animation  ')
      let btn = await driver.findComponent(ON.id('btn'));
      await CommonFunc.sleep(2000);
      await CommonFunc.sleep(2000);
      console.log('test animation  ' + btn)
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let noiseScale = inspector.getInspectorByKey("noiseScale");
      await CommonFunc.sleep(1500);
      console.log('test animation  ' + noiseScale)
      expect(JSON.parseJsonElement(noiseScale).getElement('$attrs').getString('content')).assertEqual("10");
      console.info("[ParticleTest_static_001] END");
      done();
    });

    /**
     * @tc.number   ParticleTest_static_002
     * @tc.name     ParticleTest_static_002
     * @tc.desc     ParticleTest_static_002
     * @tc.level    Level.LEVEL0
     */
    it("ParticleTest_static_002", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ParticleTest_static_002] START");
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('btn'));
      await CommonFunc.sleep(2000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let noiseFrequency = inspector.getInspectorByKey("noiseFrequency");
      await CommonFunc.sleep(1500);
      expect(JSON.parseJsonElement(noiseFrequency).getElement('$attrs').getString('content')).assertEqual("15");
      console.info("[ParticleTest_static_002] END");
      done();
    });

    /**
     * @tc.number   ParticleTest_static_003
     * @tc.name     ParticleTest_static_003
     * @tc.desc     ParticleTest_static_003
     * @tc.level    Level.LEVEL0
     */
    it("ParticleTest_static_003", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ParticleTest_static_003] START");
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('btn'));
      await CommonFunc.sleep(2000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let noiseAmplitude = inspector.getInspectorByKey("noiseAmplitude");
      await CommonFunc.sleep(1500);
      expect(JSON.parseJsonElement(noiseAmplitude).getElement('$attrs').getString('content')).assertEqual("5");
      console.info("[ParticleTest_static_003] END");
      done();
    });
    
    /**
     * @tc.number   ParticleTest_static_004
     * @tc.name     ParticleTest_static_004
     * @tc.desc     ParticleTest_static_004
     * @tc.level    Level.LEVEL0
     */
    it("ParticleTest_static_004", Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[ParticleTest_static_004] START");
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('btn'));
      await CommonFunc.sleep(2000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let shape = inspector.getInspectorByKey("shape");
      await CommonFunc.sleep(1500);
      expect(JSON.parseJsonElement(shape).getElement('$attrs').getString('content')).assertEqual("RECT");
      console.info("[ParticleTest_static_004] END");
      done();
    });
  })
}