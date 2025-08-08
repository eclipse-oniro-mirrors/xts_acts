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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function UIContextGetOpacityTest() {
  describe('UIContextGetOpacityTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextGetOpacityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/UIContextGetOpacityTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextGetOpacityTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get UIContextGetOpacityTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContextGetOpacityTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextGetOpacityTest page error:" + err);
      }
      console.info("UIContextGetOpacityTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIContextGetOpacityTest after each called");
    });

    /**
     * @tc.number    UIContextGetOpacityTest_0100
     * @tc.name      UIContextGetOpacityTest_0100
     * @tc.desc      frameNode: GetOpacity Test
     * @tc.level:    Level 0
     * @tc.type :
     * @tc.size :
     */
    it('UIContextGetOpacityTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('UIContextGetOpacityTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('btn_click_id'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = getInspectorByKey('getOpacityValue1');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[UIContextGetOpacityTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[UIContextGetOpacityTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      let strJson2: string = getInspectorByKey('getOpacityValue2');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[UIContextGetOpacityTest_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[UIContextGetOpacityTest_0100] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      let strJson3: string = getInspectorByKey('getOpacityValue3');
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[UIContextGetOpacityTest_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[UIContextGetOpacityTest_0100] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      let strJson4: string = getInspectorByKey('getOpacityValue4');
      let obj4: Record<string, ESObject> = JSON.parse(strJson4);
      console.info("[UIContextGetOpacityTest_0100] component obj4 is: " + JSON.stringify(obj4));
      console.info("[UIContextGetOpacityTest_0100] content obj4 is: " + JSON.stringify(obj4.$attrs.content));
      let strJson5: string = getInspectorByKey('getOpacityValue5');
      let obj5: Record<string, ESObject> = JSON.parse(strJson5);
      console.info("[UIContextGetOpacityTest_0100] component obj5 is: " + JSON.stringify(obj5));
      console.info("[UIContextGetOpacityTest_0100] content obj5 is: " + JSON.stringify(obj5.$attrs.content));
      let strJson6: string = getInspectorByKey('getTransformValue');
      let obj6: Record<string, ESObject> = JSON.parse(strJson6);
      console.info("[UIContextGetOpacityTest_0100] component obj6 is: " + JSON.stringify(obj6));
      console.info("[UIContextGetOpacityTest_0100] content obj6 is: " + JSON.stringify(obj6.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('0');
      expect(obj2.$attrs.content).assertEqual('0');
      expect(obj3.$attrs.content).assertEqual('1');
      expect(obj4.$attrs.content).assertEqual('1');
      expect(obj5.$attrs.content).assertEqual('0.5');
      expect(obj6.$attrs.content).assertEqual('0');
      console.info('[UIContextGetOpacityTest_0100] END');
      done();
    });

  })
}