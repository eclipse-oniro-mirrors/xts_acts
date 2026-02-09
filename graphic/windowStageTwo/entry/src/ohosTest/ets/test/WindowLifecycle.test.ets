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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { BusinessError, settings } from '@kit.BasicServicesKit';
import * as LoadContentByName from '../testability/pages/WindowTest/LoadContentByName';
import { abilityAccessCtrl, PermissionRequestResult, Permissions, StartOptions } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import deviceInfo from '@ohos.deviceInfo';

let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('contextTest') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}
async function startAbility1(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartAbility2'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility1(caseName: string) {
  let pageContext = AppStorage.get('contextTest') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

async function startAbility3(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility3'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest3') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility3(caseName: string) {
  let pageContext = AppStorage.get('contextTest3') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

function getPermision(){
  let atManager:abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let context : common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
  let permissions: Permissions[] = ["ohos.permission.CUSTOM_SCREEN_CAPTURE"];
  atManager.requestPermissionsFromUser(context, permissions, (err: BusinessError, data: PermissionRequestResult) => {
    if (err) {
      console.error('capture requestPermissionsFromUser failed: ' + JSON.stringify(err));
    } else {
      console.info('capture requestPermissionsFromUser success: ' + JSON.stringify(data));
    }
  })
}

async function ClickButtonDriver() {
  console.info(`come in permissionClick`);
  let driver: Driver = Driver.create();
  console.info(`come in Driver create`);
  let buttonOne = await driver.findComponent(ON.text('允许'));
  console.info(`buttonOne is ${JSON.stringify(buttonOne)}`);
  if (buttonOne != undefined) {
    await buttonOne.click();
  }
}

export default function WindowLifecycle() {
  describe('WindowLifecycleTest', async () => {
    let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let isPCStatus: string = '';
    let isAutoWindow: string = '';
    let windowclassArr: Array<window.Window>;
    let isFreeWindowMode = false;
    let deviceType:string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '', settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: ` + isPCStatus);
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      await getPermision();
      await sleep(300);
      await ClickButtonDriver();
      await sleep(200);
      try {
        windowclassArr = await windowStage.getSubWindow();
        console.log(`brforeAll getSubWindow success. Cause: ${JSON.stringify(windowclassArr)}`);
        if (windowclassArr.length != 0) {
          for (let i = 0; i < windowclassArr.length; i++) {
            await windowclassArr[i].destroyWindow();
            console.log(`brforeAll destroyWindow windowclassArr ${i} success`);
          }
        }
      } catch (err) {
        console.error(`brforeAll destroyWindow failed` + err);
      }
    });
    beforeEach(() => {
    });
    afterEach(async () => {
      try {
        await sleep(1000)
        let mainWindowClass = windowStage.getMainWindowSync()
        let mainID = mainWindowClass.getWindowProperties().id
        let lastWindow = await window.getLastWindow(context)
        let lastID = lastWindow.getWindowProperties().id
        while (mainID != lastID) {
          await lastWindow.destroyWindow()
          await sleep(1000)
          lastWindow = await window.getLastWindow(context)
          lastID = lastWindow.getWindowProperties().id
        }
      } catch (error) {
        console.log('afterEach fail cause' + error)
      }
    })
    afterAll(() => {
    });
    /**
     * @tc.name   testgetSubWindow0_promise
     * @tc.number SUB_BASIC_WMS_FUNCTION_GETSUBWINDOW_0100
     * @tc.desc   Test the function value of getSubWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetSubWindow0_promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testgetSubWindow0_promise';
      try {
        let windowclass: Array<window.Window> = await windowStage.getSubWindow();
        console.log(`${caseName} getSubWindow success. Cause: ${JSON.stringify(windowclass)}`);
        expect(windowclass.length).assertEqual(0)
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   testgetSubWindow0_callback
     * @tc.number SUB_BASIC_WMS_FUNCTION_GETSUBWINDOW_0200
     * @tc.desc   Test the function value of getSubWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetSubWindow0_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testgetSubWindow0_callback';
      try {

        windowStage.getSubWindow((err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ` Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            let windowclass: Array<window.Window> = data;
            console.log(`${caseName} getSubWindow success. Cause: ${JSON.stringify(windowclass)}`);
            expect(windowclass.length).assertEqual(0)
            done();
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   test_findWindow_null
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0100
     * @tc.desc   test_findWindow_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_findWindow_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_findWindow_null';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: window.Window | null = null;
      try {
        tempWnd = window.findWindow(null);
        console.log(msgStr + 'findWindow success');
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      };
    });
    /**
     * @tc.name   test_findWindow_notExist
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0200
     * @tc.desc   test_findWindow_notExist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_findWindow_notExist', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_findWindow_notExist';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: window.Window | null = null;
      try {
        tempWnd = window.findWindow('aa');
        console.log(msgStr + 'findWindow success');
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      };
    });
    /**
     * @tc.name   test_findWindow_subWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0300
     * @tc.desc   test_findWindow_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_findWindow_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_findWindow_subWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: window.Window | null = null;
      try {
        let promise = windowStage.createSubWindow('test_findWindow_subWindow');
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow = data;
          console.log(msgStr + "create the subWindow success");
          tempWnd = window.findWindow('test_findWindow_subWindow');
          if (tempWnd != null) {
            console.log(msgStr + 'findWindow success');
            await subWindow.destroyWindow();
            
            done();
          } else {
            await subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      };
    });
    /**
     * @tc.name   test_findWindow_subWindow_loadContent
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0400
     * @tc.desc   test_findWindow_subWindow_loadContent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_findWindow_subWindow_loadContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_findWindow_subWindow_loadContent';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: window.Window | null = null;
      let storage: LocalStorage = new LocalStorage();
      storage.setOrCreate('storageSimpleProp', 121);
      try {
        let promise = windowStage.createSubWindow('test_findWindow_subWindow_loadContent');
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow = data;
          console.log(msgStr + "create the subWindow success");
          let promise = subWindow.loadContent('testability/pages/First/index2', storage);
          promise.then(async () => {
            console.info(msgStr + 'Succeeded in loading the content.');
            tempWnd = window.findWindow('test_findWindow_subWindow_loadContent');
            if (tempWnd != null) {
              console.log(msgStr + 'findWindow success');
              await subWindow.destroyWindow();
              
              done();
            } else {
              expect(false).assertTrue();
              await subWindow.destroyWindow();
              done();
            }
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
            subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          });
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      };
    });
    /**
     * @tc.name   test_findWindow_mainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0500
     * @tc.desc   test_findWindow_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_findWindow_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_findWindow_mainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindowName: string | undefined = ' ';
      let tempWnd: window.Window;
      try {
        let mainWindowClass = await windowStage.getMainWindow();
        mainWindowName = mainWindowClass.getUIContext().getWindowName();
        console.log(msgStr + 'mainWindowName: ' + mainWindowName);
        tempWnd = window.findWindow(mainWindowName);
        if (tempWnd != null) {
          console.log(msgStr + 'findWindow success');
          
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      }
      ;
    });
    /**
     * @tc.name   test_findWindow_mainWindow_isObscured
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0600
     * @tc.desc   test_findWindow_mainWindow_isObscured
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_findWindow_mainWindow_isObscured', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_findWindow_mainWindow_isObscured';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let mainWindowName: string | undefined = '';
      console.log(msgStr + 'begin');
      let tempWnd: window.Window | null = null;
      let storage: LocalStorage = new LocalStorage();
      storage.setOrCreate('storageSimpleProp', 121);
      let mainWindowClass = await windowStage.getMainWindow();
      try {
        let promise = windowStage.createSubWindow('test_findWindow_subWindow_loadContent');
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow = data;
          console.log(msgStr + "create the subWindow success");
          let promise = subWindow.loadContent('testability/pages/First/index2', storage);
          promise.then(async () => {
            console.info(msgStr + 'Succeeded in loading the content.');
            mainWindowName = mainWindowClass.getUIContext().getWindowName();
            tempWnd = window.findWindow(mainWindowName);
            if (tempWnd != null) {
              console.log(msgStr + 'findWindow success');
              await subWindow.destroyWindow();
              
              done();
            } else {
              subWindow.destroyWindow();
              expect(false).assertTrue();
              done();
            }
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
            subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          });
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      }
      ;
    });
    /**
     * @tc.name   testOffWindowStageEvent_RepeatOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSTAGEEVENT_0100
     * @tc.desc   Turn off listening for Windows Stage lifecycle changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowStageEvent_RepeatOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testOffWindowStageEvent_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.on('windowStageEvent', (data) => {
          console.info(msgStr + 'Succeeded in enabling the listener for window stage event changes. Data: ' +
            JSON.stringify(data));
          
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to enable the listener for window stage event changes. Cause:' +
          JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowStage.off('windowStageEvent');
        console.log(msgStr + 'windowStageEvent success first');
        
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for window stage event changes. Cause:' +
          JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowStage.off('windowStageEvent');
        console.log(msgStr + 'windowStageEvent success second');
        
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for window stage event changes. Cause:' +
          JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testIsWindowShowing_WindowStateAbnormal
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_IS_WINDOW_SHOWING_0100
     * @tc.desc   Check whether the current window is displayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsWindowShowing_WindowStateAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testIsWindowShowing_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win: window.Window | null = null;
      win = await windowStage.createSubWindow('testIsWindowShowing_WindowStateAbnormal');
      //   .catch((err:BusinessError) => {
      //   console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
      //   expect().assertFail();
      //   done();
      // });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        let data = win.isWindowShowing();
        console.info(msgStr + 'Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
        win.destroyWindow();
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        win.destroyWindow();
        done();
      }
    });
    /**
     * @tc.name   testIsWindowShowingTest
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_IS_WINDOW_SHOWING_0200
     * @tc.desc   To verify the widow isshowing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsWindowShowingTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testIsWindowShowingTest begin');
      // let wnd: window.Window | undefined = undefined;
      let msgStr = "testIsWindowShowingTest";
      windowStage.createSubWindow('testIsWindowShowingTest').then(async (data) => {
        let wnd: window.Window = data;
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        let isWindowShowing: boolean = wnd.isWindowShowing();
        console.log(msgStr + 'isWindowShowing:' + isWindowShowing);
        expect(!isWindowShowing).assertTrue();
        await wnd.showWindow().then(async () => {
          let isWindowShowing2 = wnd.isWindowShowing();
          console.log(msgStr + 'isWindowShowing2:' + isWindowShowing2);
          expect(isWindowShowing2).assertTrue();
          await wnd.destroyWindow();
          done();
        }).catch(async (err: BusinessError) => {
          console.error('Failed to show window1. Cause:' + JSON.stringify(err));
          expect().assertFail();
          await wnd.destroyWindow();
          done();
        });
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testIsWindowShowing_Invoke_Interface_Two_Times
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_IS_WINDOW_SHOWING_0300
     * @tc.desc   Check whether the current window is displayed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testIsWindowShowing_Invoke_Interface_Two_Times', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testIsWindowShowing_Invoke_Interface_Two_Times';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      await windowStage.createSubWindow('testIsWindowShowing_Invoke_Interface_Two_Times').then(async (data) => {
        windowClass = data;
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        try {
          let data: boolean = windowClass.isWindowShowing();
          expect(!data).assertTrue();
          console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
        } catch (exception) {
          console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          await windowClass.destroyWindow();
          done();
        }
        try {
          let data2 = windowClass.isWindowShowing();
          expect(!data2).assertTrue();
          await windowClass.destroyWindow();
          done();
          console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data2));
        } catch (exception) {
          console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          await windowClass.destroyWindow();
          done();
        }

      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testIsWindowShowing_mainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_IS_WINDOW_SHOWING_0400
     * @tc.desc   testIsWindowShowing_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsWindowShowing_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testIsWindowShowing_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindowClass = await windowStage.getMainWindow();
      try {
        let data = mainWindowClass.isWindowShowing();
        expect(data).assertTrue();
        done();
        console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testOn_WindowSize_Change_subWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSIZE_CHANGE_0100
     * @tc.desc   testOn_WindowSize_Change_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testOn_WindowSize_Change_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testOn_WindowSize_Change_subWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass: window.Window;
      let storage: LocalStorage = new LocalStorage();
      try {
        await windowStage.createSubWindow('testOn_WindowSize_Change_subWindow').then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!subWindowClass).assertTrue();
          await subWindowClass.loadContent('testability/pages/First/index2', storage);
          let promise = subWindowClass.showWindow();
          promise.then(async () => {
            console.info(msgStr + 'Succeeded in showing the window.');
            await sleep(1000);
            subWindowClass.on('windowSizeChange', (data) => {
              console.info(msgStr + 'Succeeded in enabling the listener for window size changes. Data: ' +
                JSON.stringify(data));
              expect(data.width).assertEqual(800);
              expect(data.height).assertEqual(1000);
              subWindowClass.destroyWindow();
              done();
            });
            await subWindowClass.resize(800, 1000);
            console.info(msgStr + 'Succeeded in resize the subWindowClass');
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
            subWindowClass.destroyWindow();
            expect().assertFail();
            done();
          });
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          subWindowClass.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testOn_WindowSize_Change_Two_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSIZE_CHANGE_0200
     * @tc.desc   testOn_WindowSize_Change_Two_callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testOn_WindowSize_Change_Two_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testOn_WindowSize_Change_Two_callback';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass: window.Window;
      let storage: LocalStorage = new LocalStorage();
      let num = 0;
      const callback1 = (size: window.Size) => {
        console.info(msgStr + 'callback1 is called ' + JSON.stringify(size));
        num++;
      };
      const callback2 = (size: window.Size) => {
        console.info(msgStr + 'callback2 is called ' + JSON.stringify(size));
        num++;
      };
      try {
        await windowStage.createSubWindow('testOn_WindowSize_Change_Two_callback').then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!subWindowClass).assertTrue();
          await subWindowClass.loadContent('testability/pages/First/index2', storage);
          await subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowSizeChange', callback1);
          subWindowClass.on('windowSizeChange', callback2);
          await subWindowClass.resize(800, 900);
          console.info(msgStr + 'Succeeded in resize the subWindowClass');
          await sleep(1000);
          console.info(msgStr + 'num: ' + num);
          expect(num).assertEqual(2);
          await subWindowClass.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          subWindowClass.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testOn_WindowSize_Change_off_callback1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSIZE_CHANGE_0300
     * @tc.desc   testOn_WindowSize_Change_off_callback1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testOn_WindowSize_Change_off_callback1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testOn_WindowSize_Change_off_callback1';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass: window.Window;
      let storage: LocalStorage = new LocalStorage();
      let num = 0;
      const callback1 = (size: window.Size) => {
        console.info(msgStr + 'callback1 is called ' + JSON.stringify(size));
        num++;
      };
      const callback2 = (size: window.Size) => {
        console.info(msgStr + 'callback2 is called ' + JSON.stringify(size));
        num--;
      };
      try {
        await windowStage.createSubWindow('testOn_WindowSize_Change_off_callback1').then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!subWindowClass).assertTrue();
          await subWindowClass.loadContent('testability/pages/First/index2', storage);
          await subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowSizeChange', callback1);
          subWindowClass.on('windowSizeChange', callback2);
          subWindowClass.off('windowSizeChange', callback1);
          await subWindowClass.resize(800, 1200);
          console.info(msgStr + 'Succeeded in resize the subWindowClass');
          await sleep(1000);
          console.info(msgStr + 'num: ' + num);
          expect(num).assertEqual(-1);
          await subWindowClass.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          subWindowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testOn_WindowSize_Change_off_callback_all
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSIZE_CHANGE_0400
     * @tc.desc   testOn_WindowSize_Change_off_callback_all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testOn_WindowSize_Change_off_callback_all', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'testOn_WindowSize_Change_off_callback_all';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass: window.Window;
      let storage: LocalStorage = new LocalStorage();
      let num = 0;
      const callback1 = (size: window.Size) => {
        console.info(msgStr + 'callback1 is called ' + JSON.stringify(size));
        num++;
      };
      const callback2 = (size: window.Size) => {
        console.info(msgStr + 'callback2 is called ' + JSON.stringify(size));
        num++;
      };
      try {
        await windowStage.createSubWindow('testOn_WindowSize_Change_off_callback_all').then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!subWindowClass).assertTrue();
          await subWindowClass.loadContent('testability/pages/First/index2', storage);
          await subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowSizeChange', callback1);
          subWindowClass.on('windowSizeChange', callback2);
          subWindowClass.off('windowSizeChange');
          await subWindowClass.resize(800, 1300);
          console.info(msgStr + 'Succeeded in resize the subWindowClass');
          await sleep(1000);
          console.info(msgStr + 'num: ' + num);
          expect(num).assertEqual(0);
          await subWindowClass.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          subWindowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_showWindow_subWindow_top_promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_SHOW_WINDOW_0100
     * @tc.desc   test move the subWindow to the top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('test_showWindow_subWindow_top_promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'test_showWindow_subWindow_top_promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass1: window.Window;
      let subWindowClass2: window.Window;
      let storage: LocalStorage = new LocalStorage();
      try {
        await windowStage.createSubWindow('test_showWindow_subWindow_top_promise').then(async (data) => {
          subWindowClass1 = data;
          console.info(msgStr + 'Succeeded in creating the subwindow1. Data: ' + JSON.stringify(data));
          let id = subWindowClass1.getWindowProperties().id;
          console.info(msgStr + 'Succeeded in getting the window id. : ' + id);
          expect(!!subWindowClass1).assertTrue();
          await subWindowClass1.loadContent('testability/pages/First/index2', storage);
          // await subWindowClass1.showWindow();
          await windowStage.createSubWindow('test_showWindow_subWindow_top_promise2').then(async (data) => {
            subWindowClass2 = data;
            console.info(msgStr + 'Succeeded in creating the subwindow2. Data: ' + JSON.stringify(data));
            expect(!!subWindowClass2).assertTrue();
            await subWindowClass2.loadContent('testability/pages/First/index3', storage);
            // await subWindowClass2.showWindow();
            await sleep(1000);
            let promise1 = subWindowClass1.showWindow();
            promise1.then(() => {
              console.info(msgStr + 'Succeeded in showing the window.');
              let promise = window.getTopWindow(context);
              promise.then((data) => {
                let windowClass = data;
                console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
                let id1 = windowClass.getWindowProperties().id;
                console.info(msgStr + 'Succeeded in getting the window id1. : ' + id1);
                expect(id1).assertEqual(id);
                sleep(1000);
                subWindowClass1.destroyWindow();
                subWindowClass2.destroyWindow();
                done();
              }).catch((err: BusinessError) => {
                console.error(msgStr +
                  `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                subWindowClass1.destroyWindow();
                subWindowClass2.destroyWindow();
                done();
              });
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              subWindowClass1.destroyWindow();
              subWindowClass2.destroyWindow();
              done();
            });
          }).catch((err: BusinessError) => {
            console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
            subWindowClass1.destroyWindow();
            subWindowClass2.destroyWindow();
            expect().assertFail();
            done();
          });
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_showWindow_subWindow_top_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_SHOW_WINDOW_0200
     * @tc.desc   test move the subWindow to the top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('test_showWindow_subWindow_top_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let caseName: string = 'test_showWindow_subWindow_top_callback';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass1: window.Window;
      let subWindowClass2: window.Window;
      let storage: LocalStorage = new LocalStorage();
      try {
        await windowStage.createSubWindow('test_showWindow_subWindow_top_callback').then(async (data) => {
          subWindowClass1 = data;
          console.info(msgStr + 'Succeeded in creating the subwindow1. Data: ' + JSON.stringify(data));
          let id = subWindowClass1.getWindowProperties().id;
          console.info(msgStr + 'Succeeded in getting the window id. : ' + id);
          let name = subWindowClass1.getWindowProperties().name;
          console.info(msgStr + 'Succeeded in getting the window name. : ' + name);
          expect(!!subWindowClass1).assertTrue();
          await subWindowClass1.loadContent('testability/pages/First/index2', storage);
          await windowStage.createSubWindow('test_showWindow_subWindow_top_callback2').then(async (data) => {
            subWindowClass2 = data;
            console.info(msgStr + 'Succeeded in creating the subwindow2. Data: ' + JSON.stringify(data));
            expect(!!subWindowClass2).assertTrue();
            await subWindowClass2.loadContent('testability/pages/First/index3', storage);
            await sleep(1000);
            subWindowClass1.showWindow((err) => {
              const errCode: number = err.code;
              if (errCode) {
                console.error(msgStr + `Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
              }
              console.info(msgStr + 'Succeeded in showing the window.');
              let promise = window.getTopWindow(context);
              promise.then((data) => {
                let windowClass = data;
                console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
                let id1 = windowClass.getWindowProperties().id;
                console.info(msgStr + 'Succeeded in getting the window id1. : ' + id1);
                expect(id1).assertEqual(id);
                sleep(1000);
                subWindowClass1.destroyWindow();
                subWindowClass2.destroyWindow();
                done();
              }).catch((err: BusinessError) => {
                console.error(msgStr +
                  `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                subWindowClass1.destroyWindow();
                subWindowClass2.destroyWindow();
                done();
              });
            });
          }).catch((err: BusinessError) => {
            console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
            expect().assertFail();
            subWindowClass1.destroyWindow();
            subWindowClass2.destroyWindow();
            done();
          });
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          subWindowClass1.destroyWindow();
          subWindowClass2.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testDestroyWindow_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_DESTORY_WINDOW_0100
     * @tc.desc   Verification window destruction scenario.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDestroyWindow_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testDestroyWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: window.Window;
      try {
        tempWnd = await windowStage.createSubWindow('testDestroyWindow_Promise');
        console.log(msgStr + 'ohosWindow.createWindow successed');
        expect(!!tempWnd).assertTrue();
        await tempWnd.destroyWindow().then(() => {
          console.info(msgStr + 'Succeeded in destroying the window.');
          
          try {
            let findWnd = window.findWindow('testDestroyWindow_Promise');
            expect().assertFail();
            done();
          } catch (exception) {
            console.error(msgStr + 'try catch Failed to find the Window. Cause: ' + JSON.stringify(exception));
            expect(exception.code === 1300002).assertTrue();
            tempWnd.destroyWindow();
            done();
          };
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'try catch Failed to destroy the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      };

    });
    /**
     * @tc.name   testDestroyWindow_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_DESTORY_WINDOW_0200
     * @tc.desc   Verification window destruction scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDestroyWindow_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testDestroyWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let winData: window.Window;
      await windowStage.createSubWindow('testDestroyWindow_Callback').then((data) => {
        winData = data;
        console.log(msgStr + 'ohosWindow.createWindow successed');
        expect(!!winData).assertTrue();
        winData.destroyWindow((err) => {
          if (err.code) {
            console.log(msgStr + 'windowTest DestroyTest fail' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            try {
              let findWnd = window.findWindow('testDestroyWindow_Callback');
              expect(false).assertTrue();
              done();
            } catch (exception) {
              console.error(msgStr + 'try catch Failed to find the Window. Cause: ' + JSON.stringify(exception));
              expect(exception.code === 1300002).assertTrue();
              winData.destroyWindow();
              done();
            };
          }
        });
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testWindowOffWindowEvent_RepeatOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0100
     * @tc.desc   Disable the monitoring of window life cycle changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowOffWindowEvent_RepeatOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindowOffWindowEvent_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win: window.Window;
      await windowStage.createSubWindow('testWindowOffWindowEvent_RepeatOff').then(async (data) => {
        win = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!win).assertTrue();
        try {
          win.on('windowEvent', (data) => {
            console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await win.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          win.off('windowEvent');
          
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await win.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          win.off('windowEvent');
          await win.destroyWindow();
          
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await win.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testWindow_on_WindowEvent_subWindow_shown
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0200
     * @tc.desc   Disable the monitoring of window life cycle changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindow_on_WindowEvent_subWindow_shown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindow_on_WindowEvent_subWindow_shown';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window;
      let promise = windowStage.createSubWindow('m1testWindow_on_WindowEvent_subWindow_shownySubWindow');
      promise.then((data) => {
        subWindow = data;
        console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        try {
          subWindow.on('windowEvent', async (data) => {
            console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
            expect(data).assertEqual(1);
            subWindow.off('windowEvent');
            subWindow.destroyWindow();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    });
    /**
     * @tc.name   testWindow_on_WindowEvent_subWindow_active
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0300
     * @tc.desc   testWindow_on_WindowEvent_subWindow_active
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindow_on_WindowEvent_subWindow_active', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindow_on_WindowEvent_subWindow_active';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window;
      await windowStage.createSubWindow('2testWindow_on_WindowEvent_subWindow_active').then(async (data) => {
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          subWindow.on('windowEvent', async (data) => {
            console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
            if (data == 2) {
              
              subWindow.off('windowEvent');
              subWindow.destroyWindow();
              done();
            } else {
              await sleep(1000);
            }
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testWindow_on_WindowEvent_subWindow_inactive
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0400
     * @tc.desc   testWindow_on_WindowEvent_subWindow_inactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindow_on_WindowEvent_subWindow_inactive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindow_on_WindowEvent_subWindow_inactive';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let errCode = 0;
      let subWindow: window.Window;
      let windowClass: window.Window;
      let windowClassId: number;
      let subWindowClassId: number;
      let storage: LocalStorage = new LocalStorage();
      let promise = windowStage.getMainWindow();
      promise.then((data) => {
        if (data == null) {
          console.error(msgStr + "Failed to obtaining the window. Cause: The data is empty");
          expect().assertFail();
          done();
        }
        windowClass = data;
        windowClassId = windowClass.getWindowProperties().id;
        console.info(msgStr + 'Succeeded in obtaining the window');
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to obtaining the window. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      });
      let promise1 = windowStage.createSubWindow('3testWindow_on_WindowEvent_subWindow_inactive');
      promise1.then((data) => {
        if (data == null) {
          console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
          expect().assertFail();
          done();
        }
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        subWindow.resize(1000, 800);
        subWindow.loadContent('testability/pages/First/index2', storage);
        let promise2 = subWindow.showWindow();
        promise2.then(async () => {
          console.info(msgStr + 'Succeeded in showing the window.');
          await sleep(2000);
          subWindowClassId = subWindow.getWindowProperties().id;
          try {
            subWindow.on('windowEvent', async (data) => {
              console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
              expect(data).assertEqual(3);
              subWindow.off('windowEvent');
              await subWindow.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
            await subWindow.destroyWindow();
            expect().assertFail();
            done();
          }
          try {
            let promise = window.shiftAppWindowFocus(subWindowClassId, windowClassId);
            promise.then(() => {
              console.info(msgStr + 'Succeeded in shifting app window focus');
              
            }).catch(async (err: BusinessError) => {
              console.error(msgStr +
                `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code) {
                expect(err.code).assertEqual(801);
                subWindow.off('windowEvent');
                await subWindow.destroyWindow();
                done();
              } else {
                subWindow.off('windowEvent');
                await subWindow.destroyWindow();
                expect().assertFail();
                done();
              }
            });
          } catch (err) {
            console.error(msgStr + `Failed to shiftAppWindowFocus. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to creatw subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testWindow_on_WindowEvent_mainWindow_inactive
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0600
     * @tc.desc   testWindow_on_WindowEvent_mainWindow_inactive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindow_on_WindowEvent_mainWindow_inactive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindow_on_WindowEvent_mainWindow_inactive';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window;
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('windowEvent', async (data) => {
          console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
          if (data == window.WindowEventType.WINDOW_INACTIVE) {
            await subWindow.destroyWindow();
            windowClass.off('windowEvent');
            done();
          } else {
            await sleep(1000);
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception) + exception.code);
        expect().assertFail();
        done();
      }
      await windowStage.createSubWindow('4testWindow_on_WindowEvent_mainWindow_inactive').then(async (data) => {
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          await subWindow.showWindow();
          console.log(msgStr + 'windowStage.show SubWindow success');
          
          await sleep(1000);
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testWindow_on_WindowEvent_mainWindow_active
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0700
     * @tc.desc   testWindow_on_WindowEvent_mainWindow_active
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindow_on_WindowEvent_mainWindow_active', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindow_on_WindowEvent_mainWindow_active';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let storage: LocalStorage = new LocalStorage();
      let subWindow: window.Window;
      let windowClass = await windowStage.getMainWindow();
      let promise = windowStage.createSubWindow('5testWindow_on_WindowEvent_mainWindow_active');
      promise.then(async (data) => {
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        subWindow.resize(800, 1000);
        subWindow.loadContent('testability/pages/First/index2', storage);
        await subWindow.showWindow();
        console.log(msgStr + 'windowStage.show SubWindow success');
        try {
          await sleep(2000);
          windowClass.on('windowEvent', (data) => {
            console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
            expect(data).assertEqual(2);
            windowClass.off('windowEvent');
            subWindow.destroyWindow();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception) + exception.code);
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          await subWindow.destroyWindow();
          console.log(msgStr + ' SubWindow  destroy success');
          
          await sleep(1000);
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    });
    /**
     * @tc.name   testWindow_on_WindowEvent_Two_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0800
     * @tc.desc   testWindow_on_WindowEvent_Two_callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindow_on_WindowEvent_Two_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindow_on_WindowEvent_Two_callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window;
      let num = 0;
      const callback1 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback1 is called,num: ' + num);
      };
      const callback2 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback2 is called,num: ' + num);
      };
      await windowStage.createSubWindow('6testWindow_on_WindowEvent_Two_callback').then(async (data) => {
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          subWindow.on('windowEvent', callback1);
          subWindow.on('windowEvent', callback2);
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          await sleep(1000);
          if (num >= 2) {
            
            subWindow.off('windowEvent');
            subWindow.destroyWindow();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testWindow_on_WindowEvent_off_callback1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0900
     * @tc.desc   testWindow_on_WindowEvent_off_callback1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindow_on_WindowEvent_off_callback1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindow_on_WindowEvent_off_callback1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window;
      let num = 0;
      const callback1 = (windowEventType: window.WindowEventType) => {
        num--;
        console.log(msgStr + 'callback1 is called,num: ' + num);
      };
      const callback2 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback2 is called,num: ' + num);
      };
      await windowStage.createSubWindow('7testWindow_on_WindowEvent_off_callback1').then(async (data) => {
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          subWindow.on('windowEvent', callback1);
          subWindow.on('windowEvent', callback2);
          subWindow.off('windowEvent', callback1);
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          await sleep(1000);
          expect(num).assertLarger(1);
          subWindow.off('windowEvent');
          subWindow.destroyWindow();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testWindow_on_WindowEvent_off_callback_All
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_1000
     * @tc.desc   testWindow_on_WindowEvent_off_callback_All
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindow_on_WindowEvent_off_callback_All', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testWindow_on_WindowEvent_off_callback_All';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window;
      let num = 0;
      const callback1 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback1 is called,num: ' + num);
      };
      const callback2 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback2 is called,num: ' + num);
      };
      await windowStage.createSubWindow('8testWindow_on_WindowEvent_off_callback_All').then(async (data) => {
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          subWindow.on('windowEvent', callback1);
          subWindow.on('windowEvent', callback2);
          subWindow.off('windowEvent');
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          await sleep(1000);
          expect(num).assertEqual(0);
          subWindow.off('windowEvent');
          subWindow.destroyWindow();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.name   testWindowOffWindowVisibilityChange_UnregisteredOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0100
     * @tc.desc   Enable this window to listen for status change events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindowOffWindowVisibilityChange_UnregisteredOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindowOffWindowVisibilityChange_UnregisteredOff';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win: window.Window | void =
        await windowStage.createSubWindow('testWindowOffWindowVisibilityChange_UnregisteredOff').catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        (win as window.Window).off('windowVisibilityChange');
        await (win as window.Window).destroyWindow();
        
        done();
      } catch (exception) {
        await (win as window.Window).destroyWindow();
        console.error(msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' +
          JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testWindowOffWindowVisibilityChange_RepeatOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0200
     * @tc.desc   Enable this window to listen for status change events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowOffWindowVisibilityChange_RepeatOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'testWindowOffWindowVisibilityChange_RepeatOff';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win: window.Window | void = await windowStage.createSubWindow('testWindowOffWindowVisibilityChange_RepeatOff').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        (win as window.Window).on('windowVisibilityChange', (boolean) => {
          console.info(msgStr + 'Window visibility changed, isVisible=' + boolean);
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error('Failed to register callback. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + 'The device not support SystemCapability.Window.SessionManager');
          console.log(msgStr + JSON.stringify(exception));
          expect(exception.code).assertEqual(801);
          // done();
        }
      }
      try {
        (win as window.Window).off('windowVisibilityChange');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + 'The device not support SystemCapability.Window.SessionManager');
          console.log(msgStr + JSON.stringify(exception));
          expect(exception.code).assertEqual(1300002);
          // done();
        }
      }
      try {
        (win as window.Window).off('windowVisibilityChange');
        await (win as window.Window).destroyWindow();
        done();
      } catch (exception) {
        await (win as window.Window).destroyWindow();
        console.error(msgStr + 'Failed to unregister callback Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testWindowVisibilityChange_on_Function_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0300
     * @tc.desc   window type windowVisibilityChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testWindowVisibilityChange_on_Function_Callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testWindowVisibilityChange_on_Function_Callback";
      console.log(msgStr + "begin");
      try {
        console.log(msgStr + "try begin");
        let windowClass = await windowStage.getMainWindow();
        windowClass.on('windowVisibilityChange', (boolean) => {
          console.log(msgStr + 'Window visibility changed, isVisible=' + boolean);
        });
        
        windowClass.off('windowVisibilityChange');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
        if (error.code != 801) {
          console.error(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + 'The device not support SystemCapability.Window.SessionManager');
          console.log(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect(error.code).assertEqual(801);
          done();
        }
      }
    });
    /**
     * @tc.name   testWindowVisibilityChange_off_Function_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0400
     * @tc.desc   window type windowVisibilityChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testWindowVisibilityChange_off_Function_Callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testWindowVisibilityChange_off_Function_Callback";
      console.log(msgStr + "begin");
      try {
        console.log(msgStr + "try begin");
        let windowClass = await windowStage.getMainWindow();
        windowClass.off('windowVisibilityChange');
        console.log(msgStr + 'Window visibility changed');
        
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
        if (error.code != 801) {
          console.error(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + 'The device not support SystemCapability.Window.SessionManager');
          console.log(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect(error.code).assertEqual(801);
          done();
        }
      }
    });
    /**
     * @tc.name   testWindowVisibilityChange_subWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0500
     * @tc.desc   testWindowVisibilityChange_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testWindowVisibilityChange_subWindow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testWindowVisibilityChange_subWindow";
      console.log(msgStr + "begin");
      let windowVisable: boolean = false;
      let subwindowClass: window.Window;

      console.log(msgStr + "try begin");
      subwindowClass = await windowStage.createSubWindow('testWindowVisibilityChange_subWindow');
      try {
        subwindowClass.on('windowVisibilityChange', (data) => {
          console.info(msgStr + 'Window visibility changed, isVisible=' + data);
          windowVisable = data;
        });
        await subwindowClass.setUIContent('testability/pages/Index2');
        await subwindowClass.showWindow();
        await sleep(300);
        console.log(msgStr + 'windowVisable1:' + windowVisable);
        expect(windowVisable).assertEqual(true);
        await subwindowClass.minimize();
        await sleep(300);
        console.log(msgStr + 'windowVisable2:' + windowVisable);
        expect(windowVisable).assertEqual(false);
        await subwindowClass.destroyWindow();
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
        await subwindowClass.destroyWindow();
        if (error.code != 801) {
          console.error(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + 'The device not support SystemCapability.Window.SessionManager');
          console.log(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect(error.code).assertEqual(801);
          done();
        }
      }
    });
    /**
     * @tc.name   testRemoveStartingWindow_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_API_REMOVE_STARTING_WINDOW_0100
     * @tc.desc   testRemoveStartingWindow_Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testRemoveStartingWindow_Promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testRemoveStartingWindow_Promise";
      console.log(msgStr + "begin");
      try {
        windowStage.removeStartingWindow().then(() => {
          console.info('Succeeded in removing starting window.');
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to remove starting window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code != 801) {
            console.error(msgStr + 'Failed testRemoveStartingWindow_Promise. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + 'The device not support SystemCapability.Window.SessionManager');
            expect(err.code).assertEqual(801);
            done();
          }
        });

      } catch (error) {
        console.log(msgStr + 'Failed to testRemoveStartingWindow_Promise. Cause: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_WindowEventType_enum
     * @tc.number SUB_BASIC_WMS_WINDOW_EVENT_TYPE_0100
     * @tc.desc   test_WindowEventType_enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_WindowEventType_enum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "test_WindowEventType_enum";
      console.log(msgStr + "begin");
      try {
        expect(window.WindowEventType.WINDOW_DESTROYED).assertEqual(7);
        console.info('Succeeded in test_WindowEventType_enum.');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to test_WindowEventType_enum. Cause: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_loadContentByName
     * @tc.number SUB_BASIC_WMS_LOAD_CONTENT_BY_NAME_0100
     * @tc.desc   test_loadContentByName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_loadContentByName", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "test_loadContentByName";
      console.log(msgStr + "begin");
      try {
        windowStage.loadContentByName(LoadContentByName.entryName).then(async () => {
          console.info('Succeeded in loadContentByName.');
          
          await windowStage.loadContent('testability/pages/Index');
          done();
        }).catch(async (err: BusinessError) => {
          console.error(`Failed to test loadContentByName. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          await windowStage.loadContent('testability/pages/Index');
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to test_loadContentByName. Cause: ' + JSON.stringify(error));
        expect().assertFail();
        await windowStage.loadContent('testability/pages/Index');
        done();
      }
    });

    /**
     * @tc.name   testWindowStageLifecycleEventTypeEnum
     * @tc.number SUB_BASIC_WMS_XTS_WINDOWSTAGE_LIFECYCLE_EVENT_0100
     * @tc.desc   验证WindowStageLifecycleEventType枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testWindowStageLifecycleEventTypeEnum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testWindowStageLifecycleEventTypeEnum";
      console.log(caseName + " begin");
      try {
        console.log(caseName + " window.WindowStageLifecycleEventType: " + JSON.stringify(window.WindowStageLifecycleEventType));
        expect(window.WindowStageLifecycleEventType.SHOWN).assertEqual(1);
        expect(window.WindowStageLifecycleEventType.RESUMED).assertEqual(2);
        expect(window.WindowStageLifecycleEventType.PAUSED).assertEqual(3);
        expect(window.WindowStageLifecycleEventType.HIDDEN).assertEqual(4);
        done();
      } catch (error) {
        console.error(caseName + ' Failed. Cause: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testOnWindowStageLifecycleEventwithDestoryedWindow
     * @tc.number SUB_BASIC_WMS_XTS_WINDOWSTAGE_LIFECYCLE_EVENT_0200
     * @tc.desc   验证主窗销毁后调用OnWindowStageLifecycleEvent抛1300002错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testOnWindowStageLifecycleEventwithDestoryedWindow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testOnWindowStageLifecycleEventwithDestoryedWindow";
      console.log(caseName + " begin");
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        const callback = (data: window.WindowStageLifecycleEventType) => {
          console.log(caseName + " callback: " + JSON.stringify(data));
        }
        windowStageStart.on('windowStageLifecycleEvent', callback);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(caseName + ' Failed. Cause: ' + JSON.stringify(error));
        expect(error.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.name   testOffWindowStageLifecycleEventwithDestoryedWindow
     * @tc.number SUB_BASIC_WMS_XTS_WINDOWSTAGE_LIFECYCLE_EVENT_0300
     * @tc.desc   验证主窗销毁后调用OffWindowStageLifecycleEvent抛1300002错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testOffWindowStageLifecycleEventwithDestoryedWindow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testOffWindowStageLifecycleEventwithDestoryedWindow";
      console.log(caseName + " begin");
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        const callback = (data: window.WindowStageLifecycleEventType) => {
          console.log(caseName + " callback: " + JSON.stringify(data));
        }
        windowStageStart.off('windowStageLifecycleEvent', callback);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(caseName + ' Failed. Cause: ' + JSON.stringify(error));
        expect(error.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.name   testOnWindowStageLifecycleEventRegisterOne
     * @tc.number SUB_BASIC_WMS_XTS_WINDOWSTAGE_LIFECYCLE_EVENT_0400
     * @tc.desc   WindowStageLifecycleEvent 一个callBack对象订阅监听验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testOnWindowStageLifecycleEventRegisterOne", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testOnWindowStageLifecycleEventRegisterOne";
      console.log(caseName + " begin");
      let timer = 0;
      let arr: Array<window.WindowStageLifecycleEventType> = [];
      let cb1 = (WindowStageLifecycleEvent: window.WindowStageLifecycleEventType) => {
        console.log(caseName + " callback: " + JSON.stringify(WindowStageLifecycleEvent));
        arr.push(WindowStageLifecycleEvent);
        console.log('windowTest arr: ' + JSON.stringify(arr));
        timer++;
        console.log(caseName + " callback: timer :" + timer);
      }
      try {
        windowStage.on('windowStageLifecycleEvent', cb1);
        let windowClass = windowStage.getMainWindowSync();
        if (isPCStatus != '') {
          await windowClass.minimize();
          await sleep(1000);
          console.log(caseName + " callback: timer1 :" + timer);
          expect(timer).assertEqual(2);
          await windowClass.restore();
          await sleep(1000);
          console.log(caseName + " callback: timer2 :" + timer);
          expect(timer).assertEqual(4);
          expect(arr.length).assertEqual(4);
          expect(arr[0]).assertEqual(window.WindowStageLifecycleEventType.PAUSED);
          expect(arr[1]).assertEqual(window.WindowStageLifecycleEventType.HIDDEN);
          expect(arr[2]).assertEqual(window.WindowStageLifecycleEventType.SHOWN);
          expect(arr[3]).assertEqual(window.WindowStageLifecycleEventType.RESUMED);
          windowStage.off('windowStageLifecycleEvent', cb1);
          done();

        } else {
          windowStage.off('windowStageLifecycleEvent', cb1);
          done();
        }
      } catch (error) {
        console.error(caseName + ' Failed. Cause: ' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          windowStage.off('windowStageLifecycleEvent', cb1);
          expect().assertFail();
          done();
        }

      }
    });

    /**
     * @tc.name   testOnWindowStageLifecycleEventRegisterTwo
     * @tc.number SUB_BASIC_WMS_XTS_WINDOWSTAGE_LIFECYCLE_EVENT_0500
     * @tc.desc   WindowStageLifecycleEvent 多个callBack对象订阅监听验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testOnWindowStageLifecycleEventRegisterTwo", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testOnWindowStageLifecycleEventRegisterTwo";
      console.log(caseName + " begin");
      let isCb1 = false;
      let isCb2 = false;
      let timer = 0;
      let cb1 = (WindowStageLifecycleEvent: window.WindowStageLifecycleEventType) => {
        console.log(caseName + " callback1: " + JSON.stringify(WindowStageLifecycleEvent));
        timer++;
        console.log(caseName + " callback1: timer :" + timer);

      }
      let cb2 = (WindowStageLifecycleEvent: window.WindowStageLifecycleEventType) => {
        console.log(caseName + " callback2: " + JSON.stringify(WindowStageLifecycleEvent));
        timer++;
        console.log(caseName + " callback2: timer :" + timer);

      }
      try {
        windowStage.on('windowStageLifecycleEvent', cb1);
        windowStage.on('windowStageLifecycleEvent', cb2);
        let windowClass = windowStage.getMainWindowSync();
        if (isPCStatus != '') {
          await windowClass.minimize();
          await sleep(1000);
          console.log(caseName + " callback: timer1 :" + timer);
          expect(timer).assertEqual(4);
          await windowClass.restore();
          await sleep(1000);
          console.log(caseName + " callback: timer2 :" + timer);
          expect(timer).assertEqual(8);
          windowStage.off('windowStageLifecycleEvent', cb1);
          await windowClass.minimize();
          await sleep(1000);
          console.log(caseName + " callback: timer3 :" + timer);
          expect(timer).assertEqual(10);
          await windowClass.restore();
          await sleep(1000);
          console.log(caseName + " callback: timer4 :" + timer);
          expect(timer).assertEqual(12);
          windowStage.off('windowStageLifecycleEvent');
          done();

        } else {
          windowStage.off('windowStageLifecycleEvent');
          done();
        }
      } catch (error) {
        console.error(caseName + ' Failed. Cause: ' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          windowStage.off('windowStageLifecycleEvent');
          expect().assertFail();
          done();
        }

      }
    });

    /**
     * @tc.name   testOffWindowStageLifecycleEventwithUnregisterAll
     * @tc.number SUB_BASIC_WMS_XTS_WINDOWSTAGE_LIFECYCLE_EVENT_0600
     * @tc.desc   WindowStageLifecycleEvent 多个callBack对象订阅取消监听验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testOffWindowStageLifecycleEventwithUnregisterAll", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testOffWindowStageLifecycleEventwithUnregisterAll";
      console.log(caseName + " begin");
      let isCb1 = false;
      let isCb2 = false;
      let timer = 0;
      let cb1 = (WindowStageLifecycleEvent: window.WindowStageLifecycleEventType) => {
        console.log(caseName + " callback1: " + JSON.stringify(WindowStageLifecycleEvent));
        timer++;
        console.log(caseName + " callback1: timer :" + timer);

      }
      let cb2 = (WindowStageLifecycleEvent: window.WindowStageLifecycleEventType) => {
        console.log(caseName + " callback2: " + JSON.stringify(WindowStageLifecycleEvent));
        timer++;
        console.log(caseName + " callback2: timer :" + timer);

      }
      try {
        windowStage.on('windowStageLifecycleEvent', cb1);
        windowStage.on('windowStageLifecycleEvent', cb2);
        await sleep(100);
        windowStage.off('windowStageLifecycleEvent');
        let windowClass = windowStage.getMainWindowSync();
        if (isPCStatus != '') {
          await windowClass.minimize();
          await sleep(1000);
          console.log(caseName + " callback: timer1 :" + timer);
          expect(timer).assertEqual(0);
          await windowClass.restore();
          await sleep(1000);
          console.log(caseName + " callback: timer2 :" + timer);
          expect(timer).assertEqual(0);
          done();

        } else {
          windowStage.off('windowStageLifecycleEvent');
          done();
        }
      } catch (error) {
        console.error(caseName + ' Failed. Cause: ' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          windowStage.off('windowStageLifecycleEvent');
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testisShowingTrue_callback
     * @tc.number SUB_BASIC_WMS_XTS_ISSHOWING_0100
     * @tc.desc   testisShowingTrue_callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testisShowingTrue_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testisShowingTrue_callback";
      console.log(caseName + " begin");
      let mainWindow = windowStage.getMainWindowSync();
      mainWindow.isShowing((err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(caseName + ` Failed to check whether the window is showing. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(caseName + ' Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
          expect(data).assertEqual(true);
          done();
        }
      })
    });

    /**
     * @tc.name   testisShowingTrue_Promise
     * @tc.number SUB_BASIC_WMS_XTS_ISSHOWING_0200
     * @tc.desc   testisShowingTrue_Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testisShowingTrue_Promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testisShowingTrue_Promise";
      console.log(caseName + " begin");
      let mainWindow = windowStage.getMainWindowSync();
      let promise = mainWindow.isShowing();
      promise.then((data) => {
        console.info(caseName + ' Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
        expect(data).assertEqual(true);
        done();
      }).catch((err: BusinessError) => {
        console.error(caseName + ` Failed to check whether the window is showing. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      });

    });

    /**
     * @tc.name   testisShowingFalse_callback
     * @tc.number SUB_BASIC_WMS_XTS_ISSHOWING_0300
     * @tc.desc   testisShowingFalse_callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testisShowingFalse_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testisShowingFalse_callback";
      console.log(caseName + " begin");
      let subWindow = await windowStage.createSubWindow('testisShowingFalse_callback');
      subWindow.isShowing(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(caseName + ` Failed to check whether the window is showing. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          expect(false).assertTrue();
          done();
        } else {
          console.info(caseName + ' Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
          await subWindow.destroyWindow();
          expect(data).assertEqual(false);
          done();
        }
      })
    });

    /**
     * @tc.name   testisShowingFalse_Promise
     * @tc.number SUB_BASIC_WMS_XTS_ISSHOWING_0400
     * @tc.desc   testisShowingFalse_Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testisShowingFalse_Promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testisShowingFalse_Promise";
      console.log(caseName + " begin");
      let subWindow = await windowStage.createSubWindow('testisShowingFalse_callback');
      let promise = subWindow.isShowing();
      promise.then(async (data) => {
        console.info(caseName + ' Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
        await subWindow.destroyWindow();
        expect(data).assertEqual(false);
        done();
      }).catch(async (err: BusinessError) => {
        console.error(caseName + ` Failed to check whether the window is showing. Cause code: ${err.code}, message: ${err.message}`);
        await subWindow.destroyWindow();
        expect(false).assertTrue();
        done();
      });

    });
    /**
     * @tc.name   testWindowEvent_0100
     * @tc.number testWindowEvent_0100
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowEvent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testWindowEvent_0100';
      let windoweventChange: Array<window.WindowEventType> = [];
      try {
        let windowClass = await windowStage.createSubWindow('testWindowEvent_0100')
        console.info(message + ' createSubWindow success ' + JSON.stringify(windowClass));
        windowClass.on('windowEvent', (data) => {
          console.info(message + ' Window event happened. Event:' + JSON.stringify(data));
          windoweventChange.push(data);
          console.info(message + ' windoweventChange:' + JSON.stringify(windoweventChange));
        });
        await windowClass.setUIContent('testability/pages/Index2')
        await windowClass.showWindow();
        console.info(message + ' windowClass showWindow success ');
        await sleep(300)
        let windowClass2 = await windowStage.createSubWindow('testWindowEvent_01002')
        await windowClass2.setUIContent('testability/pages/Index2')
        await windowClass2.showWindow();
        console.info(message + ' windowClass2 showWindow success ');
        await sleep(300)
        await windowClass2.destroyWindow();
        console.info(message + ' windowClass2 destroyWindow success ');
        await sleep(300)
        await windowClass.minimize();
        console.info(message + ' windowClass minimize success ');
        await sleep(300)
        await windowClass.destroyWindow();
        console.info(message + ' windowClass destroyWindow success ');
        await sleep(300)
        expect(windoweventChange[0]).assertEqual(window.WindowEventType.WINDOW_SHOWN);
        expect(windoweventChange[1]).assertEqual(window.WindowEventType.WINDOW_ACTIVE);
        expect(windoweventChange[2]).assertEqual(window.WindowEventType.WINDOW_INACTIVE);
        expect(windoweventChange[3]).assertEqual(window.WindowEventType.WINDOW_ACTIVE);
        expect(windoweventChange[4]).assertEqual(window.WindowEventType.WINDOW_INACTIVE);
        expect(windoweventChange[5]).assertEqual(window.WindowEventType.WINDOW_HIDDEN);
        expect(windoweventChange[6]).assertEqual(window.WindowEventType.WINDOW_DESTROYED);
        done();
      } catch (err) {
        console.error(message + ' failed: ' + err);
        if (err.code == 801) {
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   testWindowEvent_0200
     * @tc.number testWindowEvent_0200
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowEvent_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testWindowEvent_0200';
      let windoweventChange: Array<window.WindowEventType> = [];
      let config1: window.Configuration = {
        name: "testWindowEvent_0200_1",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      let config2: window.Configuration = {
        name: "testWindowEvent_0200_2",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let windowClass = await window.createWindow(config1);
        console.info(message + ' createSubWindow success ' + JSON.stringify(windowClass));
        windowClass.on('windowEvent', (data) => {
          console.info(message + ' Window event happened. Event:' + JSON.stringify(data));
          windoweventChange.push(data);
          console.info(message + ' windoweventChange:' + JSON.stringify(windoweventChange));
        });
        await windowClass.setUIContent('testability/pages/Index2')
        await windowClass.showWindow();
        console.info(message + ' windowClass showWindow success ');
        await sleep(300)
        let windowClass2 = await window.createWindow(config2)
        await windowClass2.setUIContent('testability/pages/Index2')
        await windowClass2.showWindow();
        console.info(message + ' windowClass2 showWindow success ');
        await sleep(300)
        await windowClass2.destroyWindow();
        console.info(message + ' windowClass2 destroyWindow success ');
        await sleep(300)
        await windowClass.destroyWindow();
        console.info(message + ' windowClass destroyWindow success ');
        await sleep(300)
        expect(windoweventChange[0]).assertEqual(window.WindowEventType.WINDOW_SHOWN);
        expect(windoweventChange[1]).assertEqual(window.WindowEventType.WINDOW_ACTIVE);
        expect(windoweventChange[2]).assertEqual(window.WindowEventType.WINDOW_INACTIVE);
        expect(windoweventChange[3]).assertEqual(window.WindowEventType.WINDOW_ACTIVE);
        expect(windoweventChange[4]).assertEqual(window.WindowEventType.WINDOW_INACTIVE);
        expect(windoweventChange[5]).assertEqual(window.WindowEventType.WINDOW_DESTROYED);
        done();
      } catch (err) {
        console.error(message + ' failed: ' + err);
        if (err.code == 801) {
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }


    })
    /**
     * @tc.name   testWindowEvent_0300
     * @tc.number testWindowEvent_0300
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowEvent_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testWindowEvent_0300';
      let windoweventChange: Array<window.WindowEventType> = [];
      let config1: window.Configuration = {
        name: "testWindowEvent_03000_1",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      }
      let config2: window.Configuration = {
        name: "testWindowEvent_0300_2",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      }
      let windowClass: window.Window | null = null;
      try {
        window.createWindow(config1).then(async (data) => {
          windowClass = data;
          console.info(message + ' createSubWindow success ' + JSON.stringify(windowClass));
          windowClass.on('windowEvent', (data) => {
            console.info(message + ' Window event happened. Event:' + JSON.stringify(data));
            windoweventChange.push(data);
            console.info(message + ' windoweventChange:' + JSON.stringify(windoweventChange));
          });
          await windowClass.setUIContent('testability/pages/Index2')
          await windowClass.showWindow();
          console.info(message + ' windowClass showWindow success ');
          await sleep(300)
          let windowClass2 = await window.createWindow(config2);
          await windowClass2.setUIContent('testability/pages/Index2')
          await windowClass2.showWindow();
          console.info(message + ' windowClass2 showWindow success ');
          await sleep(300)
          await windowClass2.destroyWindow();
          console.info(message + ' windowClass2 destroyWindow success ');
          await sleep(300)
          await windowClass.minimize();
          console.info(message + ' windowClass minimize success ');
          await sleep(300)
          await windowClass.destroyWindow();
          console.info(message + ' windowClass destroyWindow success ');
          await sleep(300)
          expect(windoweventChange[0]).assertEqual(window.WindowEventType.WINDOW_SHOWN);
          expect(windoweventChange[1]).assertEqual(window.WindowEventType.WINDOW_ACTIVE);
          expect(windoweventChange[2]).assertEqual(window.WindowEventType.WINDOW_INACTIVE);
          expect(windoweventChange[3]).assertEqual(window.WindowEventType.WINDOW_ACTIVE);
          expect(windoweventChange[4]).assertEqual(window.WindowEventType.WINDOW_INACTIVE);
          expect(windoweventChange[5]).assertEqual(window.WindowEventType.WINDOW_HIDDEN);
          expect(windoweventChange[6]).assertEqual(window.WindowEventType.WINDOW_DESTROYED);
          done();
        }).catch(async (err: BusinessError) => {
          console.error(message + 'createWindow ' + 'caught, err: ' + JSON.stringify(err.code) + ',errMessage: ' + err.message);
          if (err.code === 1300002) {
            expect(err.message != null).assertTrue();
            done();
          } else if (err.code == 801) {
            console.error(message + 'windowEvent failed ' + 'caught, err: ' + JSON.stringify(err));
            await windowClass!.destroyWindow();
            expect(err.message != null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done()
          }
        })
      } catch (err) {
        console.error(message + ' failed: ' + err);
        if (err.code == 801) {
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }


    })

    /**
     * @tc.name   SUB_BASIC_WMS_WindowStageEvent_0100
     * @tc.number SUB_BASIC_WMS_WindowStageEvent_0100
     * @tc.desc   Test the function value of preferredOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_WMS_WindowStageEvent_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'SUB_BASIC_WMS_WindowStageEvent_0100';
      // 1、拉起另一个Abllity主窗
      try {
        let windowStageStart = await startAbility1(caseName, context);
        let windowclass = windowStageStart.getMainWindowSync();
        await sleep(1000);
        await terminateAbility1(caseName);
        await sleep(2000);
        let arr: Array<window.WindowStageEventType> = AppStorage.get('arrary') as Array<window.WindowStageEventType>;
        console.log(`${caseName} arr get. ${JSON.stringify(arr)}`);
        expect(arr[0]).assertEqual(window.WindowStageEventType.SHOWN);
        expect(arr[1]).assertEqual(window.WindowStageEventType.ACTIVE);
        expect(arr[2]).assertEqual(window.WindowStageEventType.INACTIVE);
        expect(arr[3]).assertEqual(window.WindowStageEventType.HIDDEN);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await terminateAbility1(caseName);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testGetAllMainWindowInfo_0200
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200
     * @tc.desc   北向getAllMainWindowInfo测试返回值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetAllMainWindowInfo_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetAllMainWindowInfo_0200";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowInfoArray = await window.getAllMainWindowInfo();
          console.info(caseName + ' windowInfoArray.length: ' + JSON.stringify(windowInfoArray.length));
          console.info(caseName + ' windowInfoArray: ' + JSON.stringify(windowInfoArray));
          expect(windowInfoArray.length).assertLargerOrEqual(1);
          for (let i = 0; i < windowInfoArray.length; i++) {
            if (windowInfoArray[i].windowId == windowId) {
              let mainWindowInfo = windowInfoArray[i];
              console.info(caseName + ' mainWindowInfo: ' + JSON.stringify(mainWindowInfo));
              expect(mainWindowInfo.windowId).assertEqual(windowId);
              expect(mainWindowInfo.displayId).assertEqual(0);
              expect(mainWindowInfo.showing).assertEqual(true);
              expect(mainWindowInfo.label).assertEqual('test label');
              break;
            }
          }
          const callback = async (data: window.WindowStageLifecycleEventType) => {
            console.info(`Succeeded in enabling the listener for window stage event changes. Data: ${JSON.stringify(data)}`);
            if (data === window.WindowStageLifecycleEventType.HIDDEN) {
              console.info(caseName + ' current window stage event is HIDDEN');
              let windowInfoArray2 = await window.getAllMainWindowInfo();
              console.info(caseName + ' windowInfoArray2: ' + JSON.stringify(windowInfoArray2));
              for (let i = 0; i < windowInfoArray2.length; i++) {
                if (windowInfoArray2[i].windowId == windowId) {
                  let mainWindowInfo2 = windowInfoArray2[i];
                  console.info(caseName + ' mainWindowInfo2: ' + JSON.stringify(mainWindowInfo2));
                  expect(mainWindowInfo2.showing).assertEqual(false);
                  break;
                }
              }
              windowStage.off('windowStageLifecycleEvent', callback);
              await windowClass.restore();
              context.setMissionLabel('label2');
              let windowInfoArray3 = await window.getAllMainWindowInfo();
              console.info(caseName + ' windowInfoArray3: ' + JSON.stringify(windowInfoArray3));
              for (let i = 0; i < windowInfoArray3.length; i++) {
                if (windowInfoArray3[i].windowId == windowId) {
                  let mainWindowInfo3 = windowInfoArray3[i];
                  console.info(caseName + ' mainWindowInfo3: ' + JSON.stringify(mainWindowInfo3));
                  expect(mainWindowInfo3.label).assertEqual('label2');
                  break;
                }
              }
              done()
            }
          }
          windowStage.on('windowStageLifecycleEvent', callback);
          await windowClass.minimize();
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err))
          expect().assertFail();
          done();
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_0200
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参是null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_0200";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let configs: window.WindowSnapshotConfiguration = {
            useCache: false
          }
          await window.getMainWindowSnapshot(null, configs)
          expect().assertFail();
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          if (err.code == 401) {
            
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_0300
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参是undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_0300";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let configs: window.WindowSnapshotConfiguration = {
            useCache: false
          }
          await window.getMainWindowSnapshot(undefined, configs)
          expect().assertFail();
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          if (err.code == 401) {
            
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_0400
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参包含0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_0400";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray = [0, windowId];
          let configs: window.WindowSnapshotConfiguration = {
            useCache: false
          }
          await window.getMainWindowSnapshot(windowIdArray, configs)
          expect().assertFail();
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          if (err.code == 401) {
            
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_0500
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参包含-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_0500";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray = [-1, windowId];
          let configs: window.WindowSnapshotConfiguration = {
            useCache: false
          }
          await window.getMainWindowSnapshot(windowIdArray, configs)
          expect().assertFail();
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          if (err.code == 401) {
            
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_0600
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参包含重复Id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_0600";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray = [windowId, windowId];
          let configs: window.WindowSnapshotConfiguration = {
            useCache: false
          }
          await window.getMainWindowSnapshot(windowIdArray, configs)
          expect().assertFail();
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          if (err.code == 401) {
            
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_0700
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700
     * @tc.desc   北向getMainWindowSnapshot测试windowId数组长度大于512
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_0700";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray: number[] = new Array(520).fill(windowId);
          let configs: window.WindowSnapshotConfiguration = {
            useCache: false
          }
          await window.getMainWindowSnapshot(windowIdArray, configs)
          expect().assertFail();
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          if (err.code == 401) {
            
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_0800
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参正整数，但是不存在的windowId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_0800";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray = [1000];
          let configs: window.WindowSnapshotConfiguration = {
            useCache: false
          }
          let pixelMapArray = await window.getMainWindowSnapshot(windowIdArray, configs);
          console.info(caseName + ' pixelMapArray: ' + pixelMapArray);
          console.info(caseName + ' pixelMapArray.length: ' + pixelMapArray.length);
          expect(pixelMapArray.length).assertEqual(1);
          expect(pixelMapArray[0]).assertEqual(undefined);
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_0900
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_0900
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参正常，WindowSnapshotConfiguration入参 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_0900";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray = [windowId];
          await window.getMainWindowSnapshot(windowIdArray, null);
          expect().assertFail();
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          if (err.code == 401) {
            
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_1000
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_1000
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参正常，WindowSnapshotConfiguration入参 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_1000";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray = [windowId];
          await window.getMainWindowSnapshot(windowIdArray, undefined);
          expect().assertFail();
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          if (err.code == 401) {
            
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_1100
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_1100
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参正常，WindowSnapshotConfiguration设置useCache=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_1100";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray = [windowId];
          let configs: window.WindowSnapshotConfiguration = {
            useCache: false
          }
          let pixelMapArray = await window.getMainWindowSnapshot(windowIdArray, configs);
          console.info(caseName + ' pixelMapArray: ' + pixelMapArray);
          console.info(caseName + ' pixelMapArray.length: ' + pixelMapArray.length);
          expect(pixelMapArray.length).assertEqual(1);
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } else {
        done();
      }
    });

    /**
     * @tc.name   testGetMainWindowSnapshot_1200
     * @tc.number SUB_BASIC_WMS_FUNCTION_GET_MAIN_WINDOW_SNAPSHOT_TEST_1200
     * @tc.desc   北向getMainWindowSnapshot测试windowId入参正常，WindowSnapshotConfiguration设置useCache=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testGetMainWindowSnapshot_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetMainWindowSnapshot_1200";
      console.log(caseName + " begin");
      if (isPCStatus != '') {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(caseName + ' windowId: ' + windowId);
          let windowIdArray = [windowId];
          let configs: window.WindowSnapshotConfiguration = {
            useCache: true
          }
          let pixelMapArray = await window.getMainWindowSnapshot(windowIdArray, configs);
          console.info(caseName + ' pixelMapArray: ' + pixelMapArray);
          console.info(caseName + ' pixelMapArray.length: ' + pixelMapArray.length);
          expect(pixelMapArray.length).assertEqual(1);
          done()
        } catch (err) {
          console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      } else {
        done();
      }
    });
    /**
    * @tc.name   testStartAbilityNeedAnimation_true
    * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_NEED_ANIMATION_0100
    * @tc.desc   Test the needAnimation true
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('testStartAbilityNeedAnimation_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testStartAbilityNeedAnimation_true';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let wantInfo: Want = {
        bundleName: AppStorage.get('bundleName'),
        abilityName: 'StartTestAbility'
      };
      let animation_param: window.StartAnimationParams = {
        type: window.AnimationType.FADE_IN_OUT
      };
      let windowParam: window.WindowCreateParams = {
        animationParams: animation_param,
        needAnimation: true
      };
      let options: StartOptions = {
        windowCreateParams: windowParam
      };
      try {
        await context.startAbility(wantInfo, options).then(async () => {
          console.info(`${msgStr} Succeeded in starting ability.`);
          await sleep(900);
          await sleep(900);
          await terminateAbility(msgStr);
          console.info(`${msgStr} terminateSelf end.`);
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to starting ability.Cause code: ${ err.code }, message: ${ err.message }`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(msgStr + `Failed to starting ability.outcatch Cause code: ${ err.code }, message: ${ err.message }`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
    * @tc.name    testStartAbilityNeedAnimation_false
    * @tc.number  SUB_BASIC_WMS_SPCIAL_XTS_NEED_ANIMATION_0200
    * @tc.desc    Test the needAnimation false
    * @tc.type    FUNCTION
    * @tc.size    MEDIUMTEST
    * @tc.level   LEVEL1
    */
    it('testStartAbilityNeedAnimation_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testStartAbilityNeedAnimation_false';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let wantInfo: Want = {
        bundleName:AppStorage.get('bundleName'),
        abilityName: 'StartTestAbility'
      };
      let animation_param: window.StartAnimationParams = {
        type: window.AnimationType.FADE_IN_OUT
      };
      let windowParam: window.WindowCreateParams = {
        animationParams: animation_param,
        needAnimation: false
      };
      let options: StartOptions = {
        windowCreateParams: windowParam
      };
      try {
        await context.startAbility(wantInfo, options).then(async () => {
          console.info(`${msgStr} Succeeded in starting ability.`);
          await sleep(900);
          await sleep(900);
          await terminateAbility(msgStr);
          console.info(`${msgStr} terminateSelf end.`);
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to starting ability.Cause code: ${ err.code }, message: ${ err.message }`);
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(msgStr + `Failed to starting ability.outcatch Cause code: ${ err.code }, message: ${ err.message }`);
        expect(false).assertTrue();
        done();
      }
    })




    /**
     * @tc.name   testRestoreMainWindow_0100
     * @tc.number SUB_WMS_RESTORE_MAIN_WINDOW_0100
     * @tc.desc   验证非float窗口调用restoreMainWindow返回1300004错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRestoreMainWindow_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = "testRestoreMainWindow_0100";
      console.log(caseName + " begin");
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      let windowClass = windowStage.getMainWindowSync();
      let subWindowClass: window.Window | undefined;
      let dialogWindowClass: window.Window | undefined;
      try {
        await windowClass.restoreMainWindow();
        expect().assertFail();
        done()
      } catch (err) {
        console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
        if (canIUseRes) {
          expect(err.code).assertEqual(1300004)
        } else {
          expect(err.code).assertEqual(801)
        }
      }
      try {
        subWindowClass = await windowStage.createSubWindow('sub_testRestoreMainWindow_0100')
        await subWindowClass.restoreMainWindow();
        expect().assertFail();
        await subWindowClass.destroyWindow();
        done()
      } catch (err) {
        console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
        await subWindowClass?.destroyWindow();
        if (canIUseRes) {
          expect(err.code).assertEqual(1300004)
        } else {
          expect(err.code).assertEqual(801)
        }
      }
      try {
        let config: window.Configuration = {
          name: "dialog_testRestoreMainWindow_0100",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        dialogWindowClass = await window.createWindow(config);
        await dialogWindowClass.restoreMainWindow();
        expect().assertFail();
        await dialogWindowClass.destroyWindow();
        done()
      } catch (err) {
        console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
        await dialogWindowClass?.destroyWindow();
        if (canIUseRes) {
          expect(err.code).assertEqual(1300004)
        } else {
          expect(err.code).assertEqual(801)
        }
        done();
      }
    });


    /**
     * @tc.name   testRestoreMainWindow_0200
     * @tc.number SUB_WMS_RESTORE_MAIN_WINDOW_0200
     * @tc.desc   验证float窗口销毁后调用restoreMainWindow返回1300002错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRestoreMainWindow_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = "testRestoreMainWindow_0200";
      console.log(caseName + " begin");
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      let config: window.Configuration = {
        name: "testRestoreMainWindow_0200",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      let subWindowClass: window.Window | undefined;
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await subWindowClass.destroyWindow();
          await subWindowClass.restoreMainWindow();
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (err) {
        console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   testRestoreMainWindow_0300
     * @tc.number SUB_WMS_RESTORE_MAIN_WINDOW_0300
     * @tc.desc   验证float窗口restoreMainWindow拉起已销毁的主窗返回1300004错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testRestoreMainWindow_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = "testRestoreMainWindow_0300";
      console.log(caseName + " begin");
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      let subWindowClass: window.Window | undefined;
      let windowStageStart = await startAbility3(caseName, context);
      let contextTest3 = AppStorage.get('contextTest3') as common.UIAbilityContext;
      console.log(`${caseName} contextTest3: ${contextTest3}`);
      let config: window.Configuration = {
        name: "testRestoreMainWindow_0300",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: contextTest3
      };
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await terminateAbility3(caseName);
          await sleep(1000);
          await subWindowClass.restoreMainWindow();
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          await terminateAbility3(caseName);
          if (err.code == 1300002) {
            done();
          } else {
            await subWindowClass?.destroyWindow();
            if (!canIUseRes || (deviceType != 'phone' && deviceType != 'tablet' && deviceType != '2in1')) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err.code).assertEqual(1300004);
              done();
            }
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
        await subWindowClass?.destroyWindow();
        await terminateAbility3(caseName);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name testRestoreMainWindow_0500
     * @tc.number SUB_WMS_RESTORE_MAIN_WINDOW_0500
     * @tc.desc 验证float窗口在前台且有down时间时调用restoreMainWindow拉起主窗到前台，未传入wantparameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("testRestoreMainWindow_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testRestoreMainWindow_0500";
      console.log(caseName + " begin");
      let driver = Driver.create()
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      let config: window.Configuration = {
        name: "testRestoreMainWindow_0500",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      let subWindowClass: window.Window | undefined;
      let mainWindow = windowStage.getMainWindowSync();
      try {
        const callback = async (res: window.WindowEventType) => {
          console.log(caseName + ' windowEvent callback res: ' + res)
          expect(res).assertEqual(window.WindowEventType.WINDOW_SHOWN);
          mainWindow.off('windowEvent', callback)
          await subWindowClass?.destroyWindow();
          done()
        }
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await subWindowClass.showWindow();
          await subWindowClass.resize(800, 1200);
          await sleep(500);
          if (canIUseRes && (deviceType == 'phone' || deviceType == 'tablet' || deviceType == '2in1')) {
            console.log(`${caseName} minimize`);
            await mainWindow.minimize();
            await sleep(500);
            let text = await driver.findComponent(ON.id('textId'))
            console.log(`${caseName} text: ${text}`);
            await sleep(1000);
            await text.click();
            await sleep(500);
            mainWindow.on('windowEvent', callback);
            await subWindowClass.restoreMainWindow();
            await sleep(500);
          } else {
            await subWindowClass?.destroyWindow();
            done();
          }
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          if (err.code == 1300002) {
            done();
          } else {
            expect(true).assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
        await subWindowClass?.destroyWindow();
        expect(true).assertFail();
        done();
      }
    });

    /**
     * @tc.name testRestoreMainWindow_0600
     * @tc.number SUB_WMS_RESTORE_MAIN_WINDOW_0600
     * @tc.desc 验证float窗口在前台且有down时间时调用restoreMainWindow拉起主窗到前台，传入wantparameters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it("testRestoreMainWindow_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testRestoreMainWindow_0600";
      console.log(caseName + " begin");
      let driver = Driver.create()
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      let config: window.Configuration = {
        name: "testRestoreMainWindow_0600",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      let subWindowClass: window.Window | undefined;
      let mainWindow = windowStage.getMainWindowSync();
      try {
        const callback = async (res: window.WindowEventType) => {
          console.log(caseName + ' windowEvent callback res: ' + res)
          expect(res).assertEqual(window.WindowEventType.WINDOW_SHOWN);
          mainWindow.off('windowEvent', callback)
          await subWindowClass?.destroyWindow();
          done();
        }
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await subWindowClass.showWindow();
          await subWindowClass.resize(800, 1200);
          await sleep(500);
          if (canIUseRes && (deviceType == 'phone' || deviceType == 'tablet' || deviceType == '2in1')) {
            console.log(`${caseName} minimize`);
            await mainWindow.minimize();
            await sleep(500);
            let text = await driver.findComponent(ON.id('textId'))
            console.log(`${caseName} text: ${text}`);
            await sleep(1000);
            await text.click();
            await sleep(500);
            mainWindow.on('windowEvent', callback);
            let param: Record<string, Object> = {
              'info': 'restoreMainWindow',
            };
            await subWindowClass.restoreMainWindow(param);
            await sleep(500)
          } else {
            await subWindowClass?.destroyWindow();
            done();
          }
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          if (err.code == 1300002) {
            done();
          } else {
            expect(true).assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Cause: ' + JSON.stringify(err));
        await subWindowClass?.destroyWindow();
        expect(true).assertFail();
        done();
      }
    });
    /**
    * @tc.name testcreateWindowCallback1300002_0100
    * @tc.number testcreateWindowCallback1300002_0100
    * @tc.desc testcreateWindowCallback1300002_0100
    * @tc.type FUNCTION
    * @tc.size MEDIUMTEST
    * @tc.level LEVEL3
    */
    it("testcreateWindowCallback1300002_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testcreateWindowCallback1300002_0100";
      console.log(caseName + " begin");
      let windowConfig: window.Configuration = {
        name: "testcreateWindowCallback1300002_0100",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      try {
        window.createWindow(windowConfig, async (err, data) => {
          const errCode: number = err!.code;
          if (errCode) {
            console.log(caseName + 'Failed to call createWindow. Cause:' + JSON.stringify(err));
            if (err!.code === 1300002) {
              done();
            } else if (err!.code === 801) {
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          } else {
            console.log(caseName + 'Succeeded in calling createWindow.');
            expect(!!data).assertTrue();
            await data.destroyWindow();
            done();
          }

        });
      } catch (exception) {
        console.error(caseName + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
        expect(false).assertTrue();
        done()
      }
    });

  })

}