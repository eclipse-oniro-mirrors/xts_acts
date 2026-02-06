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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
export default function AttachDetachTest() {
  describe('AttachDetachTest', () => {
    beforeEach(async (done: Function) => {
      console.info("AttachDetachTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CanvasRenderingContext2D/AttachDetachTest",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AttachDetachTest state pages: " + JSON.stringify(pages));
        if (!("AttachDetachTest" == pages.name)) {
          console.info("get AttachDetachTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push AttachDetachTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AttachDetachTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number
     * @tc.name      AttachDetachTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('AttachDetachTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('AttachDetachTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // aboutToAppear中已绑定“onAttach 1”和“onDetach 1”
      // 页面加载，触发“onAttach 1”回调
      let strJson1 = getInspectorByKey('attach_content_1');
      let strJson2 = getInspectorByKey('detach_content_1');
      let strJson3 = getInspectorByKey('attach_content_2');
      let strJson4 = getInspectorByKey('detach_content_2');
      let obj1: ESObject = JSON.parse(strJson1);
      let obj2: ESObject = JSON.parse(strJson2);
      let obj3: ESObject = JSON.parse(strJson3);
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("页面加载，触发onAttach 1回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('onAttach 1');
      expect(obj2.$attrs.content).assertEqual('');
      expect(obj3.$attrs.content).assertEqual('');
      expect(obj4.$attrs.content).assertEqual('');

      // 点击按钮解绑canvas，触发“onDetach 1”回调
      let button = await driver.findComponent(ON.id('change_canvas'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('attach_content_1');
      strJson2 = getInspectorByKey('detach_content_1');
      strJson3 = getInspectorByKey('attach_content_2');
      strJson4 = getInspectorByKey('detach_content_2');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      obj3 = JSON.parse(strJson3);
      obj4 = JSON.parse(strJson4);
      console.info("点击按钮解绑canvas，触发onDetach 1回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('');
      expect(obj2.$attrs.content).assertEqual('onDetach 1');
      expect(obj3.$attrs.content).assertEqual('');
      expect(obj4.$attrs.content).assertEqual('');

      // 点击按钮绑定“onAttach 2” 、“onDetach 2”回调
      button = await driver.findComponent(ON.id('on_onAttach'));
      await button.click();
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('on_onDetach'));
      await button.click();
      await CommonFunc.sleep(1000);

      // 点击按钮绑定canvas，触发“onAttach 1” 和 “onAttach 2”回调
      button = await driver.findComponent(ON.id('change_canvas'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('attach_content_1');
      strJson2 = getInspectorByKey('detach_content_1');
      strJson3 = getInspectorByKey('attach_content_2');
      strJson4 = getInspectorByKey('detach_content_2');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      obj3 = JSON.parse(strJson3);
      obj4 = JSON.parse(strJson4);
      console.info("点击按钮绑定canvas，触发onAttach 1和onAttach 2回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('onAttach 1');
      expect(obj2.$attrs.content).assertEqual('');
      expect(obj3.$attrs.content).assertEqual('onAttach 2');
      expect(obj4.$attrs.content).assertEqual('');

      // 点击按钮解绑canvas，触发“onDetach 1” 和 “onDetach 2”回调
      button = await driver.findComponent(ON.id('change_canvas'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('attach_content_1');
      strJson2 = getInspectorByKey('detach_content_1');
      strJson3 = getInspectorByKey('attach_content_2');
      strJson4 = getInspectorByKey('detach_content_2');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      obj3 = JSON.parse(strJson3);
      obj4 = JSON.parse(strJson4);
      console.info("点击按钮解绑canvas，触发onDetach 1和onDetach 2回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('');
      expect(obj2.$attrs.content).assertEqual('onDetach 1');
      expect(obj3.$attrs.content).assertEqual('');
      expect(obj4.$attrs.content).assertEqual('onDetach 2');

      // 点击按钮解绑“onAttach 2” 、“onDetach 2”回调
      button = await driver.findComponent(ON.id('off_onAttach'));
      await button.click();
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('off_onDetach'));
      await button.click();
      await CommonFunc.sleep(1000);

      // 点击按钮绑定canvas，触发“onAttach 1”回调
      button = await driver.findComponent(ON.id('change_canvas'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('attach_content_1');
      strJson2 = getInspectorByKey('detach_content_1');
      strJson3 = getInspectorByKey('attach_content_2');
      strJson4 = getInspectorByKey('detach_content_2');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      obj3 = JSON.parse(strJson3);
      obj4 = JSON.parse(strJson4);
      console.info("点击按钮绑定canvas，触发onAttach 1回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('onAttach 1');
      expect(obj2.$attrs.content).assertEqual('');
      expect(obj3.$attrs.content).assertEqual('');
      expect(obj4.$attrs.content).assertEqual('');

      // 点击按钮解绑canvas，触发“onDetach 1” 回调
      button = await driver.findComponent(ON.id('change_canvas'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('attach_content_1');
      strJson2 = getInspectorByKey('detach_content_1');
      strJson3 = getInspectorByKey('attach_content_2');
      strJson4 = getInspectorByKey('detach_content_2');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      obj3 = JSON.parse(strJson3);
      obj4 = JSON.parse(strJson4);
      console.info("点击按钮解绑canvas，触发onDetach 1回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('');
      expect(obj2.$attrs.content).assertEqual('onDetach 1');
      expect(obj3.$attrs.content).assertEqual('');
      expect(obj4.$attrs.content).assertEqual('');

      // 点击按钮解绑所有onAttach、onDetach回调
      button = await driver.findComponent(ON.id('off_onAttach_all'));
      await button.click();
      await CommonFunc.sleep(1000);
      button = await driver.findComponent(ON.id('off_onDetach_all'));
      await button.click();
      await CommonFunc.sleep(1000);

      // 点击按钮绑定canvas，不触发onAttach回调
      button = await driver.findComponent(ON.id('change_canvas'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson1 = getInspectorByKey('attach_content_1');
      strJson2 = getInspectorByKey('detach_content_1');
      strJson3 = getInspectorByKey('attach_content_2');
      strJson4 = getInspectorByKey('detach_content_2');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      obj3 = JSON.parse(strJson3);
      obj4 = JSON.parse(strJson4);
      console.info("点击按钮绑定canvas，不触发onAttach回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('');
      expect(obj2.$attrs.content).assertEqual('');
      expect(obj3.$attrs.content).assertEqual('');
      expect(obj4.$attrs.content).assertEqual('');

      // 点击按钮解绑canvas，不触发onDetach回调
      button = await driver.findComponent(ON.id('change_canvas'));
      await button.click();
      await CommonFunc.sleep(1000);
      
      strJson1 = getInspectorByKey('attach_content_1');
      strJson2 = getInspectorByKey('detach_content_1');
      strJson3 = getInspectorByKey('attach_content_2');
      strJson4 = getInspectorByKey('detach_content_2');
      obj1 = JSON.parse(strJson1);
      obj2 = JSON.parse(strJson2);
      obj3 = JSON.parse(strJson3);
      obj4 = JSON.parse(strJson4);
      console.info("点击按钮解绑canvas，不触发onDetach回调");
      console.info("[AttachDetachTest_0100] attach_content_1 is: " + JSON.stringify(obj1.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_1 is: " + JSON.stringify(obj2.$attrs.content));
      console.info("[AttachDetachTest_0100] attach_content_2 is: " + JSON.stringify(obj3.$attrs.content));
      console.info("[AttachDetachTest_0100] detach_content_2 is: " + JSON.stringify(obj4.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('');
      expect(obj2.$attrs.content).assertEqual('');
      expect(obj3.$attrs.content).assertEqual('');
      expect(obj4.$attrs.content).assertEqual('');

      console.info('[AttachDetachTest_0100] END');
      done();
    });
  })
}

