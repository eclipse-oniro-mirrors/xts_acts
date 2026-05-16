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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function MenuPolicy_SHOW_APITest() {
  describe('MenuPolicy_SHOW_APITest', () => {
    beforeEach(async (done: Function) => {
      console.info("MenuPolicy_SHOW_APITest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SearchApi12/MenuPolicy_SHOW",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get MenuPolicy_SHOW_APITest state pages: " + JSON.stringify(pages));
        if (!("MenuPolicy_SHOW" == pages.name)) {
          console.info("get MenuPolicy_SHOW_APITest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push MenuPolicy_SHOW_APITest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push MenuPolicy_SHOW_APITest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   MenuPolicy_SHOW_APITest_0100
     * @tc.number MenuPolicy_SHOW_APITest_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MenuPolicy_SHOW_APITest_0100',  Level.LEVEL2, async (done: Function) => {
      console.info('MenuPolicy_SHOW_APITest_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let textComponent = await driver.findComponent(ON.id('Search'));
      await textComponent.click()
      await CommonFunc.sleep(500);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      await textComponent.inputText("hello")
      await CommonFunc.sleep(2000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await CommonFunc.sleep(2000);
      await textComponent.inputText("123")
      await CommonFunc.sleep(2000);
	    await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      let MenuPolicy = getInspectorByKey('MenuPolicy_SHOW');
      console.info("[MenuPolicy_SHOW_APITest_0100] Tabs animationMode attrs is: " + JSON.stringify(JSON.parse(MenuPolicy).$attrs));
      expect(JSON.parse(MenuPolicy).$attrs.content).assertEqual('SHOW');
      console.info('[MenuPolicy_SHOW_APITest_0100] END');
      done();
    });
  })
}