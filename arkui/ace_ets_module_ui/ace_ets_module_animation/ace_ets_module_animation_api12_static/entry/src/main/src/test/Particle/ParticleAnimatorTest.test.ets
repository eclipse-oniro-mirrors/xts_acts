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

export default function ParticleAnimatorTest() {
  describe('ParticleAnimatorTest', () => {
    beforeAll(() => {
      console.info("ParticleAnimatorTest beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.animation12.static", "EntryAbility")
      

    });

    beforeEach(async (): Promise<void> => {
      console.info("ParticleAnimatorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/particleAnimationTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ParticleAnimatorTest state pages:" + JSON.stringify(pages));
        if (!("particleAnimationTest" == pages.name)) {
          console.info("get ParticleAnimatorTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ParticleAnimatorTest page error:" + err);
      }
      console.info("ParticleAnimatorTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ParticleAnimatorTest after each called");
    });
    
    
/**
     * @tc.number   ParticleAnimatorTest_static_001
     * @tc.name     ParticleAnimatorTest_static_001
     * @tc.desc     ParticleAnimatorTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ParticleAnimatorTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[ParticleAnimatorTest_static_001] START');
      await CommonFunc.sleep(500);
      let json = inspector.getInspectorByKey('particleTest');
      await CommonFunc.sleep(2000);
      console.info('particleAnimatorTest_00_0100 :' + JSON.stringify(json));
      // test whether support the commonAttrs
      console.info('particleAnimatorTest_00_0100 :' +
      JSON.parseJsonElement(json).getElement('$attrs').getString('borderStyle'));
      console.info('particleAnimatorTest_00_0100 :' +
      JSON.parseJsonElement(json).getElement('$attrs').getString('borderColor'));
      expect(JSON.parseJsonElement(json).getElement('$attrs').getString('borderStyle'))
        .assertEqual('BorderStyle.Solid');
      expect(JSON.parseJsonElement(json).getElement('$attrs').getString('borderColor')).assertEqual('#FF000000');
      console.info('[ParticleAnimatorTest_static_001] END');
      done();
    });
  })
}