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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function tabsModeTest() {
  describe('tabsModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsModeTest state pages:" + JSON.stringify(pages));
        if (!("tabsMode" == pages.name)) {
          console.info("get tabsModeTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsModeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsModeTest page error:" + err);
      }
      console.info("tabsModeTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsModeTest after each called");
    });

    /**
     * @tc.number    tabsModeTest_001
     * @tc.name      tabsModeTest_0100
     * @tc.desc      Set the AnimationMode to 'SwiperAnimationMode.NO_ANIMATION'.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsModeTest_0100', 0, async (done: Function) => {
      console.info('[tabsModeTest_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_animode_content'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tabs_aniMode');
      console.info("[tabsModeTest_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[tabsModeTest_0100] tabsMode1: " + JSON.stringify(JSON.parse(strJson).$attrs.animationMode));
      expect(JSON.parse(strJson).$attrs.animationMode).assertEqual('AnimationMode.CONTENT_FIRST_WITH_JUMP');
      console.info('[tabsModeTest_0100] AnimationMode.CONTENT_FIRST_WITH_JUMP END');
      done();
    });

    /**
     * @tc.number    tabsModeTest_002
     * @tc.name      tabsModeTest_0200
     * @tc.desc      Set the AnimationMode to 'AnimationMode.ACTION_FIRST_WITH_JUMP'.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabsModeTest_0200', 0, async (done: Function) => {
      console.info('[tabsModeTest_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_animode_first'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tabs_aniMode');
      console.info("[tabsModeTest_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[tabsModeTest_0200] tabsMode1: " + JSON.stringify(JSON.parse(strJson).$attrs.animationMode));
      expect(JSON.parse(strJson).$attrs.animationMode).assertEqual('AnimationMode.ACTION_FIRST_WITH_JUMP');
      console.info('[tabsModeTest_0200] AnimationMode.ACTION_FIRST_WITH_JUMP END');
      done();
    });
  })
}