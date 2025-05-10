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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function barBackEffect() {
  describe('barBackEffect', () => {
    beforeEach(async (done: Function) => {
      console.info("barBackEffect beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/barBackEffect",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get barBackEffect state pages:" + JSON.stringify(pages));
        if (!("barBackEffect" == pages.name)) {
          console.info("get barBackEffect pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push barBackEffect page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barBackEffect page error:" + err);
      }
      console.info("barBackEffect beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("barBackEffect after each called");
    });

    /**
     * @tc.number    barBackEffect_001
     * @tc.name      barBackEffect_0100
     * @tc.desc      Get TabBar background properties.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('barBackEffect_0100', 0, async (done: Function) => {
      console.info('[barBackEffect_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tabs_bar_back_effect');
      console.info("[barBackEffect_0100] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[barBackEffect_0100] barBackgroundEffect: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect));
      console.info("[barBackEffect_0100] radius: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.radius));
      console.info("[barBackEffect_0100] saturation: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.saturation));
      console.info("[barBackEffect_0100] brightness: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.brightness));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.radius).assertEqual(10);
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.saturation).assertEqual(50);
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.brightness).assertEqual(2);
      console.info('[barBackEffect_0100] END');
      done();
    });

    /**
     * @tc.number    barBackEffect_002
     * @tc.name      barBackEffect_0200
     * @tc.desc      Get TabBar background properties.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('barBackEffect_0200', 0, async (done: Function) => {
      console.info('[barBackEffect_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tabs_bar_back_effect');
      console.info("[barBackEffect_0200] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[barBackEffect_0200] barBackgroundEffect: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect));
      console.info("[barBackEffect_0200] color: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.color));
      console.info("[barBackEffect_0200] adaptiveColor: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.adaptiveColor));
      console.info("[barBackEffect_0200] inactiveColor: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.inactiveColor));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.color).assertEqual("#8044A4B5");
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.adaptiveColor).assertEqual("AdaptiveColor.Default");
      expect(JSON.parse(strJson).$attrs.barBackgroundEffect.inactiveColor).assertEqual("#FFFF0000");
      console.info('[barBackEffect_0200] END');
      done();
    });

    /**
     * @tc.number    barBackEffect_003
     * @tc.name      barBackEffect_0300
     * @tc.desc      Get TabBar background properties.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('barBackEffect_0300', 0, async (done: Function) => {
      console.info('[barBackEffect_0300] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('tabs_bar_back_effect');
      console.info("[barBackEffect_0300] component obj is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[barBackEffect_0300] barBackgroundEffect: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect));
      console.info("[barBackEffect_0300] policy: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.policy));
      console.info("[barBackEffect_0300] blurOption: " + JSON.stringify(JSON.parse(strJson).$attrs.barBackgroundEffect.blurOption));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson)
        .$attrs
        .barBackgroundEffect
        .policy).assertEqual("BlurStyleActivePolicy.ALWAYS_ACTIVE");
      expect(JSON.parse(strJson)
        .$attrs
        .barBackgroundEffect
        .blurOption).assertEqual("[20.000000,20.000000]");
      console.info('[barBackEffect_0300] END');
      done();
    });
  })
}