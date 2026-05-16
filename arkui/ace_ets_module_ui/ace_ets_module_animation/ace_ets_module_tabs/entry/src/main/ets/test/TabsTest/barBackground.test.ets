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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function barBackground() {
  describe('barBackground', () => {
    beforeEach(async (done: Function) => {
      console.info("barBackground beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/barBackground",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get barBackground state pages:" + JSON.stringify(pages));
        if (!("barBackground" == pages.name)) {
          console.info("get barBackground pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push barBackground page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barBackground page error:" + err);
      }
      console.info("barBackground beforeEach end");
      done();
    });

    /**
     * @tc.name   barBackground_0100
     * @tc.number barBackground_001
     * @tc.desc   Provide TabBar with a blurring ability between background and content.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('barBackground_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[barBackground_0100] START');
      let strJson = getInspectorByKey('tabs_bar_back_style');
      console.info("[barBackground_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[barBackground_0100] barBackgroundBlurStyle: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundBlurStyle));
      expect(JSON.parse(strJson).$attrs.barBackgroundBlurStyle).assertEqual("BlurStyle.COMPONENT_THICK");
      console.info('[barBackground_0100] END');
      done();
    });

    /**
     * @tc.name   barBackground_0200
     * @tc.number barBackground_002
     * @tc.desc   Get TabBar background properties.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('barBackground_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[barBackground_0200] START');
      let strJson = getInspectorByKey('tabs_bar_back_effect');
      console.info("[barBackEffect_0100] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[barBackEffect_0100] barBackgroundEffect: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect));
      console.info("[barBackEffect_0100] radius: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.radius));
      console.info("[barBackEffect_0100] saturation: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.saturation));
      console.info("[barBackEffect_0100] brightness: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.brightness));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.radius).assertEqual(20);
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.saturation).assertEqual(15);
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.brightness).assertEqual(0.6);
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.color).assertEqual("#8044A4B5");
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.adaptiveColor).assertEqual("AdaptiveColor.Default");
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.inactiveColor).assertEqual("#FFFF0000");
      expect(JSON.parse(strJson)
        .$attrs
        .barBackgroundEffect
        .policy).assertEqual("BlurStyleActivePolicy.ALWAYS_ACTIVE");
      expect(JSON.parse(strJson)
        .$attrs
        .barBackgroundEffect
        .blurOption).assertEqual("[20.000000,20.000000]");
      console.info('[barBackground_0200] END');
      done();
    });

  })
}
