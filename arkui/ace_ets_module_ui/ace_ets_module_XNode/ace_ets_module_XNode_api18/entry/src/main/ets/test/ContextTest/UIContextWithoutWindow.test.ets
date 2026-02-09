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

export default function UIContextWithoutWindowTest() {
  describe('UIContextWithoutWindowTest', () => {
    beforeEach(async (done: Function) => {
      console.info("UIContextWithoutWindowTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Context/UIContextWithoutWindowTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get UIContextWithoutWindowTest state pages:" + JSON.stringify(pages));
        if (!("gestureEventTest" == pages.name)) {
          console.info("get UIContextWithoutWindowTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push UIContextWithoutWindowTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push UIContextWithoutWindowTest page error:" + err);
      }
      console.info("UIContextWithoutWindowTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("UIContextWithoutWindowTest after each called");
    });

    /**
     * @tc.name   UIContextWithoutWindowTest_0100
     * @tc.number UIContextWithoutWindowTest_0100
     * @tc.desc   frameNode: UIContext Without Window Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UIContextWithoutWindowTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('UIContextWithoutWindowTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button1 = await driver.findComponent(ON.id('create_context_id'));
      await button1.click();
      await CommonFunc.sleep(1000);
      let button2 = await driver.findComponent(ON.id('check_error_id'));
      await button2.click();
      await CommonFunc.sleep(1000);
      let button3 = await driver.findComponent(ON.id('destroy_context_id'));
      await button3.click();
      await CommonFunc.sleep(1000);

      let strJson1: string = getInspectorByKey('create_str_id');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[UIContextWithoutWindowTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[UIContextWithoutWindowTest_0100] content obj1 is: " + JSON.stringify(obj1.$attrs.content));
      let strJson2: string = getInspectorByKey('check_str_id');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      console.info("[UIContextWithoutWindowTest_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[UIContextWithoutWindowTest_0100] content obj2 is: " + JSON.stringify(obj2.$attrs.content));
      let strJson3: string = getInspectorByKey('destroy_str_id');
      let obj3: Record<string, ESObject> = JSON.parse(strJson3);
      console.info("[UIContextWithoutWindowTest_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[UIContextWithoutWindowTest_0100] content obj3 is: " + JSON.stringify(obj3.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('{"instanceId_":900000}');
      expect(obj2.$attrs.content).assertEqual('401');
      expect(obj3.$attrs.content).assertEqual('UIContext destroyed');
      console.info('[UIContextWithoutWindowTest_0100] END');
      done();
    });

  })
}