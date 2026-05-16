/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from '../../MainAbility/common/Utils';
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection,
  MouseButton, WindowMode, PointerMatrix, Rect } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';

export default function GestureInterceptTest() {
  describe('GestureInterceptTest', () => {
    beforeEach(async (done: Function) => {
      console.info("GestureInterceptTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/gestureIntercept/GestureIntercept',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get GestureInterceptTest state pages:" + JSON.stringify(pages));
        if (!("GestureIntercept" == pages.name)) {
          console.info("get GestureInterceptTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GestureInterceptTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GestureInterceptTest page error:" + err);
      }
      console.info("GestureInterceptTest beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GestureInterceptTest after each called");
    });

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0100
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0100
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0100] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('0'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1: Component = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('InterceptTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0100] gestureIntercept: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('result1111');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0100] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0200
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0200
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0200] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('1'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1: Component = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('InterceptTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0200] gestureIntercept: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('result0011');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0200] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0300
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0300
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0300] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('2'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1: Component = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('InterceptTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0300] gestureIntercept: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('result1100');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0300] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0400
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0400
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0400] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('3'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1: Component = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('InterceptTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0400] gestureIntercept: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('result1101');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0400] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0500
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0500
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0500] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('4'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1: Component = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('InterceptTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0500] gestureIntercept: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('result1011');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0500] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0600
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0600
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0600] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('undefined'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1: Component = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('InterceptTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0600] gestureIntercept: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('result1111');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0600] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0700
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0700
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0700] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('null'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1: Component = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('InterceptTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0700] gestureIntercept: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('result1111');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0700] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0800
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0800
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0800] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let btn0: Component = await driver.findComponent(ON.id('clear'));
      await btn0.click();
      await CommonFunc.sleep(1000);
      let btn: Component = await driver.findComponent(ON.id('-1'));
      await btn.click();
      await CommonFunc.sleep(500);
      let btn1: Component = await driver.findComponent(ON.id('button1'));
      await btn1.click();
      await CommonFunc.sleep(500);
      let strJson1 = getInspectorByKey('InterceptTest');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0800] gestureIntercept: ' + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('result1111');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0800] END');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0900
     * @tc.name      SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0900
     * @tc.desc      test touch gestureIntercept
     * @tc.level:    LEVEL 1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0900] START');
      await CommonFunc.sleep(500);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('HostBelongTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0900] gestureIntercept: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('111111');
      console.info('[SUB_ACE_ARKUI_GESTUREINTERCEPTJS_0900] END');
      done();
    })
  })
}