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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
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
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function backgroundEffectTest() {
  describe('backgroundEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("backgroundEffect beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/background/backgroundEffect',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get backgroundEffect state pages: " + JSON.stringify(pages));
        if (!("backgroundEffect" == pages.name)) {
          console.info("get backgroundEffect state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push backgroundEffect success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push backgroundEffect page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   backgroundEffectTest_0100
     * @tc.number motionBlurTest_0100
     * @tc.desc   api: motionBlur
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('backgroundEffectTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('backgroundEffectTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('backgroundEffectValue');
      console.log('backgroundEffectTest_0100', JSON.stringify(JSON.parse(strJson).$attrs))
      await CommonFunc.sleep(1000);
      // expect(JSON.parse(strJson).$attrs.backgroundEffect.radius).assertEqual(10);
      // expect(JSON.parse(strJson).$attrs.backgroundEffect.saturation).assertEqual(50);
      // expect(JSON.parse(strJson).$attrs.backgroundEffect.brightness).assertEqual(2);
      expect(JSON.parse(strJson).$attrs.backgroundEffect.options.inactiveColor).assertEqual("#FFFF0000");
      expect(JSON.parse(strJson).$attrs.backgroundEffect.options.policy).assertEqual("BlurStyleActivePolicy.ALWAYS_ACTIVE");
      console.info('backgroundEffectTest_0100 END');
      done();
    });
  })
}
