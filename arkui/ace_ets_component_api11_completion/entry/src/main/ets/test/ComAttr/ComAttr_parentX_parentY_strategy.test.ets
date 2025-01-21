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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton,
  UIElementInfo,
  UIEventObserver
} from '@ohos.UiTest';

export default function parentX_parentY_strategy_Test() {
  describe('parentX_parentY_strategy_Test', () => {
    beforeEach(async (done: Function) => {
      console.info("parentX_parentY_strategy_Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Com_Attr/parentX',
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
     * @tc.number SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0100
     * @tc.name parentX_parentY_strategy_Test
     * @tc.desc set api
     * @tc.level Level 2
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
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('parentX');
      console.info("[parentX_parentY_strategy_Test_0100] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[parentX_parentY_strategy_Test_0100] content JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('200');
      console.info('[parentX_parentY_strategy_Test_0100] END');
      await CommonFunc.sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0200
     * @tc.name parentX_parentY_strategy_Test
     * @tc.desc set api
     * @tc.level Level 2
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
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('parentY');
      console.info("[parentX_parentY_strategy_Test_0200] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[parentX_parentY_strategy_Test_0200] contentY is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('200');
      await CommonFunc.sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0300
     * @tc.name parentX_parentY_strategy_Test
     * @tc.desc set api
     * @tc.level Level 2
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
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('strategy_DEFAULT');
      console.info("[parentX_parentY_strategy_Test_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[parentX_parentY_strategy_Test_0300] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("0");
      console.info('[parentX_parentY_strategy_Test_0300] END');
      await CommonFunc.sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0400
     * @tc.name parentX_parentY_strategy_Test
     * @tc.desc set api
     * @tc.level Level 2
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
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('strategy_FORWARD_COMPETITION');
      console.info("[parentX_parentY_strategy_Test_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[parentX_parentY_strategy_Test_0400] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("1");
      console.info('[parentX_parentY_strategy_Test_0400] END');
      await CommonFunc.sleep(1000);
      done();
    });
    /**
     * @tc.number SUB_ACE_RICHEDITOR_parentX_parentY_strategy_Test_0500
     * @tc.name parentX_parentY_strategy_Test
     * @tc.desc set api
     * @tc.level Level 2
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
      await driver.click(point.x, point.y)
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('strategy_FORWARD');
      console.info("[parentX_parentY_strategy_Test_0500] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[parentX_parentY_strategy_Test_0500] component JSON.parse(strJson) is: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("2");
      console.info('[parentX_parentY_strategy_Test_0500] END');
      await CommonFunc.sleep(1000);
      done();
    });
  })
}
