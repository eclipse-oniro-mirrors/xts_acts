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
import window from '@ohos.window';
import display from '@ohos.display';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import deviceInfo from '@ohos.deviceInfo';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

export default function windowPropertiesTest3() {
  describe('windowPropertiesTest3', () => {
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let mainWindowClass: window.Window;
    let deviceType: string = deviceInfo.deviceType;
    let isSyscapSessionManagerSupported: boolean = false;
    let windowRect: window.Rect;

    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.info('windowPropertiesTest3 context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      mainWindowClass = windowStage.getMainWindowSync();

      console.info(`deviceType: ${deviceType}`);

      isSyscapSessionManagerSupported = canIUse('SystemCapability.Window.SessionManager');
      console.info(`isSyscapSessionManagerSupported: ${isSyscapSessionManagerSupported}`);

      windowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`windowRect: ${JSON.stringify(windowRect)}`);
    });

    beforeEach(() => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    // ==================== setTouchableAreas 测试用例 ====================

    /**
     * @tc.name   testSetTouchableAreas_singleRect
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0100
     * @tc.desc   设置单个可触摸区域，验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTouchableAreas_singleRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testSetTouchableAreas_singleRect';
      let currentWindowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`${message} currentWindowRect: ${JSON.stringify(currentWindowRect)}`);
      
      let rectWidth = Math.floor(currentWindowRect.width / 3);
      let rectHeight = Math.floor(currentWindowRect.height / 3);
      let rectLeft = Math.floor(currentWindowRect.width / 3);
      let rectTop = Math.floor(currentWindowRect.height / 3);
      
      let touchableRects: Array<window.Rect> = [
        { left: rectLeft, top: rectTop, width: rectWidth, height: rectHeight }
      ];
      console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
      
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_multipleRects
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0200
     * @tc.desc   设置多个可触摸区域（3个），验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_multipleRects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_multipleRects';
      let currentWindowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`${message} currentWindowRect: ${JSON.stringify(currentWindowRect)}`);
      
      let touchableRects: Array<window.Rect> = [
        { 
          left: Math.floor(currentWindowRect.width / 3),
          top: Math.floor(currentWindowRect.height / 3),
          width: Math.floor(currentWindowRect.width / 3),
          height: Math.floor(currentWindowRect.height / 3)
        },
        { 
          left: 0,
          top: Math.floor(currentWindowRect.height / 6),
          width: Math.floor(currentWindowRect.width / 4),
          height: Math.floor(currentWindowRect.height / 3)
        },
        { 
          left: Math.floor(currentWindowRect.width * 2 / 3),
          top: Math.floor(currentWindowRect.height * 2 / 3),
          width: Math.floor(currentWindowRect.width / 3),
          height: Math.floor(currentWindowRect.height / 3)
        }
      ];
      console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
      
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_maxRects
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0300
     * @tc.desc   设置最大数量可触摸区域（10个），验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_maxRects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_maxRects';
      let currentWindowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`${message} currentWindowRect: ${JSON.stringify(currentWindowRect)}`);
      
      let rectWidth = Math.floor(currentWindowRect.width / 10);
      let rectHeight = Math.floor(currentWindowRect.height / 10);
      let touchableRects: Array<window.Rect> = [];
      
      for (let i = 0; i < 10; i++) {
        touchableRects.push({
          left: Math.floor(currentWindowRect.width * i / 10),
          top: Math.floor(currentWindowRect.height * i / 10),
          width: rectWidth,
          height: rectHeight
        });
      }
      console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
      
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_emptyArray
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0400
     * @tc.desc   设置空数组，验证恢复为默认状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_emptyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_emptyArray';
      let touchableRects: Array<window.Rect> = [];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_fullWindow
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0500
     * @tc.desc   设置完整窗口区域，验证等同于默认状态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_fullWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_fullWindow';
      let touchableRects: Array<window.Rect> = [
        { left: 0, top: 0, width: windowRect.width, height: windowRect.height }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   testSetTouchableAreas_exceedMaxRects
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0600
     * @tc.desc   设置超过最大数量（11个）的可触摸区域，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_exceedMaxRects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_exceedMaxRects';
      let touchableRects: Array<window.Rect> = [];
      for (let i = 0; i < 11; i++) {
        touchableRects.push({ left: i * 30, top: i * 30, width: 50, height: 50 });
      }
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(1300016);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_outOfWindowRange
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0700
     * @tc.desc   设置超出窗口范围的可触摸区域，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_outOfWindowRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_outOfWindowRange';
      let touchableRects: Array<window.Rect> = [
        { left: -100, top: 0, width: 200, height: 200 }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 401) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(401);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_negativeWidthHeight
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0800
     * @tc.desc   设置宽/高为负值的可触摸区域，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_negativeWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_negativeWidthHeight';
      let touchableRects: Array<window.Rect> = [
        { left: 100, top: 100, width: -200, height: 200 }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 401) {
          console.info(`${message} Expected error 1300016.`);
          expect(exception.code).assertEqual(401);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_floatParams
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_BOUNDARY_0100
     * @tc.desc   Rect参数使用浮点数，验证向下取整后调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_floatParams', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_floatParams';
      let currentWindowRect = mainWindowClass.getWindowProperties().windowRect;
      console.info(`${message} currentWindowRect: ${JSON.stringify(currentWindowRect)}`);
      
      let rectWidth = 10.5;
      let rectHeight = 10.5;
      let rectLeft = 0;
      let rectTop = 0;
      
      let touchableRects: Array<window.Rect> = [
        { left: rectLeft, top: rectTop, width: rectWidth, height: rectHeight }
      ];
      console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
      console.info(`${message} Verify float params: left=${rectLeft}, top=${rectTop}, width=${rectWidth}, height=${rectHeight}`);
      
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_zeroWidthHeight
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_BOUNDARY_0200
     * @tc.desc   设置宽/高为0的可触摸区域，验证调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_zeroWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_zeroWidthHeight';
      let touchableRects: Array<window.Rect> = [
        { left: 0, top: 0, width: 0, height: 0 }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetTouchableAreas_windowDestroyed
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_BOUNDARY_0300
     * @tc.desc   窗口销毁后调用，验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTouchableAreas_windowDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetTouchableAreas_windowDestroyed';
      let config: window.Configuration = {
        name: 'testSetTouchableAreas_windowDestroyed',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        let testWindowRect = testWindow.getWindowProperties().windowRect;
        console.info(`${message} testWindowRect: ${JSON.stringify(testWindowRect)}`);
        
        let rectWidth = Math.floor(testWindowRect.width / 3);
        let rectHeight = Math.floor(testWindowRect.height / 3);
        let rectLeft = Math.floor(testWindowRect.width / 3);
        let rectTop = Math.floor(testWindowRect.height / 3);
        
        let touchableRects: Array<window.Rect> = [
          { left: rectLeft, top: rectTop, width: rectWidth, height: rectHeight }
        ];
        console.info(`${message} touchableRects: ${JSON.stringify(touchableRects)}`);
        
        await testWindow.destroyWindow();
        await sleep(500);
        try {
          await testWindow.setTouchableAreas(touchableRects);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300002) {
            console.info(`${message} Expected error 1300002.`);
            expect(exception.code).assertEqual(1300002);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    // ==================== setWindowContainerModalColor 测试用例 ====================

    /**
     * @tc.name   testSetWindowContainerModalColor_standardRGB
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0100
     * @tc.desc   设置标准RGB颜色，验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowContainerModalColor_standardRGB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_standardRGB';
      let activeColor: string = '#FF0000';
      let inactiveColor: string = '#00FF00';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetWindowContainerModalColor_ARGB
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0200
     * @tc.desc   设置ARGB颜色（含透明度），验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_ARGB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_ARGB';
      let activeColor: string = '#80FF0000';
      let inactiveColor: string = '#8000FF00';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }

    });

    /**
     * @tc.name   testSetWindowContainerModalColor_transparent
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0300
     * @tc.desc   设置全透明颜色，验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_transparent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_transparent';
      let activeColor: string = '#00000000';
      let inactiveColor: string = '#00000000';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_lowercase
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0400
     * @tc.desc   使用小写颜色格式，验证接口调用成功（不区分大小写）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_lowercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_lowercase';
      let activeColor: string = '#ff0000';
      let inactiveColor: string = '#00ff00';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_focusStateChange
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0500
     * @tc.desc   设置焦点态和非焦点态颜色，验证颜色设置成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_focusStateChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_focusStateChange';
      let activeColor: string = '#FFFFFF';
      let inactiveColor: string = '#CCCCCC';
      try {
        mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
        console.info(`${message} Succeeded in setting window container modal color.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (deviceType === '2in1') {
          expect().assertFail();
          done();
        }else{
          if (exception.code === 801) {
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_windowDestroyed
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0600
     * @tc.desc   窗口销毁后调用，验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_windowDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_windowDestroyed';
      let activeColor: string = '#FF0000';
      let inactiveColor: string = '#00FF00';
      let config: window.Configuration = {
        name: 'testSetWindowContainerModalColor_windowDestroyed',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        await testWindow.destroyWindow();
        await sleep(500);
        try {
          testWindow.setWindowContainerModalColor(activeColor, inactiveColor);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300002) {
            console.info(`${message} Expected error 1300002.`);
            expect(exception.code).assertEqual(1300002);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_subWindow
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0700
     * @tc.desc   子窗口调用，验证1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowContainerModalColor_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_subWindow';
      let activeColor: string = '#FF0000';
      let inactiveColor: string = '#00FF00';
      let config: window.Configuration = {
        name: 'testSetWindowContainerModalColor_subWindow',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };
      try {
        let testWindow = await window.createWindow(config);
        try {
          testWindow.setWindowContainerModalColor(activeColor, inactiveColor);
          console.error(`${message} Should not succeed.`);
          expect().assertFail();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 1300004) {
            console.info(`${message} Expected error 1300004.`);
            expect(exception.code).assertEqual(1300004);
            done();
          } else if (exception.code === 801){
            console.info(`${message} Expected error 801.`);
            expect(exception.code).assertEqual(801);
            done();
          } else{
            expect().assertFail();
            done();
          }
        } finally {
          await testWindow.destroyWindow();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }
    });

    // ==================== getAllWindowLayoutInfo 测试用例 ====================

    /**
     * @tc.name   testGetAllWindowLayoutInfo_noOption
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0100
     * @tc.desc   不传option参数，获取所有可见窗口布局信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllWindowLayoutInfo_noOption', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_noOption';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      try {
        let data = await window.getAllWindowLayoutInfo(displayId);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length > 0).assertTrue();
        if (data.length > 0) {
          let rect = data[0].windowRect;
          expect(rect.left >= 0).assertTrue();
          expect(rect.top >= 0).assertTrue();
          expect(rect.width > 0).assertTrue();
          expect(rect.height > 0).assertTrue();
          let alpha = data[0].windowAlpha;
          expect(alpha! >= 0 && alpha! <= 1).assertTrue();
        }
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }

      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_defaultOption
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0200
     * @tc.desc   传入默认option，获取所有可见窗口布局信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_defaultOption', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_defaultOption';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = {};
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      try {
        let data = await window.getAllWindowLayoutInfo(displayId, option);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length > 0).assertTrue();
        if (data.length > 0) {
          let rect = data[0].windowRect;
          expect(rect.left >= 0).assertTrue();
          expect(rect.top >= 0).assertTrue();
          expect(rect.width > 0).assertTrue();
          expect(rect.height > 0).assertTrue();
          let alpha = data[0].windowAlpha;
          expect(alpha! >= 0 && alpha! <= 1).assertTrue();
        }
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_excludeSystemWindows
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0300
     * @tc.desc   excludeSystemWindows为true，排除系统窗口
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_excludeSystemWindows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_excludeSystemWindows';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = { excludeSystemWindows: true };
      let isSupport = canIUse('SystemCapability.Window.SessionManager')

      let config: window.Configuration = {
        name: 'testGetAllWindowLayoutInfo_excludeSystemWindows',
        windowType: window.WindowType.TYPE_DIALOG,
        decorEnabled: true,
        ctx: context
      };

      try {
        let testWindow = await window.createWindow(config);
        console.info(`${message} createWindow success.`);
        await testWindow.setUIContent("testability/pages/Index1");
        console.info(`${message} setUIContent success.`);
        await testWindow.showWindow();
        console.info(`${message} showWindow success.`);
        let windowLimits = testWindow.getWindowLimits();
        console.info(`${message} getWindowLimits.{windowLimits}`);
        let tmpWindowWidth:number = 0;
        let tmpWindowHeight:number = 0;
        if (windowLimits.minWidth !== undefined && windowLimits.maxWidth != undefined){
          tmpWindowWidth = windowLimits?.minWidth + 100 < windowLimits?.maxWidth ? windowLimits?.minWidth + 100 : windowLimits?.minWidth;
        }
        if (windowLimits.minHeight !== undefined && windowLimits.maxHeight != undefined){
          tmpWindowHeight = windowLimits?.minHeight + 100 < windowLimits?.maxHeight ? windowLimits?.minHeight + 100 : windowLimits?.minHeight;
        }
        await testWindow.resize(tmpWindowWidth, tmpWindowHeight);
        console.info(`${message} resize success.`);
        await testWindow.moveWindowTo(100, 100);
        console.info(`${message} moveWindowTo success.`);

        await sleep(500);

        try {
          let data = await window.getAllWindowLayoutInfo(displayId, option);
          console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
          let flag = false
          for (let i = 0; i < data.length; i++) {
            if (data[i].windowRect.width === tmpWindowWidth && data[i].windowRect.height === tmpWindowHeight) {
              flag = true
            }
          }
          expect(flag).assertTrue()
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (isSupport === false){
            if (exception.code === 801) {
              console.info(`${message} Capability not supported.`);
              done();
            } else {
              expect().assertFail();
              done();
            }
          }else{
            expect().assertFail();
            done();
          }
        } finally {
          await testWindow.destroyWindow();
        }
      } catch (err) {
        err = err as BusinessError;
        console.error(`${message} Failed to create window. Cause: ${err.code}, ${err.message}`);
        done();
      }

    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_invalidDisplayId
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0400
     * @tc.desc   使用无效displayId（负数），验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_invalidDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_invalidDisplayId';
      let displayId: number = -1;

      try {
        await window.getAllWindowLayoutInfo(displayId);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 401) {
          console.info(`${message} Expected error 401.`);
          expect(exception.code).assertEqual(401);
          done();
        }else{
          expect().assertFail();
          done();
        }

      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_invalidAboveWindowId
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0500
     * @tc.desc   foregroundAboveWindow传入不存在windowId，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_invalidAboveWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_invalidAboveWindowId';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = { foregroundAboveWindow: -1 };

      try {
        await window.getAllWindowLayoutInfo(displayId, option);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 401.`);
          expect(exception.code).assertEqual(1300016);
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_invalidBelowWindowId
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0600
     * @tc.desc   foregroundBelowWindow传入不存在windowId，验证1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_invalidBelowWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_invalidBelowWindowId';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let option: window.WindowInfoOptions = { foregroundBelowWindow: -1 };

      try {
        await window.getAllWindowLayoutInfo(displayId, option);
        console.error(`${message} Should not succeed.`);
        expect().assertFail();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 1300016) {
          console.info(`${message} Expected error 401.`);
          expect(exception.code).assertEqual(1300016);
          done();
        }
      }
    });

    /**
     * @tc.name   testGetAllWindowLayoutInfo_sameWindowId
     * @tc.number SUB_WINDOW_GETALLWINDOWLAYOUTINFO_FUNCTION_0800
     * @tc.desc   foregroundBelowWindow和foregroundAboveWindow等于主窗windowId，返回空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_sameWindowId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'testGetAllWindowLayoutInfo_sameWindowId';
      let displayId: number = mainWindowClass.getWindowProperties().displayId ?? 0;
      let mainWindowId: number = mainWindowClass.getWindowProperties().id;
      console.info(`${message} mainWindowId: ${mainWindowId}`);
      let option: window.WindowInfoOptions = {
        foregroundBelowWindow: mainWindowId,
        foregroundAboveWindow: mainWindowId
      };
      let isSupport = canIUse('SystemCapability.Window.SessionManager')

      try {
        let data = await window.getAllWindowLayoutInfo(displayId, option);
        console.info(`${message} Succeeded in getting window layout info. Data: ${JSON.stringify(data)}`);
        expect(data.length === 0).assertTrue();
        console.info(`${message} Empty array returned as expected.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (isSupport === false){
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== @Env(SystemProperties.WINDOW_SYSTEM_DENSITY) 测试用例 ====================

    /**
     * @tc.name   testEnvSystemDensity
     * @tc.number SUB_WINDOW_ENV_SYSTEM_DENSITY_0100
     * @tc.desc   验证@Env(SystemProperties.WINDOW_SYSTEM_DENSITY)获取的SystemDensity与getWindowDensityInfo查询结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvSystemDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testEnvSystemDensity';
      console.info(`${message} begin`);
      
      try {
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.info(`${message} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        
        let envSystemDensity = AppStorage.get('SystemDensity') as number;
        console.info(`${message} envSystemDensity from page: ${envSystemDensity}`);
        
        let densityInfo = mainWindowClass.getWindowDensityInfo();
        console.info(`${message} densityInfo: ${JSON.stringify(densityInfo)}`);
        let systemDensityFromApi = densityInfo.systemDensity;
        console.info(`${message} systemDensity from getWindowDensityInfo: ${systemDensityFromApi}`);
        
        expect(envSystemDensity).assertEqual(systemDensityFromApi);
        console.info(`${message} Succeeded. envSystemDensity equals systemDensity from API.`);
        
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        if (exception.code === 801) {
          if (!canIUseRes) {
            console.info(`${message} Capability not supported and canIUse is false.`);
            expect(exception.code).assertEqual(801);
            done();
          } else {
            console.info(`${message} Capability not supported but canIUse is true.`);
            expect().assertFail();
            done();
          }
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    // ==================== @Env(SystemProperties.WINDOW_DISPLAY_ID) 测试用例 ====================

    /**
     * @tc.name   testEnvDisplayId
     * @tc.number SUB_WINDOW_ENV_DISPLAY_ID_0100
     * @tc.desc   验证@Env(SystemProperties.WINDOW_DISPLAY_ID)获取的DisplayId与getDefaultDisplaySync查询结果一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnvDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testEnvDisplayId';
      console.info(`${message} begin`);
      
      try {
        await mainWindowClass.setUIContent('testability/pages/Index');
        await sleep(500);
        
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.info(`${message} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        
        let envDisplayId = AppStorage.get('DisplayId') as number;
        console.info(`${message} envDisplayId from page: ${envDisplayId}`);
        
        let displayInfo = display.getDefaultDisplaySync();
        console.info(`${message} displayInfo: ${JSON.stringify(displayInfo)}`);
        let displayIdFromApi = displayInfo.id;
        console.info(`${message} displayId from getDefaultDisplaySync: ${displayIdFromApi}`);
        
        expect(envDisplayId).assertEqual(displayIdFromApi);
        console.info(`${message} Succeeded. envDisplayId equals displayId from API.`);
        
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        expect().assertFail();
        done();
      }
    });
  });
}