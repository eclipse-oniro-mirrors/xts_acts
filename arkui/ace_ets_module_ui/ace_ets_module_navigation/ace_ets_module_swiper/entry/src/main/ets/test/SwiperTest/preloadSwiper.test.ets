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
import events_emitter from '@ohos.events.emitter';

export default function preloadSwiper() {
  describe('preloadSwiper', () => {
    beforeEach(async (done: Function) => {
      console.info("preloadSwiper beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/preloadSwiper",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get preloadSwiper state pages:" + JSON.stringify(pages));
        if (!("preloadSwiper" == pages.name)) {
          console.info("get preloadSwiper pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push preloadSwiper page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push preloadSwiper page error:" + err);
      }
      console.info("preloadSwiper beforeEach end");
      done();
    });

    /**
     * @tc.name   preloadSwiper_0100
     * @tc.number preloadSwiper_001
     * @tc.desc   Control Swiper to preload specified child nodes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('preloadSwiper_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[preloadSwiper_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('preloadItems_swiper_succ'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('preloadItems_swiper_text');
      console.info("[preloadSwiper_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[preloadSwiper_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('preloadItems: success');
      await CommonFunc.sleep(1000);

      let btn2: Component = await driver.findComponent(ON.id('preloadItems_swiper_401'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      let strJson2 = getInspectorByKey('preloadItems_swiper_text');
      console.info("[preloadSwiper_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('preloadItems: "401"');

      let btn3: Component = await driver.findComponent(ON.id('preloadItems_swiper_1004'));
      await btn3.click();
      await CommonFunc.sleep(1500);
      let strJson3 = getInspectorByKey('preloadItems_swiper_text');
      console.info("[preloadSwiper_0100] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('preloadItems: "100004"');
      console.info('[preloadSwiper_0100] END');
      done();
    });
  })
}
