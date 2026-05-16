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

import { expect,afterEach, beforeAll, describe, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect,MouseButton } from '@ohos.UiTest';
import nativeFunc from 'libnativefunc.so'
import {
  InputEventTestFunctionData,
  InputEventTestFunctionStaticData
} from '../../MainAbility/pages/inputevent/InputEventTest';
import nativeRender from 'libnativerender.so'

async function MouseClickComponent(id: string, mouseButton: MouseButton , done?: Function) {
  let driver = Driver.create();
  let button = await driver.findComponent(ON.id(id));
  let point = await button.getBounds();
  await driver.mouseClick({x:point.left+10, y:point.top+10}, mouseButton);
}

async function mouseButtonInputEventTest(testCase: string, funcName: string, mouseButton: MouseButton,
  isAssertEqual: boolean = false, expectedValue: number = 1) {
  let PAGE_TAG = 'InputEventTest';
  let option = new InputEventTestFunctionData(testCase, funcName);
  await Utils.pushPageByParams(`inputevent/${PAGE_TAG}`, option);
  InputEventTestFunctionStaticData.pageTag = testCase;
  InputEventTestFunctionStaticData.funcName = funcName;
  await Utils.clickComponent('mouseButtonCallInputEvent');
  await Utils.sleep(300);
  await MouseClickComponent('buttonMouse', mouseButton);
  let state = nativeRender.getEventState();
  console.log('InputEventTest mouseButtonInputEventTest testCase:',testCase, 'funcName:', funcName, 'state:', state,'expectedValue:',expectedValue);  
  expect(state).assertEqual(expectedValue);
}

async function axisInputEventTest(testCase: string, funcName: string, isAssertEqual: boolean = false,
  expectedValue: number = 1) {
  let PAGE_TAG = 'InputEventAxisTest';
  let option = new InputEventTestFunctionData(testCase, funcName);
  await Utils.pushPageByParams(`inputevent/${PAGE_TAG}`, option);
  InputEventTestFunctionStaticData.pageTag = testCase;
  InputEventTestFunctionStaticData.funcName = funcName;
  await Utils.clickComponent('axisCallInputEvent');
  await Utils.sleep(300);
  let driver = await Driver.create()
  let rect = Utils.getComponentRect("AxisID");
  let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
  let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
  await driver.mouseScroll({x:x, y:y}, true, 30); 
  await Utils.sleep(1000);
  let state = nativeRender.getEventState();
  console.log('InputEventTest mouseButtonInputEventTest testCase:',testCase, 'funcName:', funcName, 'state:', state,'expectedValue:',expectedValue);  
  expect(state).assertEqual(expectedValue);
}

async function fingerTouchInputEventTest(testCase: string, funcName: string, isAssertEqual: boolean = false,
  expectedValue: number = 1) {
  let PAGE_TAG = 'InputEventTest';
  let option = new InputEventTestFunctionData(testCase, funcName);
  await Utils.pushPageByParams(`inputevent/${PAGE_TAG}`, option);
  InputEventTestFunctionStaticData.pageTag = testCase;
  InputEventTestFunctionStaticData.funcName = funcName;
  await Utils.clickComponent('mouseButtonCallInputEvent');
  let driver = Driver.create()
  let rect = Utils.getComponentRect('textTouch');
  let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
  let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
  let pointers: PointerMatrix = PointerMatrix.create(2,2);
  pointers.setPoint(0,0,{x: Math.round(x),y: Math.round(y)});
  pointers.setPoint(0,1,{x: Math.round(y),y: Math.round(y + vp2px(20))});
  pointers.setPoint(1,0,{x: Math.round(x),y: Math.round(y)});
  pointers.setPoint(1,1,{x: Math.round(x),y: Math.round(y + vp2px(20))}); 
  await driver.injectMultiPointerAction(pointers);
  await Utils.sleep(300);
  let state = nativeRender.getEventState();
  console.log('InputEventTest mouseButtonInputEventTest testCase:',testCase, 'funcName:', funcName, 'state:', state,'expectedValue:',expectedValue);  
  expect(state).assertEqual(expectedValue);
}

export default function InputEventTest() {

  describe('InputEventTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })
    /**
     * @tc.name   testInputEvent001
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_001
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetType for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent001', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent001', 'OH_ArkUI_UIInputEvent_GetType',
        MouseButton.MOUSE_BUTTON_RIGHT, true, 3);
      done();
    });
    /**
     * @tc.name   testInputEvent002
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_002
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetAction for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent002', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent002', 'OH_ArkUI_UIInputEvent_GetAction',
        MouseButton.MOUSE_BUTTON_RIGHT, true, 2);
      done();
    });
    /**
     * @tc.name   testInputEvent003
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_003
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetSourceType for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent003', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent003', 'OH_ArkUI_UIInputEvent_GetSourceType',
        MouseButton.MOUSE_BUTTON_RIGHT, true, 1);
      done();
    });
    /**
     * @tc.name   testInputEvent004
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_004
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetToolType for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent004', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent004', 'OH_ArkUI_UIInputEvent_GetToolType',
        MouseButton.MOUSE_BUTTON_RIGHT, true, 3);
      let state = nativeRender.getEventState();
      done();
    });
    /**
     * @tc.name   testInputEvent005
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_005
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetEventTime for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent005', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent005', 'OH_ArkUI_UIInputEvent_GetEventTime',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent006
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_006
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPointerCount for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent006', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent006', 'OH_ArkUI_PointerEvent_GetPointerCount',
        MouseButton.MOUSE_BUTTON_RIGHT,true, 1);
      done();
    });
    /**
     * @tc.name   testInputEvent007
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_007
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPointerId for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent007', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent007', 'OH_ArkUI_PointerEvent_GetPointerId',
        MouseButton.MOUSE_BUTTON_RIGHT,true, 0);
      done();
    });
    /**
     * @tc.name   testInputEvent008
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_008
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetX for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent008', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent008', 'OH_ArkUI_PointerEvent_GetX',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent009
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_009
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetXByIndex for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent009', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent009', 'OH_ArkUI_PointerEvent_GetXByIndex',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent010
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_010
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetY for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent010', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent010', 'OH_ArkUI_PointerEvent_GetY',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent011
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_011
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetYByIndex for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent011', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent011', 'OH_ArkUI_PointerEvent_GetYByIndex',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent012
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_012
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowX for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent012', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent012', 'OH_ArkUI_PointerEvent_GetWindowX',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent013
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_013
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowXByIndex for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent013', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent013', 'OH_ArkUI_PointerEvent_GetWindowXByIndex',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent014
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_014
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowY for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent014', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent014', 'OH_ArkUI_PointerEvent_GetWindowY',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent015
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_015
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowYByIndex for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent015', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent015', 'OH_ArkUI_PointerEvent_GetWindowYByIndex',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent016
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_016
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayX for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent016', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent016', 'OH_ArkUI_PointerEvent_GetDisplayX',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent017
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_017
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayXByIndex for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent017', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent017', 'OH_ArkUI_PointerEvent_GetDisplayXByIndex',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent018
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_018
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayY for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent018', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent018', 'OH_ArkUI_PointerEvent_GetDisplayY',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent019
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_019
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayYByIndex for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent019', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent019', 'OH_ArkUI_PointerEvent_GetDisplayYByIndex',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent020
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_020
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPressure for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent020', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent020', 'OH_ArkUI_PointerEvent_GetPressure',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent021
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_021
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTiltX for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent021', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent021', 'OH_ArkUI_PointerEvent_GetTiltX',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent022
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_022
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTiltY for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent022', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent022', 'OH_ArkUI_PointerEvent_GetTiltY',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent023
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_023
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTouchAreaWidth for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent023', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent023', 'OH_ArkUI_PointerEvent_GetTouchAreaWidth',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent024
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_024
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTouchAreaHeight for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent024', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent024', 'OH_ArkUI_PointerEvent_GetTouchAreaHeight',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent025
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_025
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistorySize for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent025', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent025', 'OH_ArkUI_PointerEvent_GetHistorySize',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent026
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_026
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryEventTime for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent026', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent026', 'OH_ArkUI_PointerEvent_GetHistoryEventTime',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent027
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_027
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPointerCount for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent027', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent027', 'OH_ArkUI_PointerEvent_GetHistoryPointerCount',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent028
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_028
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPointerId for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent028', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent028', 'OH_ArkUI_PointerEvent_GetHistoryPointerId',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent029
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_029
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryX for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent029', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent029', 'OH_ArkUI_PointerEvent_GetHistoryX',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent030
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_030
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryY for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent030', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent030', 'OH_ArkUI_PointerEvent_GetHistoryY',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent031
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_031
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryWindowX for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent031', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent031', 'OH_ArkUI_PointerEvent_GetHistoryWindowX',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent032
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_032
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryWindowY for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent032', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent032', 'OH_ArkUI_PointerEvent_GetHistoryWindowY',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent033
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_033
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryDisplayX for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent033', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent033', 'OH_ArkUI_PointerEvent_GetHistoryDisplayX',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent034
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_034
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryDisplayY for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent034', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent034', 'OH_ArkUI_PointerEvent_GetHistoryDisplayY',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent035
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_035
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPressure for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent035', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent035', 'OH_ArkUI_PointerEvent_GetHistoryPressure',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent036
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_036
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTiltX for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent036', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent036', 'OH_ArkUI_PointerEvent_GetHistoryTiltX',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent037
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_037
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTiltY for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent037', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent037', 'OH_ArkUI_PointerEvent_GetHistoryTiltY',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent038
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_038
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent038', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent038', 'OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent039
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_039
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight for mouse click  button
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent039', Level.LEVEL1, async (done: Function) => {
      await mouseButtonInputEventTest('testInputEvent039', 'OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight',
        MouseButton.MOUSE_BUTTON_RIGHT);
      done();
    });
    /**
     * @tc.name   testInputEvent040
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_040
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetType for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent040', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent040', 'OH_ArkUI_UIInputEvent_GetType', true,
        1); //ARKUI_UIINPUTEVENT_TYPE_TOUCH
      done();
    });
    /**
     * @tc.name   testInputEvent041
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_041
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetAction for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent041', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent041', 'OH_ArkUI_UIInputEvent_GetAction', true, 3); //CANCEL
      done();
    });
    /**
     * @tc.name   testInputEvent042
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_042
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetSourceType for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent042', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent042', 'OH_ArkUI_UIInputEvent_GetSourceType', true, 2); //TOUCH
      done();
    });
    /**
     * @tc.name   testInputEvent043
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_043
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetToolType for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent043', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent043', 'OH_ArkUI_UIInputEvent_GetToolType', true,
        1); //ARKUI_UIINPUTEVENT_TYPE_TOUCH
      done();
    });
    /**
     * @tc.name   testInputEvent044
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_044
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetEventTime for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent044', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent044', 'OH_ArkUI_UIInputEvent_GetEventTime');
      done();
    });
    /**
     * @tc.name   testInputEvent045
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_045
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPointerCount for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent045', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent045', 'OH_ArkUI_PointerEvent_GetPointerCount', true);
      done();
    });
    /**
     * @tc.name   testInputEvent046
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_046
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPointerId for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent046', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent046', 'OH_ArkUI_PointerEvent_GetPointerId', true);
      done();
    });
    /**
     * @tc.name   testInputEvent047
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_047
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetX for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent047', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent047', 'OH_ArkUI_PointerEvent_GetX', true);
      done();
    });
    /**
     * @tc.name   testInputEvent048
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_048
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetXByIndex for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent048', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent048', 'OH_ArkUI_PointerEvent_GetXByIndex', true);
      done();
    });
    /**
     * @tc.name   testInputEvent049
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_049
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetY for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent049', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent049', 'OH_ArkUI_PointerEvent_GetY', true);
      done();
    });
    /**
     * @tc.name   testInputEvent050
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_050
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetYByIndex for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent050', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent050', 'OH_ArkUI_PointerEvent_GetYByIndex', true);
      done();
    });
    /**
     * @tc.name   testInputEvent051
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_051
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowX for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent051', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent051', 'OH_ArkUI_PointerEvent_GetWindowX', true);
      done();
    });
    /**
     * @tc.name   testInputEvent052
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_052
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowXByIndex for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent052', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent052', 'OH_ArkUI_PointerEvent_GetWindowXByIndex', true);
      done();
    });
    /**
     * @tc.name   testInputEvent053
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_053
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowY for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent053', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent053', 'OH_ArkUI_PointerEvent_GetWindowY', true);
      done();
    });
    /**
     * @tc.name   testInputEvent054
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_054
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowYByIndex for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent054', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent054', 'OH_ArkUI_PointerEvent_GetWindowYByIndex', true);
      done();
    });
    /**
     * @tc.name   testInputEvent055
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_055
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayX for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent055', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent055', 'OH_ArkUI_PointerEvent_GetDisplayX', true);
      done();
    });
    /**
     * @tc.name   testInputEvent056
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_056
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayXByIndex for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent056', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent056', 'OH_ArkUI_PointerEvent_GetDisplayXByIndex', true);
      done();
    });
    /**
     * @tc.name   testInputEvent057
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_057
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayY for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent057', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent057', 'OH_ArkUI_PointerEvent_GetDisplayY', true);
      done();
    });
    /**
     * @tc.name   testInputEvent058
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_058
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayYByIndex for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent058', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent058', 'OH_ArkUI_PointerEvent_GetDisplayYByIndex', true);
      done();
    });
    /**
     * @tc.name   testInputEvent059
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_059
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPressure for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent059', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent059', 'OH_ArkUI_PointerEvent_GetPressure', true);
      done();
    });
    /**
     * @tc.name   testInputEvent060
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_060
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTiltX for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent060', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent060', 'OH_ArkUI_PointerEvent_GetTiltX', true);
      done();
    });
    /**
     * @tc.name   testInputEvent061
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_061
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTiltY for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent061', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent061', 'OH_ArkUI_PointerEvent_GetTiltY', true);
      done();
    });
    /**
     * @tc.name   testInputEvent062
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_062
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTouchAreaWidth for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent062', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent062', 'OH_ArkUI_PointerEvent_GetTouchAreaWidth', true);
      done();
    });
    /**
     * @tc.name   testInputEvent063
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_063
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTouchAreaHeight for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent063', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent063', 'OH_ArkUI_PointerEvent_GetTouchAreaHeight', true);
      done();
    });
    /**
     * @tc.name   testInputEvent064
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_064
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistorySize for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent064', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent064', 'OH_ArkUI_PointerEvent_GetHistorySize', true);
      done();
    });
    /**
     * @tc.name   testInputEvent065
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_065
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryEventTime for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent065', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent065', 'OH_ArkUI_PointerEvent_GetHistoryEventTime', true);
      done();
    });
    /**
     * @tc.name   testInputEvent066
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_066
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPointerCount for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent066', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent066', 'OH_ArkUI_PointerEvent_GetHistoryPointerCount', true);
      done();
    });
    /**
     * @tc.name   testInputEvent067
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_067
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPointerId for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent067', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent067', 'OH_ArkUI_PointerEvent_GetHistoryPointerId', true);
      done();
    });
    /**
     * @tc.name   testInputEvent068
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_068
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryX for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent068', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent068', 'OH_ArkUI_PointerEvent_GetHistoryX', true);
      done();
    });
    /**
     * @tc.name   testInputEvent069
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_069
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryY for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent069', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent069', 'OH_ArkUI_PointerEvent_GetHistoryY', true);
      done();
    });
    /**
     * @tc.name   testInputEvent070
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_070
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryWindowX for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent070', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent070', 'OH_ArkUI_PointerEvent_GetHistoryWindowX', true);
      done();
    });
    /**
     * @tc.name   testInputEvent071
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_071
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryWindowY for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent071', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent071', 'OH_ArkUI_PointerEvent_GetHistoryWindowY', true);
      done();
    });
    /**
     * @tc.name   testInputEvent072
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_072
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryDisplayX for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent072', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent072', 'OH_ArkUI_PointerEvent_GetHistoryDisplayX', true);
      done();
    });
    /**
     * @tc.name   testInputEvent073
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_073
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryDisplayY for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent073', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent073', 'OH_ArkUI_PointerEvent_GetHistoryDisplayY', true);
      done();
    });
    /**
     * @tc.name   testInputEvent074
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_074
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPressure for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent074', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent074', 'OH_ArkUI_PointerEvent_GetHistoryPressure', true);
      done();
    });
    /**
     * @tc.name   testInputEvent075
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_075
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTiltX for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent075', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent075', 'OH_ArkUI_PointerEvent_GetHistoryTiltX', true);
      done();
    });
    /**
     * @tc.name   testInputEvent076
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_076
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTiltY for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent076', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent076', 'OH_ArkUI_PointerEvent_GetHistoryTiltY', true);
      done();
    });
    /**
     * @tc.name   testInputEvent077
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_077
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent077', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent077', 'OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth', true);
      done();
    });
    /**
     * @tc.name   testInputEvent078
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_078
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight for finger touch input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent078', Level.LEVEL1, async (done: Function) => {
      await fingerTouchInputEventTest('testInputEvent078', 'OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight', true);
      done();
    });
    /**
     * @tc.name   testInputEvent079
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_079
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetType for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent079', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent079', 'OH_ArkUI_UIInputEvent_GetType', true,
        2); //ARKUI_UIINPUTEVENT_TYPE_AXIS
      done();
    });
    /**
     * @tc.name   testInputEvent080
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_080
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetAction for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent080', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent080', 'OH_ArkUI_UIInputEvent_GetAction', true,
        3); // AXIS_EVENT_ACTION_END
      done();
    });
    /**
     * @tc.name   testInputEvent081
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_081
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetSourceType for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent081', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent081', 'OH_ArkUI_UIInputEvent_GetSourceType', true, 1); //MOUSE
      done();
    });
    /**
     * @tc.name   testInputEvent082
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_082
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetToolType for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent082', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent082',
        'OH_ArkUI_UIInputEvent_GetToolType', true, 3); // Failed to get tool type,return RUBBER = 3, which is not correct
      done();
    });
    /**
     * @tc.name   testInputEvent083
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_083
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetEventTime for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent083', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent083', 'OH_ArkUI_UIInputEvent_GetEventTime');
      done();
    });
    /**
     * @tc.name   testInputEvent084
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_084
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPointerCount for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent084', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent084', 'OH_ArkUI_PointerEvent_GetPointerCount');
      done();
    });
    /**
     * @tc.name   testInputEvent085
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_085
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPointerId for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent085', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent085', 'OH_ArkUI_PointerEvent_GetPointerId', true, 0);
      done();
    });
    /**
     * @tc.name   testInputEvent086
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_086
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetX for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent086', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent086', 'OH_ArkUI_PointerEvent_GetX');
      done();
    });
    /**
     * @tc.name   testInputEvent087
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_087
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetXByIndex for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent087', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent087', 'OH_ArkUI_PointerEvent_GetXByIndex');
      done();
    });
    /**
     * @tc.name   testInputEvent088
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_088
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetY for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent088', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent088', 'OH_ArkUI_PointerEvent_GetY');
      done();
    });
    /**
     * @tc.name   testInputEvent089
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_089
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetYByIndex for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent089', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent089', 'OH_ArkUI_PointerEvent_GetYByIndex');
      done();
    });
    /**
     * @tc.name   testInputEvent090
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_090
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowX for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent090', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent090', 'OH_ArkUI_PointerEvent_GetWindowX');
      done();
    });
    /**
     * @tc.name   testInputEvent091
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_091
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowXByIndex for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent091', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent091', 'OH_ArkUI_PointerEvent_GetWindowXByIndex');
      done();
    });
    /**
     * @tc.name   testInputEvent092
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_092
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowY for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent092', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent092', 'OH_ArkUI_PointerEvent_GetWindowY');
      done();
    });
    /**
     * @tc.name   testInputEvent093
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_093
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowYByIndex for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent093', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent093', 'OH_ArkUI_PointerEvent_GetWindowYByIndex');
      done();
    });
    /**
     * @tc.name   testInputEvent094
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_094
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayX for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent094', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent094', 'OH_ArkUI_PointerEvent_GetDisplayX');
      done();
    });
    /**
     * @tc.name   testInputEvent095
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_095
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayXByIndex for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent095', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent095', 'OH_ArkUI_PointerEvent_GetDisplayXByIndex');
      done();
    });
    /**
     * @tc.name   testInputEvent096
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_096
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayY for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent096', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent096', 'OH_ArkUI_PointerEvent_GetDisplayY');
      done();
    });
    /**
     * @tc.name   testInputEvent097
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_097
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayYByIndex for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent097', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent097', 'OH_ArkUI_PointerEvent_GetDisplayYByIndex');
      done();
    });
    /**
     * @tc.name   testInputEvent098
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_098
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPressure for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent098', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent098', 'OH_ArkUI_PointerEvent_GetPressure');
      done();
    });
    /**
     * @tc.name   testInputEvent099
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_099
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTiltX for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent099', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent099', 'OH_ArkUI_PointerEvent_GetTiltX');
      done();
    });
    /**
     * @tc.name   testInputEvent100
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_100
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTiltY for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent100', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent100', 'OH_ArkUI_PointerEvent_GetTiltY');
      done();
    });
    /**
     * @tc.name   testInputEvent101
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_101
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTouchAreaWidth for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent101', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent101', 'OH_ArkUI_PointerEvent_GetTouchAreaWidth');
      done();
    });
    /**
     * @tc.name   testInputEvent102
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_102
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTouchAreaHeight for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent102', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent102', 'OH_ArkUI_PointerEvent_GetTouchAreaHeight');
      done();
    });
    /**
     * @tc.name   testInputEvent103
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_103
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistorySize for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent103', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent103', 'OH_ArkUI_PointerEvent_GetHistorySize');
      done();
    });
    /**
     * @tc.name   testInputEvent104
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_104
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryEventTime for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent104', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent104', 'OH_ArkUI_PointerEvent_GetHistoryEventTime');
      done();
    })
    /**
     * @tc.name   testInputEvent105
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_105
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPointerCount for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent105', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent105', 'OH_ArkUI_PointerEvent_GetHistoryPointerCount');
      done();
    })
    /**
     * @tc.name   testInputEvent106
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_106
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPointerId for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent106', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent106', 'OH_ArkUI_PointerEvent_GetHistoryPointerId');
      done();
    })
    /**
     * @tc.name   testInputEvent107
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_107
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryX for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent107', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent107', 'OH_ArkUI_PointerEvent_GetHistoryX');
      done();
    })
    /**
     * @tc.name   testInputEvent108
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_108
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryY for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent108', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent108', 'OH_ArkUI_PointerEvent_GetHistoryY');
      done();
    })
    /**
     * @tc.name   testInputEvent109
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_109
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryWindowX for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent109', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent109', 'OH_ArkUI_PointerEvent_GetHistoryWindowX');
      done();
    })
    /**
     * @tc.name   testInputEvent110
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_110
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryWindowY for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent110', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent110', 'OH_ArkUI_PointerEvent_GetHistoryWindowY');
      done();
    })
    /**
     * @tc.name   testInputEvent111
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_111
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryDisplayX for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent111', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent111', 'OH_ArkUI_PointerEvent_GetHistoryDisplayX');
      done();
    })
    /**
     * @tc.name   testInputEvent112
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_112
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryDisplayY for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent112', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent112', 'OH_ArkUI_PointerEvent_GetHistoryDisplayY');
      done();
    })
    /**
     * @tc.name   testInputEvent113
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_113
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPressure for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent113', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent113', 'OH_ArkUI_PointerEvent_GetHistoryPressure');
      done();
    })
    /**
     * @tc.name   testInputEvent114
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_114
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTiltX for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent114', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent114', 'OH_ArkUI_PointerEvent_GetHistoryTiltX');
      done();
    })
    /**
     * @tc.name   testInputEvent115
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_115
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTiltY for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent115', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent115', 'OH_ArkUI_PointerEvent_GetHistoryTiltY');
      done();
    })
    /**
     * @tc.name   testInputEvent116
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_116
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent116', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent116', 'OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth');
      done();
    })
    /**
     * @tc.name   testInputEvent117
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_117
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent117', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent117', 'OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight');
      done();
    })
    /**
     * @tc.name   testInputEvent118
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_118
     * @tc.desc   testing OH_ArkUI_AxisEvent_GetVerticalAxisValue for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent118', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent118', 'OH_ArkUI_AxisEvent_GetVerticalAxisValue');
      done();
    })
    /**
     * @tc.name   testInputEvent119
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_119
     * @tc.desc   testing OH_ArkUI_AxisEvent_GetHorizontalAxisValue for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent119', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent119', 'OH_ArkUI_AxisEvent_GetHorizontalAxisValue');
      done();
    })
    /**
     * @tc.name   testInputEvent120
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_120
     * @tc.desc   testing OH_ArkUI_AxisEvent_GetPinchAxisScaleValue for axis input event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent120', Level.LEVEL1, async (done: Function) => {
      await axisInputEventTest('testInputEvent120', 'OH_ArkUI_AxisEvent_GetPinchAxisScaleValue');
      done();
    })
    /**
     * @tc.name   testInputEvent121
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_121
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetType function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent121', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent121()).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testInputEvent122
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_122
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetAction function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent122', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent122()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent123
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_123
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetSourceType function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent123', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent123()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent124
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_124
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetToolType function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent124', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent124()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent125
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_125
     * @tc.desc   testing OH_ArkUI_UIInputEvent_GetEventTime function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent125', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent125()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent126
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_126
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPointerCount function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent126', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent126()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent127
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_127
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPointerId function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent127', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent127()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent128
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_128
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetX function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent128', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent128()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent129
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_129
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetXByIndex function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent129', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent129()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent130
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_130
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetY function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent130', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent130()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent131
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_131
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetYByIndex function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent131', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent131()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent132
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_132
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowX function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent132', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent132()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent133
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_133
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowXByIndex function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent133', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent133()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent134
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_134
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowY function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent134', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent134()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent135
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_135
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetWindowYByIndex function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent135', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent135()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent136
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_136
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayX function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent136', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent136()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent137
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_137
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayXByIndex function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent137', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent137()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent138
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_138
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayY function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent138', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent138()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent139
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_139
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetDisplayYByIndex function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent139', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent139()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent140
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_140
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetPressure function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent140', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent140()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent141
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_141
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTiltX function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent141', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent141()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent142
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_142
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTiltY function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent142', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent142()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent143
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_143
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTouchAreaWidth function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent143', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent143()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent144
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_144
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetTouchAreaHeight function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent144', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent144()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent145
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_145
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistorySize function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent145', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent145()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent146
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_146
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryEventTime function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent146', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent146()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent147
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_147
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPointerCount function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent147', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent147()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent148
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_148
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPointerId function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent148', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent148()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent149
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_149
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryX function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent149', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent149()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent150
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_150
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryY function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent150', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent150()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent151
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_151
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryWindowX function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent151', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent151()).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testInputEvent152
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_152
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryWindowY function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent152', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent152()).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testInputEvent153
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_153
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryDisplayX function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent153', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent153()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent154
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_154
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryDisplayY function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent154', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent154()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent155
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_155
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryPressure function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent155', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent155()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent156
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_156
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTiltX function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent156', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent156()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent157
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_157
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTiltY function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent157', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent157()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent158
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_158
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent158', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent158()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent159
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_159
     * @tc.desc   testing OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent159', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent159()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent160
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_160
     * @tc.desc   testing OH_ArkUI_AxisEvent_GetVerticalAxisValue function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent160', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent160()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent161
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_161
     * @tc.desc   testing OH_ArkUI_AxisEvent_GetHorizontalAxisValue function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent161', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent161()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent162
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_162
     * @tc.desc   testing OH_ArkUI_AxisEvent_GetPinchAxisScaleValue function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent162', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent162()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent163
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_163
     * @tc.desc   testing OH_ArkUI_PointerEvent_SetInterceptHitTestMode function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent163', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent163()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent164
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_164
     * @tc.desc   testing OH_ArkUI_MouseEvent_GetMouseButton function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent164', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent164()).assertEqual(0);
      done()
    });

    /**
     * @tc.name   testInputEvent165
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_165
     * @tc.desc   testing OH_ArkUI_MouseEvent_GetMouseAction function abnormal parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent165', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testInputEvent165()).assertEqual(0);
      done()
    });
    /**
     * @tc.name   testInputEvent166
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_166
     * @tc.desc   testing Right Mouse button for GetMouseButton and GetMouseAction sequence of Press and Release.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent166', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'InputEventMouseTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseRightTest', MouseButton.MOUSE_BUTTON_RIGHT);
      await Utils.sleep(1000);
      // When mouse button is RIGHT_MOUSE_BUTTON and mouse action sequence is MOUSE_PRESSED then MOUSE_RELEASE
      // component 'onMouseRightTest' backgroundColor will change to '#FFFFFF00'. Assert the backgroundColor.
      expect(Utils.getComponentInfoByKey('onMouseRightTest').$attrs.backgroundColor).assertEqual('#FFFFFF00');
      await Utils.sleep(2000);
      done()
    });

    /**
     * @tc.name   testInputEvent167
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_167
     * @tc.desc   testing Input Event of Left Mouse button for GetMouseButton.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent167', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'InputEventMouseTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseLeftTest',MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(1000);
      // When mouse button is LEFT_MOUSE_BUTTON and mouse action is MOUSE_PRESSED,
      // component 'onMouseLeftTest' backgroundColor will change to '#FFFF11FF'. Assert the backgroundColor.
      expect(Utils.getComponentInfoByKey('onMouseLeftTest').$attrs.backgroundColor).assertEqual('#FFFF11FF');
      await Utils.sleep(2000);
      done()
    });
    /**
     * @tc.name   testInputEvent168
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_168
     * @tc.desc   testing Input Event of Middle Mouse button for GetMouseButton.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent168', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'InputEventMouseTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseMiddleTest',MouseButton.MOUSE_BUTTON_MIDDLE);
      await Utils.sleep(1000);
      // When mouse button is MIDDLE_MOUSE_BUTTON and mouse action is MOUSE_PRESSED,
      // component 'onMouseMiddleTest' backgroundColor will change to '#FFFFC0CB'. Assert the backgroundColor.      
      expect(Utils.getComponentInfoByKey('onMouseMiddleTest').$attrs.backgroundColor).assertEqual('#FFFFC0CB');
      await Utils.sleep(2000);
      done()
    });

    /**
     * @tc.name   testInputEvent169
     * @tc.number SUB_ARKUI_CAPI_INPUT_EVENT_169
     * @tc.desc   testing Input Event of Mouse movement for GetMouseAction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInputEvent169', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'InputEventMouseTest';
      await Utils.pushPage(`inputevent/${PAGE_TAG}`);
      await MouseClickComponent('onMouseMoveTest',MouseButton.MOUSE_BUTTON_LEFT);
      await Utils.sleep(1000);
      // When mouse action is MOUSE_MOVEMENT,
      // component 'onMouseMoveTest' backgroundColor will change to '#FF000000'. Assert the backgroundColor.          
      expect(Utils.getComponentInfoByKey('onMouseMoveTest').$attrs.backgroundColor).assertEqual('#FF000000');
      await Utils.sleep(2000);
      done()
    });

  })
}
