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
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, UiDirection, MouseButton, UIElementInfo, UIEventObserver} from '@ohos.UiTest';
import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';
export default function parentX_parentY_strategy_Test() {
  describe('parentX_parentY_strategy_Test', () => {
    beforeEach(async (done: Function) => {
config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
	done();
});
    beforeAll(async (done: Function) => {
      console.info("parentX_parentY_strategy_Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onChildTouchTest/parentX',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get parentX_parentY_strategy_Test state pages:" + JSON.stringify(pages));
        if (!("parentX" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push parentX_parentY_strategy_Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push parentX_parentY_strategy_Test page error:" + err);
      }
      console.info("parentX_parentY_strategy_Test beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("parentX_parentY_strategy_Test after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0100
     * @tc.name      parentX_parentY_strategy_Test
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('parentX_parentY_strategy_Test_0100', 0, async (done: Function) => {
      console.info('[parentX_parentY_strategy_Test_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(point.x), Math.round(point.y))
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('parentX');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[parentX_parentY_strategy_Test_0100] component obj is: " + JSON.stringify(obj));
      console.info("[parentX_parentY_strategy_Test_0100] content obj is: " + JSON.stringify(obj.$attrs.content));
      expect(Math.abs(Math.abs(Number(obj.$attrs.content)) - 200) <= 1).assertTrue();
      console.info('[parentX_parentY_strategy_Test_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0200
     * @tc.name      parentX_parentY_strategy_Test
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('parentX_parentY_strategy_Test_0200', 0, async (done: Function) => {
      console.info('[parentX_parentY_strategy_Test_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(point.x), Math.round(point.y))
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('parentY');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[parentX_parentY_strategy_Test_0200] component obj is: " + JSON.stringify(obj));
      console.info("[parentX_parentY_strategy_Test_0200] contentY is: " + JSON.stringify(obj.$attrs.content));
      expect(Math.abs(Math.abs(Number(obj.$attrs.content)) - 200) <= 1).assertTrue();
      await CommonFunc.sleep(1000);
      done();
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0300
     * @tc.name      parentX_parentY_strategy_Test
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('parentX_parentY_strategy_Test_0300', 0, async (done: Function) => {
      console.info('[parentX_parentY_strategy_Test_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(point.x), Math.round(point.y))
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('strategy_DEFAULT');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[parentX_parentY_strategy_Test_0300] component obj is: " + JSON.stringify(obj));
      console.info("[parentX_parentY_strategy_Test_0300] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(Math.abs(Number(obj.$attrs.content)) <= 1).assertTrue();
      console.info('[parentX_parentY_strategy_Test_0300] END');
      await CommonFunc.sleep(1000);
      done();
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0400
     * @tc.name      parentX_parentY_strategy_Test
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('parentX_parentY_strategy_Test_0400', 0, async (done: Function) => {
      console.info('[parentX_parentY_strategy_Test_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(point.x), Math.round(point.y))
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('strategy_FORWARD_COMPETITION');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[parentX_parentY_strategy_Test_0400] component obj is: " + JSON.stringify(obj));
      console.info("[parentX_parentY_strategy_Test_0400] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(Math.abs(Math.abs(Number(obj.$attrs.content)) - 1) <= 1).assertTrue();
      console.info('[parentX_parentY_strategy_Test_0400] END');
      await CommonFunc.sleep(1000);
      done();
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0500
     * @tc.name      parentX_parentY_strategy_Test
     * @tc.desc      set api
     * @tc.level     Level 2
     * @tc.type
    * @tc.size
     */
    it('parentX_parentY_strategy_Test_0500', 0, async (done: Function) => {
      console.info('[parentX_parentY_strategy_Test_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(Math.round(point.x), Math.round(point.y))
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('strategy_FORWARD');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[parentX_parentY_strategy_Test_0500] component obj is: " + JSON.stringify(obj));
      console.info("[parentX_parentY_strategy_Test_0500] component obj is: " + JSON.stringify(obj.$attrs.content));
      expect(Math.abs(Math.abs(Number(obj.$attrs.content)) - 2) <= 1).assertTrue();
      console.info('[parentX_parentY_strategy_Test_0500] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
