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

 import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function XComponentNdkInterfaceTest() {
  describe('XComponentNdkInterfaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentNdkInterface beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentNdkInterfacePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentNdkInterface state pages:" + JSON.stringify(pages));
        if (!("XComponentNdkInterfacePage" == pages.name)) {
          console.info("get XComponentNdkInterface pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentNdkInterface page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentNdkInterface page error:" + err);
      }
      console.info("XComponentNdkInterface beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("XComponentNdkInterface after each called");
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0100
     * @tc.name      XComponentNdkInterfaceTest_0100
     * @tc.desc      Test XComponentNdkInterface
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('XComponent_create_provider'));
      await button.click();
      console.info("[XComponentNdkInterfaceTest_0100] click XComponent_create_provider");
      await CommonFunc.sleep(1000);

      // XComponent exist accessibility subnode: QWidget
      await driver.assertComponentExist(ON.type('QWidget'));

      button = await driver.findComponent(ON.id('XComponent_dispose_provider'));
      await button.click();
      console.info("[XComponentNdkInterfaceTest_0100] click XComponent_dispose_provider");
      await CommonFunc.sleep(1000);

      // accessibility subnode is not exist
      let subnode = await driver.findComponent(ON.type('QWidget'));
      expect(subnode).assertNull();

      console.info('[XComponentNdkInterfaceTest_0100] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0200
     * @tc.name      XComponentNdkInterfaceTest_0200
     * @tc.desc      Test XComponentNdkInterface
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0200] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('XComponent_setNeedSoftKeyboard'));
      await button.click();
      console.info("[XComponentNdkInterfaceTest_0200] click XComponent_setNeedSoftKeyboard");
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('XComponent_setNeedSoftKeyboardResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentNdkInterfaceTest_0200] setNeedSoftKeyboardResult is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');

      console.info('[XComponentNdkInterfaceTest_0200] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0300
     * @tc.name      XComponentNdkInterfaceTest_0300
     * @tc.desc      Test XComponentNdkInterface
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0300] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('XComponent_setFrameRate'));
      await button.click();
      console.info("[XComponentNdkInterfaceTest_0300] click XComponent_setFrameRate");
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('XComponent_setFrameRateResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentNdkInterfaceTest_0300] setFrameRateResult is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');

      console.info('[XComponentNdkInterfaceTest_0300] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0400
     * @tc.name      XComponentNdkInterfaceTest_0400
     * @tc.desc      Test XComponentNdkInterface
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0400] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('XComponent_setFrameRate'));
      await button.click();
      console.info("[XComponentNdkInterfaceTest_0400] click XComponent_setFrameRate");
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('XComponent_setFrameRateResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentNdkInterfaceTest_0400] setFrameRateResult is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');

      console.info('[XComponentNdkInterfaceTest_0400] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0500
     * @tc.name      XComponentNdkInterfaceTest_0500
     * @tc.desc      Test XComponentNdkInterface
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0500] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('XComponent_frameCallback'));
      await button.click();
      console.info("[XComponentNdkInterfaceTest_0500] unregisterFrameCallback");
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('XComponent_unregisterFrameCallbackResult');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentNdkInterfaceTest_0500] unregisterFrameCallbackResult is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');

      await button.click();
      console.info("[XComponentNdkInterfaceTest_0500] registerFrameCallback");
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponent_registerFrameCallbackResult');
      obj = JSON.parse(strJson);
      console.info("[XComponentNdkInterfaceTest_0500] registerFrameCallbackResult is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('0');

      await CommonFunc.sleep(1000);
      console.info('[XComponentNdkInterfaceTest_0500] END');
      done();
    });

  })
}