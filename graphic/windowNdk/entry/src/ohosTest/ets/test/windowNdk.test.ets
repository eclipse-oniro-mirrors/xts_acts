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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import windowNdkTest from 'libentry.so';
import { BusinessError } from '@ohos.base';
import deviceInfo from '@ohos.deviceInfo';
import { image } from '@kit.ImageKit';

function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export default function windowNdk() {
  describe('windowNdk', () => {
    let windowStage:window.WindowStage;
    let Tag = 'ActsWindowNdkTest';
    let WindowClass:window.Window;
    let windowId:number;
    let context : common.UIAbilityContext;
    let deviceType: string = '';
    beforeAll(async() => {
      windowStage = AppStorage.get("windowStage") as window.WindowStage;
      console.log(`${Tag}:beforeAll start... `);
      WindowClass = await windowStage.getMainWindow();
      windowId = WindowClass.getWindowProperties().id;
      console.log(`${Tag}:windowId:${windowId} `);
      context = AppStorage.get("context") as common.UIAbilityContext;
      deviceType = deviceInfo.deviceType;
      console.log('windowNdk beforeAll deviceType =' + deviceType);
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0100
     * @tc.name      : test_OH_NativeWindowManager_RegisterKeyEventFilter
     * @tc.desc      : test_OH_NativeWindowManager_RegisterKeyEventFilter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_OH_NativeWindowManager_RegisterKeyEventFilter', 0, async (done:Function) => {
        console.info(`${Tag}: test_OH_NativeWindowManager_RegisterKeyEventFilter RegisterKeyEventFilter windowId: ${windowId}`);
        let a = windowNdkTest.filterKeyCode(windowId,2070);
        console.info(`${Tag}: test_OH_NativeWindowManager_RegisterKeyEventFilter RegisterKeyEventFilter: ${a}`);
        if(a==2000){
          console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
          expect(true).assertTrue();
          done();
        }else
          if (a==0){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0200
     * @tc.name      : test_OH_NativeWindowManager_UnregisterKeyEventFilter
     * @tc.desc      : test_OH_NativeWindowManager_UnregisterKeyEventFilter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_OH_NativeWindowManager_UnregisterKeyEventFilter', 0, async (done:Function) => {
      let a = windowNdkTest.unFilterKeyCode(windowId);
      console.info(`${Tag}: test_OH_NativeWindowManager_UnregisterKeyEventFilter unRegisterKeyEventFilter windowId: ${windowId}`);
      console.info(`${Tag}: test_OH_NativeWindowManager_UnregisterKeyEventFilter unRegisterKeyEventFilter: ${a}`);
      if(a==2000){
        console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
        expect(true).assertTrue();
        done();
      }else if (a==0){
        expect(true).assertTrue();
        done();
      }else{
        expect(false).assertTrue();
        done();
      }

    })

     /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0300
     * @tc.name      : test_OH_WindowManager_ShowWindow
     * @tc.desc      : test_OH_WindowManager_ShowWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_OH_WindowManager_ShowWindow', 0, async (done:Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0400
     * @tc.name      : test_NDK_show_subWindow
     * @tc.desc      : test_NDK_show_subWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_NDK_show_subWindow', 0, async (done:Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0500
     * @tc.name      : test_NDK_show_subWindow_JS_isShowWindow
     * @tc.desc      : test_NDK_show_subWindow_JS_isShowWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_NDK_show_subWindow_JS_isShowWindow', 0, async (done:Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0600
     * @tc.name      : test_NDK_show_subWindow_Minimize_window
     * @tc.desc      : test_NDK_show_subWindow_Minimize_window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_NDK_show_subWindow_Minimize_window', 0, async (done:Function) => {
      let caseName = "test_NDK_show_subWindow_Minimize_window";
      try {
        let promise = windowStage.createSubWindow('test_NDK_show_subWindow_Minimize_window');
        promise.then(async (data) => {
          let subWindow = data;
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
            console.info(caseName +':Succeeded in minimizing the window.');
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
            if(err.code == 801){
              done();
            }else{
              expect(false).assertTrue();
              done();
            }
          });
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0700
     * @tc.name      : test_NDK_Show_DialogWindow
     * @tc.desc      : test_NDK_Show_DialogWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_NDK_Show_DialogWindow', 0, async (done:Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0800
     * @tc.name      : test_OH_WindowManager_ShowWindow_1300002
     * @tc.desc      : test_OH_WindowManager_ShowWindow_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_OH_WindowManager_ShowWindow_1300002', 0, async (done:Function) => {
      let result = windowNdkTest.showWindow(-1);
      console.info(`${Tag}: test_OH_WindowManager_ShowWindow_1300002 result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(1300002);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_0900
     * @tc.name      : test_OH_WindowManager_IsShowWindown_1300002
     * @tc.desc      : test_OH_WindowManager_IsShowWindown_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_OH_WindowManager_IsShowWindown_1300002', 0, async (done:Function) => {
      let result = windowNdkTest.isWindowShown(-1);
      console.info(`${Tag}: test_OH_WindowManager_IsShowWindown_1300002 result: ${JSON.stringify(result)}`);
      expect(result.resultCode).assertEqual(1300002);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1000
     * @tc.name      : test_SetWindowStatusBarEnabled_1300002
     * @tc.desc      : test_SetWindowStatusBarEnabled_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetWindowStatusBarEnabled_1300002', 0, async (done:Function) => {
      let caseName = "test_SetWindowStatusBarEnabled_1300002";
      let result = windowNdkTest.setWindowStatusBarEnabled(-1,true,true);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1100
     * @tc.name      : test_mainWindow_SetWindowStatusBarEnabled
     * @tc.desc      : test_mainWindow_SetWindowStatusBarEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_mainWindow_SetWindowStatusBarEnabled', 0, async (done:Function) => {
      let caseName = "test_mainWindow_SetWindowStatusBarEnabled";
      let result = windowNdkTest.setWindowStatusBarEnabled(windowId,true,true);
      console.info(`${caseName}: result: ${result}`);
      if(deviceType == '2in1'){
        expect(result).assertEqual(801);
        done();
      }else{
        expect(result).assertEqual(0);
        done();
      }
      
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1200
     * @tc.name      : test_mainWindow_SetWindowStatusBarEnabled_false
     * @tc.desc      : test_mainWindow_SetWindowStatusBarEnabled_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_mainWindow_SetWindowStatusBarEnabled_false', 0, async (done:Function) => {
      let caseName = "test_mainWindow_SetWindowStatusBarEnabled_false";
      let result = windowNdkTest.setWindowStatusBarEnabled(windowId,false,false);
      console.info(`${caseName}: result: ${result}`);
      if(deviceType == '2in1'){
        expect(result).assertEqual(801);
        done();
      }else{
        expect(result).assertEqual(0);
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1300
     * @tc.name      : test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true
     * @tc.desc      : test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true', 0, async (done:Function) => {
      let caseName = "test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true";
      let result = windowNdkTest.setWindowStatusBarEnabled(windowId,false,true);
      console.info(`${caseName}: result: ${result}`);
      if(deviceType == '2in1'){
        expect(result).assertEqual(801);
        done();
      }else{
        expect(result).assertEqual(0);
        done();
      }
    })

     /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1400
     * @tc.name      : test_subWindow_SetWindowStatusBarEnabled
     * @tc.desc      : test_subWindow_SetWindowStatusBarEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
     it('test_subWindow_SetWindowStatusBarEnabled', 0, async (done:Function) => {
      let caseName = "test_subWindow_SetWindowStatusBarEnabled";
      try {
        let promise = windowStage.createSubWindow('test_subWindow_SetWindowStatusBarEnabled');
        promise.then(async (data) => {
          let subWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let subWindowId = subWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + subWindowId);

          let result1 = windowNdkTest.showWindow(subWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);
          
          let result = windowNdkTest.setWindowStatusBarEnabled(subWindowId,true,true);
          console.info(`${caseName}: result: ${result}`);
          if(deviceType == '2in1'){
            await subWindow.destroyWindow();
            expect(result).assertEqual(801);
            done();
          }else{
            await subWindow.destroyWindow();
            expect(result).assertEqual(0);
            done();
          } 
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1500
     * @tc.name      : test_dialogWindow_SetWindowStatusBarEnabled_1300002
     * @tc.desc      : test_dialogWindow_SetWindowStatusBarEnabled_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
     it('test_dialogWindow_SetWindowStatusBarEnabled_1300002', 0, async (done:Function) => {
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

          let result1 = windowNdkTest.showWindow(dialogWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);
          
          let result = windowNdkTest.setWindowStatusBarEnabled(dialogWindowId,true,true);
          console.info(`${caseName}: result: ${result}`);
          if(deviceType == '2in1'){
            await dialogWindow.destroyWindow();
            expect(result).assertEqual(801);
            done();
          }else {
            await dialogWindow.destroyWindow();
            expect(result).assertEqual(0);
            done();
          } 
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1600
     * @tc.name      : test_SetWindowNavigationBarEnabled_1300002
     * @tc.desc      : test_SetWindowNavigationBarEnabled_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetWindowNavigationBarEnabled_1300002', 0, async (done:Function) => {
      let caseName = "test_SetWindowNavigationBarEnabled_1300002";
      let result = windowNdkTest.setWindowNavigationBarEnabled(-1,true,true);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(1300002);
      done();
      
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1700
     * @tc.name      : test_mainWindow_setWindowNavigationBarEnabled
     * @tc.desc      : test_mainWindow_setWindowNavigationBarEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_mainWindow_setWindowNavigationBarEnabled', 0, async (done:Function) => {
      let caseName = "test_mainWindow_setWindowNavigationBarEnabled";
      let result = windowNdkTest.setWindowNavigationBarEnabled(windowId,true,true);
      console.info(`${caseName}: result: ${result}`);
      if(deviceType == '2in1'){
        expect(result).assertEqual(801);
        done();
      }else{
        expect(result).assertEqual(0);
      done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1800
     * @tc.name      : test_mainWindow_setWindowNavigationBarEnabled_false
     * @tc.desc      : test_mainWindow_setWindowNavigationBarEnabled_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_mainWindow_setWindowNavigationBarEnabled_false', 0, async (done:Function) => {
      let caseName = "test_mainWindow_setWindowNavigationBarEnabled_false";
      let result = windowNdkTest.setWindowNavigationBarEnabled(windowId,false,false);
      console.info(`${caseName}: result: ${result}`);
      if(deviceType == '2in1'){
        expect(result).assertEqual(801);
        done();
      }else{
        expect(result).assertEqual(0);
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_1900
     * @tc.name      : test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true
     * @tc.desc      : test_mainWindow_SetWindowStatusBarEnabled_false_enableAnimation_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_mainWindow_setWindowNavigationBarEnabled_false_enableAnimation_true', 0, async (done:Function) => {
      let caseName = "test_mainWindow_setWindowNavigationBarEnabled_false_enableAnimation_true";
      let result = windowNdkTest.setWindowNavigationBarEnabled(windowId,false,true);
      console.info(`${caseName}: result: ${result}`);
      if(deviceType == '2in1'){
        expect(result).assertEqual(801);
        done();
      }else{
        expect(result).assertEqual(0);
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2000
     * @tc.name      : test_subWindow_SetWindowNavigationBarEnabled
     * @tc.desc      : test_subWindow_SetWindowNavigationBarEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_subWindow_SetWindowNavigationBarEnabled', 0, async (done:Function) => {
      let caseName = "test_subWindow_SetWindowNavigationBarEnabled";
      try {
        let promise = windowStage.createSubWindow('test_subWindow_SetWindowNavigationBarEnabled');
        promise.then(async (data) => {
          let subWindow = data;
          console.info(`${caseName}: Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let subWindowId = subWindow.getWindowProperties().id;
          console.info(`${caseName}: Succeeded in get the subwindow id: ` + subWindowId);

          let result1 = windowNdkTest.showWindow(subWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);
          
          let result = windowNdkTest.setWindowNavigationBarEnabled(subWindowId,true,true);
          console.info(`${caseName}: result: ${result}`);
          if(deviceType == '2in1'){
            await subWindow.destroyWindow();
            expect(result).assertEqual(801);
            done();
          }else{
            await subWindow.destroyWindow();
            expect(result).assertEqual(0);
            done();
          } 
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2100
     * @tc.name      : test_dialogWindow_SetWindowNavigationBarEnabled_1300002
     * @tc.desc      : test_dialogWindow_SetWindowNavigationBarEnabled_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
     it('test_dialogWindow_SetWindowNavigationBarEnabled_1300002', 0, async (done:Function) => {
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

          let result1 = windowNdkTest.showWindow(dialogWindowId);
          console.info(`${caseName}: showWindow result1: ${JSON.stringify(result1)} + &{typeOf(result1)}`);
          
          let result = windowNdkTest.setWindowNavigationBarEnabled(dialogWindowId,true,true);
          console.info(`${caseName}: result: ${result}`);
          if(deviceType == '2in1'){
            await dialogWindow.destroyWindow();
            expect(result).assertEqual(801);
            done();
          }else{
            await dialogWindow.destroyWindow();
            expect(result).assertEqual(0);
            done();
          } 
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
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2200
     * @tc.name      : test_SetWindowStatusBarColor_1300002
     * @tc.desc      : test_SetWindowStatusBarColor_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetWindowStatusBarColor_1300002', 0, async (done:Function) => {
      let caseName = "test_SetWindowStatusBarColor_1300002";
      let result = windowNdkTest.setWindowStatusBarColor(-1,0XFF00FF00);
      console.info(`${caseName}: result: ${result}`);
      expect(result).assertEqual(1300002);
      done();

    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2300
     * @tc.name      : test_SetWindowStatusBarColor_0xFF00FF00
     * @tc.desc      : test_SetWindowStatusBarColor_0xFF00FF00
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetWindowStatusBarColor_0xFF00FF00', 0, async (done:Function) => {
      let caseName = "test_SetWindowStatusBarColor_0xFF00FF00";
      let result = windowNdkTest.setWindowStatusBarColor(windowId,0XFF00FF00);
      console.info(`${caseName}: result: ${result}`);
      if(deviceType == '2in1'){
        expect(result).assertEqual(801);
        done();
      }else{
        expect(result).assertEqual(0);
        let statusBarContentColor = WindowClass.getWindowSystemBarProperties().statusBarContentColor;
        console.info(`${caseName}: statusBarContentColor: ${statusBarContentColor}`);
        expect(statusBarContentColor).assertEqual('#FF00FF00');
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2400
     * @tc.name      : test_SetWindowStatusBarColor_0xFF000000
     * @tc.desc      : test_SetWindowStatusBarColor_0xFF000000
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetWindowStatusBarColor_0xFF000000', 0, async (done:Function) => {
      let caseName = "test_SetWindowStatusBarColor_0xFF000000";
      let result1 = windowNdkTest.setWindowStatusBarEnabled(windowId,false,true);
      console.info(`${caseName}: result1: ${result1}`);
      if(deviceType == '2in1'){
        expect(result1).assertEqual(801);
        done();
      }else{
        expect(result1).assertEqual(0);
        let result2 = windowNdkTest.setWindowStatusBarColor(windowId,0XFF000000);
        console.info(`${caseName}: result: ${result2}`);
        await sleep(100);
        let statusBarContentColor = WindowClass.getWindowSystemBarProperties().statusBarContentColor;
        console.info(`${caseName}: statusBarContentColor: ${statusBarContentColor}`);
        expect(statusBarContentColor).assertEqual('#FF000000');
        let result3 = windowNdkTest.setWindowStatusBarEnabled(windowId,true,true);
        console.info(`${caseName}: result: ${result3}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2500
     * @tc.name      : test_getAvoidAreaByType_1300002
     * @tc.desc      : test_getAvoidAreaByType_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_getAvoidAreaByType_1300002', 0, async (done:Function) => {
      let caseName = "test_getAvoidAreaByType_1300002";
      let result1 = windowNdkTest.getAvoidAreaByType(-1,0);
      console.info(`${caseName}: result: ${JSON.stringify(result1)}`);
      expect(result1).assertEqual(1300002);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2600
     * @tc.name      : test_getAvoidAreaByType_statusBar_show
     * @tc.desc      : test_getAvoidAreaByType_statusBar_show
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_getAvoidAreaByType_statusBar_show', 0, async (done:Function) => {
      let caseName = "test_getAvoidAreaByType_statusBar_show";
      let result1 = windowNdkTest.setWindowStatusBarEnabled(windowId,true,true);
      console.info(`${caseName}: result1: ${result1}`);
      if(deviceType == '2in1'){
        expect(result1).assertEqual(801);
        done();
      }else{
        expect(result1).assertEqual(0);
        let AvoidArea_system = windowNdkTest.getAvoidAreaByType(windowId,0);
        console.info(`${caseName}: AvoidArea_system result: ${JSON.stringify(AvoidArea_system)}`);
        expect(AvoidArea_system.topRect.width).assertLargerOrEqual(0);
        expect(AvoidArea_system.topRect.height).assertLargerOrEqual(0);
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2700
     * @tc.name      : test_getAvoidAreaByType_statusBar_hide
     * @tc.desc      : test_getAvoidAreaByType_statusBar_hide
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_getAvoidAreaByType_statusBar_hide', 0, async (done:Function) => {
      let caseName = "test_getAvoidAreaByType_statusBar_hide";
      let result1 = windowNdkTest.setWindowStatusBarEnabled(windowId,false,true);
      console.info(`${caseName}: result1: ${result1}`);
      await sleep(500);
      if(deviceType == '2in1'){
        expect(result1).assertEqual(801);
        done();
      }else{
        expect(result1).assertEqual(0);
        let AvoidArea_system = windowNdkTest.getAvoidAreaByType(windowId,0);
        console.info(`${caseName}: AvoidArea_system result: ${JSON.stringify(AvoidArea_system)}`);
        expect(AvoidArea_system.topRect.width).assertEqual(0);
        expect(AvoidArea_system.topRect.height).assertEqual(0);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2800
     * @tc.name      : test_getAvoidAreaByType_setLayoutFullScreen
     * @tc.desc      : test_getAvoidAreaByType_setLayoutFullScreen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_getAvoidAreaByType_setLayoutFullScreen', 0, async (done:Function) => {
      let caseName = "test_getAvoidAreaByType_setLayoutFullScreen";
      let result1 = windowNdkTest.setWindowStatusBarEnabled(windowId,true,true);
      console.info(`${caseName}: result1: ${result1}`);
      if(deviceType == '2in1'){
        expect(result1).assertEqual(801);
        done();
      }else{
        expect(result1).assertEqual(0);
        await WindowClass.setWindowLayoutFullScreen(true);
        let AvoidArea_system = windowNdkTest.getAvoidAreaByType(windowId,0);
        console.info(`${caseName}: AvoidArea_system result: ${JSON.stringify(AvoidArea_system)}`);
        expect(AvoidArea_system.topRect.width).assertLargerOrEqual(0);
        expect(AvoidArea_system.topRect.height).assertLargerOrEqual(0);
        await WindowClass.setWindowLayoutFullScreen(false);
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_2900
     * @tc.name      : test_getAvoidAreaByType_setPreferredOrientation
     * @tc.desc      : test_getAvoidAreaByType_setPreferredOrientation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_getAvoidAreaByType_setPreferredOrientation', 0, async (done:Function) => {
      let caseName = "test_getAvoidAreaByType_setPreferredOrientation";
      await WindowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
      await sleep(2000);
      let AvoidArea_system = windowNdkTest.getAvoidAreaByType(windowId,0);
      console.info(`${caseName}: AvoidArea_system result: ${JSON.stringify(AvoidArea_system)}`);
      expect(AvoidArea_system.topRect.width).assertLargerOrEqual(0);
      expect(AvoidArea_system.topRect.height).assertLargerOrEqual(0);
      await WindowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
      await sleep(2000);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3000
     * @tc.name      : test_setBackgroundColor_401
     * @tc.desc      : test_setBackgroundColor_401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_setBackgroundColor_401', 0, async (done:Function) => {
      let caseName = "test_setBackgroundColor_401";
      let result = windowNdkTest.setBackgroundColor(windowId,null);
      console.info(`${caseName}: setBackgroundColor result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3100
     * @tc.name      : test_setBackgroundColor_#FF00FF00
     * @tc.desc      : test_setBackgroundColor_#FF00FF00
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_setBackgroundColor_#FF00FF00', 0, async (done:Function) => {
      let caseName = "test_setBackgroundColor_#FF00FF00";
      let result = windowNdkTest.setBackgroundColor(windowId,'#FF00FF00');
      console.info(`${caseName}: setBackgroundColor result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3200
     * @tc.name      : test_setBackgroundColor_1300002
     * @tc.desc      : test_setBackgroundColor_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_setBackgroundColor_1300002', 0, async (done:Function) => {
      let caseName = "test_setBackgroundColor_1300002";
      let result = windowNdkTest.setBackgroundColor(-1,'#FF00FF00');
      console.info(`${caseName}: setBackgroundColor result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3300
     * @tc.name      : test_SetBrightness_401
     * @tc.desc      : test_SetBrightness_401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetBrightness_401', 0, async (done:Function) => {
      let caseName = "test_SetBrightness_401";
      let result = windowNdkTest.setBrightness(windowId,-5);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3400
     * @tc.name      : test_SetBrightness_1300002
     * @tc.desc      : test_SetBrightness_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetBrightness_1300002', 0, async (done:Function) => {
      let caseName = "test_SetBrightness_1300002";
      let result = windowNdkTest.setBrightness(-1,1);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3500
     * @tc.name      : test_SetBrightness_-2
     * @tc.desc      : test_SetBrightness_-2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetBrightness_-2', 0, async (done:Function) => {
      let caseName = "test_SetBrightness_-2";
      let result = windowNdkTest.setBrightness(windowId,-2);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3600
     * @tc.name      : test_SetBrightness_2
     * @tc.desc      : test_SetBrightness_2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetBrightness_2', 0, async (done:Function) => {
      let caseName = "test_SetBrightness_2";
      let result = windowNdkTest.setBrightness(windowId,2);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(401);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3700
     * @tc.name      : test_SetBrightness_1
     * @tc.desc      : test_SetBrightness_1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetBrightness_1', 0, async (done:Function) => {
      let caseName = "test_SetBrightness_1";
      let result = windowNdkTest.setBrightness(windowId,1.0);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      let brightness = WindowClass.getWindowProperties().brightness;
      console.info(`${caseName}: get brightness: ${JSON.stringify(brightness)}`);
      expect(brightness).assertEqual(1.0)
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3800
     * @tc.name      : test_SetBrightness_0.0
     * @tc.desc      : test_SetBrightness_0.0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetBrightness_0.0', 0, async (done:Function) => {
      let caseName = "test_SetBrightness_0.0";
      let result = windowNdkTest.setBrightness(windowId,0.0);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      let brightness = WindowClass.getWindowProperties().brightness;
      console.info(`${caseName}: get brightness: ${JSON.stringify(brightness)}`);
      expect(brightness).assertEqual(0.0)
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_3900
     * @tc.name      : test_SetBrightness_-1
     * @tc.desc      : test_SetBrightness_-1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetBrightness_-1', 0, async (done:Function) => {
      let caseName = "test_SetBrightness_-1";
      let result = windowNdkTest.setBrightness(windowId,-1);
      console.info(`${caseName}: setBrightness result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      let brightness = WindowClass.getWindowProperties().brightness;
      console.info(`${caseName}: get brightness: ${JSON.stringify(brightness)}`);
      expect(brightness).assertEqual(-1)
      done();
    })


    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4000
     * @tc.name      : test_SetKeepScreenOn_1300002
     * @tc.desc      : test_SetKeepScreenOn_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetKeepScreenOn_1300002', 0, async (done:Function) => {
      let caseName = "test_SetKeepScreenOn_1300002";
      let result = windowNdkTest.setKeepScreenOn(-1,true);
      console.info(`${caseName}: setKeepScreenOn result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(1300002);
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4100
     * @tc.name      : test_SetKeepScreenOn_false
     * @tc.desc      : test_SetKeepScreenOn_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetKeepScreenOn_false', 0, async (done:Function) => {
      let caseName = "test_SetKeepScreenOn_false";
      let result = windowNdkTest.setKeepScreenOn(windowId,false);
      console.info(`${caseName}: setKeepScreenOn result: ${JSON.stringify(result)}`);
      expect(result).assertEqual(0);
      let isKeepScreenOn = WindowClass.getWindowProperties().isKeepScreenOn;
      console.info(`${caseName}: get isKeepScreenOn: ${JSON.stringify(isKeepScreenOn)}`);
      expect(isKeepScreenOn).assertEqual(false)
      done();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4200
     * @tc.name      : test_SetKeepScreenOn_true
     * @tc.desc      : test_SetKeepScreenOn_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetKeepScreenOn_true', 0, async (done:Function) => {
      let caseName = "test_SetKeepScreenOn_true";
      let result = windowNdkTest.setKeepScreenOn(windowId,true);
      console.info(`${caseName}: setKeepScreenOn result: ${result}`);
      expect(result).assertEqual(0);
      let isKeepScreenOn = WindowClass.getWindowProperties().isKeepScreenOn;
      console.info(`${caseName}: get isKeepScreenOn: ${JSON.stringify(isKeepScreenOn)}`);
      expect(isKeepScreenOn).assertEqual(true)
      done();
    })


    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4300
     * @tc.name      : test_SetWindowPrivacyMode_1300002
     * @tc.desc      : test_SetWindowPrivacyMode_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetWindowPrivacyMode_1300002', 0, async (done:Function) => {
      let caseName = "test_SetWindowPrivacyMode_1300002";
      let result = windowNdkTest.setWindowPrivacyMode(-1,true);
      console.info(`${caseName}: setWindowPrivacyMode result: ${result}`);
      expect(result).assertEqual(1300002);
      done();
    })

/**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4400
     * @tc.name      : test_SetWindowPrivacyMode_true
     * @tc.desc      : test_SetWindowPrivacyMode_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetWindowPrivacyMode_true', 0, async (done:Function) => {
      let caseName = "test_SetWindowPrivacyMode_true";
      let result = windowNdkTest.setWindowPrivacyMode(windowId,true);
      console.info(`${caseName}: setWindowPrivacyMode result: ${result}`);
      expect(result).assertEqual(0);
      let windowRect = WindowClass.getWindowProperties().windowRect;
      console.log(`${caseName}: windowRect : ${JSON.stringify(windowRect)}`)
      let PixelMap = windowNdkTest.snapshot(windowId);
        console.info(`${caseName}:  snapshot result: ${JSON.stringify(PixelMap)}`);
        if(Number(PixelMap) == 801){
          done();
        }else{
          PixelMap.getImageInfo().then((imageInfo:image.ImageInfo)=>{
            let PixelMapWidth = imageInfo.size.width;
            let PixelMapHeight = imageInfo.size.height;
            console.info(caseName + ' PixelMapWidth:'+ PixelMapWidth + ' ,PixelMapHeight:'+ PixelMapHeight);
            expect(Math.abs(PixelMapWidth-windowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(PixelMapHeight-windowRect.height)).assertLessOrEqual(1);
            // expect(PixelMapWidth).assertEqual(windowRect.width);
            // expect(PixelMapHeight).assertEqual(windowRect.height);
            done();
          })

        }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4500
     * @tc.name      : test_SetWindowPrivacyMode_false
     * @tc.desc      : test_SetWindowPrivacyMode_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_SetWindowPrivacyMode_false', 0, async (done:Function) => {
      let caseName = "test_SetWindowPrivacyMode_false";
      let result = windowNdkTest.setWindowPrivacyMode(windowId,false);
      console.info(`${caseName}: setWindowPrivacyMode result: ${result}`);
      expect(result).assertEqual(0);
      let windowRect = WindowClass.getWindowProperties().windowRect;
      console.log(`${caseName}: windowRect : ${JSON.stringify(windowRect)}`)
      let PixelMap = windowNdkTest.snapshot(windowId);
        console.info(`${caseName}:  snapshot result: ${JSON.stringify(PixelMap)}`);
        if(Number(PixelMap) == 801){
          done();
        }else{
          PixelMap.getImageInfo().then((imageInfo:image.ImageInfo)=>{
            let PixelMapWidth = imageInfo.size.width;
            let PixelMapHeight = imageInfo.size.height;
            console.info(caseName + ' PixelMapWidth:'+ PixelMapWidth + ' ,PixelMapHeight:'+ PixelMapHeight);
            // expect(PixelMapWidth).assertEqual(windowRect.width);
            // expect(PixelMapHeight).assertEqual(windowRect.height);
            expect(Math.abs(PixelMapWidth-windowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(PixelMapHeight-windowRect.height)).assertLessOrEqual(1);
            done();
          })

        }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4600
         * @tc.name      : test_snapshot_1300002
         * @tc.desc      : test_snapshot_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_snapshot_1300002', 0, async (done:Function) => {
      let caseName = "test_snapshot_1300002";
      let PixelMap = windowNdkTest.snapshot(-1);
        console.log(caseName + ' snapshot result:'+ JSON.stringify(PixelMap));
        if(Number(PixelMap) == 801 || Number(PixelMap)==1300002){
          expect(false).assertTrue();
          done();
        }else{
          expect(true).assertTrue();
          done();
        }
    })

     /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4700
         * @tc.name      : test_SetWindowFocusable_1300002
         * @tc.desc      : test_SetWindowFocusable_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_SetWindowFocusable_1300002', 0, async (done:Function) => {
      let caseName = "test_SetWindowFocusable_1300002";
      let result = windowNdkTest.setWindowFocusable(-1,true);
        console.log(caseName + ' setWindowFocusable result:'+ JSON.stringify(result));
        expect(result).assertEqual(1300002);
        done();
    })
/**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4800
         * @tc.name      : test_SetWindowFocusable_false
         * @tc.desc      : test_SetWindowFocusable_false
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_SetWindowFocusable_true', 0, async (done:Function) => {
      let caseName = "test_SetWindowFocusable_true";
      let result = windowNdkTest.setWindowFocusable(windowId,false);
        console.log(caseName + ' setWindowFocusable result:'+ JSON.stringify(result));
        expect(result).assertEqual(0);
        let focusable = WindowClass.getWindowProperties().focusable;
        console.log(caseName + ' properties.focusable result:'+ JSON.stringify(focusable));
        expect(focusable).assertEqual(false);
        done();
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_4900
         * @tc.name      : test_SetWindowFocusable_true
         * @tc.desc      : test_SetWindowFocusable_true
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_SetWindowFocusable_true', 0, async (done:Function) => {
      let caseName = "test_SetWindowFocusable_true";
      let result = windowNdkTest.setWindowFocusable(windowId,true);
        console.log(caseName + ' setWindowFocusable result:'+ JSON.stringify(result));
        expect(result).assertEqual(0);
        let focusable = WindowClass.getWindowProperties().focusable;
        console.log(caseName + ' properties.focusable result:'+ JSON.stringify(focusable));
        expect(focusable).assertEqual(true);
        done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5000
         * @tc.name      : test_SetWindowTouchable_1300002
         * @tc.desc      : test_SetWindowTouchable_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_SetWindowTouchable_1300002', 0, async (done:Function) => {
      let caseName = "test_SetWindowTouchable_1300002";
      let result = windowNdkTest.setWindowTouchable(-1,true);
        console.log(caseName + ' SetWindowTouchable result:'+ JSON.stringify(result));
        expect(result).assertEqual(1300002);
        done();
    })
/**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5100
         * @tc.name      : test_SetWindowTouchable_false
         * @tc.desc      : test_SetWindowTouchable_false
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_SetWindowTouchable_false', 0, async (done:Function) => {
      let caseName = "test_SetWindowTouchable_false";
      let result = windowNdkTest.setWindowTouchable(windowId,false);
        console.log(caseName + ' SetWindowTouchable result:'+ JSON.stringify(result));
        expect(result).assertEqual(0);
        let touchable = WindowClass.getWindowProperties().touchable;
        console.log(caseName + ' properties.touchable result:'+ JSON.stringify(touchable));
        expect(touchable).assertEqual(false);
        done();
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5200
         * @tc.name      : test_SetWindowTouchable_true
         * @tc.desc      : test_SetWindowTouchable_true
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_SetWindowTouchable_true', 0, async (done:Function) => {
      let caseName = "test_SetWindowTouchable_true";
      let result = windowNdkTest.setWindowTouchable(windowId,true);
        console.log(caseName + ' SetWindowTouchable result:'+ JSON.stringify(result));
        expect(result).assertEqual(0);
        let touchable = WindowClass.getWindowProperties().touchable;
        console.log(caseName + ' properties.touchable result:'+ JSON.stringify(touchable));
        expect(touchable).assertEqual(true);
        done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5300
         * @tc.name      : test_GetWindowPorperties_1300002
         * @tc.desc      : test_GetWindowPorperties_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_GetWindowPorperties_1300002', 0, async (done:Function) => {
      let caseName = "test_GetWindowPorperties_1300002";
      let result = windowNdkTest.getWindowPorperties(-1);
        console.log(caseName + ' getWindowPorperties result:'+ JSON.stringify(Number(result)));
        expect(Number(result)).assertEqual(1300002);
        done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5400
         * @tc.name      : test_GetWindowPorperties
         * @tc.desc      : test_GetWindowPorperties
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_GetWindowPorperties', 0, async (done:Function) => {
      let caseName = "test_GetWindowPorperties";
      let windowProperties = windowNdkTest.getWindowPorperties(windowId);
        console.log(caseName + ' getWindowPorperties result:'+ JSON.stringify(windowProperties));
        expect(windowProperties.windowRect.width).assertLarger(0);
        expect(windowProperties.windowRect.height).assertLarger(0);
        done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5500
         * @tc.name      : test_registerMouseFilter_1300002
         * @tc.desc      : test_registerMouseFilter_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_registerMouseFilter_1300002', 0, async (done:Function) => {
      let caseName = "test_registerMouseFilter_1300002";
      let result = windowNdkTest.registerMouseFilter(-1);
        console.log(caseName + '  result:'+ JSON.stringify(result));
        expect(result).assertEqual(1000);
        done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5600
         * @tc.name      : test_registerMouseFilter_MouseRightButton
         * @tc.desc      : test_registerMouseFilter_MouseRightButton
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_registerMouseFilter_MouseRightButton', 0, async (done:Function) => {
      let caseName = "test_registerMouseFilter_MouseRightButton";
      let result = windowNdkTest.registerMouseFilter(windowId);
        console.log(caseName + '  result:'+ JSON.stringify(result));
        if(result==2000){
          console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
          expect(true).assertTrue();
          done();
        }else
          if (result==0){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5600
         * @tc.name      : test_unRegisterMouseFilter_1300002
         * @tc.desc      : test_unRegisterMouseFilter_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_unRegisterMouseFilter_1300002', 0, async (done:Function) => {
      let caseName = "test_unRegisterMouseFilter_1300002";
      let result = windowNdkTest.clearMouseFilter(-1);
        console.log(caseName + '  result:'+ JSON.stringify(result));
        //1000
        expect(result).assertEqual(1000);
        done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5700
         * @tc.name      : test_UnRegisterMouseFilter_MouseRightButton
         * @tc.desc      : test_UnRegisterMouseFilter_MouseRightButton
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_UnRegisterMouseFilter_MouseRightButton', 0, async (done:Function) => {
      let caseName = "test_UnRegisterMouseFilter_MouseRightButton";
      let result = windowNdkTest.clearMouseFilter(windowId);
        console.log(caseName + '  result:'+ JSON.stringify(result));
        if(result==2000){
          console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
          expect(true).assertTrue();
          done();
        }else
          if (result==0){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
    })
/**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5800
         * @tc.name      : test_registerTouchFilter_1300002
         * @tc.desc      : test_registerTouchFilter_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_registerTouchFilter_1300002', 0, async (done:Function) => {
      let caseName = "test_registerTouchFilter_1300002";
      let result = windowNdkTest.registerTouchFilter(-1);
        console.log(caseName + '  result:'+ JSON.stringify(result));
        expect(result).assertEqual(1000);
        done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_5900
         * @tc.name      : test_registerTouchFilter_TouchMove
         * @tc.desc      : test_registerTouchFilter_TouchMove
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_registerTouchFilter_TouchMove', 0, async (done:Function) => {
      let caseName = "test_registerTouchFilter_TouchMove";
      let result = windowNdkTest.registerTouchFilter(windowId);
        console.log(caseName + '  result:'+ JSON.stringify(result));
        if(result==2000){
          console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
          expect(true).assertTrue();
          done();
        }else
          if (result==0){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6000
         * @tc.name      : test_unRegisterTouchFilter_1300002
         * @tc.desc      : test_unRegisterTouchFilter_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_unRegisterTouchFilter_1300002', 0, async (done:Function) => {
      let caseName = "test_unRegisterTouchFilter_1300002";
      let result = windowNdkTest.clearTouchFilter(-1);
        console.log(caseName + '  result:'+ JSON.stringify(result));
        expect(result).assertEqual(1000);
        done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_WINDOW_MANAGER_NDK_6100
         * @tc.name      : test_unRegisterTouchFilter_TouchMove
         * @tc.desc      : test_unRegisterTouchFilter_TouchMove
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it('test_unRegisterTouchFilter_TouchMove', 0, async (done:Function) => {
      let caseName = "test_unRegisterTouchFilter_TouchMove";
      let result = windowNdkTest.clearTouchFilter(windowId);
        console.log(caseName + '  result:'+ JSON.stringify(result));
        if(result==2000){
          console.info(`${Tag}: 此设备不支持SystemCapability.Window.SessionManager能力`);
          expect(true).assertTrue();
          done();
        }else
          if (result==0){
          expect(true).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
    })

  })
}