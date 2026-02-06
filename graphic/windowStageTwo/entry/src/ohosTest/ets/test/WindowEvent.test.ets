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
import { describe, beforeAll,afterAll,it, expect , TestType, Size, Level} from '@ohos/hypium';
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
    let isPCStatus:string = '';
    let isAutoWindow:string = '';
    let isFreeWindowMode:boolean = false;
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
      isPCStatus = settings.getValueSync(context,'isStatusBarExist','',settings.domainName.USER_PROPERTY)
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.USER_PROPERTY);
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
        await subWindowClass.moveWindowTo(displayInfo.width/2, displayInfo.height/2);

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
        await driver.click(Math.round(windowProperties.windowRect.left as number+10), Math.round(windowProperties.windowRect.top as number+10));
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
        await subWindowClass.resize(windowLimits.minWidth as number+200, windowLimits.minHeight as number);
        await subWindowClass.moveWindowTo(200, 0);
        if(isFreeWindowMode){
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
        await driver.click(Math.round((windowProperties.windowRect.left as number+10)), (windowProperties.windowRect.top as number+10));
        await sleep(300);
        console.log(`${caseName} timer1: ${timer}`);
        expect(timer).assertEqual(0);
        // await driver.click(((windowLimits.minWidth as number+200)+10) , 0);
        await driver.click(((windowProperties.windowRect.left as number)-10) , 0);
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

  })
}