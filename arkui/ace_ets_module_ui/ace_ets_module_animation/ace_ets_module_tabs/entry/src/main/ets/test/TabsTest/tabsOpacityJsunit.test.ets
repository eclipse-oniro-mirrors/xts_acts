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
import { Driver, Component, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function tabsOpacityJsunit() {
  describe('tabsOpacityJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("tabsOpacityJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsOpacity",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get tabsOpacityJsunit state pages:" + JSON.stringify(pages));
        if (!("tabsOpacity" == pages.name)) {
          console.info("get tabsOpacityJsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push tabsOpacityJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabsOpacityJsunit page error:" + err);
      }
      console.info("tabsOpacityJsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("tabsOpacityJsunit after each called");
    });

    /**
     * @tc.name   tabsOpacityJsunit_0100
     * @tc.number tabsOpacityJsunit_001
     * @tc.desc   Set the translation distance and transparency of TabBar.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('tabsOpacityJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[tabsOpacityJsunit_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bar_translate'));
      await btn.click();
      await CommonFunc.sleep(2000);
      let btn2: Component = await driver.findComponent(ON.id('bar_opacity'));
      await btn2.click();
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('tabContent_bar_2');
      console.info("[tabsOpacityJsunit_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[tabsOpacityJsunit_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[tabsOpacityJsunit_0100] tabBar: " + JSON.stringify(JSON.parse(strJson).$attrs.tabBar));
      await CommonFunc.sleep(1000);
      let text01: Component = await driver.findComponent(ON.text("pink"))
      let textContent01:string = await text01.getText();
      console.info("[tabsOpacityJsunit_0100] textContent01: " + textContent01);
      expect(JSON.parse(strJson).$type).assertEqual('TabContent');
      expect(textContent01).assertEqual("pink");
      console.info('[tabsOpacityJsunit_0100] END');
      done();
    });
  })
}
