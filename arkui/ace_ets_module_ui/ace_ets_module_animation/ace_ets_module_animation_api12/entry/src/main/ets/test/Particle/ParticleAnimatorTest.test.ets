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
export default function ParticleAnimatorTest() {
  describe('ParticleAnimatorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("ParticleAnimatorTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Particle/particleAnimationTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get particleAnimationTest state pages: " + JSON.stringify(pages));
        if (!("particleAnimationTest" == pages.name)) {
          console.info("get particleAnimationTest  state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(3000);
          console.info("push particleAnimationTest  success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ParticleAnimatorTest page error:" + err);
      }
      console.info("ParticleAnimatorTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParticleAnimatorTest after each called");
    });
    /**
     * @tc.number ParticleAnimatorTest_001
     * @tc.name ParticleAnimatorTest_001
     * @tc.desc test the particle of attribute
     * @tc.level Level 2
     * @tc.type
     * @tc.size
     */
    it('ParticleAnimatorTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('[ParticleAnimatorTest_001] START');
      await CommonFunc.sleep(500);
      let json = getInspectorByKey('particleTest');
      console.info('particleAnimatorTest_00_0100 :' + JSON.stringify(json));
      // test whether support the commonAttrs
      console.info('particleAnimatorTest_00_0100 :' + JSON.parse(json).$attrs.borderStyle);
      console.info('particleAnimatorTest_00_0100 :' + JSON.parse(json).$attrs.borderColor);
      expect(JSON.parse(json).$attrs.borderStyle).assertEqual('BorderStyle.Solid');
      expect(JSON.parse(json).$attrs.borderColor).assertEqual('#FF000000');
      console.info('[ParticleAnimatorTest_001] END');
      done();
    });
  })
}