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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';


export default function activeTest() {
  describe('activeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("activeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/UIContext/FocusController/activeTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get activeTest state pages: " + JSON.stringify(pages));
        if (!("activeTest" == pages.name)) {
          console.info("get activeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push activeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push activeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

   /**
    * @tc.name   activeTest_0010
    * @tc.number activeTest_0010
    * @tc.desc   FocusController.active(active：true,autoInactive:true)
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('activeTest_0010', Level.LEVEL0, async (done: Function) => {
      console.info('activeTest_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button = await scrollBar.scrollSearch(ON.id('active1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let button2 = await scrollBar.scrollSearch(ON.id('active2'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[activeTest_0010] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[activeTest_0010] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true true');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0010] END');
      done();
    });
    /**
     * @tc.name   activeTest_0020
     * @tc.number activeTest_0020
     * @tc.desc   FocusController.active(active：true,autoInactive:false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activeTest_0020', Level.LEVEL0, async (done: Function) => {
      console.info('activeTest_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('active1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[activeTest_0020] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[activeTest_0020] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true false');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0020] END');
      done();
    });
    /**
     * @tc.name   activeTest_0030
     * @tc.number activeTest_0030
     * @tc.desc   FocusController.active(active：false,autoInactive:false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activeTest_0030', Level.LEVEL0, async (done: Function) => {
      console.info('activeTest_0030 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[activeTest_0030] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[activeTest_0030] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('false false');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0030] END');
      done();
    });

    /**
     * @tc.name   activeTest_0040
     * @tc.number activeTest_0040
     * @tc.desc   FocusController.active(active:false,autoInactive:true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activeTest_0040', Level.LEVEL0, async (done: Function) => {
      console.info('activeTest_0040 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));

      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('active2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[activeTest_0040] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[activeTest_0040] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('false true');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0040] END');
      done();
    });

    /**
     * @tc.name   activeTest_0050
     * @tc.number activeTest_0050
     * @tc.desc   FocusController.active(active：true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activeTest_0050', Level.LEVEL0, async (done: Function) => {
      console.info('activeTest_0040 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('active3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[activeTest_0050] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[activeTest_0050] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('true false');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0050] END');
      done();
    });

    /**
     * @tc.name   activeTest_0060
     * @tc.number activeTest_0060
     * @tc.desc   FocusController.active(active：false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('activeTest_0060', Level.LEVEL0, async (done: Function) => {
      console.info('activeTest_0040 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let scrollBar: Component = await driver.findComponent(ON.type('Scroll'));
      let button3 = await scrollBar.scrollSearch(ON.id('init'));
      await button3.click();
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('active3'));
      await button.click();
      await CommonFunc.sleep(1000);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('text');
      console.info("[activeTest_0050] attrs is: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[activeTest_0050] content is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('false false');
      await CommonFunc.sleep(1000);
      console.info('[activeTest_0050] END');
      done();
    });

  })
}

