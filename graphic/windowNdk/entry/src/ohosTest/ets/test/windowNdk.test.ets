/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import windowNdkTest from 'libentry.so';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import settings from '@ohos.settings';
import { Driver, ON, MouseButton, Point } from '@ohos.UiTest';
import deviceInfo from '@ohos.deviceInfo';

function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function windowNdk() {
  describe('windowNdk', () => {
    let windowStage: window.WindowStage;
    let Tag = 'ActsWindowNdkTest';
    let WindowClass: window.Window;
    let windowId: number;
    let context: common.UIAbilityContext;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    let isFreeWindowMode = false;
    const WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED = 801;
    let deviceType: string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    beforeAll(async () => {
      windowStage = AppStorage.get("windowStage") as window.WindowStage;
      console.log(`${Tag}:beforeAll start... `);
      WindowClass = await windowStage.getMainWindow();
      windowId = WindowClass.getWindowProperties().id;
      console.log(`${Tag}:windowId:${windowId} `);
      context = AppStorage.get("context") as common.UIAbilityContext;
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '', settings.domainName.DEVICE_SHARED);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: ` + isPCStatus);
      isFreeWindowMode = WindowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      try {
        let driver = Driver.create();
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        console.log('findComponent allowed: ' + JSON.stringify(allowed));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent allowed failed: ' + JSON.stringify(err));
      }
    })
    beforeEach(() => {
      console.log(`${Tag}:beforeEach start... `);
    })
    afterEach(() => {
      console.log(`${Tag}:afterEach start... `);
    })
    afterAll(() => {
      console.log(`${Tag}:afterAll start... `);
    })


    /**
     * @tc.name   test_OH_NativeWindowManager_RegisterKeyEventFilter
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0100
     * @tc.desc   test_OH_NativeWindowManager_RegisterKeyEventFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_OH_NativeWindowManager_RegisterKeyEventFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${Tag}: test_OH_NativeWindowManager_RegisterKeyEventFilter RegisterKeyEventFilter windowId: ${windowId}`);
      let a = windowNdkTest.filterKeyCode(windowId, 2070);
      console.info(`${Tag}: test_OH_NativeWindowManager_RegisterKeyEventFilter RegisterKeyEventFilter: ${a}`);
      if (a == 2000) {
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);

        done();
      } else
        if (a == 0) {

          done();
        } else {
          expect(false).assertTrue();
          done();
        }
    })

    /**
     * @tc.name   test_OH_NativeWindowManager_UnregisterKeyEventFilter
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0200
     * @tc.desc   test_OH_NativeWindowManager_UnregisterKeyEventFilter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_OH_NativeWindowManager_UnregisterKeyEventFilter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let a = windowNdkTest.unFilterKeyCode(windowId);
      console.info(`${Tag}: test_OH_NativeWindowManager_UnregisterKeyEventFilter unRegisterKeyEventFilter windowId: ${windowId}`);
      console.info(`${Tag}: test_OH_NativeWindowManager_UnregisterKeyEventFilter unRegisterKeyEventFilter: ${a}`);
      if (a == 2000) {
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);

        done();
      } else if (a == 0) {

        done();
      } else {
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   test_OH_WindowManager_ShowWindow
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0300
     * @tc.desc   test_OH_WindowManager_ShowWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_ShowWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result1 = windowNdkTest.showWindow(windowId);
      console.info(`${Tag}: test_OH_WindowManager_ShowWindow result: ${JSON.stringify(result1)}`);
      expect(result1.resultCode).assertEqual(0);
      let result2 = windowNdkTest.isWindowShown(windowId);
      console.info(`${Tag}: test_OH_WindowManager_ShowWindow result: ${JSON.stringify(result2)}`);
      expect(result2.resultCode).assertEqual(0);
      expect(result2.isShow).assertEqual(1);
      done();
    })

    /**
     * @tc.name   test_NDK_show_subWindow
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0400
     * @tc.desc   test_NDK_show_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NDK_show_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_NDK_show_subWindow";
      try {
        let promise = windowStage.createSubWindow('test_NDK_show_subWindow');
        promise.then(async (data) => {
          let subWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let subWindowId = subWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + subWindowId);

          let result1 = windowNdkTest.isWindowShown(subWindowId);
          console.info(`${caseName}: isWindowShown result1: ${JSON.stringify(result1)}`);
          expect(result1.resultCode).assertEqual(0);
          expect(result1.isShow).assertEqual(0);

          let result2 = windowNdkTest.showWindow(subWindowId);
          console.info(`${caseName}: showWindow result2: ${JSON.stringify(result1)} + &{typeOf(result2)}`);
          expect(result2.resultCode).assertEqual(0);

          let result3 = windowNdkTest.isWindowShown(subWindowId);
          console.info(`${caseName}: isWindowShown result3: ${JSON.stringify(result3)}`);
          expect(result3.resultCode).assertEqual(0);
          expect(result3.isShow).assertEqual(1);
          await subWindow.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName}:Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName}:Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_NDK_show_subWindow_JS_isShowWindow
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0500
     * @tc.desc   test_NDK_show_subWindow_JS_isShowWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NDK_show_subWindow_JS_isShowWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_NDK_show_subWindow_JS_isShowWindow";
      try {
        let promise = windowStage.createSubWindow('test_NDK_show_subWindow_JS_isShowWindow');
        promise.then(async (data) => {
          let subWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let subWindowId = subWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + subWindowId);

          let result1 = subWindow.isWindowShowing();
          console.info(`${caseName}: isWindowShowing result1: ${JSON.stringify(result1)}`);
          expect(result1).assertEqual(false);

          let result2 = windowNdkTest.showWindow(subWindowId);
          console.info(`${caseName}: showWindow result2: ${JSON.stringify(result1)} + &{typeOf(result2)}`);
          expect(result2.resultCode).assertEqual(0);

          let result3 = subWindow.isWindowShowing();
          console.info(`${caseName}: isWindowShown result3: ${JSON.stringify(result3)}`);
          expect(result3).assertEqual(true);
          await subWindow.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName}:Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName}:Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_NDK_show_subWindow_Minimize_window
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0600
     * @tc.desc   test_NDK_show_subWindow_Minimize_window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NDK_show_subWindow_Minimize_window', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_NDK_show_subWindow_Minimize_window";
      try {
        let subWindow: window.Window;
        let promise = windowStage.createSubWindow('test_NDK_show_subWindow_Minimize_window');
        promise.then(async (data) => {
          subWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let subWindowId = subWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + subWindowId);

          let result1 = windowNdkTest.showWindow(subWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);
          expect(result1.resultCode).assertEqual(0);

          let result2 = windowNdkTest.isWindowShown(subWindowId);
          console.info(`${caseName}: isWindowShown result2: ${JSON.stringify(result2)}`);
          expect(result2.resultCode).assertEqual(0);
          expect(result2.isShow).assertEqual(1);

          let promise2 = subWindow.minimize();
          promise2.then(async () => {
            console.info(caseName + ':Succeeded in minimizing the window.');
            let result3 = windowNdkTest.isWindowShown(subWindowId);
            console.info(`${caseName}: isWindowShown result3: ${JSON.stringify(result3)}`);
            expect(result3.resultCode).assertEqual(0);
            expect(result3.isShow).assertEqual(0);

            let result4 = windowNdkTest.showWindow(subWindowId);
            console.info(`${caseName}: showWindow result4: ${JSON.stringify(result1)} + &{typeOf(result4)}`);
            expect(result4.resultCode).assertEqual(0);

            let result5 = windowNdkTest.isWindowShown(subWindowId);
            console.info(`${caseName}: isWindowShown result5: ${JSON.stringify(result5)}`);
            expect(result5.resultCode).assertEqual(0);
            expect(result5.isShow).assertEqual(1);
            await subWindow.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName}: Failed to minimize the window. Cause code: ${err.code}, message: ${err.message}`);
            await subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          });
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName}:Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code == 801) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName}:Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_NDK_Show_DialogWindow
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0700
     * @tc.desc   test_NDK_Show_DialogWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_NDK_Show_DialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_NDK_Show_DialogWindow";
      try {
        let config: window.Configuration = {
          name: "test_NDK_Show_DialogWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          let dialogWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let dialogWindowId = dialogWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + dialogWindowId);

          let result1 = windowNdkTest.isWindowShown(dialogWindowId);
          console.info(`${caseName}: isWindowShown result1: ${JSON.stringify(result1)}`);
          expect(result1.resultCode).assertEqual(0);
          expect(result1.isShow).assertEqual(0);

          let result2 = windowNdkTest.showWindow(dialogWindowId);
          console.info(`${caseName}: showWindow result2: ${JSON.stringify(result1)} + &{typeOf(result2)}`);
          expect(result2.resultCode).assertEqual(0);

          let result3 = windowNdkTest.isWindowShown(dialogWindowId);
          console.info(`${caseName}: isWindowShown result3: ${JSON.stringify(result3)}`);
          expect(result3.resultCode).assertEqual(0);
          expect(result3.isShow).assertEqual(1);
          await dialogWindow.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName}:Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName}:Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_ShowWindow_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0800
     * @tc.desc   test_OH_WindowManager_ShowWindow_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_OH_WindowManager_ShowWindow_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result = windowNdkTest.showWindow(-1);
      console.info(`${Tag}: test_OH_WindowManager_ShowWindow_1300002 result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_OH_WindowManager_IsShowWindown_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0900
     * @tc.desc   test_OH_WindowManager_IsShowWindown_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_OH_WindowManager_IsShowWindown_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result = windowNdkTest.isWindowShown(-1);
      console.info(`${Tag}: test_OH_WindowManager_IsShowWindown_1300002 result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_SetWindowStatusBarEnabled_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1000
     * @tc.desc   test_SetWindowStatusBarEnabled_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowStatusBarEnabled_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowStatusBarEnabled_1300002";
      let result = windowNdkTest.setWindowStatusBarEnabled(-1, true, true);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_mainWindow_SetWindowStatusBarEnabled
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1100
     * @tc.desc   test_mainWindow_SetWindowStatusBarEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_mainWindow_SetWindowStatusBarEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "test_mainWindow_SetWindowStatusBarEnabled";
      windowNdkTest.setWindowStatusBarEnabled(windowId, false, true);
      await sleep(1000)
      let flag: boolean = false;
      WindowClass.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
        console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        flag = true;
      });
      let result = windowNdkTest.setWindowStatusBarEnabled(windowId, true, true);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(0);
      await sleep(1000);
      if(isFreeWindowMode){
        WindowClass.off('avoidAreaChange')
        expect(flag).assertEqual(false)
        done()
      }else{
        WindowClass.off('avoidAreaChange')
        expect(flag).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   test_mainWindow_SetWindowStatusBarEnabled_false
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1200
     * @tc.desc   test_mainWindow_SetWindowStatusBarEnabled_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_mainWindow_SetWindowStatusBarEnabled_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "test_mainWindow_SetWindowStatusBarEnabled_false";
      let flag: boolean = false;
      WindowClass.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
        console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        flag = true;
      });
      let result = windowNdkTest.setWindowStatusBarEnabled(windowId, false, false);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(0);
      await sleep(1000);
      if(isFreeWindowMode){
        WindowClass.off('avoidAreaChange')
        expect(flag).assertEqual(false)
        done()
      }else{
        WindowClass.off('avoidAreaChange')
        windowNdkTest.setWindowStatusBarEnabled(windowId, true, false);
        await sleep(500)
        expect(flag).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1300
     * @tc.desc   test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true";
      let flag: boolean = false;
      WindowClass.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
        console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        flag = true;
      });
      let result = windowNdkTest.setWindowStatusBarEnabled(windowId, false, true);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(0);
      await sleep(1000);
      if(isFreeWindowMode){
        WindowClass.off('avoidAreaChange')
        expect(flag).assertEqual(false)
        done()
      }else{
        WindowClass.off('avoidAreaChange')
        windowNdkTest.setWindowStatusBarEnabled(windowId, true ,true);
        await sleep(500)
        expect(flag).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   test_subWindow_SetWindowStatusBarEnabled
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1400
     * @tc.desc   test_subWindow_SetWindowStatusBarEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_subWindow_SetWindowStatusBarEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_subWindow_SetWindowStatusBarEnabled";
      try {
        let promise = windowStage.createSubWindow('test_subWindow_SetWindowStatusBarEnabled');
        promise.then(async (data) => {
          let subWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let subWindowId = subWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + subWindowId);

          let result1 =await windowNdkTest.showWindow(subWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);
          await sleep(1000)

          let flag: boolean = false;
          subWindow.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
            console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
              JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
            flag = true;
          });

          let result = windowNdkTest.setWindowStatusBarEnabled(subWindowId, true, true);
          console.info(`${caseName}: result: ${result}`)
          expect(result).assertEqual(0);
          await sleep(1000);
          subWindow.off('avoidAreaChange')
          await subWindow.destroyWindow();
          expect(flag).assertEqual(false)
          done()
        }).catch((err: BusinessError) => {
          console.error(`${caseName}:Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${caseName} filed. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_dialogWindow_SetWindowStatusBarEnabled_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1500
     * @tc.desc   test_dialogWindow_SetWindowStatusBarEnabled_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_dialogWindow_SetWindowStatusBarEnabled_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_dialogWindow_SetWindowStatusBarEnabled_1300002";
      try {
        let config: window.Configuration = {
          name: "test_dialogWindow_SetWindowStatusBarEnabled_1300002",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          let dialogWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let dialogWindowId = dialogWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + dialogWindow);

          let result1 =await windowNdkTest.showWindow(dialogWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);
          await sleep(1000)

          let flag: boolean = false;
          dialogWindow.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
            console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
              JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
            flag = true;
          });

          let result = windowNdkTest.setWindowStatusBarEnabled(dialogWindowId, true, true);
          console.info(`${caseName}: result: ${result}`);
          expect(result).assertEqual(0);
          await sleep(1000);
          dialogWindow.off('avoidAreaChange')
          await dialogWindow.destroyWindow();
          expect(flag).assertEqual(false)
          done()
        }).catch((err: BusinessError) => {
          console.error(`${caseName}:Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${caseName} filed. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_SetWindowNavigationBarEnabled_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1600
     * @tc.desc   test_SetWindowNavigationBarEnabled_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowNavigationBarEnabled_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowNavigationBarEnabled_1300002";
      let result = windowNdkTest.setWindowNavigationBarEnabled(-1, true, true);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(1300002);
      done();

    })

    /**
     * @tc.name   test_mainWindow_setWindowNavigationBarEnabled
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1700
     * @tc.desc   test_mainWindow_setWindowNavigationBarEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_mainWindow_setWindowNavigationBarEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_mainWindow_setWindowNavigationBarEnabled";
      console.info(`${caseName} start`);
      windowNdkTest.setWindowNavigationBarEnabled(windowId, false, true);
      await sleep(1000)
      let flag: boolean = false;
      WindowClass.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
        console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        flag = true;
      });
      let result = windowNdkTest.setWindowNavigationBarEnabled(windowId, true, true);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(0);
      await sleep(1000);
      if (deviceType === 'phone' ||deviceType === 'wearable' || deviceType === 'tv' || deviceType === '2in1' || deviceType === 'car' || deviceType === 'tablet' ){
         WindowClass.off('avoidAreaChange')
        expect(flag).assertEqual(false)
        done()
      }else{
        WindowClass.off('avoidAreaChange')
        expect(flag).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   test_mainWindow_setWindowNavigationBarEnabled_false
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1800
     * @tc.desc   test_mainWindow_setWindowNavigationBarEnabled_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_mainWindow_setWindowNavigationBarEnabled_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_mainWindow_setWindowNavigationBarEnabled_false";
      let flag: boolean = false;
      WindowClass.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
        console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        flag = true;
      });
      let result = windowNdkTest.setWindowNavigationBarEnabled(windowId, false, false);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(0);
      await sleep(1000);
      if(deviceType === 'phone' ||deviceType === 'wearable' || deviceType === 'tv' || deviceType === '2in1' || deviceType === 'car' || deviceType === 'tablet'){
        WindowClass.off('avoidAreaChange')
        expect(flag).assertEqual(false)
        done()
      }else{
        WindowClass.off('avoidAreaChange')
        windowNdkTest.setWindowNavigationBarEnabled(windowId, true, false);
        await sleep(500)
        expect(flag).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   test_mainWindow_setWindowNavigationBarEnabled_false_enableAnimation_true
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1900
     * @tc.desc   test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_mainWindow_setWindowNavigationBarEnabled_false_enableAnimation_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_mainWindow_setWindowNavigationBarEnabled_false_enableAnimation_true";
      let flag: boolean = false;
      WindowClass.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
        console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        flag = true;
      });
      let result = windowNdkTest.setWindowNavigationBarEnabled(windowId, false, true);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(0);
      await sleep(1000);
      if(deviceType === 'phone' ||deviceType === 'wearable' || deviceType === 'tv' || deviceType === '2in1' || deviceType === 'car' || deviceType === 'tablet'){
        WindowClass.off('avoidAreaChange')
        expect(flag).assertEqual(false)
        done()
      }else{
        WindowClass.off('avoidAreaChange')
        windowNdkTest.setWindowNavigationBarEnabled(windowId, true, false);
        await sleep(500)
        expect(flag).assertEqual(true)
        done()
      }
    })

    /**
     * @tc.name   test_subWindow_SetWindowNavigationBarEnabled
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2000
     * @tc.desc   test_subWindow_SetWindowNavigationBarEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_subWindow_SetWindowNavigationBarEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_subWindow_SetWindowNavigationBarEnabled";
      try {
        let promise = windowStage.createSubWindow('test_subWindow_SetWindowNavigationBarEnabled');
        promise.then(async (data) => {
          let subWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let subWindowId = subWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + subWindowId);

          let result1 =await windowNdkTest.showWindow(subWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);

           await sleep(1000)
           let flag: boolean = false;
          subWindow.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
            console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
              JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
            flag = true;
          });

          let result = windowNdkTest.setWindowNavigationBarEnabled(subWindowId, true, true);
          console.info(`${caseName}: result: ${result}`);
          expect(result).assertEqual(0);
          await sleep(1000);
          subWindow.off('avoidAreaChange')
          await subWindow.destroyWindow();
          expect(flag).assertEqual(false)
          done()
        }).catch((err: BusinessError) => {
          console.error(`${caseName}:Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${caseName} filed. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_dialogWindow_SetWindowNavigationBarEnabled_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2100
     * @tc.desc   test_dialogWindow_SetWindowNavigationBarEnabled_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_dialogWindow_SetWindowNavigationBarEnabled_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_dialogWindow_SetWindowNavigationBarEnabled_1300002";
      try {
        let config: window.Configuration = {
          name: "test_dialogWindow_SetWindowNavigationBarEnabled_1300002",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          let dialogWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let dialogWindowId = dialogWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + dialogWindow);

          let result1 =await windowNdkTest.showWindow(dialogWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);
          await sleep(1000)

          let flag: boolean = false;
          dialogWindow.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
            console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
              JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
            flag = true;
          });

          let result = windowNdkTest.setWindowNavigationBarEnabled(dialogWindowId, true, true);
          console.info(`${caseName}: result: ${result}`);
          expect(result).assertEqual(0);
          await sleep(1000);
          dialogWindow.off('avoidAreaChange')
          await dialogWindow.destroyWindow();
          expect(flag).assertEqual(false)
          done()
        }).catch((err: BusinessError) => {
          console.error(`${caseName}:Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(`${caseName} filed. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   test_SetWindowStatusBarColor_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2200
     * @tc.desc   test_SetWindowStatusBarColor_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowStatusBarColor_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowStatusBarColor_1300002";
      let result = windowNdkTest.setWindowStatusBarColor(-1, 0XFF00FF00);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(1300002);
      done();

    })

    /**
     * @tc.name   test_SetWindowStatusBarColor_0xFF00FF00
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2300
     * @tc.desc   test_SetWindowStatusBarColor_0xFF00FF00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowStatusBarColor_0xFF00FF00', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowStatusBarColor_0xFF00FF00";
      let result = windowNdkTest.setWindowStatusBarColor(windowId, 0XFF00FF00);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(0);
      let statusBarContentColor = WindowClass.getWindowSystemBarProperties().statusBarContentColor;
      console.info(`${caseName}: statusBarContentColor: ${statusBarContentColor}`);
      expect(statusBarContentColor).assertEqual('#FF00FF00');
      done();
    })

    /**
     * @tc.name   test_SetWindowStatusBarColor_0xFF000000
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2400
     * @tc.desc   test_SetWindowStatusBarColor_0xFF000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowStatusBarColor_0xFF000000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowStatusBarColor_0xFF000000";
      let result1 = windowNdkTest.setWindowStatusBarEnabled(windowId, false, true);
      console.info(`${caseName}: result1: ${result1}`);
      expect(result1).assertEqual(0);
      let result2 = windowNdkTest.setWindowStatusBarColor(windowId, 0XFF000000);
      console.info(`${caseName}: result: ${result2}`);
      await sleep(100);
      let statusBarContentColor = WindowClass.getWindowSystemBarProperties().statusBarContentColor;
      console.info(`${caseName}: statusBarContentColor: ${statusBarContentColor}`);
      expect(statusBarContentColor).assertEqual('#FF000000');
      let result3 = windowNdkTest.setWindowStatusBarEnabled(windowId, true, true);
      console.info(`${caseName}: result: ${result3}`);
      done();
    })

    /**
     * @tc.name   test_getAvoidAreaByType_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2500
     * @tc.desc   test_getAvoidAreaByType_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAvoidAreaByType_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getAvoidAreaByType_1300002";
      let result1 = windowNdkTest.getAvoidAreaByType(-1, 0);
      console.info(`${caseName}: result: ${JSON.stringify(result1)}`);
      expect(result1).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_getAvoidAreaByType_statusBar_show
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2600
     * @tc.desc   test_getAvoidAreaByType_statusBar_show
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAvoidAreaByType_statusBar_show', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getAvoidAreaByType_statusBar_show";
      let result1 = windowNdkTest.setWindowStatusBarEnabled(windowId, true, true);
      console.info(`${caseName}: result1: ${result1}`);
      expect(result1).assertEqual(0);
      let AvoidArea_system = windowNdkTest.getAvoidAreaByType(windowId, 0);
      console.info(`${caseName}: AvoidArea_system result: ${JSON.stringify(AvoidArea_system)}`);
      if (isFreeWindowMode) {	 
          expect(AvoidArea_system.topRect.width).assertEqual(0);
          expect(AvoidArea_system.topRect.height).assertEqual(0);
          done();	 
       } else {
        expect(AvoidArea_system.topRect.width).assertLargerOrEqual(0);
        expect(AvoidArea_system.topRect.height).assertLargerOrEqual(0);
        done();
       }
    
    })

    /**
     * @tc.name   test_getAvoidAreaByType_statusBar_hide
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2700
     * @tc.desc   test_getAvoidAreaByType_statusBar_hide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAvoidAreaByType_statusBar_hide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getAvoidAreaByType_statusBar_hide";
      let result1 = windowNdkTest.setWindowStatusBarEnabled(windowId, false, true);
      console.info(`${caseName}: result1: ${result1}`);
      await sleep(500);
      expect(result1).assertEqual(0);
      let AvoidArea_system = windowNdkTest.getAvoidAreaByType(windowId, 0);
      console.info(`${caseName}: AvoidArea_system result: ${JSON.stringify(AvoidArea_system)}`);
      if (isFreeWindowMode) {	 
          expect(AvoidArea_system.topRect.width).assertEqual(0);
          expect(AvoidArea_system.topRect.height).assertEqual(0);
          done();	 
       } else {
        expect(AvoidArea_system.topRect.width).assertLargerOrEqual(0);
        expect(AvoidArea_system.topRect.height).assertLargerOrEqual(0);
        done();
       }
    })
    /**
     * @tc.name   test_getAvoidAreaByType_setLayoutFullScreen
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2800
     * @tc.desc   test_getAvoidAreaByType_setLayoutFullScreen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAvoidAreaByType_setLayoutFullScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getAvoidAreaByType_setLayoutFullScreen";
      let result1 = windowNdkTest.setWindowStatusBarEnabled(windowId, true, true);
      console.info(`${caseName}: result1: ${result1}`);
      expect(result1).assertEqual(0);
      await WindowClass.setWindowLayoutFullScreen(true);
      let AvoidArea_system = windowNdkTest.getAvoidAreaByType(windowId, 0);
      console.info(`${caseName}: AvoidArea_system result: ${JSON.stringify(AvoidArea_system)}`);
      if (isFreeWindowMode) {	 
         await WindowClass.setWindowLayoutFullScreen(false);
          expect(AvoidArea_system.topRect.width).assertEqual(0);
          expect(AvoidArea_system.topRect.height).assertEqual(0);
          done();	 
       } else {
         await WindowClass.setWindowLayoutFullScreen(false);
        expect(AvoidArea_system.topRect.width).assertLargerOrEqual(0);
        expect(AvoidArea_system.topRect.height).assertLargerOrEqual(0);
        done();
       }
    })

    /**
     * @tc.name   test_getAvoidAreaByType_setPreferredOrientation
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2900
     * @tc.desc   test_getAvoidAreaByType_setPreferredOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAvoidAreaByType_setPreferredOrientation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getAvoidAreaByType_setPreferredOrientation";
      await WindowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
      await sleep(2000);
      let AvoidArea_system = windowNdkTest.getAvoidAreaByType(windowId, 0);
      console.info(`${caseName}: AvoidArea_system result: ${JSON.stringify(AvoidArea_system)}`);
      expect(AvoidArea_system.topRect.width).assertLargerOrEqual(0);
      expect(AvoidArea_system.topRect.height).assertLargerOrEqual(0);
      await WindowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
      await sleep(2000);
      done();
    })

    /**
     * @tc.name   test_setBackgroundColor_401
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3000
     * @tc.desc   test_setBackgroundColor_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setBackgroundColor_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setBackgroundColor_401";
      let result = windowNdkTest.setBackgroundColor(windowId, null);
      console.info(`${caseName}: setBackgroundColor result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   test_setBackgroundColor_FF00FF00Adapt001
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3100
     * @tc.desc   test_setBackgroundColor_#FF00FF00
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setBackgroundColor_FF00FF00Adapt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_setBackgroundColor_#FF00FF00";
      let result = windowNdkTest.setBackgroundColor(windowId, '#FF00FF00');
      console.info(`${caseName}: setBackgroundColor result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   test_setBackgroundColor_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3200
     * @tc.desc   test_setBackgroundColor_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setBackgroundColor_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setBackgroundColor_1300002";
      let result = windowNdkTest.setBackgroundColor(-1, '#FF00FF00');
      console.info(`${caseName}: setBackgroundColor result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_SetBrightness_401
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3300
     * @tc.desc   test_SetBrightness_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetBrightness_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetBrightness_401";
      let result = windowNdkTest.setBrightness(windowId, -5);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   test_SetBrightness_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3400
     * @tc.desc   test_SetBrightness_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetBrightness_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetBrightness_1300002";
      let result = windowNdkTest.setBrightness(-1, 1);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_SetBrightness_-2
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3500
     * @tc.desc   test_SetBrightness_-2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetBrightness_-2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetBrightness_-2";
      let result = windowNdkTest.setBrightness(windowId, -2);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   test_SetBrightness_2
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3600
     * @tc.desc   test_SetBrightness_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetBrightness_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetBrightness_2";
      let result = windowNdkTest.setBrightness(windowId, 2);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.name   test_SetBrightness_1
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3700
     * @tc.desc   test_SetBrightness_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetBrightness_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetBrightness_1";
      let result = windowNdkTest.setBrightness(windowId, 1.0);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      let brightness = WindowClass.getWindowProperties().brightness;
      console.info(`${caseName}: get brightness: ${JSON.stringify(brightness)}`);
      expect(brightness).assertEqual(1.0)
      done();
    })

    /**
     * @tc.name   test_SetBrightness_00Adapt001
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3800
     * @tc.desc   test_SetBrightness_0.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetBrightness_00Adapt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetBrightness_0.0";
      let result = windowNdkTest.setBrightness(windowId, 0.0);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      let brightness = WindowClass.getWindowProperties().brightness;
      console.info(`${caseName}: get brightness: ${JSON.stringify(brightness)}`);
      expect(brightness).assertEqual(0.0)
      done();
    })

    /**
     * @tc.name   test_SetBrightness_-1
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3900
     * @tc.desc   test_SetBrightness_-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetBrightness_-1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetBrightness_-1";
      let result = windowNdkTest.setBrightness(windowId, -1);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      let brightness = WindowClass.getWindowProperties().brightness;
      console.info(`${caseName}: get brightness: ${JSON.stringify(brightness)}`);
      expect(brightness).assertEqual(-1)
      done();
    })


    /**
     * @tc.name   test_SetKeepScreenOn_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4000
     * @tc.desc   test_SetKeepScreenOn_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetKeepScreenOn_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetKeepScreenOn_1300002";
      let result = windowNdkTest.setKeepScreenOn(-1, true);
      console.info(`${caseName}: setKeepScreenOn result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_SetKeepScreenOn_false
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4100
     * @tc.desc   test_SetKeepScreenOn_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetKeepScreenOn_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetKeepScreenOn_false";
      let result = windowNdkTest.setKeepScreenOn(windowId, false);
      console.info(`${caseName}: setKeepScreenOn result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      let isKeepScreenOn = WindowClass.getWindowProperties().isKeepScreenOn;
      console.info(`${caseName}: get isKeepScreenOn: ${JSON.stringify(isKeepScreenOn)}`);
      expect(isKeepScreenOn).assertEqual(false)
      done();
    })

    /**
     * @tc.name   test_SetKeepScreenOn_true
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4200
     * @tc.desc   test_SetKeepScreenOn_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetKeepScreenOn_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetKeepScreenOn_true";
      let result = windowNdkTest.setKeepScreenOn(windowId, true);
      console.info(`${caseName}: setKeepScreenOn result: ${result}`);
      expect(result).assertEqual(0);
      let isKeepScreenOn = WindowClass.getWindowProperties().isKeepScreenOn;
      console.info(`${caseName}: get isKeepScreenOn: ${JSON.stringify(isKeepScreenOn)}`);
      expect(isKeepScreenOn).assertEqual(true)
      done();
    })


    /**
     * @tc.name   test_SetWindowPrivacyMode_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4300
     * @tc.desc   test_SetWindowPrivacyMode_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowPrivacyMode_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowPrivacyMode_1300002";
      let result = windowNdkTest.setWindowPrivacyMode(-1, true);
      console.info(`${caseName}: setWindowPrivacyMode result: ${result}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_SetWindowPrivacyMode_true
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4400
     * @tc.desc   test_SetWindowPrivacyMode_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowPrivacyMode_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowPrivacyMode_true";
      let result = windowNdkTest.setWindowPrivacyMode(windowId, true);
      console.info(`${caseName}: setWindowPrivacyMode result: ${result}`);
      expect(result).assertEqual(0);
      let windowRect = WindowClass.getWindowProperties().windowRect;
      console.log(`${caseName}: windowRect : ${JSON.stringify(windowRect)}`)
      let PixelMap = windowNdkTest.snapshot(windowId);
      console.info(`${caseName}:  snapshot result: ${JSON.stringify(PixelMap)}`);
      if (Number(PixelMap) == 801) {
        done();
      } else {
        PixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          let PixelMapWidth = imageInfo.size.width;
          let PixelMapHeight = imageInfo.size.height;
          console.info(caseName + ' PixelMapWidth:' + PixelMapWidth + ' ,PixelMapHeight:' + PixelMapHeight);
          expect(Math.abs(PixelMapWidth - windowRect.width)).assertLessOrEqual(1);
          expect(Math.abs(PixelMapHeight - windowRect.height)).assertLessOrEqual(1);
          // expect(PixelMapWidth).assertEqual(windowRect.width);
          // expect(PixelMapHeight).assertEqual(windowRect.height);
          done();
        })

      }
    })

    /**
     * @tc.name   test_SetWindowPrivacyMode_false
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4500
     * @tc.desc   test_SetWindowPrivacyMode_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowPrivacyMode_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowPrivacyMode_false";
      let result = windowNdkTest.setWindowPrivacyMode(windowId, false);
      console.info(`${caseName}: setWindowPrivacyMode result: ${result}`);
      expect(result).assertEqual(0);
      let windowRect = WindowClass.getWindowProperties().windowRect;
      console.log(`${caseName}: windowRect : ${JSON.stringify(windowRect)}`)
      let PixelMap = windowNdkTest.snapshot(windowId);
      console.info(`${caseName}:  snapshot result: ${JSON.stringify(PixelMap)}`);
      if (Number(PixelMap) == 801) {
        done();
      } else {
        PixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          let PixelMapWidth = imageInfo.size.width;
          let PixelMapHeight = imageInfo.size.height;
          console.info(caseName + ' PixelMapWidth:' + PixelMapWidth + ' ,PixelMapHeight:' + PixelMapHeight);
          // expect(PixelMapWidth).assertEqual(windowRect.width);
          // expect(PixelMapHeight).assertEqual(windowRect.height);
          expect(Math.abs(PixelMapWidth - windowRect.width)).assertLessOrEqual(1);
          expect(Math.abs(PixelMapHeight - windowRect.height)).assertLessOrEqual(1);
          done();
        })

      }
    })

    /**
     * @tc.name   test_snapshot_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4600
     * @tc.desc   test_snapshot_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_snapshot_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_snapshot_1300002";
      let PixelMap = windowNdkTest.snapshot(-1);
      console.log(caseName + ' snapshot result:' + JSON.stringify(PixelMap));
      if (Number(PixelMap) == 801 || Number(PixelMap) == 1300002) {
        expect(false).assertTrue();
        done();
      } else {

        done();
      }
    })

    /**
     * @tc.name   test_SetWindowFocusable_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4700
     * @tc.desc   test_SetWindowFocusable_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowFocusable_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowFocusable_1300002";
      let result = windowNdkTest.setWindowFocusable(-1, true);
      console.log(caseName + ' setWindowFocusable result:' + JSON.stringify(result));
      expect(result).assertEqual(1300002);
      done();
    })
    /**
     * @tc.name   test_SetWindowFocusable_true
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4800
     * @tc.desc   test_SetWindowFocusable_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowFocusable_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetWindowFocusable_true";
      let result = windowNdkTest.setWindowFocusable(windowId, false);
      console.log(caseName + ' setWindowFocusable result:' + JSON.stringify(result));
      expect(result).assertEqual(0);
      let focusable = WindowClass.getWindowProperties().focusable;
      console.log(caseName + ' properties.focusable result:' + JSON.stringify(focusable));
      expect(focusable).assertEqual(false);
      done();
    })
    /**
     * @tc.name   test_SetWindowFocusable_trueAdapt001
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4900
     * @tc.desc   test_SetWindowFocusable_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowFocusable_trueAdapt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetWindowFocusable_true";
      let result = windowNdkTest.setWindowFocusable(windowId, true);
      console.log(caseName + ' setWindowFocusable result:' + JSON.stringify(result));
      expect(result).assertEqual(0);
      let focusable = WindowClass.getWindowProperties().focusable;
      console.log(caseName + ' properties.focusable result:' + JSON.stringify(focusable));
      expect(focusable).assertEqual(true);
      done();
    })

    /**
     * @tc.name   test_SetWindowTouchable_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5000
     * @tc.desc   test_SetWindowTouchable_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowTouchable_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_SetWindowTouchable_1300002";
      let result = windowNdkTest.setWindowTouchable(-1, true);
      console.log(caseName + ' SetWindowTouchable result:' + JSON.stringify(result));
      expect(result).assertEqual(1300002);
      done();
    })
    /**
     * @tc.name   test_SetWindowTouchable_false
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5100
     * @tc.desc   test_SetWindowTouchable_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowTouchable_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetWindowTouchable_false";
      let result = windowNdkTest.setWindowTouchable(windowId, false);
      console.log(caseName + ' SetWindowTouchable result:' + JSON.stringify(result));
      expect(result).assertEqual(0);
      let touchable = WindowClass.getWindowProperties().touchable;
      console.log(caseName + ' properties.touchable result:' + JSON.stringify(touchable));
      expect(touchable).assertEqual(false);
      done();
    })
    /**
     * @tc.name   test_SetWindowTouchable_true
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5200
     * @tc.desc   test_SetWindowTouchable_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowTouchable_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_SetWindowTouchable_true";
      let result = windowNdkTest.setWindowTouchable(windowId, true);
      console.log(caseName + ' SetWindowTouchable result:' + JSON.stringify(result));
      expect(result).assertEqual(0);
      let touchable = WindowClass.getWindowProperties().touchable;
      console.log(caseName + ' properties.touchable result:' + JSON.stringify(touchable));
      expect(touchable).assertEqual(true);
      done();
    })

    /**
     * @tc.name   test_GetWindowPorperties_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5300
     * @tc.desc   test_GetWindowPorperties_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_GetWindowPorperties_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_GetWindowPorperties_1300002";
      let result = windowNdkTest.getWindowPorperties(-1);
      console.log(caseName + ' getWindowPorperties result:' + JSON.stringify(Number(result)));
      expect(Number(result)).assertEqual(1300002);
      done();
    })

    /**
     * @tc.name   test_GetWindowPorperties
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5400
     * @tc.desc   test_GetWindowPorperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_GetWindowPorperties', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_GetWindowPorperties";
      let windowProperties = windowNdkTest.getWindowPorperties(windowId);
      console.log(caseName + ' getWindowPorperties result:' + JSON.stringify(windowProperties));
      expect(windowProperties.windowRect.width).assertLarger(0);
      expect(windowProperties.windowRect.height).assertLarger(0);
      done();
    })

    /**
     * @tc.name   test_registerMouseFilter_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5500
     * @tc.desc   test_registerMouseFilter_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_registerMouseFilter_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_registerMouseFilter_1300002";
      let result = windowNdkTest.registerMouseFilter(-1);
      console.log(caseName + '  result:' + JSON.stringify(result));
      expect(result).assertEqual(1000);
      done();
    })

    /**
     * @tc.name   test_registerMouseFilter_MouseRightButton
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5600
     * @tc.desc   test_registerMouseFilter_MouseRightButton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_registerMouseFilter_MouseRightButton', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_registerMouseFilter_MouseRightButton";
      let result = windowNdkTest.registerMouseFilter(windowId);
      console.log(caseName + '  result:' + JSON.stringify(result));
      if (result == 2000) {
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);

        done();
      } else
        if (result == 0) {

          done();
        } else {
          expect(false).assertTrue();
          done();
        }
    })

    /**
     * @tc.name   test_unRegisterMouseFilter_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5600
     * @tc.desc   test_unRegisterMouseFilter_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_unRegisterMouseFilter_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_unRegisterMouseFilter_1300002";
      let result = windowNdkTest.clearMouseFilter(-1);
      console.log(caseName + '  result:' + JSON.stringify(result));
      //1000
      expect(result).assertEqual(1000);
      done();
    })

    /**
     * @tc.name   test_UnRegisterMouseFilter_MouseRightButton
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5700
     * @tc.desc   test_UnRegisterMouseFilter_MouseRightButton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_UnRegisterMouseFilter_MouseRightButton', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_UnRegisterMouseFilter_MouseRightButton";
      let result = windowNdkTest.clearMouseFilter(windowId);
      console.log(caseName + '  result:' + JSON.stringify(result));
      if (result == 2000) {
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);

        done();
      } else
        if (result == 0) {

          done();
        } else {
          expect(false).assertTrue();
          done();
        }
    })
    /**
     * @tc.name   test_registerTouchFilter_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5800
     * @tc.desc   test_registerTouchFilter_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_registerTouchFilter_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_registerTouchFilter_1300002";
      let result = windowNdkTest.registerTouchFilter(-1);
      console.log(caseName + '  result:' + JSON.stringify(result));
      expect(result).assertEqual(1000);
      done();
    })

    /**
     * @tc.name   test_registerTouchFilter_TouchMove
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5900
     * @tc.desc   test_registerTouchFilter_TouchMove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_registerTouchFilter_TouchMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_registerTouchFilter_TouchMove";
      let result = windowNdkTest.registerTouchFilter(windowId);
      console.log(caseName + '  result:' + JSON.stringify(result));
      if (result == 2000) {
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);

        done();
      } else
        if (result == 0) {

          done();
        } else {
          expect(false).assertTrue();
          done();
        }
    })

    /**
     * @tc.name   test_unRegisterTouchFilter_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6000
     * @tc.desc   test_unRegisterTouchFilter_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_unRegisterTouchFilter_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_unRegisterTouchFilter_1300002";
      let result = windowNdkTest.clearTouchFilter(-1);
      console.log(caseName + '  result:' + JSON.stringify(result));
      expect(result).assertEqual(1000);
      done();
    })

    /**
     * @tc.name   test_unRegisterTouchFilter_TouchMove
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6100
     * @tc.desc   test_unRegisterTouchFilter_TouchMove
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_unRegisterTouchFilter_TouchMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_unRegisterTouchFilter_TouchMove";
      let result = windowNdkTest.clearTouchFilter(windowId);
      console.log(caseName + '  result:' + JSON.stringify(result));
      if (result == 2000) {
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);

        done();
      } else
        if (result == 0) {

          done();
        } else {
          expect(false).assertTrue();
          done();
        }
    })
    /**
     * @tc.name   test_getAllWIndowLayOutInfo_401
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6200
     * @tc.desc   test_getAllWIndowLayOutInfo_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAllWIndowLayOutInfo_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getAllWIndowLayOutInfo_401";
      console.log(caseName + '  start');
      let result = windowNdkTest.getAllWIndowLayOutInfo(-1);
      console.log(caseName + '  result:' + JSON.stringify(result));
      if (Number(result) == 801) {
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        done();
      } else {
        expect(Number(result)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   test_getAllWIndowLayOutInfo
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6300
     * @tc.desc   test_getAllWIndowLayOutInfo_mainWIndow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getAllWIndowLayOutInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_getAllWIndowLayOutInfo";
      console.log(caseName + '  start');
      let mainWindow = windowStage.getMainWindowSync();
      let diaplayId = mainWindow.getWindowProperties().displayId;
      console.log(caseName + '  diaplayId:' + diaplayId);
      let result = windowNdkTest.getAllWIndowLayOutInfo(diaplayId);
      console.log(caseName + '  result:' + JSON.stringify(result));
      if (Number(result) == 801) {
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        done();
      } else {
        expect(result.length).assertLargerOrEqual(1);
        done();
      }
    })
    /**
     * @tc.name   test_getAllWIndowLayOutInfo_subWIndow
     * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6400
     * @tc.desc   test_getAllWIndowLayOutInfo_subWIndow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAllWIndowLayOutInfo_subWIndow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getAllWIndowLayOutInfo_subWIndow";
      console.log(caseName + '  start');
      let subWindow = await windowStage.createSubWindow('test_getAllWIndowLayOutInfo_subWIndow');
      await subWindow.setUIContent('testability/pages/subWindow');
      try {
        let windowlimitsWidth = subWindow.getWindowLimits().minWidth;
        let windowlimitsHeight = subWindow.getWindowLimits().minHeight;
        console.log(caseName + '  windowlimitsWidth:' + windowlimitsWidth + ',windowlimitsHeight:' + windowlimitsHeight);
        subWindow.resizeAsync(windowlimitsWidth, windowlimitsHeight);
        await subWindow.showWindow();
        await sleep(300);
        let diaplayId = subWindow.getWindowProperties().displayId;
        console.log(caseName + '  diaplayId:' + diaplayId);
        let result = windowNdkTest.getAllWIndowLayOutInfo(diaplayId);
        console.log(caseName + '  result:' + JSON.stringify(result));
        await subWindow.destroyWindow();
        if (Number(result) == 801) {
          console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
          done();
        } else {
          expect(result.length).assertLargerOrEqual(2);
          done();
        }
      } catch (err) {
        await subWindow.destroyWindow();
        if (err.code == 801) {
          console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
    * @tc.name test_mainWindow_setWindowStatusBarEnabled_avoidAreaChange
    * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6500
    * @tc.desc test_mainWindow_setWindowStatusBarEnabled_avoidAreaChange
    * @tc.type FUNCTION
    * @tc.size MEDIUMTEST
    * @tc.level LEVEL2
    */
    it('test_mainWindow_setWindowStatusBarEnabled_avoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_mainWindow_setWindowStatusBarEnabled_avoidAreaChange";
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let result = windowNdkTest.setWindowStatusBarEnabled(windowId, false, true);
      console.info(`${caseName}: result: ${result}`);
      await sleep(3000);
      let areaChange: window.AvoidArea | undefined = undefined;
      let areaChangeType: window.AvoidAreaType | undefined = undefined;
      let flag: boolean = false;
      WindowClass.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
        console.info(caseName + 'Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        flag = true;
        areaChange = data.area;
        areaChangeType = data.type;
      });
      await sleep(100);
      let result2 = windowNdkTest.setWindowStatusBarEnabled(windowId, true, true);
      console.info(`${caseName}: result2: ${result2}`);
      await sleep(200);
      if (canIUseRes === false ||(deviceType === 'phone' && isFreeWindowMode === false) || (deviceType === 'tablet' && isFreeWindowMode === false)) {
        expect(result2).assertEqual(0);
        expect(areaChangeType).assertEqual(window.AvoidAreaType.TYPE_SYSTEM);
        expect(flag).assertEqual(true);
        expect(areaChange!.topRect.width).assertLarger(0);
        expect(areaChange!.topRect.height).assertLarger(0);
        WindowClass.off('avoidAreaChange');
        done();
      } else if (deviceType === 'wearable' || deviceType === 'tv' || deviceType === '2in1' || deviceType === 'car' || (deviceType === 'tablet' && isFreeWindowMode === true)) {
        expect(result2).assertEqual(0);
        expect(flag).assertEqual(false);
        WindowClass.off('avoidAreaChange');
        done();
      } else {
        WindowClass.off('avoidAreaChange');
        expect(false).assertTrue();
        done();
      }
    })
    /**
    * @tc.name testMainWindowSetNavigationBarEnabledAvoidAreaChange
    * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6600
    * @tc.desc testMainWindowSetNavigationBarEnabledAvoidAreaChange
    * @tc.type FUNCTION
    * @tc.size MEDIUMTEST
    * @tc.level LEVEL2
    */
    it('testMainWindowSetNavigationBarEnabledAvoidAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testMainWindowSetNavigationBarEnabledAvoidAreaChange";
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let result = windowNdkTest.setWindowNavigationBarEnabled(windowId, false, true);
      console.info(`${ caseName }: result: ${ result }`);
      await sleep(3000);
      let areaChange: window.AvoidArea | undefined = undefined;
      let areaChangeType: window.AvoidAreaType | undefined = undefined;
      let flag: boolean = false;
      WindowClass.on('avoidAreaChange', (data: window.AvoidAreaOptions) => {
        console.info('Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        flag = true;
        areaChange = data.area;
        areaChangeType = data.type;
      });
      await sleep(300);
      let result2 = windowNdkTest.setWindowNavigationBarEnabled(windowId, true, true);
      console.info(`${ caseName }: result2: ${ result2 }`);
      await sleep(200);
      if (!canIUseRes) {
        expect(result2).assertEqual(0);
        expect(areaChangeType).assertEqual(window.AvoidAreaType.TYPE_SYSTEM);
        expect(flag).assertEqual(true);
        expect(areaChange!.bottomRect.width).assertLarger(0);
        expect(areaChange!.bottomRect.height).assertLarger(0);
        WindowClass.off('avoidAreaChange');
        done();
      } else {
        expect(result2).assertEqual(0);
        expect(flag).assertEqual(false);
        WindowClass.off('avoidAreaChange');
        done();
      }
    })

    /**
     * @tc.name   test_OH_WindowManager_GetAllMainWindowInfo_0100
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0100
     * @tc.desc   OH_WindowManager_GetAllMainWindowInfo测试错误码校验201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetAllMainWindowInfo_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_GetAllMainWindowInfo_0100 ';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.test_OH_WindowManager_GetAllMainWindowInfo_0100();
          if (isPCStatus != '') {
            expect(Result).assertEqual(201);
          } else {
            expect(Result).assertEqual(801);
          }
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   test_OH_WindowManager_GetMainWindowSnapshot_0100
     * @tc.number SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0100
     * @tc.desc   OH_WindowManager_GetMainWindowSnapshot测试错误码校验801、201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_GetMainWindowSnapshot_0100 ';
        try {
          console.info(`${caseName} start`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          let Result: number = windowNdkTest.test_OH_WindowManager_GetMainWindowSnapshot_0100(windowId);
          console.info(`${caseName} Result: ${Result}`);
          if (isPCStatus != '') {
            expect(Result).assertEqual(201);
          } else {
            expect(Result).assertEqual(801);
          }
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   testLockCursorwithNotExistedWindowid
     * @tc.number SUB_BASIC_WMS_FUNCTION_LOCKCURSOR_0300
     * @tc.desc   testLockCursorwithNotExistedWindowid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLockCursorwithNotExistedWindowid', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'testLockCursorwithNotExistedWindowid ';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.testLockCursorwithNotExistedWindowid(10000);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300002);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   testLockCursorwithDestroyedWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_LOCKCURSOR_0400
     * @tc.desc   testLockCursorwithDestroyedWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLockCursorwithDestroyedWindow', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'testLockCursorwithDestroyedWindow ';
        let subWindowClass: window.Window | undefined
        try {
          console.info(`${caseName} start`);
          subWindowClass = await windowStage.createSubWindow('testLockCursorwithDestroyedWindow');
          let windowId = subWindowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          await subWindowClass.destroyWindow();
          let Result: number = windowNdkTest.testLockCursorwithDestroyedWindow(windowId);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300002);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          await subWindowClass?.destroyWindow();
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   testLockCursorwithUnfocusableWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_LOCKCURSOR_0500
     * @tc.desc   testLockCursorwithUnfocusableWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLockCursorwithUnfocusableWindow', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'testLockCursorwithUnfocusableWindow ';
        let subWindowClass: window.Window | undefined
        try {
          console.info(`${caseName} start`);
          subWindowClass = await windowStage.createSubWindow('testLockCursorwithUnfocusableWindow');
          let windowId = subWindowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          await subWindowClass.setFocusable(false);
          let Result: number = windowNdkTest.testLockCursorwithUnfocusableWindow(windowId);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300002);
          await subWindowClass.destroyWindow();
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          await subWindowClass?.destroyWindow();
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   testLockCursorandUnLockCursor
     * @tc.number SUB_BASIC_WMS_FUNCTION_LOCKCURSOR_0600
     * @tc.desc   testLockCursorandUnLockCursor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLockCursorandUnLockCursor', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testLockCursorandUnLockCursor ';
        let subWindowClass: window.Window | undefined
        try {
          console.info(`${caseName} start`);
          subWindowClass = await windowStage.createSubWindow('testLockCursorandUnLockCursor');
          await subWindowClass.setUIContent('testability/pages/subWindow');
          await subWindowClass.showWindow();
          await sleep(1000)
          await subWindowClass.resize(300, 300);
          await sleep(300);
          await subWindowClass.moveWindowTo(100, 100);
          await sleep(300)
          let windowProperties = subWindowClass.getWindowProperties();
          console.info(`${caseName} sub windowProperties: ${JSON.stringify(windowProperties)}`);
          let windowId = windowProperties.id;
          console.info(`${caseName} sub windowId: ${windowId}`);
          let Result: number = windowNdkTest.testLockCursorandUnLockCursor1(windowId);
          console.info(`${caseName} Result testLockCursorandUnLockCursor1: ${Result}`);
          if (Result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
            await subWindowClass.destroyWindow();
            done();
          } else {
            expect(Result).assertEqual(0);
            let Result2: number = windowNdkTest.testLockCursorandUnLockCursor2(windowId);
            console.info(`${caseName} Result testLockCursorandUnLockCursor2: ${Result2}`);
            expect(Result2).assertEqual(0);
            await subWindowClass.destroyWindow();
            done()
          }

        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          await subWindowClass?.destroyWindow();
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   testUnLockCursorwithNotExistedWindowid
     * @tc.number SUB_BASIC_WMS_FUNCTION_UNLOCKCURSOR_0300
     * @tc.desc   testUnLockCursorwithNotExistedWindowid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnLockCursorwithNotExistedWindowid', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'testUnLockCursorwithNotExistedWindowid ';
        try {
          console.info(`${caseName} start`);
          let windowClass = windowStage.getMainWindowSync()
          let windowId = windowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          let Result: number = windowNdkTest.testUnLockCursorwithNotExistedWindowid(10000);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300002);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   testUnLockCursorwithDestroyedWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_UNLOCKCURSOR_0400
     * @tc.desc   testUnLockCursorwithDestroyedWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnLockCursorwithDestroyedWindow', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'testUnLockCursorwithDestroyedWindow ';
        let subWindowClass: window.Window | undefined
        try {
          console.info(`${caseName} start`);
          subWindowClass = await windowStage.createSubWindow('testUnLockCursorwithDestroyedWindow');
          let windowId = subWindowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          await subWindowClass.destroyWindow();
          let Result: number = windowNdkTest.testUnLockCursorwithDestroyedWindow(windowId);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300002);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          await subWindowClass?.destroyWindow();
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   testUnLockCursorwithUnfocusableWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_UNLOCKCURSOR_0500
     * @tc.desc   testUnLockCursorwithUnfocusableWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnLockCursorwithUnfocusableWindow', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'testUnLockCursorwithUnfocusableWindow ';
        let subWindowClass: window.Window | undefined
        try {
          console.info(`${caseName} start`);
          subWindowClass = await windowStage.createSubWindow('testUnLockCursorwithUnfocusableWindow');
          let windowId = subWindowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          await subWindowClass.setFocusable(false);
          let Result: number = windowNdkTest.testUnLockCursorwithUnfocusableWindow(windowId);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300002);
          await subWindowClass.destroyWindow();
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          await subWindowClass?.destroyWindow();
          expect(false).assertEqual(err);
          done()
        }
      })


    /**
     * @tc.name   testWindowManager_ErrorCode_enum
     * @tc.number SUB_WindowManager_ErrorCode_0100
     * @tc.desc   testWindowManager_ErrorCode_enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindowManager_ErrorCode_enum', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testWindowManager_ErrorCode_enum ';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.testWindowManager_ErrorCode_enum();
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(0);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(err);
          done()
        }
      })

    /**
     * @tc.name   test_OH_WindowManager_registerFrameMetricsMeasuredCallback_0100
     * @tc.number test_OH_WindowManager_registerFrameMetricsMeasuredCallback_0100
     * @tc.desc   OH_WindowManager_registerFrameMetricsMeasuredCallback接口注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_registerFrameMetricsMeasuredCallback_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_RegisterFrameMetricsMeasuredCallback_0100';
        try {
          console.info(`${caseName} start`);
          let isSupport = canIUse('SystemCapability.Window.SessionManager')
          console.info(`${caseName} isSupport: ${isSupport}`);

          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          let Result: number = windowNdkTest.registerFrameMetricsMeasuredCallback(windowId);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(0);

          if (isSupport === true){
            windowStage.setCustomDensity(2.0,true);
            await sleep(500);
            let CB_count = windowNdkTest.getFrameMetricsCBCount();
            let result_metrics = windowNdkTest.getFrameMetrics(); 
            console.info(`${caseName} CB_count: ${CB_count}`);
            console.info(`${caseName} result_metrics.isFirstDrawFrame: ${result_metrics.isFirstDrawFrame}`);
            console.info(`${caseName} result_metrics.inputHandlingDuration: ${result_metrics.inputHandlingDuration}`);
            console.info(`${caseName} result_metrics.duration: ${result_metrics.duration}`);
            console.info(`${caseName} result_metrics.timestamp: ${result_metrics.timestamp}`);
            expect(CB_count).assertLarger(0);
            expect(result_metrics.isFirstDrawFrame).assertEqual(false);
            expect(result_metrics.inputHandlingDuration).assertLarger(0);
            expect(result_metrics.duration).assertLarger(0);
            expect(result_metrics.timestamp).assertLarger(0);

            await sleep(500);
            windowStage.setCustomDensity(-1.0);
          }
          
          let ResultOff: number = windowNdkTest.unregisterFrameMetricsMeasuredCallback(windowId);
          console.info(`${caseName} Result: ${ResultOff}`);
          expect(ResultOff).assertEqual(0);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback_0100
     * @tc.number test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback_0100
     * @tc.desc   OH_WindowManager_UnregisterFrameMetricsMeasuredCallback接口注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback_0100';
        try {
          console.info(`${caseName} start`);
          let isSupport = canIUse('SystemCapability.Window.SessionManager')
          console.info(`${caseName} isSupport: ${isSupport}`);

          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          let ResultOn: number = windowNdkTest.registerFrameMetricsMeasuredCallback(windowId);
          await sleep(500);
          let ResultOff: number = windowNdkTest.unregisterFrameMetricsMeasuredCallback(windowId);
          console.info(`${caseName} Result: ${ResultOff}`);
          expect(ResultOff).assertEqual(0);
          
          if (isSupport === true){
            windowStage.setCustomDensity(2.0,true);
            await sleep(500);
            let CB_count = windowNdkTest.getFrameMetricsCBCount();
            console.info(`${caseName} CB_count: ${CB_count}`);
            expect(CB_count).assertEqual(0);

            await sleep(500);
            windowStage.setCustomDensity(-1.0);
          }

          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   test_OH_WindowManager_registerFrameMetricsMeasuredCallback1300016_0100
     * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRICSMEASURED_0100
     * @tc.desc   OH_WindowManager_registerFrameMetricsMeasuredCallback接口注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_registerFrameMetricsMeasuredCallback1300016_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_registerFrameMetricsMeasuredCallback1300016_0100';
        try {
          console.info(`${caseName} start`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          let Result: number = windowNdkTest.registerFrameMetricsMeasuredCallbackNullptr(windowId);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300016);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback1300016_0100
     * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRICSMEASURED_0200
     * @tc.desc   OH_WindowManager_UnregisterFrameMetricsMeasuredCallback接口注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback1300016_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback1300016_0100';
        try {
          console.info(`${caseName} start`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`${caseName} windowId: ${windowId}`);
          let Result: number = windowNdkTest.unregisterFrameMetricsMeasuredCallbackNullptr(windowId);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300016);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   test_OH_WindowManager_registerFrameMetricsMeasuredCallback_1300002
     * @tc.number test_OH_WindowManager_registerFrameMetricsMeasuredCallback_1300002
     * @tc.desc   OH_WindowManager_registerFrameMetricsMeasuredCallback接口注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_registerFrameMetricsMeasuredCallback_1300002', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_registerFrameMetricsMeasuredCallback_1300002';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.registerFrameMetricsMeasuredCallback(-1);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300002);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.name   test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback_1300002
     * @tc.number test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback_1300002
     * @tc.desc   OH_WindowManager_UnregisterFrameMetricsMeasuredCallback接口注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback_1300002', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_UnregisterFrameMetricsMeasuredCallback_1300002';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.unregisterFrameMetricsMeasuredCallback(-1);
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300002);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

      /**
      * @tc.name   test_OH_WindowManager_FrameMetrics_IsFirstDrawFrame_1300016
      * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6700
      * @tc.desc   test OH_WindowManager_FrameMetrics_IsFirstDrawFrame with metrics nullptr
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_OH_WindowManager_FrameMetrics_IsFirstDrawFrame_1300016', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_FrameMetrics_IsFirstDrawFrame_1300016';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.testFrameMetricsIsFirstDrawFrameNullptr();
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300016);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
      * @tc.name   test_OH_WindowManager_FrameMetrics_GetInputHandlingDuration_1300016
      * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6800
      * @tc.desc   test OH_WindowManager_FrameMetrics_GetInputHandlingDuration with metrics nullptr
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_OH_WindowManager_FrameMetrics_GetInputHandlingDuration_1300016', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_FrameMetrics_GetInputHandlingDuration_1300016';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.testFrameMetricsGetInputHandlingDurationNullptr();
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300016);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
      * @tc.name   test_OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration_1300016
      * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6900
      * @tc.desc   test OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration with metrics nullptr
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration_1300016', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration_1300016';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.testFrameMetricsGetLayoutMeasureDurationNullptr();
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300016);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
      * @tc.name   test_OH_WindowManager_FrameMetrics_GetVsyncTimestamp_1300016
      * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_7000
      * @tc.desc   test OH_WindowManager_FrameMetrics_GetVsyncTimestamp with metrics nullptr
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('test_OH_WindowManager_FrameMetrics_GetVsyncTimestamp_1300016', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_FrameMetrics_GetVsyncTimestamp_1300016';
        try {
          console.info(`${caseName} start`);
          let Result: number = windowNdkTest.testFrameMetricsGetVsyncTimestampNullptr();
          console.info(`${caseName} Result: ${Result}`);
          expect(Result).assertEqual(1300016);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
      * @tc.name   test_OH_WindowManager_FrameMetrics_IsFirstDrawFrame_OK_0100
      * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_7100
      * @tc.desc   test OH_WindowManager_FrameMetrics_IsFirstDrawFrame return OK
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('test_OH_WindowManager_FrameMetrics_IsFirstDrawFrame_OK_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_FrameMetrics_IsFirstDrawFrame_OK_0100';
        try {
          console.info(`${caseName} start`);
          let okResult = windowNdkTest.testFrameMetricsIsFirstDrawFrameOK();
          console.info(`${caseName} resultCode: ${okResult.resultCode}`);
          console.info(`${caseName} isFirstDrawFrame: ${okResult.isFirstDrawFrame}`);
          
          expect(okResult.resultCode).assertEqual(0);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
      * @tc.name   test_OH_WindowManager_FrameMetrics_GetInputHandlingDuration_OK_0100
      * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_7200
      * @tc.desc   test OH_WindowManager_FrameMetrics_GetInputHandlingDuration return OK
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('test_OH_WindowManager_FrameMetrics_GetInputHandlingDuration_OK_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_FrameMetrics_GetInputHandlingDuration_OK_0100';
        try {
          console.info(`${caseName} start`);
          let okResult = windowNdkTest.testFrameMetricsGetInputHandlingDurationOK();
          console.info(`${caseName} resultCode: ${okResult.resultCode}`);
          console.info(`${caseName} duration: ${okResult.duration}`);
          
          expect(okResult.resultCode).assertEqual(0);
          expect(okResult.duration).assertLargerOrEqual(0);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
      * @tc.name   test_OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration_OK_0100
      * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_7300
      * @tc.desc   test OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration return OK
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('test_OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration_OK_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_FrameMetrics_GetLayoutMeasureDuration_OK_0100';
        try {
          console.info(`${caseName} start`);
          let okResult = windowNdkTest.testFrameMetricsGetLayoutMeasureDurationOK();
          console.info(`${caseName} resultCode: ${okResult.resultCode}`);
          console.info(`${caseName} duration: ${okResult.duration}`);
          
          expect(okResult.resultCode).assertEqual(0);
          expect(okResult.duration).assertLargerOrEqual(0);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

    /**
      * @tc.name   test_OH_WindowManager_FrameMetrics_GetVsyncTimestamp_OK_0100
      * @tc.number SUB_BASIC_WMS_WINDOW_MANAGER_NDK_7400
      * @tc.desc   test OH_WindowManager_FrameMetrics_GetVsyncTimestamp return OK
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
    it('test_OH_WindowManager_FrameMetrics_GetVsyncTimestamp_OK_0100', TestType.FUNCTION |
      Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'test_OH_WindowManager_FrameMetrics_GetVsyncTimestamp_OK_0100';
        try {
          console.info(`${caseName} start`);
          let okResult = windowNdkTest.testFrameMetricsGetVsyncTimestampOK();
          console.info(`${caseName} resultCode: ${okResult.resultCode}`);
          console.info(`${caseName} timestamp: ${okResult.timestamp}`);
          
          expect(okResult.resultCode).assertEqual(0);
          expect(okResult.timestamp).assertLargerOrEqual(0);
          done()
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        }
      })

      
  })
}