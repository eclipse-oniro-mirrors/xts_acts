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

export default function tabBarModifier() {
  describe('tabBarModifier', () => {
    beforeEach(async (done: Function) => {
      console.info("tabBarModifier beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabBarModifier",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabBarModifier state pages:" + JSON.stringify(pages));
        if (!("tabBarModifier" == pages.name)) {
          console.info("get tabBarModifier pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabBarModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabBarModifier page error:" + err);
      }
      console.info("tabBarModifier beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabBarModifier after each called");
    });

    /**
     * @tc.number    tabBarModifier_001
     * @tc.name      tabBarModifier_0100
     * @tc.desc      Using barModifier to set align to achieve tab alignment layout effect.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabBarModifier_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[tabBarModifier_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_barModifier_start'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let tabRect = CommonFunc.getComponentRectOnScreen('tabBar_pTest_01');
      let tabLeft:number = tabRect.left;
      let tabRight:number = tabRect.right;
      let tabBarRect = CommonFunc.getComponentRectOnScreen('tabBar_pTest_001');
      let tabBarLeft:number = tabBarRect.left;
      console.info("tabBarModifier_0100 value is" + tabLeft + " --" + tabRight + "--" + tabBarLeft );
      console.info("[tabBarModifier_0100] start: " + Math.round(tabBarLeft - tabLeft));
      expect(Math.abs(Math.round(tabBarLeft - tabLeft)) <= 1).assertTrue();
      let strJson1 = getInspectorByKey('tabs_barModifier_t');
      console.info("[swiperPageMode_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1).$attrs));
      console.info("[swiperPageMode_0100] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("align: Alignment.Start");
      await CommonFunc.sleep(1000);
      console.info('[tabBarModifier_0100] Alignment.Start END');
      done();
    });

    /**
     * @tc.number    tabBarModifier_002
     * @tc.name      tabBarModifier_0200
     * @tc.desc      Using barModifier to set align to achieve tab alignment layout effect.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabBarModifier_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[tabBarModifier_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_barModifier_end'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.text('Blue'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('tabs_barModifier_t');
      console.info("[swiperPageMode_0200] component obj is: " + JSON.stringify(JSON.parse(strJson1).$attrs));
      console.info("[swiperPageMode_0200] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("align: Alignment.End");
      console.info('[tabBarModifier_0200] Alignment.End END');
      done();
    });

    /**
     * @tc.number    tabBarModifier_003
     * @tc.name      tabBarModifier_0300
     * @tc.desc      Using barModifier to set align to achieve tab alignment layout effect.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('tabBarModifier_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[tabBarModifier_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_barModifier_center'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.text('Green'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('tabs_barModifier_t');
      console.info("[swiperPageMode_0300] component obj is: " + JSON.stringify(JSON.parse(strJson1).$attrs));
      console.info("[swiperPageMode_0300] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("align: Alignment.Center");
      console.info('[tabBarModifier_0300] Alignment.Center END');
      done();
    });
  })
}