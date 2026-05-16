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
import { BusinessError } from '@kit.BasicServicesKit';
import * as LoadContentByName from '../testability/pages/WindowTest/LoadContentByName';
import {Want, StartOptions } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { display } from '@kit.ArkUI';
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



export default function NoParentSubWindowLifeCycle() {
  describe('NoParentSubWindowLifeCycle', async () => {
    let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let isAutoWindow: string = '';
    let windowclassArr: Array<window.Window>;
    let isFreeWindowMode = false;
    let isPCMode: boolean = false;
    let deviceType: string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      let promise = windowClass.getWindowStateSnapshot();
      promise.then((data) => {
        let jsonObj: object = JSON.parse(data);
        console.info(`beforeAll: Succeeded. data=${data}, isPcMod=${jsonObj["isPcMode"]},isSupportFreeWindowMode=${jsonObj["isSupportFreeWindowMode"]}`);
        isPCMode = jsonObj["isPcMode"];
      }).catch((err: BusinessError) => {
        console.error(`beforeAll: getWindowStateSnapshot Failed. Cause code: ${err.code}, cancel message: ${err.message}`);
      });
      console.info(`beforeAll: isPCMode=${isPCMode}`);
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
 * @tc.number  SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100
 * @tc.name    SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100
 * @tc.desc    SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100
 * @tc.size    MediumTest
 * @tc.type    Function
 * @tc.level   LEVEL0
 */
it('SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    const caseName = 'SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_Undefined_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: undefined
    };
    try {
      windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_Undefined_0100', subWindowOptions)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          await data.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
        console.error(msgStr +
          `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      });
    } catch (exception) {
      console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      expect(false).assertTrue();
      done();
    }
    ;
  })

/**
 * @tc.number  SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100
 * @tc.name    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100
 * @tc.desc    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100
 * @tc.size    MediumTest
 * @tc.type    Function
 * @tc.level   LEVEL0
 */
it('SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    const caseName = 'SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_Undefined_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_Undefined_0200',
      decorEnabled: true,
      zLevelAboveParentLoosened: undefined
    };
    try {
      let mainWindow: window.Window = windowStage.getMainWindowSync();
      let promise =
        mainWindow.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_Undefined_0200', subWindowOptions)
      if (isFreeWindowMode) {
        promise.then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          await data.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr +
            `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } else {
        expect(promise === undefined).assertTrue();
        done();
      }
    } catch (exception) {
      console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      expect(false).assertTrue();
      done();
    }
    ;
  })

/**
 * @tc.number SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_0100
 * @tc.name   SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_0100
 * @tc.desc   SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_0100
 * @tc.size   MediumTest
 * @tc.type   Function
 * @tc.level  LEVEL0
 */
it('SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    const caseName = 'SUB_WINDOW_windowStage_CreateSubWindowWithOptions_NoParentSubWindow_false_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_false_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: false
    };
    try {
      windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_Undefined_0100', subWindowOptions)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          await data.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
        console.error(msgStr +
          `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      });
    } catch (exception) {
      console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      expect(false).assertTrue();
      done();
    }
    ;
  })

/**
 * @tc.number  SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_0100
 * @tc.name    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_0100
 * @tc.desc    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_0100
 * @tc.size    MediumTest
 * @tc.type    Function
 * @tc.level   LEVEL0
 */
it('SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    const caseName = 'SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_false_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_false_0200',
      decorEnabled: true,
      zLevelAboveParentLoosened: false
    };
    try {
      let mainWindow: window.Window = windowStage.getMainWindowSync();
      let promise =
        mainWindow.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_false_0200', subWindowOptions)
      if (isFreeWindowMode) {
        promise.then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          await data.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr +
            `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } else {
        expect(promise === undefined).assertTrue();
        done();
      }
    } catch (exception) {
      console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      expect(false).assertTrue();
      done();
    }
    ;
  })

/**
 * @tc.number  SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_0100
 * @tc.name    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_0100
 * @tc.desc    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_0100
 * @tc.size    MediumTest
 * @tc.type    Function
 * @tc.level   LEVEL0
 */
it('SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    const caseName = 'SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_true_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let mainWindow = windowStage.getMainWindowSync();
    let windowId = mainWindow.getWindowProperties().id;
    console.info(msgStr + 'windowId :' + windowId);
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_true_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    try {
      let promise =
        mainWindow.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_true_0100', subWindowOptions)
      if (isFreeWindowMode) {
        promise.then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          let parentClass = data.getParentWindow();
          let parentId = parentClass.getWindowProperties().id;
          console.info(msgStr + 'parentId :' + parentId)
          expect(parentId).assertEqual(windowId);
          await data.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr +
            `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } else {
        expect(promise === undefined).assertTrue();
        done();
      }
    } catch (exception) {
      console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      expect(false).assertTrue();
      done();
    }
    ;
  })


/**
 * @tc.number  SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_0100
 * @tc.name    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_0100
 * @tc.desc    SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_0100
 * @tc.size    MediumTest
 * @tc.type    Function
 * @tc.level   LEVEL0
 */
it('SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    const caseName = 'SUB_WINDOW_windowClass_CreateSubWindowWithOptions_NoParentSubWindow_1300004_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_true_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    let subWindowClass = await windowStage.createSubWindow('SUB_WINDOW_NoParentSubWindow_1300004_parentWindow');
    try {
      let promise =
        subWindowClass.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_1300004_0100', subWindowOptions);
      if (isFreeWindowMode) {
        promise.then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          await data.destroyWindow();
          await subWindowClass.destroyWindow();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +
            `Failed to create the subwindow1. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
          expect(err.message !== '').assertTrue();
          await subWindowClass.destroyWindow();
          done();
        });
      } else {
        expect(promise === undefined).assertTrue();
        await subWindowClass.destroyWindow();
        done();
      }
    } catch (exception) {
      console.error(msgStr +
        `Failed to create the window2. Cause: ${exception.code}, message: ${exception.message}`);
      expect(false).assertTrue();
      await subWindowClass.destroyWindow();
      done();
    };
  })

/**
 * @tc.number  SUB_WINDOW_NoParentSubWindow_isWindowShowing_0100
 * @tc.name    SUB_WINDOW_NoParentSubWindow_isWindowShowing_0100
 * @tc.desc    SUB_WINDOW_NoParentSubWindow_isWindowShowing_0100
 * @tc.size    MediumTest
 * @tc.type    Function
 * @tc.level   LEVEL1
 */
it('SUB_WINDOW_NoParentSubWindow_isWindowShowing_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    const caseName = 'SUB_WINDOW_NoParentSubWindow_isWindowShowing_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_isWindowShowing_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_isWindowShowing_0100', subWindowOptions)
      .then(async (data) => {
        let subWindow: window.Window = data;
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        let isWindowShowing: boolean = subWindow.isWindowShowing();
        console.log(msgStr + 'isWindowShowing:' + isWindowShowing);
        expect(!!subWindow).assertTrue();
        expect(isWindowShowing).assertFalse();
        subWindow.showWindow().then(async () => {
          let isWindowShowing2 = subWindow.isWindowShowing();
          console.log(msgStr + 'isWindowShowing2:' + isWindowShowing2);
          expect(isWindowShowing2).assertTrue();
          await subWindow.destroyWindow();
          done();
        }).catch(async (err: BusinessError) => {
          console.error('Failed to show window1. Cause:' + JSON.stringify(err));
          expect(true).assertFail();
          await subWindow.destroyWindow();
          done();
        });
      }).catch((err: BusinessError) => {
      console.error(msgStr +
        `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
      expect(false).assertTrue();
      done();
    });
  }
)

/**
 * @tc.number  SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0100
 * @tc.name    SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0100
 * @tc.desc    SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0100
 * @tc.size    MediumTest
 * @tc.type    Function
 * @tc.level   LEVEL0
 */
it('SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
    const caseName = 'SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let windowEventChangeArray: window.WindowEventType[] = [];
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    try {
      let windowClass =
        await windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0100',
          subWindowOptions);
      console.info(caseName + ' createSubWindow success ' + JSON.stringify(windowClass));
      windowClass.on('windowEvent', (data) => {
        console.info(caseName + ' Window event happened. Event:' + JSON.stringify(data));
        windowEventChangeArray.push(data);
        console.info(caseName + ' windowEventChangeArray:' + JSON.stringify(windowEventChangeArray));
      });
      await windowClass.setUIContent('testability/pages/Index2')
      let focusOnshowOptions: window.ShowWindowOptions = {
        focusOnShow: true
      }
      await windowClass.showWindow(focusOnshowOptions);
      console.info(caseName + ' windowClass showWindow success ');
      await sleep(300)
      await windowClass.minimize();
      console.info(caseName + ' windowClass minimize success ');
      await sleep(300)
      await windowClass.destroyWindow();
      console.info(caseName + ' windowClass destroyWindow success ');
      await sleep(300)
      expect(windowEventChangeArray[0]).assertEqual(window.WindowEventType.WINDOW_SHOWN);
      expect(windowEventChangeArray[1]).assertEqual(window.WindowEventType.WINDOW_ACTIVE);
      expect(windowEventChangeArray[2]).assertEqual(window.WindowEventType.WINDOW_INACTIVE);
      expect(windowEventChangeArray[3]).assertEqual(window.WindowEventType.WINDOW_HIDDEN);
      expect(windowEventChangeArray[4]).assertEqual(window.WindowEventType.WINDOW_DESTROYED);
      done();
    } catch (err) {
      console.error(msgStr +
        `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
      expect(false).assertTrue();
      done();
    }
  }
);

/**
 * @tc.name   SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_0100
 * @tc.number SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_0100
 * @tc.desc   SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    let caseName = 'SUB_WINDOW_NoParentSubWindow_OnWindowEvent_Two_callback_OffWindowEvent_0100';
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
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0200',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    await windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_OnWindowEvent_0200',
      subWindowOptions).then(async (data) => {
      subWindow = data;
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!subWindow).assertTrue();
      try {
        subWindow.on('windowEvent', callback1);
        subWindow.on('windowEvent', callback2);
        await subWindow.showWindow();
        await sleep(500);
        subWindow.off('windowEvent', callback1);
        await subWindow.minimize();
        await sleep(500);
        expect(num).assertEqual(6);
        await subWindow.destroyWindow();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
        await subWindow.destroyWindow();
        expect(true).assertFail();
        done();
      }
    }).catch((err: BusinessError) => {
      console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
      expect(true).assertFail();
      done();
    });
  });

/**
 * @tc.name   SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_0100
 * @tc.number SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_0100
 * @tc.desc   SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
  async (done: Function) => {
    let message = "SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_0100";
    let msgStr = 'jsunittest ' + message + ' ';
    console.log(msgStr + 'begin.');
    let windowStageStart = await startAbility(message, context);
    let mainWindow = windowStageStart.getMainWindowSync();
    let windowId = mainWindow.getWindowProperties().id;
    console.info(msgStr + 'windowId :' + windowId);
    try {
      let subWindowOptions: window.SubWindowOptions = {
        title: 'SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_0100',
        decorEnabled: true,
        zLevelAboveParentLoosened: true
      };
      let subWindowClass =
        await windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_setParentWindow_Normal_0100',
          subWindowOptions);
      subWindowClass.setParentWindow(windowId).then(async () => {
        console.info(msgStr + 'Succeeded in  setParentWindow window.')
        let parentClass = subWindowClass.getParentWindow();
        let parentId = parentClass.getWindowProperties().id;
        console.info(msgStr + 'parentId :' + parentId)
        expect(parentId).assertEqual(windowId);
        await subWindowClass.destroyWindow();
        await terminateAbility(message)
        done()
      }).catch(async (e: BusinessError) => {
        console.error(msgStr + `Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);
        if (!isFreeWindowMode) {
          expect(e.code).assertEqual(801);
          expect(e.message)
            .assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setParentWindow]msg: Set parent window failed.');
        } else {
          expect(true).assertFail();
        }
        await terminateAbility(message);
        done();
      });
    } catch (e) {
      console.error(msgStr + `Failed to setParentWindow. Cause: ${e.code}, message: ${e.message}`);
      await terminateAbility(message)
      expect(true).assertFail();
      done();
    }
  })

/**
 * @tc.name   SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_0100
 * @tc.number SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_0100
 * @tc.desc   SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
  async (done: Function) => {
    let message = "SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_0100";
    let msgStr = 'jsunittest ' + message + ' ';
    console.log(msgStr + 'begin.');
    let windowClass =
      await windowStage.createSubWindow('SUB_WINDOW_NoParentSubWindow_setParentWindow_parentWindow');
    let windowId = windowClass.getWindowProperties().id;
    console.info(msgStr + 'windowId :' + windowId);
    try {
      let subWindowOptions: window.SubWindowOptions = {
        title: 'SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_0100',
        decorEnabled: true,
        zLevelAboveParentLoosened: true
      };
      let subWindowClass =
        await windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_setParentWindow_1300009_0100',
          subWindowOptions);
      subWindowClass.setParentWindow(windowId).then(async () => {
        console.info(msgStr + 'Succeeded in  setParentWindow window.')
        await subWindowClass.destroyWindow();
        await windowClass.destroyWindow();
        done()
      }).catch(async (e: BusinessError) => {
        console.error(msgStr + `Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);
        if (isFreeWindowMode) {
          expect(e.code).assertEqual(1300009);
          expect(e.message !== '').assertTrue();
        } else {
          expect(e.code).assertEqual(801);
          expect(e.message)
            .assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setParentWindow]msg: Set parent window failed.');
        }
        await subWindowClass.destroyWindow();
        await windowClass.destroyWindow();
        done();
      });
    } catch (e) {
      console.error(msgStr + `Failed to setParentWindow. Cause: ${e.code}, message: ${e.message}`);
      await windowClass.destroyWindow();
      expect(true).assertFail();
      done();
    }
  })

/**
 * @tc.name   SUB_WINDOW_NoParentSubWindow_findWindow_normal_0100
 * @tc.number SUB_WINDOW_NoParentSubWindow_findWindow_normal_0100
 * @tc.desc   SUB_WINDOW_NoParentSubWindow_findWindow_normal_0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('SUB_WINDOW_NoParentSubWindow_findWindow_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
  async (done: Function) => {
    let message = "SUB_WINDOW_NoParentSubWindow_findWindow_normal_0100";
    let msgStr = 'jsunittest ' + message + ' ';
    console.log(msgStr + 'begin.');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_findWindow_normal_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    try {
      windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_findWindow_normal_0100',
        subWindowOptions)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          let subWindowClass = window.findWindow("SUB_WINDOW_NoParentSubWindow_findWindow_normal_0100");
          console.info(msgStr + 'Succeeded in creating the subwindow. subWindowClass: ' +
            JSON.stringify(subWindowClass));
          expect(!!subWindowClass).assertTrue();
          let windowId1 = data.getWindowProperties().id;
          let windowId2 = subWindowClass.getWindowProperties().id;
          console.info(`${msgStr},data.windowId：${windowId1},subWindowClass.windowId:${windowId2}`);
          expect(windowId1).assertEqual(windowId2)
          await data.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
        console.error(msgStr +
          `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      });
    } catch (exception) {
      console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      expect(false).assertTrue();
      done();
    }
    ;
  })

/**
 * @tc.name   SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_0100
 * @tc.number SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_0100
 * @tc.desc   SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
it('SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
  async (done: Function) => {
    let caseName = 'SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin.');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_GetUIContext_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    let storage: LocalStorage = new LocalStorage();
    try {
      windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_GetUIContext_0100', subWindowOptions)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          await data.loadContent('testability/pages/Index2',storage);
          let uiContext = data.getUIContext();
          console.info(`${msgStr} Succeeded in gettting the main window ui context. Data: ${JSON.stringify(uiContext)}`)
          expect(uiContext !== null).assertTrue();
          let UiContextWindowId = uiContext.getWindowId();
          let UiContextWindowName = uiContext.getWindowName();
          let windowId = data.getWindowProperties().id;
          let windowName = data.getWindowProperties().name;
          console.info(`${msgStr} Succeeded in gettting UiContext,UiContextWindowId: ${UiContextWindowId},UiContextWindowName: ${UiContextWindowName},windowId: ${windowId},windowName: ${windowName}`);
          expect(windowId).assertEqual(UiContextWindowId);
          expect(windowName).assertEqual(UiContextWindowName);
          await data.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
        console.error(msgStr +
          `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      });
    } catch (exception) {
      console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      expect(false).assertTrue();
      done();
    };
  })


/**
 * @tc.name   SUB_WINDOW_NoParentSubWindow_LoadContentByName_normal_0100
 * @tc.number SUB_WINDOW_NoParentSubWindow_LoadContentByName_normal_0100
 * @tc.desc   SUB_WINDOW_NoParentSubWindow_LoadContentByName_normal_0100
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
it('SUB_WINDOW_NoParentSubWindow_LoadContentByName_normal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
  async (done: Function) => {
    let caseName = 'SUB_WINDOW_NoParentSubWindow_GetUIContext_normal_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin.');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_LoadContentByName_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    let storage: LocalStorage = new LocalStorage();
    try {
      windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_LoadContentByName_0100', subWindowOptions)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!data).assertTrue();
          await data.loadContentByName(LoadContentByName.entryName,storage);
          let uiContext = data.getUIContext();
          console.info(`${msgStr} Succeeded in gettting the main window ui context. Data: ${JSON.stringify(uiContext)}`)
          expect(uiContext !== null).assertTrue();
          let UiContextWindowId = uiContext.getWindowId();
          let UiContextWindowName = uiContext.getWindowName();
          let windowId = data.getWindowProperties().id;
          let windowName = data.getWindowProperties().name;
          console.info(`${msgStr} Succeeded in gettting UiContext,UiContextWindowId: ${UiContextWindowId},UiContextWindowName: ${UiContextWindowName},windowId: ${windowId},windowName: ${windowName}`);
          expect(windowId).assertEqual(UiContextWindowId);
          expect(windowName).assertEqual(UiContextWindowName);
          await data.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
        console.error(msgStr +
          `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      });
    } catch (exception) {
      console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      expect(false).assertTrue();
      done();
    };
  })


  })

}