/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import Utils from '../../MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function StackBackgroundTest() {
  describe('StackBackgroundTest', () => {
    beforeEach(async (done: Function) => {
      console.info("StackBackgroundTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/StackBackground',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get StackBackgroundTest state pages:" + JSON.stringify(pages));
        if (!("StackBackgroundTest" == pages.name)) {
          console.info("get StackBackgroundTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push StackBackgroundTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StackBackgroundTest page error:" + err);
      }
      console.info("StackBackgroundTest beforeEach end");
      done();
    });
    afterEach(async () => {
    });

     it('StackBackgroundTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[StackBackgroundTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button1 = await driver.findComponent(ON.id('LayoutSafeAreaEdgeTop'));
      await button1.click();
      await Utils.sleep(1000)
      let strJson1 = getInspectorByKey('BackgroundLayoutSafeAreaEdge');
      console.info("[StackBackgroundTest_0100] LayoutSafeAreaEdge1 is: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));

      let button2 = await driver.findComponent(ON.id('LayoutSafeAreaEdgeBottom'));
      await button2.click();
      await Utils.sleep(1000)
      let strJson2 = getInspectorByKey('BackgroundLayoutSafeAreaEdge');
      console.info("[StackBackgroundTest_0100] LayoutSafeAreaEdge2 is: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));

      let button3 = await driver.findComponent(ON.id('LayoutSafeAreaEdgeStart'));
      await button3.click();
      await Utils.sleep(1000)
      let strJson3 = getInspectorByKey('BackgroundLayoutSafeAreaEdge');
      console.info("[StackBackgroundTest_0100] LayoutSafeAreaEdge3 is: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));

      let button4 = await driver.findComponent(ON.id('LayoutSafeAreaEdgeEnd'));
      await button4.click();
      await Utils.sleep(1000)
      let strJson4 = getInspectorByKey('BackgroundLayoutSafeAreaEdge');
      console.info("[StackBackgroundTest_0100] LayoutSafeAreaEdge4 is: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));

      let button5 = await driver.findComponent(ON.id('LayoutSafeAreaEdgeVertical'));
      await button5.click();
      await Utils.sleep(1000)
      let strJson5 = getInspectorByKey('BackgroundLayoutSafeAreaEdge');
      console.info("[StackBackgroundTest_0100] LayoutSafeAreaEdge5 is: " + JSON.stringify(JSON.parse(strJson5).$attrs.content));

      let button6 = await driver.findComponent(ON.id('LayoutSafeAreaEdgeHorizontal'));
      await button6.click();
      await Utils.sleep(1000)
      let strJson6 = getInspectorByKey('BackgroundLayoutSafeAreaEdge');
      console.info("[StackBackgroundTest_0100] LayoutSafeAreaEdge6 is: " + JSON.stringify(JSON.parse(strJson6).$attrs.content));

      let button7 = await driver.findComponent(ON.id('LayoutSafeAreaEdgeAll'));
      await button7.click();
      await Utils.sleep(1000)
      let strJson7 = getInspectorByKey('BackgroundLayoutSafeAreaEdge');
      console.info("[StackBackgroundTest_0100] LayoutSafeAreaEdge7 is: " + JSON.stringify(JSON.parse(strJson7).$attrs.content));

      expect(JSON.parse(strJson1).$attrs.content).assertEqual('0');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('1');
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('2');
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('3');
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('4');
      expect(JSON.parse(strJson6).$attrs.content).assertEqual('5');
      expect(JSON.parse(strJson7).$attrs.content).assertEqual('6');

      console.info('[StackBackgroundTest_0100] END');
      done();
    });


  })
}