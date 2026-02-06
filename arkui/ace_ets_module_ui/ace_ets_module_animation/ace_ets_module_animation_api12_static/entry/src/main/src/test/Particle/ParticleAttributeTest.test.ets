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

export default function ParticleAttributeTest() {
  describe('ParticleAttributeTest', () => {
    beforeAll(() => {
      console.info("ParticleAttributeTest beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.animation12.static", "EntryAbility")
      

    });

    beforeEach(async (): Promise<void> => {
      console.info("ParticleAttributeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/particleAttributeTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ParticleAttributeTest state pages:" + JSON.stringify(pages));
        if (!("particleAttributeTest" == pages.name)) {
          console.info("get ParticleAttributeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParticleAttributeTest page error:" + err);
      }
      console.info("ParticleAttributeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("particleAttributeTest after each called");
    });
    
    
/**
     * @tc.number   ParticleAttributeTest_static_001
     * @tc.name     ParticleAttributeTest_static_001
     * @tc.desc     ParticleAttributeTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ParticleAttributeTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info("[ParticleAttributeTest_static_001] START");
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('test1156 ')
      let btn = await driver.findComponent(ON.id('btn'));
      await CommonFunc.sleep(2000);
      console.log('test1156 ' + btn)
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let noiseScale = inspector.getInspectorByKey("text");
      expect(JSON.parseJsonElement(noiseScale).getElement('$attrs').getString('content')).assertEqual("1");
      console.info("[ParticleAttributeTest_static_001] END");
      done();
    });
  })
}