/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton} from '@ohos.UiTest';
import { KeyCode } from '@kit.InputKit';
import native from 'libnativerender.so'

export default function XComponentKeyMouseEventTest() {
  describe('XComponentKeyMouseEventTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentKeyMouseEventPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentKeyMouseEventPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentKeyMouseEventPage state pages:" + JSON.stringify(pages));
        if (!("XComponentKeyMouseEventPage" == pages.name)) {
          console.info("get XComponentKeyMouseEventPage pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentKeyMouseEventPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentKeyMouseEventPage page error:" + err);
      }
      console.info("XComponentKeyMouseEventPage beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("XComponentKeyMouseEventPage after each called");
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0100
     * @tc.number XComponentKeyMouseEventTest_0100
     * @tc.desc   Test XComponentKeyMouse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // ctrl + a
      await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      console.info('[XComponentKeyMouseEventTest_0100] triggerCombineKeys(CTRL, A)');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('XComponentKeyMouseEventPage_KeyStr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentKeyMouseEventTest_0100] keyStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('key: A ctrl: down');

      // shift + a
      await driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_A);
      console.info('[XComponentKeyMouseEventTest_0100] triggerCombineKeys(SHIFT, A)');
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentKeyMouseEventPage_KeyStr');
      obj = JSON.parse(strJson);
      console.info("[XComponentKeyMouseEventTest_0100] keyStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('key: A shift: down');

      // alt + a
      await driver.triggerCombineKeys(KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_A);
      console.info('[XComponentKeyMouseEventTest_0100] triggerCombineKeys(ALT, A)');
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentKeyMouseEventPage_KeyStr');
      obj = JSON.parse(strJson);
      console.info("[XComponentKeyMouseEventTest_0100] keyStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('key: A alt: down');

      console.info('[XComponentKeyMouseEventTest_0100] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0200
     * @tc.number XComponentKeyMouseEventTest_0200
     * @tc.desc   Test XComponentKeyMouse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0200] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // mouseClick + ctrl
      let xc = await driver.findComponent(ON.type('XComponent'));
      let rect = await xc.getBounds();
      let centerX = Math.round((rect.left + rect.right) / 2);
      let centerY = Math.round((rect.top + rect.bottom) / 2);
      console.info('[XComponentKeyMouseEventTest_0200] XComponent centerX: ' + centerX + ',centerY: ' + centerY);
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT, KeyCode.KEYCODE_CTRL_LEFT);
      console.info('[XComponentKeyMouseEventTest_0200] mouseClick(XComponent) and triggerKey(ctrl)');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('XComponentKeyMouseEventPage_MouseStr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentKeyMouseEventTest_0200] mouseStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('mouse: ctrl: down');

      // mouseClick + shift
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT, KeyCode.KEYCODE_SHIFT_LEFT);
      console.info('[XComponentKeyMouseEventTest_0200] mouseClick(XComponent) and triggerKey(shift)');
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentKeyMouseEventPage_MouseStr');
      obj = JSON.parse(strJson);
      console.info("[XComponentKeyMouseEventTest_0200] mouseStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('mouse: shift: down');

      // mouseClick + alt
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT, KeyCode.KEYCODE_ALT_LEFT);
      console.info('[XComponentKeyMouseEventTest_0200] mouseClick(XComponent) and triggerKey(alt)');
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentKeyMouseEventPage_MouseStr');
      obj = JSON.parse(strJson);
      console.info("[XComponentKeyMouseEventTest_0200] mouseStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('mouse: alt: down');

      console.info('[XComponentKeyMouseEventTest_0200] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0300
     * @tc.number XComponentKeyMouseEventTest_0300
     * @tc.desc   Test OH_NativeXComponent_GetExtraMouseEventInfo ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0300', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0300] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetExtraMouseEventInfoErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_0300] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0400
     * @tc.number XComponentKeyMouseEventTest_0400
     * @tc.desc   Test OH_NativeXComponent_GetExtraMouseEventInfo ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0400', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0400] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetExtraMouseEventInfoErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_0400] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0500
     * @tc.number XComponentKeyMouseEventTest_0500
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0500', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0500] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetMouseEventModifierKeyStatesErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_0500] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0600
     * @tc.number XComponentKeyMouseEventTest_0600
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0600', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0600] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetMouseEventModifierKeyStatesErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_0600] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0700
     * @tc.number XComponentKeyMouseEventTest_0700
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0700', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0700] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetKeyEventModifierKeyStatesErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_0700] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0800
     * @tc.number XComponentKeyMouseEventTest_0800
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0800', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0800] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetKeyEventModifierKeyStatesErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_0800] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_0900
     * @tc.number XComponentKeyMouseEventTest_0900
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_0900', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_0900] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetKeyEventNumLockStateErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_0900] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_1000
     * @tc.number XComponentKeyMouseEventTest_1000
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1000', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1000] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetKeyEventNumLockStateErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1000] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_1100
     * @tc.number XComponentKeyMouseEventTest_1100
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1100', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1100] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetKeyEventCapsLockStateErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1100] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_1200
     * @tc.number XComponentKeyMouseEventTest_1200
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1200', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1200] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetKeyEventCapsLockStateErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1200] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_1300
     * @tc.number XComponentKeyMouseEventTest_1300
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1300', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1300] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetKeyEventScrollLockStateErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1300] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_1400
     * @tc.number XComponentKeyMouseEventTest_1400
     * @tc.desc   Test OH_NativeXComponent_GetMouseEventModifierKeyStates ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1400', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1400] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetKeyEventScrollLockStateErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1400] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_1500
     * @tc.number XComponentKeyMouseEventTest_1500
     * @tc.desc   Test OH_NativeXComponent_RegisterKeyEventCallbackWithResult ErrorCode: OH_NATIVEXCOMPONENT_RESULT_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1500', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1500] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestRegisterKeyEventCallbackWithResult_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1500] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_1600
     * @tc.number XComponentKeyMouseEventTest_1600
     * @tc.desc   Test OH_NativeXComponent_RegisterKeyEventCallbackWithResult ErrorCode: OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1600', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1600] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestRegisterKeyEventCallbackWithResult_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1600] END');
      done();
    });
    
    /**
     * @tc.name   XComponentKeyMouseEventTest_1700
     * @tc.number XComponentKeyMouseEventTest_1700
     * @tc.desc   Test ErrorCode: OH_NATIVEXCOMPONENT_RESULT_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1700', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1700] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetTouchPointErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1700] END');
      done();
    });


    /**
     * @tc.name   XComponentKeyMouseEventTest_1800
     * @tc.number XComponentKeyMouseEventTest_1800
     * @tc.desc   Test ErrorCode: OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1800', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1800] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetTouchPointErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1800] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_1900
     * @tc.number XComponentKeyMouseEventTest_1900
     * @tc.desc   Test OH_NativeXComponent_RegisterUIInputEventCallback ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_1900', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_1900] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestRegisterUIInputEventCallbackErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_1900] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_2000
     * @tc.number XComponentKeyMouseEventTest_2000
     * @tc.desc   Test OH_NativeXComponent_RegisterUIInputEventCallback ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_2000', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_2000] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestRegisterUIInputEventCallbackErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_2000] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_2100
     * @tc.number XComponentKeyMouseEventTest_2100
     * @tc.desc   Test OH_NativeXComponent_RegisterOnTouchInterceptCallback ErrorCode: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_2100', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_2100] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestRegisterOnTouchInterceptCallbackErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_2100] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_2200
     * @tc.number XComponentKeyMouseEventTest_2200
     * @tc.desc   Test OH_NativeXComponent_RegisterOnTouchInterceptCallback ErrorCode: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_2200', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_2200] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestRegisterOnTouchInterceptCallbackErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_2200] END');
      done();
    });

   /**
     * @tc.name   XComponentKeyMouseEventTest_2300
     * @tc.number XComponentKeyMouseEventTest_2300
     * @tc.desc   Test OH_NativeXComponent_GetNativeAccessibilityProvider ErrorCode: OH_NATIVEXCOMPONENT_RESULT_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_2300', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_2300] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetNativeAccessibilityProviderErrorCode_01()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_2300] END');
      done();
    });

    /**
     * @tc.name   XComponentKeyMouseEventTest_2400
     * @tc.number XComponentKeyMouseEventTest_2400
     * @tc.desc   Test OH_NativeXComponent_GetNativeAccessibilityProvider ErrorCode: OH_NATIVEXCOMPONENT_RESULT_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('XComponentKeyMouseEventTest_2400', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseEventTest_2400] START');
      await CommonFunc.sleep(1000);

      // 
      expect(native.TestGetNativeAccessibilityProviderErrorCode_02()).assertEqual(0);
      
      console.info('[XComponentKeyMouseEventTest_2400] END');
      done();
    });
    
  })
}