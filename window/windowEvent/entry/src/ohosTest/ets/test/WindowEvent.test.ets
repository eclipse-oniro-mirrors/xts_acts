/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import ohosWindow from '@ohos.window';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import settings from '@ohos.settings';
import window from '@ohos.window';
import { StartOptions } from '@kit.AbilityKit';

function expectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function, code: number) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  if (error.code == code) {
    expect(TRUE_FLAG).assertTrue();
  }
  done();
}

function unexpectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  expect(TRUE_FLAG).assertFail();
  done();
}

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise < string > (resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
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

export default function windowEventTest() {
  describe('windowEvent_test', () => {
    console.log('describe window_api_test start!!!')
    let systemWindowTypeArr: Array<string> = [];
    let systemWindowTypeDicArr: Array<string> = [];
    let systemWindowTypeDic: Record<string, number> = {
      'TYPE_FLOAT': 8,
    }
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let windowClass: window.Window;
    let isPCStatus: string = '';
    let isAutoWindow: string = '';
    let isFreeWindowMode: boolean = false;
    let driver: Driver;
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      windowClass = windowStage.getMainWindowSync();
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType.TYPE_FLOAT));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsUnittest beforeAll systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '', settings.domainName.USER_PROPERTY);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`beforeall isFreeWindowMode: ${JSON.stringify(isFreeWindowMode)}`);
      driver = Driver.create();
    })
    afterAll(async () => {

      await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
    })
    /**
     * @tc.name   testTouchOutSide_0100
     * @tc.number SUB_BASIC_WMS_TOUCHOUTSIDE_0100
     * @tc.desc   验证子窗在主窗内，点击子窗，主窗可监听到touchoutside回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTouchOutSide_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTouchOutSide_0100 ';
      console.log(caseName + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      let subWindowClass = await windowStage.createSubWindow('testTouchOutSide_0100');
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await sleep(1000);
      try {

        let timer = 0;

        let windowLimits = subWindowClass.getWindowLimits();
        console.info(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        await subWindowClass.resize(windowLimits.minWidth as number, windowLimits.minHeight as number);
        await sleep(1000);
        let displayInfo = display.getDefaultDisplaySync();
        console.info(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
        await subWindowClass.moveWindowTo(displayInfo.width / 2, displayInfo.height / 2);

        await subWindowClass.showWindow();
        await sleep(1000);
        let windowProperties = subWindowClass.getWindowProperties();
        console.log(`${caseName} windowProperties: ${JSON.stringify(windowProperties)}`);
        const callback = async () => {
          timer++;
          console.log(`${caseName} timer: ${timer}`);
          expect(timer).assertEqual(1);
          await sleep(300);
          mainWindow.off('touchOutside');

          await subWindowClass.destroyWindow();
          done();
        }
        mainWindow.on('touchOutside', callback);
        await sleep(200);
        await driver.click(Math.round(windowProperties.windowRect.left as number + 10), Math.round(windowProperties.windowRect.top as number + 10));
        await sleep(300);

      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await subWindowClass.destroyWindow();
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.name   testTouchOutSide_TopBar_0100
     * @tc.number SUB_BASIC_WMS_TOUCHOUTSIDE_TOPBAR_0100
     * @tc.desc   验证点击窗口范围内的topbar区域不触发touchOutside回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTouchOutSide_TopBar_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTouchOutSide_TopBar_0100 ';
      console.log(caseName + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      let subWindowClass = await windowStage.createSubWindow('testTouchOutSide_TopBar_0100');
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await sleep(1000);
      let timer = 0;
      try {
        let windowLimits = subWindowClass.getWindowLimits();
        console.info(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        await subWindowClass.resize(windowLimits.minWidth as number + 200, windowLimits.minHeight as number);
        await subWindowClass.moveWindowTo(200, 0);
        if (isFreeWindowMode) {
          await subWindowClass.moveWindowTo(200, 200);
        }
        await subWindowClass.showWindow();
        await sleep(1000);

        const callback = () => {
          timer++;
          console.log(`${caseName} timer: ${timer}`);
        }
        subWindowClass.on('touchOutside', callback);
        await mainWindow.setPreferredOrientation(window.Orientation.LANDSCAPE);
        await mainWindow.setSpecificSystemBarEnabled('status', false);
        await sleep(3000);
        let windowProperties = subWindowClass.getWindowProperties();
        console.log(`${caseName} windowProperties: ${JSON.stringify(windowProperties)}`);
        await sleep(200);
        // await driver.click(Math.round((windowLimits.minWidth as number+200)/2), 0);
        await driver.click(Math.round((windowProperties.windowRect.left as number + 10)), (windowProperties.windowRect.top as number + 10));
        await sleep(300);
        console.log(`${caseName} timer1: ${timer}`);
        expect(timer).assertEqual(0);
        // await driver.click(((windowLimits.minWidth as number+200)+10) , 0);
        await driver.click(((windowProperties.windowRect.left as number) - 10), 0);
        await sleep(300);
        console.log(`${caseName} timer2: ${timer}`);
        expect(timer).assertEqual(1);
        await mainWindow.setPreferredOrientation(window.Orientation.PORTRAIT);
        await sleep(1000);
        subWindowClass.off('touchOutside');
        await subWindowClass.destroyWindow();
        await mainWindow.setSpecificSystemBarEnabled('status', true);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await subWindowClass.destroyWindow();
        await mainWindow.setSpecificSystemBarEnabled('status', true);
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.name   testSetReceiveDragEventEnabledwithMainWindow
     * @tc.number SUB_WMS_SET_RECEIVE_DRAG_EVENT_ENABLED_0100
     * @tc.desc   验证主窗setReceiveDragEventEnabled接口和isReceiveDragEventEnabled接口可以配合使用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetReceiveDragEventEnabledwithMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSetReceiveDragEventEnabledwithMainWindow ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowStageStart = await startAbility3(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      await windowClass.setUIContent('testability/pages/Index2');
      await windowClass.showWindow();
      await sleep(500);
      try {
        await windowClass.setReceiveDragEventEnabled(false);
        let res1 = windowClass.isReceiveDragEventEnabled();
        console.info(caseName + ' windowClass.isReceiveDragEventEnabled() res1: ' + JSON.stringify(res1));
        expect(res1).assertEqual(false)
        await windowClass.setReceiveDragEventEnabled(true);
        let res2 = windowClass.isReceiveDragEventEnabled();
        console.info(caseName + ' windowClass.isReceiveDragEventEnabled() res2: ' + JSON.stringify(res2));
        expect(res2).assertEqual(true);
        await terminateAbility3(caseName);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await terminateAbility3(caseName);
        if (!canIUseRes) {
          expect(e.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.name   testSetReceiveDragEventEnabledwithSubWindow
     * @tc.number SUB_WMS_SET_RECEIVE_DRAG_EVENT_ENABLED_0200
     * @tc.desc   验证子窗setReceiveDragEventEnabled接口和isReceiveDragEventEnabled接口可以配合使用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetReceiveDragEventEnabledwithSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSetReceiveDragEventEnabledwithSubWindow ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowClass = await windowStage.createSubWindow('testSetReceiveDragEventEnabledwithSubWindow')
      await windowClass.setUIContent('testability/pages/Index2');
      await windowClass.showWindow();
      await sleep(500);
      try {
        await windowClass.setReceiveDragEventEnabled(false);
        let res1 = windowClass.isReceiveDragEventEnabled();
        console.info(caseName + ' windowClass.isReceiveDragEventEnabled() res1: ' + JSON.stringify(res1));
        expect(res1).assertEqual(false)
        await windowClass.setReceiveDragEventEnabled(true);
        let res2 = windowClass.isReceiveDragEventEnabled();
        console.info(caseName + ' windowClass.isReceiveDragEventEnabled() res2: ' + JSON.stringify(res2));
        expect(res2).assertEqual(true);
        await windowClass.destroyWindow();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await windowClass.destroyWindow()
        if (!canIUseRes) {
          expect(e.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    });


    /**
     * @tc.name   testSetReceiveDragEventEnabledwithDialogWindow
     * @tc.number SUB_WMS_SET_RECEIVE_DRAG_EVENT_ENABLED_0300
     * @tc.desc   验证系统窗setReceiveDragEventEnabled接口和isReceiveDragEventEnabled接口可以配合使用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetReceiveDragEventEnabledwithDialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSetReceiveDragEventEnabledwithDialogWindow ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let config: window.Configuration = {
        name: "testSetReceiveDragEventEnabledwithDialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass = await window.createWindow(config);
      await windowClass.setUIContent('testability/pages/Index2');
      await windowClass.showWindow();
      await sleep(500);
      try {
        await windowClass.setReceiveDragEventEnabled(false);
        let res1 = windowClass.isReceiveDragEventEnabled();
        console.info(caseName + ' windowClass.isReceiveDragEventEnabled() res1: ' + JSON.stringify(res1));
        expect(res1).assertEqual(false)
        await windowClass.setReceiveDragEventEnabled(true);
        let res2 = windowClass.isReceiveDragEventEnabled();
        console.info(caseName + ' windowClass.isReceiveDragEventEnabled() res2: ' + JSON.stringify(res2));
        expect(res2).assertEqual(true);
        await windowClass.destroyWindow();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await windowClass.destroyWindow()
        if (!canIUseRes) {
          expect(e.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    });


    /**
     * @tc.name   testSetReceiveDragEventEnabledwithDestroyedWindow
     * @tc.number SUB_WMS_SET_RECEIVE_DRAG_EVENT_ENABLED_0400
     * @tc.desc   验证窗口销毁后调用setReceiveDragEventEnabled接口和isReceiveDragEventEnabled接口报1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetReceiveDragEventEnabledwithDestroyedWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetReceiveDragEventEnabledwithDestroyedWindow ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowClass = await windowStage.createSubWindow('testSetReceiveDragEventEnabledwithDestroyedWindow')
      await windowClass.destroyWindow();
      await sleep(500);
      try {
        await windowClass.setReceiveDragEventEnabled(false);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1300002);
      }
      try {
        let res1 = windowClass.isReceiveDragEventEnabled();
        console.info(caseName + ' windowClass.isReceiveDragEventEnabled() res1: ' + JSON.stringify(res1));
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1300002);
        done()
      }
    });


    /**
     * @tc.name   testSetSeparationTouchEnabledwithDestroyedWindow
     * @tc.number SUB_WMS_SET_SEPARATION_TOUCH_ENABLED_0100
     * @tc.desc   验证setSeparationTouchEnabled接口和isSeparationTouchEnabled接口可以报1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSeparationTouchEnabledwithDestroyedWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetSeparationTouchEnabledwithDestroyedWindow ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowClass = await windowStage.createSubWindow('testSetSeparationTouchEnabledwithDestroyedWindow')
      await windowClass.destroyWindow();
      await sleep(500);
      try {
        await windowClass.setSeparationTouchEnabled(false);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1300002);
      }
      try {
        let res1 = windowClass.isSeparationTouchEnabled();
        console.info(caseName + ' windowClass.isReceiveDragEventEnabled() res1: ' + JSON.stringify(res1));
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1300002);
        done();
      }
    });


    /**
     * @tc.name   testSetSeparationTouchEnabledwithMainwindow
     * @tc.number SUB_WMS_SET_SEPARATION_TOUCH_ENABLED_0200
     * @tc.desc   验证主窗setSeparationTouchEnabled接口和isSeparationTouchEnabled接口可以配合使用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSeparationTouchEnabledwithMainwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSetSeparationTouchEnabledwithMainwindow ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowStageStart = await startAbility3(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      await windowClass.setUIContent('testability/pages/Index2');
      await windowClass.showWindow();
      await sleep(500);
      try {
        await windowClass.setSeparationTouchEnabled(false);
        let res1 = windowClass.isSeparationTouchEnabled();
        console.info(caseName + ' windowClass.isSeparationTouchEnabled() res1: ' + JSON.stringify(res1));
        expect(res1).assertEqual(false);
        await windowClass.setSeparationTouchEnabled(true);
        let res2 = windowClass.isSeparationTouchEnabled();
        console.info(caseName + ' windowClass.isSeparationTouchEnabled() res2 ' + JSON.stringify(res2));
        expect(res2).assertEqual(true);
        await terminateAbility3(caseName);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await terminateAbility3(caseName);
        if (!canIUseRes) {
          expect(e.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    });


    /**
     * @tc.name   testSetSeparationTouchEnabledwithSubwindow
     * @tc.number SUB_WMS_SET_SEPARATION_TOUCH_ENABLED_0300
     * @tc.desc   验证主窗setSeparationTouchEnabled接口和isSeparationTouchEnabled接口可以配合使用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSeparationTouchEnabledwithSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSetSeparationTouchEnabledwithSubwindow ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowClass = await windowStage.createSubWindow('testSetSeparationTouchEnabledwithSubwindow')
      await windowClass.setUIContent('testability/pages/Index2');
      await windowClass.showWindow();
      await sleep(500);
      try {
        await windowClass.setSeparationTouchEnabled(false);
        let res1 = windowClass.isSeparationTouchEnabled();
        console.info(caseName + ' windowClass.isSeparationTouchEnabled() res1: ' + JSON.stringify(res1));
        expect(res1).assertEqual(false);
        await windowClass.setSeparationTouchEnabled(true);
        let res2 = windowClass.isSeparationTouchEnabled();
        console.info(caseName + ' windowClass.isSeparationTouchEnabled() res2 ' + JSON.stringify(res2));
        expect(res2).assertEqual(true);
        await windowClass.destroyWindow()
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await windowClass.destroyWindow()
        if (!canIUseRes) {
          expect(e.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.name   testSetSeparationTouchEnabledwithDialogwindow
     * @tc.number SUB_WMS_SET_SEPARATION_TOUCH_ENABLED_0400
     * @tc.desc   验证系统窗setSeparationTouchEnabled接口和isSeparationTouchEnabled接口可以配合使用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSeparationTouchEnabledwithDialogwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSetSeparationTouchEnabledwithDialogwindow ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let config: window.Configuration = {
        name: "testSetSeparationTouchEnabledwithDialogwindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass = await window.createWindow(config);
      await windowClass.setUIContent('testability/pages/Index2');
      await windowClass.showWindow();
      await sleep(500);
      try {
        await windowClass.setSeparationTouchEnabled(false);
        let res1 = windowClass.isSeparationTouchEnabled();
        console.info(caseName + ' windowClass.isSeparationTouchEnabled() res1: ' + JSON.stringify(res1));
        expect(res1).assertEqual(false);
        await windowClass.setSeparationTouchEnabled(true);
        let res2 = windowClass.isSeparationTouchEnabled();
        console.info(caseName + ' windowClass.isSeparationTouchEnabled() res2 ' + JSON.stringify(res2));
        expect(res2).assertEqual(true);
        await windowClass.destroyWindow()
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await windowClass.destroyWindow()
        if (!canIUseRes) {
          expect(e.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    });
    /**
    * @tc.name testClearWindowMask_1300002
    * @tc.number testClearWindowMask_0100
    * @tc.desc testClearWindowMask_1300002
    * @tc.type FUNCTION
    * @tc.size MEDIUMTEST
    * @tc.level LEVEL3
    */
    it('testClearWindowMask_1300002', Level.LEVEL3, async (done: Function) => {
      let caseName = "testClearWindowMask_1300002";
      let subWindow = await windowStage.createSubWindow('testClearWindowMask_1300002');
      await subWindow.destroyWindow();
      try {
        let promise = subWindow.clearWindowMask();
        promise.then(() => {
          console.info(caseName + ' Succeeded in clearing the window mask.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(caseName + `Failed to clear the window mask. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message).assertEqual('This window state is abnormal.[window][clearWindowMask]msg:invalid window');
          done();
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   testClearWindowMask_1300004
     * @tc.number testClearWindowMask_0200
     * @tc.desc   testClearWindowMask_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearWindowMask_1300004', Level.LEVEL3, async (done: Function) => {
      let caseName = "testClearWindowMask_1300004";
      let mainWindow = windowStage.getMainWindowSync();
      try {
        let promise = mainWindow.clearWindowMask();
        promise.then(() => {
          console.info(caseName + ' Succeeded in clearing the window mask.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(caseName + ` Failed to clear the window mask. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
          expect(err.message).assertEqual('Unauthorized operation.[window][clearWindowMask]msg: invalid type');
          done();
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   testClearWindowMask_subWindow
     * @tc.number testClearWindowMask_0300
     * @tc.desc   testClearWindowMask_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearWindowMask_subWindow', Level.LEVEL3, async (done: Function) => {
      let caseName = "testClearWindowMask_subWindow";
      let subWindow = await windowStage.createSubWindow('testClearWindowMask_subWindow');
      await subWindow.setUIContent('testability/pages/Index1');
      await subWindow.showWindow();
      await sleep(300);
      let maskWidth = subWindow.getWindowProperties().windowRect.width;
      let maskHeight = subWindow.getWindowProperties().windowRect.height;
      let windowMask = Array < Array < number >> (maskHeight).fill([]).map((_, row) => {
        let array = Array < number > (maskWidth);
        for (let i = 0; i < maskWidth; i++) {
          array[i] = (i + row) > (maskWidth + maskHeight) / 2 ? 1 : 0;
        }
        return array;
      });
      try {
        let cornerRadius1 = subWindow.getWindowCornerRadius();
        console.info(caseName + ' Succeeded in getWindowCornerRadius.cornerRadius1:' + JSON.stringify(cornerRadius1));
        let promise = subWindow.setWindowMask(windowMask);
        promise.then(() => {
          console.info(caseName + ' Succeeded in setting the window mask.');
          promise = subWindow.clearWindowMask();
          promise.then(async () => {
            console.info(caseName + ' Succeeded in clearing the window mask.');
            let cornerRadius2 = subWindow.getWindowCornerRadius();
            console.info(caseName + ' Succeeded in getWindowCornerRadius.cornerRadius2:' + JSON.stringify(cornerRadius2));
            expect(cornerRadius2).assertEqual(cornerRadius1);
            await subWindow.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + ` Failed to clear the window mask. Cause code: ${err.code}, message: ${err.message}`);
            await subWindow.destroyWindow();
            if (err.code === 801) {
              expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][clearWindowMask]msg: clear mask failed')
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }).catch(async (err: BusinessError) => {
          console.error(caseName + ` Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code === 801) {
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setWindowMask]');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }

      }

    })
    /**
     * @tc.name   testClearWindowMask_subWindow_resizeWindow
     * @tc.number testClearWindowMask_0400
     * @tc.desc   testClearWindowMask_subWindow_resizeWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearWindowMask_subWindow_resizeWindow', Level.LEVEL3, async (done: Function) => {
      let caseName = "testClearWindowMask_subWindow_resizeWindow";
      let subWindow = await windowStage.createSubWindow('testClearWindowMask_subWindow');
      await subWindow.setUIContent('testability/pages/Index1');
      await subWindow.showWindow();
      await sleep(300);
      let maskWidth = subWindow.getWindowProperties().windowRect.width;
      let maskHeight = subWindow.getWindowProperties().windowRect.height;
      let windowMask = Array < Array < number >> (maskHeight).fill([]).map((_, row) => {
        let array = Array < number > (maskWidth);
        for (let i = 0; i < maskWidth; i++) {
          array[i] = (i + row) > (maskWidth + maskHeight) / 2 ? 1 : 0;
        }
        return array;
      });
      try {
        let minWidth = subWindow.getWindowLimits().minWidth;
        let minHeight = subWindow.getWindowLimits().minHeight;
        console.info(caseName + ' subWindow minWidth:' + minWidth + '，minHeight：' + minHeight);
        let promise = subWindow.setWindowMask(windowMask);
        promise.then(() => {
          console.info(caseName + ' Succeeded in setting the window mask.');
          promise = subWindow.clearWindowMask();
          promise.then(async () => {
            console.info(caseName + ' Succeeded in clearing the window mask.');
            await subWindow.resizeAsync(minWidth, minHeight);
            await sleep(500);
            let width = subWindow.getWindowProperties().windowRect.width;
            let height = subWindow.getWindowProperties().windowRect.height;
            console.info(caseName + ' subWindow width:' + width + ',height:' + height);
            expect(width).assertEqual(minWidth);
            expect(height).assertEqual(minHeight);
            await subWindow.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + ` Failed to clear the window mask. Cause code: ${err.code}, message: ${err.message}`);
            await subWindow.destroyWindow();
            if (err.code === 801) {
              expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][clearWindowMask]msg: clear mask failed')
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }).catch(async (err: BusinessError) => {
          console.error(caseName + ` Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code === 801) {
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setWindowMask]');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }

      }

    })
    /**
     * @tc.name   testClearWindowMask_subWindow_not_setWindowMask
     * @tc.number testClearWindowMask_0500
     * @tc.desc   testClearWindowMask_subWindow_not_setWindowMask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearWindowMask_subWindow_not_setWindowMask', Level.LEVEL3, async (done: Function) => {
      let caseName = "testClearWindowMask_subWindow_not_setWindowMask";
      let subWindow = await windowStage.createSubWindow('testClearWindowMask_subWindow_not_setWindowMask');
      await subWindow.setUIContent('testability/pages/Index1');
      await subWindow.showWindow();
      await sleep(300);

      try {
        let promise = subWindow.clearWindowMask();
        promise.then(async () => {
          console.info(caseName + ' Succeeded in clearing the window mask.');
          await subWindow.destroyWindow();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + ` Failed to clear the window mask. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code === 801) {
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][clearWindowMask]msg: clear mask failed')
            done();
          } else if (err.code === 1300002) {
            expect(err.message).assertEqual('This window state is abnormal.[window][clearWindowMask]msg: clear mask failed')
            done();
          }
          else {
            expect(false).assertTrue();
            done();
          }
        });

      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   testClearWindowMask_floatWindow
     * @tc.number testClearWindowMask_0600
     * @tc.desc   testClearWindowMask_floatWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearWindowMask_floatWindow', Level.LEVEL3, async (done: Function) => {
      let caseName = "testClearWindowMask_floatWindow";
      let subWindow: window.Window | null = null;
      let config: window.Configuration = {
        name: "testClearWindowMask_floatWindow",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      window.createWindow(config).then(async (data) => {
        console.info(caseName + ' createWindow Succeeded');
        subWindow = data;
        await subWindow.setUIContent('testability/pages/Index1');
        await subWindow.showWindow();
        await sleep(300);
        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        let windowMask = Array < Array < number >> (maskHeight).fill([]).map((_, row) => {
          let array = Array < number > (maskWidth);
          for (let i = 0; i < maskWidth; i++) {
            array[i] = (i + row) > (maskWidth + maskHeight) / 2 ? 1 : 0;
          }
          return array;
        });
        try {
          let cornerRadius1 = subWindow.getWindowCornerRadius();
          console.info(caseName + ' Succeeded in getWindowCornerRadius.cornerRadius1:' + JSON.stringify(cornerRadius1));
          let promise = subWindow!.setWindowMask(windowMask);
          promise.then(() => {
            console.info(caseName + ' Succeeded in setting the window mask.');
            promise = subWindow!.clearWindowMask();
            promise.then(async () => {
              console.info(caseName + ' Succeeded in clearing the window mask.');
              let cornerRadius2 = subWindow!.getWindowCornerRadius();
              console.info(caseName + ' Succeeded in getWindowCornerRadius.cornerRadius2:' + JSON.stringify(cornerRadius2));
              expect(cornerRadius2).assertEqual(cornerRadius1);
              await subWindow!.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(caseName + ` Failed to clear the window mask. Cause code: ${err.code}, message: ${err.message}`);
              await subWindow!.destroyWindow();
              if (err.code === 801) {
                expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][clearWindowMask]msg: clear mask failed')
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(caseName + ` Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
            await subWindow!.destroyWindow();
            if (err.code === 801) {
              expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setWindowMask]');
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
          await subWindow!.destroyWindow();
          if (err.code === 801) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }

        }
      }).catch(async (err: BusinessError) => {
        console.error(caseName + 'createWindow ' + 'caught, err: ' + JSON.stringify(err.code) + ',errMessage: ' + err.message);
        if (err.code === 1300002) {
          expect(err.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done()
        }
      })
    })
    /**
     * @tc.name   testClearWindowMask_floatWindow_resizeWindow
     * @tc.number testClearWindowMask_0700
     * @tc.desc   testClearWindowMask_floatWindow_resizeWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClearWindowMask_floatWindow_resizeWindow', Level.LEVEL3, async (done: Function) => {
      let caseName = "testClearWindowMask_floatWindow_resizeWindow";
      let subWindow: window.Window | null = null;
      let config: window.Configuration = {
        name: "testClearWindowMask_floatWindow_resizeWindow",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      window.createWindow(config).then(async (data) => {
        console.info(caseName + ' createWindow Succeeded');
        subWindow = data;
        await subWindow.setUIContent('testability/pages/Index1');
        await subWindow.showWindow();
        await sleep(300);
        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        let windowMask = Array < Array < number >> (maskHeight).fill([]).map((_, row) => {
          let array = Array < number > (maskWidth);
          for (let i = 0; i < maskWidth; i++) {
            array[i] = (i + row) > (maskWidth + maskHeight) / 2 ? 1 : 0;
          }
          return array;
        });
        try {
          let minWidth = subWindow.getWindowLimits().minWidth;
          let minHeight = subWindow.getWindowLimits().minHeight;
          console.info(caseName + ' subWindow minWidth:' + minWidth + '，minHeight：' + minHeight);
          let cornerRadius1 = subWindow.getWindowCornerRadius();
          console.info(caseName + ' Succeeded in getWindowCornerRadius.cornerRadius1:' + JSON.stringify(cornerRadius1));
          let promise = subWindow!.setWindowMask(windowMask);
          promise.then(() => {
            console.info(caseName + ' Succeeded in setting the window mask.');
            promise = subWindow!.clearWindowMask();
            promise.then(async () => {
              console.info(caseName + ' Succeeded in clearing the window mask.');
              await subWindow!.resizeAsync(minWidth, minHeight);
              await sleep(500);
              let width = subWindow!.getWindowProperties().windowRect.width;
              let height = subWindow!.getWindowProperties().windowRect.height;
              console.info(caseName + ' subWindow width:' + width + ',height:' + height);
              expect(width).assertEqual(minWidth);
              expect(height).assertEqual(minHeight);
              await subWindow!.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(caseName + ` Failed to clear the window mask. Cause code: ${err.code}, message: ${err.message}`);
              await subWindow!.destroyWindow();
              if (err.code === 801) {
                expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][clearWindowMask]msg: clear mask failed')
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(caseName + ` Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
            await subWindow!.destroyWindow();
            if (err.code === 801) {
              expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setWindowMask]');
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
          await subWindow!.destroyWindow();
          if (err.code === 801) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      }).catch(async (err: BusinessError) => {
        console.error(caseName + 'createWindow ' + 'caught, err: ' + JSON.stringify(err.code) + ',errMessage: ' + err.message);
        if (err.code === 1300002) {
          expect(err.message != null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done()
        }
      })



    })
    /**
     * @tc.name   testSetWindowMask_subWindow
     * @tc.number testSetWindowMask_0100
     * @tc.desc   testSetWindowMask_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMask_subWindow', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowMask_subWindow";
      let subWindow = await windowStage.createSubWindow('testSetWindowMask_subWindow');
      await subWindow.setUIContent('testability/pages/Index1');
      await subWindow.showWindow();
      await sleep(300);
      let windowMask = [];
      try {
        let promise = subWindow.setWindowMask(windowMask);
        promise.then(() => {
          console.info(caseName + ' Succeeded in setting the window mask.');
          expect(false).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + ` Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if (err.code === 801) {
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setWindowMask]');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        if (err.code ===401) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }

      }

    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_subWindow_normal_param
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_PARAM_0100
     * @tc.desc   验证子窗口上使用合法参数设置窗口掩码成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowMaskWithAlpha_subWindow_normal_param', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_subWindow_normal_param';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_subWindow_normal_param');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let windowLimits = subWindow.getWindowLimits();
        let minWidth = windowLimits.minWidth as number;
        let minHeight = windowLimits.minHeight as number;
        console.info(caseName + ' getWindowLimits: minWidth=' + minWidth + ', minHeight=' + minHeight);
        await subWindow.resize(minWidth, minHeight);
        console.info(caseName + ' resize success: ' + minWidth + ' x ' + minHeight);
        await sleep(500);

        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        for (let i = 0; i < maskHeight; i++) {
          for (let j = 0; j < maskWidth; j++) {
            windowMask[i * maskWidth + j] = (i + j) > (maskWidth + maskHeight) / 2 ? 255 : 0;
          }
        }
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_floatWindow_normal_param
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_PARAM_0200
     * @tc.desc   验证全局悬浮窗上使用合法参数设置窗口掩码成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaskWithAlpha_floatWindow_normal_param', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_floatWindow_normal_param';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let config: window.Configuration = {
        name: "testSetWindowMaskWithAlpha_floatWindow_normal_param",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };

      let subWindow: window.Window;
      subWindow = await window.createWindow(config);
      console.info(caseName + ' createWindow success');
      try {
        await subWindow.setUIContent('testability/pages/Index1');
        console.info(caseName + ' setUIContent success');
        await subWindow.showWindow();
        console.info(caseName + ' showWindow success');
        await sleep(300);

        let windowLimits = subWindow.getWindowLimits();
        let minWidth = windowLimits.minWidth as number;
        let minHeight = windowLimits.minHeight as number;
        console.info(caseName + ' getWindowLimits: minWidth=' + minWidth + ', minHeight=' + minHeight);
        await subWindow.resize(minWidth, minHeight);
        console.info(caseName + ' resize success: ' + minWidth + ' x ' + minHeight);
        await sleep(500);

        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        for (let i = 0; i < maskHeight; i++) {
          for (let j = 0; j < maskWidth; j++) {
            windowMask[i * maskWidth + j] = (i + j) > (maskWidth + maskHeight) / 2 ? 255 : 0;
          }
        }
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        if (subWindow) {
          await subWindow.destroyWindow();
          console.info(caseName + ' destroyWindow in catch');
        }
        if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_alpha_all_transparent
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_PARAM_0300
     * @tc.desc   验证所有像素alpha值为0时设置窗口掩码成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaskWithAlpha_alpha_all_transparent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_alpha_all_transparent';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_alpha_all_transparent');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let windowLimits = subWindow.getWindowLimits();
        let minWidth = windowLimits.minWidth as number;
        let minHeight = windowLimits.minHeight as number;
        console.info(caseName + ' getWindowLimits: minWidth=' + minWidth + ', minHeight=' + minHeight);
        await subWindow.resize(minWidth, minHeight);
        console.info(caseName + ' resize success: ' + minWidth + ' x ' + minHeight);
        await sleep(500);

        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        windowMask.fill(0);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_alpha_all_opaque
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_PARAM_0400
     * @tc.desc   验证所有像素alpha值为255时设置窗口掩码成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaskWithAlpha_alpha_all_opaque', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_alpha_all_opaque';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_alpha_all_opaque');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let windowLimits = subWindow.getWindowLimits();
        let minWidth = windowLimits.minWidth as number;
        let minHeight = windowLimits.minHeight as number;
        console.info(caseName + ' getWindowLimits: minWidth=' + minWidth + ', minHeight=' + minHeight);
        await subWindow.resize(minWidth, minHeight);
        console.info(caseName + ' resize success: ' + minWidth + ' x ' + minHeight);
        await sleep(500);

        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        windowMask.fill(255);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_alpha_mixed_values
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_PARAM_0500
     * @tc.desc   验证使用不同alpha值（0-255范围内的多种值）设置窗口掩码成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaskWithAlpha_alpha_mixed_values', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_alpha_mixed_values';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_alpha_mixed_values');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let windowLimits = subWindow.getWindowLimits();
        let minWidth = windowLimits.minWidth as number;
        let minHeight = windowLimits.minHeight as number;
        console.info(caseName + ' getWindowLimits: minWidth=' + minWidth + ', minHeight=' + minHeight);
        await subWindow.resize(minWidth, minHeight);
        console.info(caseName + ' resize success: ' + minWidth + ' x ' + minHeight);
        await sleep(500);

        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        let alphaValues = [0, 64, 128, 192, 255];
        for (let i = 0; i < windowMask.length; i++) {
          windowMask[i] = alphaValues[i % alphaValues.length];
        }

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_maskWidth_not_match
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_PARAM_0600
     * @tc.desc   验证maskWidth不等于窗口宽度时抛出错误码1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowMaskWithAlpha_maskWidth_not_match', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_maskWidth_not_match';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_maskWidth_not_match');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        windowMask.fill(128);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth + 10, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 1300016) {
          expect(err.code).assertEqual(1300016);
        } else if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_maskHeight_not_match
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_PARAM_0700
     * @tc.desc   验证maskHeight不等于窗口高度时抛出错误码1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowMaskWithAlpha_maskHeight_not_match', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_maskHeight_not_match';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_maskHeight_not_match');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        windowMask.fill(128);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight + 10);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 1300016) {
          expect(err.code).assertEqual(1300016);
        } else if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_array_length_not_match
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_PARAM_0800
     * @tc.desc   验证windowMask数组长度不等于maskWidth×maskHeight时抛出错误码1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowMaskWithAlpha_array_length_not_match', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_array_length_not_match';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_array_length_not_match');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight - 10);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        windowMask.fill(128);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 1300016) {
          expect(err.code).assertEqual(1300016);
        } else if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_mainWindow_1300004
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_ERROR_0100
     * @tc.desc   验证在主窗口上调用抛出错误码1300004（未授权操作）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowMaskWithAlpha_mainWindow_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_mainWindow_1300004';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      try {
        let maskWidth = windowClass.getWindowProperties().windowRect.width;
        let maskHeight = windowClass.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        windowMask.fill(128);

        await windowClass.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        if (err.code === 1300004) {
          expect(err.code).assertEqual(1300004);
        } else if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_destroyedWindow_1300002
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_ERROR_0200
     * @tc.desc   验证在已销毁的窗口上调用抛出错误码1300002（窗口状态异常）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetWindowMaskWithAlpha_destroyedWindow_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_destroyedWindow_1300002';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_destroyedWindow_1300002');
      console.info(caseName + ' createSubWindow success');
      let maskWidth = subWindow.getWindowProperties().windowRect.width;
      let maskHeight = subWindow.getWindowProperties().windowRect.height;
      console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);
      await subWindow.destroyWindow();
      console.info(caseName + ' destroyWindow success');
      await sleep(500);

      try {
        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        windowMask.fill(128);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        expect(err.code).assertEqual(1300002);
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_and_clearWindowMask
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_FUNCTION_0300
     * @tc.desc   验证setWindowMaskWithAlpha与clearWindowMask配合使用清除掩码成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowMaskWithAlpha_and_clearWindowMask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_and_clearWindowMask';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_and_clearWindowMask');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let windowLimits = subWindow.getWindowLimits();
        let minWidth = windowLimits.minWidth as number;
        let minHeight = windowLimits.minHeight as number;
        console.info(caseName + ' getWindowLimits: minWidth=' + minWidth + ', minHeight=' + minHeight);
        await subWindow.resize(minWidth, minHeight);
        console.info(caseName + ' resize success: ' + minWidth + ' x ' + minHeight);
        await sleep(500);

        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        for (let i = 0; i < maskHeight; i++) {
          for (let j = 0; j < maskWidth; j++) {
            windowMask[i * maskWidth + j] = (i + j) > (maskWidth + maskHeight) / 2 ? 255 : 0;
          }
        }

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');

        await subWindow.clearWindowMask();
        console.info(caseName + ' clearWindowMask success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   testSetWindowMaskWithAlpha_largeWindowSize
     * @tc.number SUB_WINDOW_SETEVENTMASKWITHALPHA_BOUNDARY_0200
     * @tc.desc   验证在大尺寸窗口时设置掩码成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaskWithAlpha_largeWindowSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowMaskWithAlpha_largeWindowSize';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));

      let subWindow = await windowStage.createSubWindow('testSetWindowMaskWithAlpha_largeWindowSize');
      console.info(caseName + ' createSubWindow success');
      await subWindow.setUIContent('testability/pages/Index1');
      console.info(caseName + ' setUIContent success');
      await subWindow.showWindow();
      console.info(caseName + ' showWindow success');
      await sleep(300);

      try {
        let displayInfo = display.getDefaultDisplaySync();
        let largeWidth = Math.floor(displayInfo.width * 0.8);
        let largeHeight = Math.floor(displayInfo.height * 0.6);
        console.info(caseName + ' largeWidth:' + largeWidth + ', largeHeight:' + largeHeight);

        await subWindow.resize(largeWidth, largeHeight);
        console.info(caseName + ' resize success: ' + largeWidth + ' x ' + largeHeight);
        await sleep(500);

        let maskWidth = subWindow.getWindowProperties().windowRect.width;
        let maskHeight = subWindow.getWindowProperties().windowRect.height;
        console.info(caseName + ' getWindowProperties: maskWidth=' + maskWidth + ', maskHeight=' + maskHeight);

        let windowMask = new Uint8Array(maskWidth * maskHeight);
        console.info(caseName + ' create Uint8Array windowMask success, length=' + windowMask.length);
        windowMask.fill(128);

        await subWindow.setWindowMaskWithAlpha(windowMask, maskWidth, maskHeight);
        console.info(caseName + ' setWindowMaskWithAlpha success');
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow success');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(caseName + ' failed. Caused: err.code ' + err.code + ' ,err.message: ' + err.message);
        await subWindow.destroyWindow();
        console.info(caseName + ' destroyWindow in catch');
        if (err.code === 801) {
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
          }
        } else {
          expect().assertFail();
        }
        done();
      }
    })


  })
}