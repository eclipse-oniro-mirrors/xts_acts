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

export default function swiperModeTest() {
  describe('swiperModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/swiperMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperModeTest state pages:" + JSON.stringify(pages));
        if (!("swiperMode" == pages.name)) {
          console.info("get swiperModeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperModeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperModeTest page error:" + err);
      }
      console.info("swiperModeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("swiperModeTest after each called");
    });

    /**
     * @tc.name   swiperModeTest_0100
     * @tc.number swiperModeTest_001
     * @tc.desc   Set the SwiperAnimationMode to 'SwiperAnimationMode.NO_ANIMATION'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swiperModeTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[swiperModeTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_mode_no'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('swiper_mode_text');
      console.info("[swiperModeTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[swiperModeTest_0100] swiperMode1: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual("changeMode: NO_ANIMATION");
      let strJson2 = getInspectorByKey('swiper_aniMode_text');
      console.info("[swiperModeTest_0100] index: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("changeIndex: 2");
      console.info('[swiperModeTest_0100] SwiperAnimationMode.NO_ANIMATION END');
      done();
    });

    /**
     * @tc.name   swiperModeTest_0200
     * @tc.number swiperModeTest_002
     * @tc.desc   Set the SwiperAnimationMode to 'SwiperAnimationMode.DEFAULT_ANIMATION'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swiperModeTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[swiperModeTest_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_mode_default'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('swiper_mode_text');
      console.info("[swiperModeTest_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[swiperModeTest_0200] swiperMode2: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual("changeMode: DEFAULT_ANIMATION");
      let strJson2 = getInspectorByKey('swiper_aniMode_text');
      console.info("[swiperModeTest_0200] index: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("changeIndex: 6");
      console.info('[swiperModeTest_0200] SwiperAnimationMode.DEFAULT_ANIMATION END');
      done();
    });

    /**
     * @tc.name   swiperModeTest_0300
     * @tc.number swiperModeTest_003
     * @tc.desc   Set the SwiperAnimationMode to 'SwiperAnimationMode.FAST_ANIMATION'.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('swiperModeTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[swiperModeTest_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_mode_fast'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('swiper_mode_text');
      console.info("[swiperModeTest_0300] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[swiperModeTest_0300] swiperMode3: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$attrs.content).assertEqual("changeMode: FAST_ANIMATION");
      let strJson2 = getInspectorByKey('swiper_aniMode_text');
      console.info("[swiperModeTest_0300] index: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("changeIndex: 9");
      console.info('[swiperModeTest_0300] SwiperAnimationMode.FAST_ANIMATION END');
      done();
    });
  })
}