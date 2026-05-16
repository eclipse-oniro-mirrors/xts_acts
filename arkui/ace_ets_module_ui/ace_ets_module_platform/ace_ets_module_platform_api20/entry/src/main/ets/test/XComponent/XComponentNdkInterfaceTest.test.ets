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
import nativeNode from 'libnativerender.so'

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
     * @tc.name   XComponentNdkInterfaceTest_0100
     * @tc.number XComponentNdkInterfaceTest_0100
     * @tc.desc   Test XComponentNdkInterface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   XComponentNdkInterfaceTest_0200
     * @tc.number XComponentNdkInterfaceTest_0200
     * @tc.desc   Test OH_ArkUI_XComponent_SetNeedSoftKeyboard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentNdkInterfaceTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0200] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // OH_ArkUI_XComponent_SetNeedSoftKeyboard is true
      let button = await driver.findComponent(ON.id('XComponent_setNeedSoftKeyboard'));
      await button.click();
      console.info("[XComponentNdkInterfaceTest_0200] setNeedSoftKeyboard is true");
      await CommonFunc.sleep(1000);

      // OH_ArkUI_XComponent_SetNeedSoftKeyboard is false
      button = await driver.findComponent(ON.id('XComponent_setNeedSoftKeyboard'));
      await button.click();
      console.info("[XComponentNdkInterfaceTest_0200] setNeedSoftKeyboard is false");
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('NdkInterfaceXComponent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentNdkInterfaceTest_0200] NdkInterfaceXComponent is: " + obj.$type);
      expect(obj.$type).assertEqual('XComponent');

      console.info('[XComponentNdkInterfaceTest_0200] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0300
     * @tc.name      XComponentNdkInterfaceTest_0300
     * @tc.desc      Test OH_ArkUI_XComponent_SetExpectedFrameRateRange ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0300] START');

      expect(nativeNode.TestSetExpectedFrameRateRangeErrorCode_001('NdkInterfaceXComponent')).assertEqual(0)

      console.info('[XComponentNdkInterfaceTest_0300] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0400
     * @tc.name      XComponentNdkInterfaceTest_0400
     * @tc.desc      Test OH_ArkUI_XComponent_SetExpectedFrameRateRange ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0400] START');
      
      expect(nativeNode.TestSetExpectedFrameRateRangeErrorCode_002('NdkInterfaceXComponent')).assertEqual(0)

      console.info('[XComponentNdkInterfaceTest_0400] END');
      done();
    });


    /**
     * @tc.number    XComponentNdkInterfaceTest_0500
     * @tc.name      XComponentNdkInterfaceTest_0500
     * @tc.desc      Test OH_ArkUI_XComponent_RegisterOnFrameCallback ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0500] START');

      expect(nativeNode.TestRegisterOnFrameCallbackErrorCode_001('NdkInterfaceXComponent')).assertEqual(0)

      console.info('[XComponentNdkInterfaceTest_0500] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0600
     * @tc.name      XComponentNdkInterfaceTest_0600
     * @tc.desc      Test OH_ArkUI_XComponent_RegisterOnFrameCallback ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0600] START');
      
      expect(nativeNode.TestRegisterOnFrameCallbackErrorCode_002('NdkInterfaceXComponent')).assertEqual(0)

      console.info('[XComponentNdkInterfaceTest_0600] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0700
     * @tc.name      XComponentNdkInterfaceTest_0700
     * @tc.desc      Test OH_ArkUI_XComponent_UnregisterOnFrameCallback ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0700] START');

      expect(nativeNode.TestUnregisterOnFrameCallbackErrorCode_001('NdkInterfaceXComponent')).assertEqual(0)

      console.info('[XComponentNdkInterfaceTest_0700] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0800
     * @tc.name      XComponentNdkInterfaceTest_0800
     * @tc.desc      Test OH_ArkUI_XComponent_UnregisterOnFrameCallback ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0800] START');
      
      expect(nativeNode.TestUnregisterOnFrameCallbackErrorCode_002('NdkInterfaceXComponent')).assertEqual(0)

      console.info('[XComponentNdkInterfaceTest_0800] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_0900
     * @tc.name      XComponentNdkInterfaceTest_0900
     * @tc.desc      Test OH_ArkUI_XComponent_SetNeedSoftKeyboard ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_0900] START');

      expect(nativeNode.TestSetNeedSoftKeyboardErrorCode_001('NdkInterfaceXComponent')).assertEqual(0)

      console.info('[XComponentNdkInterfaceTest_0900] END');
      done();
    });

    /**
     * @tc.number    XComponentNdkInterfaceTest_1000
     * @tc.name      XComponentNdkInterfaceTest_1000
     * @tc.desc      Test OH_ArkUI_XComponent_SetNeedSoftKeyboard ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.level     Level 1
     */
    it('XComponentNdkInterfaceTest_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentNdkInterfaceTest_1000] START');
      
      expect(nativeNode.TestSetNeedSoftKeyboardErrorCode_002('NdkInterfaceXComponent')).assertEqual(0)

      console.info('[XComponentNdkInterfaceTest_1000] END');
      done();
    });
  })
}