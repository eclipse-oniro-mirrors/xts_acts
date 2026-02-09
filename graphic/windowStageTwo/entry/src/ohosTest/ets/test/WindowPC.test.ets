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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import settings from '@ohos.settings';
import type Want from '@ohos.app.ability.Want';
import { StartOptions, bundleManager } from '@kit.AbilityKit';
import display from '@ohos.display';

let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartAbility'
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
  AppStorage.setOrCreate('startNum', startNum + 1)
  let windowStageStart = AppStorage.get('windowStageStart') as window.WindowStage;
  return windowStageStart
}

async function terminateAbilityCycle(caseName: string) {
  let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number
  console.log(`${caseName} startNum = ${startNum}`)
  while (startNum) {
    let pageContext = AppStorage.get('pageContext') as common.UIAbilityContext
    await pageContext.terminateSelf().then(() => {
      console.log(`${caseName} terminateSelf success`);
      // startNum -= 1
      startNum--;
    }).catch((err: BusinessError) => {
      console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
    });
    await sleep(1000)
  }
  AppStorage.delete('startNum')
}

async function terminateAbility(caseName: string) {
  let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number
  let pageContext = AppStorage.get('pageContext') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  AppStorage.setOrCreate('startNum', startNum - 1)
  await sleep(1000)
}

async function assertMaximizeComponentExist(windowState: number, windowClass?: window.Window) {
  let driver = Driver.create()
  if (windowState == 2 || windowState == 1) {
    await driver.mouseMoveTo({ x: 100, y: 0 })
  }
  let test = true
  await driver.assertComponentExist(ON.id('EnhanceMaximizeBtn')).then(() => {
    test = true
  }).catch((err: BusinessError) => {
    if (err.code == 17000003) {
      test = false
    }
  })
  return test
}
export default function windowPCTest() {
  describe('windowPCTest', async () => {
    let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    let mainWindowClass: window.Window;
    let isFreeWindowMode = false;
    let driver: Driver;
    beforeAll(() => {
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
      mainWindowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      driver = Driver.create();
    });
    beforeEach(() => {
    });
    afterEach(async () => {
      try {
        await terminateAbilityCycle('afterEach')
        await sleep(1000)
        // let mainWindowClass = windowStage.getMainWindowSync()
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
    });
    afterAll(() => {
      let windowClass = windowStage.getMainWindowSync()
      windowClass.setUIContent('testability/pages/Index')
    });

    /**
     * @tc.name   testSetWindowTitleMoveEnabled_0100
     * @tc.number testSetWindowTitleMoveEnabled_0100
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowTitleMoveEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0100';
      let windowClass = windowStage.getMainWindowSync();
      let driver = Driver.create()
      let windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      if (isFreeWindowMode == true) {
        await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
        await sleep(1000)
      }
      windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      try {
        windowClass.setWindowTitleMoveEnabled(false);
        console.info(`${message} setWindowTitleMoveEnabled`)
        await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
        await sleep(1000)
        let windowPointDragged = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
        expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
        await driver.doubleClick(windowPointDragged.left + 100, windowPointDragged.top + 50)
        await sleep(1000)
        let windowPointClicked = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoiisWindowRectAutoSaventClicked = ${JSON.stringify(windowPointDragged)}`)
        expect(JSON.stringify(windowPointClicked)).assertEqual(JSON.stringify(windowPoint));
        done();
      } catch (exception) {
        if (exception.code == 801) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          
          done();
        } else {
          console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
          done();
        }
      }



    })

    /**
     * @tc.name   testSetWindowTitleMoveEnabled_0200
     * @tc.number testSetWindowTitleMoveEnabled_0200
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleMoveEnabled_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0200';
      let windowClass = windowStage.getMainWindowSync();
      let driver = Driver.create()
      let windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      if (isFreeWindowMode == true) {
        await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
        await sleep(1000)
      }
      windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      try {
        windowClass.setWindowDecorVisible(false)
        windowClass.setWindowTitleMoveEnabled(false);
        console.info(`${message} setWindowTitleMoveEnabled`)
        await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
        await sleep(1000)
        let windowPointDragged = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
        expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
        await driver.doubleClick(windowPointDragged.left + 100, windowPointDragged.top + 50)
        let windowPointClicked = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
        expect(JSON.stringify(windowPointClicked)).assertEqual(JSON.stringify(windowPoint));
        windowClass.setWindowDecorVisible(true)
        done();
      } catch (exception) {
        if (exception.code == 801) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          
          done();
        } else {
          console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
          done();
        }
      }

    })

    /**
     * @tc.name   testSetWindowTitleMoveEnabled_0300
     * @tc.number testSetWindowTitleMoveEnabled_0300
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleMoveEnabled_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0300';
      let options: window.SubWindowOptions = {
        title: 'setWindowTitleMoveEnabledTest_0300',
        decorEnabled: true
      };
      windowStage.createSubWindowWithOptions('setWindowTitleMoveEnabledTest_0300', options).then(async (data) => {
        let windowClass = data
        windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
        windowClass.resize(1000, 1200)
        windowClass.showWindow()
        await sleep(1000)
        let driver = Driver.create()
        let windowPoint = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
        await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
        await sleep(1000)
        windowPoint = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
        try {
          windowClass.setWindowTitleMoveEnabled(false);
          console.info(`${message} setWindowTitleMoveEnabled`)
          await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
          await sleep(1000)
          let windowPointDragged = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
          expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
          await driver.doubleClick(windowPointDragged.left + 100, windowPointDragged.top + 50)
          let windowPointClicked = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
          expect(JSON.stringify(windowPointClicked)).assertEqual(JSON.stringify(windowPoint));
        } catch (exception) {
          if (exception.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            
            done();
          } else {
            console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail()
            done();
          }
        }
        windowClass.destroyWindow()
        done();
      }).catch((err: BusinessError) => {
        if (err.code == 801) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          expect(false).assertFalse();
        } else {
          console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertFalse();
        }
        done();
      })
    })

    /**
     * @tc.name   testSetWindowTitleMoveEnabled_0400
     * @tc.number testSetWindowTitleMoveEnabled_0400
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleMoveEnabled_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0400';
      let windowClass = windowStage.getMainWindowSync();
      let options: window.SubWindowOptions = {
        title: 'setWindowTitleMoveEnabledTest_0400',
        decorEnabled: true
      };
      try {
        windowClass.createSubWindowWithOptions('setWindowTitleMoveEnabledTest_0400', options).then(async (data) => {
          let windowClass = data
          windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          windowClass.showWindow()
          await sleep(1000)
          let driver = Driver.create()
          let windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200, windowPoint.top + 150)
          await sleep(1000)
          windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          try {
            windowClass.setWindowDecorVisible(false)
            windowClass.setWindowTitleMoveEnabled(false);
            console.info(`${message} setWindowTitleMoveEnabled`)
            await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200,
              windowPoint.top + 150)
            await sleep(1000)
            let windowPointDragged = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
            expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
            await driver.doubleClick(windowPointDragged.left + 100, windowPointDragged.top + 50)
            let windowPointClicked = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoiisWindowRectAutoSaventDragged = ${JSON.stringify(windowPointDragged)}`)
            expect(JSON.stringify(windowPointClicked)).assertEqual(JSON.stringify(windowPoint));
          } catch (exception) {
            if (exception.code == 801) {
              console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
              
              done();
            } else {
              console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail()
              done();
            }
          }
          windowClass.destroyWindow()
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
          } else {
            console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
          }
          done();
        })
      } catch (exception) {
        console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   testSetWindowTitleMoveEnabled_0500
     * @tc.number testSetWindowTitleMoveEnabled_0500
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleMoveEnabled_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0500';
      let windowClass = windowStage.getMainWindowSync();
      let options: window.SubWindowOptions = {
        title: 'setWindowTitleMoveEnabledTest_0500',
        decorEnabled: false
      };
      try {
        windowClass.createSubWindowWithOptions('setWindowTitleMoveEnabledTest_0500', options).then(async (data) => {
          let windowClass = data
          windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          windowClass.showWindow()
          await sleep(1000)
          let driver = Driver.create()
          let windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          try {
            windowClass.setWindowTitleMoveEnabled(true);
            console.info(`${message} setWindowTitleMoveEnabled`)
            await driver.drag(windowPoint.left + 100, windowPoint.top + 50, windowPoint.left + 200,
              windowPoint.top + 150)
            await sleep(1000)
            let windowPointDragged = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPointDragged = ${JSON.stringify(windowPointDragged)}`)
            expect(JSON.stringify(windowPointDragged)).assertEqual(JSON.stringify(windowPoint));
          } catch (exception) {
            if (exception.code == 801) {
              console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
              
              done();
            } else {
              console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail()
              done();
            }
          }
          windowClass.destroyWindow()
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
          } else {
            console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
          }
          done();
        })
      } catch (exception) {
        console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   test_createSubWindowWithOptions_windowRect_negativeLeftTop_minWidthHeight
     * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0100
     * @tc.desc   LeftTop为负整数，WidthHeight为最小值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_createSubWindowWithOptions_windowRect_negativeLeftTop_minWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_negativeLeftTop_minWidthHeight'
        let limit = context.windowStage.getMainWindowSync().getWindowLimits()
        let options: window.SubWindowOptions = {
          title: 'subwindow0',
          decorEnabled: false,
          windowRect: {
            left: -100,
            top: -100,
            width: Number(limit.minWidth),
            height: Number(limit.minHeight)
          }
        };
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          console.info('succeed in create the subwindow');
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          await sleep(10000);
          let windowRealRect = subWindowClass.getWindowProperties().windowRect
          console.info(`options.windowRect:${JSON.stringify(options.windowRect)},windowRealRect:${JSON.stringify(windowRealRect)}`)
          expect(options.windowRect?.left).assertEqual(windowRealRect.left);
          expect(options.windowRect?.top).assertEqual(windowRealRect.top);
          expect(options.windowRect?.width).assertEqual(windowRealRect.width);
          expect(options.windowRect?.height).assertEqual(windowRealRect.height);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801 || err.code == 401) {
            
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801 || err.code == 401) {
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
      ;
    });

    /**
     * @tc.name   test_createSubWindowWithOptions_windowRect_positiveLeftTop_maxWidthHeight
     * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0200
     * @tc.desc   LeftTop为正整数，WidthHeight为最大值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_createSubWindowWithOptions_windowRect_positiveLeftTop_maxWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_positiveLeftTop_maxWidthHeight';
        let limit = context.windowStage.getMainWindowSync().getWindowLimits();
        let Display = display.getDefaultDisplaySync();
        console.log('Display.width: ' + Display.width + ',Display.height: ' + Display.height);
        let options: window.SubWindowOptions = {
          title: 'subwindow0',
          decorEnabled: false,
          windowRect: {
            left: Display.width,
            top: Display.height,
            width: Number(limit.maxWidth),
            height: Number(limit.maxHeight)
          }
        };
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          console.info('succeed in create the subwindow');
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          await sleep(1000);
          let windowRealRect = subWindowClass.getWindowProperties().windowRect
          console.info(`options.windowRect:${JSON.stringify(options.windowRect)},windowRealRect:${JSON.stringify(windowRealRect)}`)
          expect(options.windowRect?.left).assertEqual(windowRealRect.left);
          expect(options.windowRect?.top).assertEqual(windowRealRect.top);
          expect(options.windowRect?.width).assertEqual(windowRealRect.width);
          expect(options.windowRect?.height).assertEqual(windowRealRect.height);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801) {
            
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
        
      }
      ;
    });

    /**
     * @tc.name   test_createSubWindowWithOptions_windowRect_801
     * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0300
     * @tc.desc   LeftTop为正整数，验证801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_createSubWindowWithOptions_windowRect_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_801'
        let options: window.SubWindowOptions = {
          title: 'subwindow0',
          decorEnabled: false,
          windowRect: {
            left: 100,
            top: 100,
            width: 300,
            height: 300
          }
        };
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          console.info('succeed in create the subwindow');
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          await sleep(1000);
          let windowRealRect = subWindowClass.getWindowProperties().windowRect
          console.info(`options.windowRect:${JSON.stringify(options.windowRect)},windowRealRect:${JSON.stringify(windowRealRect)}`)
          expect(options.windowRect?.left).assertEqual(windowRealRect.left);
          expect(options.windowRect?.top).assertEqual(windowRealRect.top);
          expect(options.windowRect?.width).assertEqual(windowRealRect.width);
          expect(options.windowRect?.height).assertEqual(windowRealRect.height);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801 || err.code == 1300002) {
            
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        expect().assertFail()
        done();
      }
      ;
    });

    /**
     * @tc.name   test_createSubWindowWithOptions_windowRect_floatLeftTop_floatWidthHeight
     * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0400
     * @tc.desc   LeftTop为浮点数，WidthHeight为浮点数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_createSubWindowWithOptions_windowRect_floatLeftTop_floatWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_floatLeftTop_floatWidthHeight';
        let limit = context.windowStage.getMainWindowSync().getWindowLimits();
        let options: window.SubWindowOptions = {
          title: 'title',
          decorEnabled: false,
          windowRect: {
            left: 3.14,
            top: 6.28,
            width: Number(limit.maxWidth) - 0.1,
            height: Number(limit.maxHeight) - 0.1
          }
        };
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          console.info('succeed in create the subwindow');
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          await sleep(1000);
          let windowRealRect = subWindowClass.getWindowProperties().windowRect
          console.info(`${message} options.windowRect:${JSON.stringify(options.windowRect)},windowRealRect:${JSON.stringify(windowRealRect)}`)
          expect(Math.floor(Number(options.windowRect?.left))).assertEqual(Number(windowRealRect.left));
          expect(Math.floor(Number(options.windowRect?.top))).assertEqual(Number(windowRealRect.top));
          expect(Math.floor(Number(options.windowRect?.width))).assertEqual(Number(windowRealRect.width));
          expect(Math.floor(Number(options.windowRect?.height))).assertEqual(Number(windowRealRect.height));
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801) {
            
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
      ;
    });

    /**
     * @tc.name   test_createSubWindowWithOptions_windowRect_0LeftTop_0WidthHeight
     * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0500
     * @tc.desc   LeftTop为0，WidthHeight为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_createSubWindowWithOptions_windowRect_0LeftTop_0WidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_0LeftTop_0WidthHeight';
        let limit = context.windowStage.getMainWindowSync().getWindowLimits();
        let options: window.SubWindowOptions = {
          title: 'title',
          decorEnabled: false,
          windowRect: {
            left: 0,
            top: 0,
            width: 0,
            height: 0
          }
        };
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          console.info('succeed in create the subwindow');
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          await sleep(1000);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801) {
            
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 401 || err.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
        
      }
      ;
    });

    /**
     * @tc.name   test_createSubWindowWithOptions_windowRect_maxAboveWidthHeight
     * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0600
     * @tc.desc   LeftTop为正整数，WidthHeight为最大值+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_createSubWindowWithOptions_windowRect_maxAboveWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_maxAboveWidthHeight';
        let limit = context.windowStage.getMainWindowSync().getWindowLimits();
        let options: window.SubWindowOptions = {
          title: 'title',
          decorEnabled: true,
          windowRect: {
            left: 314,
            top: 628,
            width: Number(limit.maxWidth) + 1,
            height: Number(limit.maxHeight) + 1
          }
        };
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          console.info('succeed in create the subwindow');
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          await sleep(1000);
          let windowRealRect = subWindowClass.getWindowProperties().windowRect
          console.info(`${message} options.windowRect:${JSON.stringify(options.windowRect)},windowRealRect:${JSON.stringify(windowRealRect)}`)
          expect(Number(options.windowRect?.left)).assertEqual(Number(windowRealRect.left));
          expect(Number(options.windowRect?.top)).assertEqual(Number(windowRealRect.top));
          expect(Number(options.windowRect?.width) - 1).assertEqual(Number(windowRealRect.width));
          expect(Number(options.windowRect?.height) - 1).assertEqual(Number(windowRealRect.height));
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801) {
            
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          
          console.error(`The device not support getWindowLimits`);
        } else {
          expect().assertFail();
        }
        done();
      }
      ;
    });

    /**
     * @tc.name   test_createSubWindowWithOptions_windowRect_followMinWidthHeight
     * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0700
     * @tc.desc   LeftTop为正整数，WidthHeight为最小值-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_createSubWindowWithOptions_windowRect_followMinWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_followMinWidthHeight';
        let subwindow0 = await windowStage.createSubWindow('subwindow0');
        await sleep(1000)
        let limit = subwindow0.getWindowLimits();
        await subwindow0.destroyWindow()
        let options: window.SubWindowOptions = {
          title: 'title',
          decorEnabled: false,
          windowRect: {
            left: 314,
            top: 628,
            width: Number(limit.minWidth) - 1,
            height: Number(limit.minHeight) - 1
          }
        };
        let promise = windowStage.createSubWindowWithOptions('subwindow1', options);
        await promise.then(async (data) => {
          console.info('succeed in create the subwindow');
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          await sleep(1000);
          let windowRealRect = subWindowClass.getWindowProperties().windowRect
          console.info(`${message} options.windowRect:${JSON.stringify(options.windowRect)},windowRealRect:${JSON.stringify(windowRealRect)}`)
          expect(Number(options.windowRect?.left)).assertEqual(Number(windowRealRect.left));
          expect(Number(options.windowRect?.top)).assertEqual(Number(windowRealRect.top));
          expect(Number(options.windowRect?.width) + 1).assertEqual(Number(windowRealRect.width));
          expect(Number(options.windowRect?.height) + 1).assertEqual(Number(windowRealRect.height));
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801) {
            
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          done();
        } else {
          expect().assertFail()
          done();
        }
        
      }
      ;
    });

    /**
     * @tc.name   test_createSubWindowWithOptions_windowRect_NaNLeftTopWidthHeight
     * @tc.number SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0800
     * @tc.desc   LeftTop为NaN，WidthHeight为NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_createSubWindowWithOptions_windowRect_NaNLeftTopWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_NaNLeftTopWidthHeight'
        let options: window.SubWindowOptions = {
          title: 'title',
          decorEnabled: false,
          windowRect: {
            left: NaN,
            top: NaN,
            width: NaN,
            height: NaN
          }
        };
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          console.info('succeed in create the subwindow');
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          await sleep(1000);
          expect().assertFail()
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801) {
            
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 401) {
          done();
        } else {
          expect().assertFail()
          done();
        }
        
      }
      ;
    });
    /**
     * @tc.name   testStartOptionsSupportWindowModes_0100
     * @tc.number testStartOptionsSupportWindowModes_0100
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartOptionsSupportWindowModes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0100';
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FULL_SCREEN,
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FULL_SCREEN
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 全屏
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 1`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
        //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
        // 判断是否存在最大化 - false
        let test = await assertMaximizeComponentExist(windowStatus)
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.name   testStartOptionsSupportWindowModes_0200
     * @tc.number testStartOptionsSupportWindowModes_0200
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartOptionsSupportWindowModes_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0200';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        windowClass?.moveWindowToAsync(mainWindowRect?.left, mainWindowRect?.top);
        await sleep(1000);
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test = await assertMaximizeComponentExist(windowStatus, windowClass);
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 200, 200)
        await sleep(1000)
        // 获取窗口状态 - 分屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        done();
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.name   testStartOptionsSupportWindowModes_0300
     * @tc.number testStartOptionsSupportWindowModes_0300
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartOptionsSupportWindowModes_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0300';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        windowClass?.moveWindowToAsync(mainWindowRect?.left, mainWindowRect?.top);
        await sleep(1000);
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test =
          await assertMaximizeComponentExist(windowStatus, windowClass)
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，可触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
        await sleep(1000)
        // 获取窗口状态 - 自由窗口
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.name   testStartOptionsSupportWindowModes_0400
     * @tc.number testStartOptionsSupportWindowModes_0400
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartOptionsSupportWindowModes_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0400';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FLOATING,
          bundleManager.SupportWindowMode.SPLIT
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        windowClass?.moveWindowToAsync(mainWindowRect?.left, mainWindowRect?.top);
        await sleep(1000);
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test =
          await assertMaximizeComponentExist(windowStatus, windowClass)
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 200, 200)
        await sleep(1000)
        // 获取窗口状态 - 自由窗口
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.name   testStartOptionsSupportWindowModes_0500
     * @tc.number testStartOptionsSupportWindowModes_0500
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartOptionsSupportWindowModes_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0500';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FLOATING,
          bundleManager.SupportWindowMode.FULL_SCREEN
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        windowClass?.moveWindowToAsync(mainWindowRect?.left, mainWindowRect?.top);
        await sleep(1000);
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - true
        let test =
          await assertMaximizeComponentExist(windowStatus, windowClass)
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect true`);
        expect(test).assertTrue()
        // 模拟用户移动窗口到左边缘，无法触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
        await sleep(1000)
        // 获取窗口状态 - 自由窗口
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.name   testStartOptionsSupportWindowModes_0600
     * @tc.number testStartOptionsSupportWindowModes_0600
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStartOptionsSupportWindowModes_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0600';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        windowClass?.moveWindowToAsync(mainWindowRect?.left, mainWindowRect?.top);
        await sleep(1000);
        // 获取窗口状态 - 全屏
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 1`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
        // 判断是否存在最大化 - true
        let test = await assertMaximizeComponentExist(windowStatus, windowClass)
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect true`);
        expect(!test).assertTrue();
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })


    /**
     * @tc.name   testStartOptionsSupportWindowModes_0700
     * @tc.number testStartOptionsSupportWindowModes_0700
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testStartOptionsSupportWindowModes_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0700';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        windowClass?.moveWindowToAsync(mainWindowRect?.left, mainWindowRect?.top);
        await sleep(1000);
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - true
        let test =
          await assertMaximizeComponentExist(windowStatus, windowClass)
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect true`);
        expect(test).assertTrue()
        // 点击最大化
        let maxButton = await driver.findComponent(ON.id('EnhanceMaximizeBtn'))
        await sleep(1000)
        await maxButton.click()
        await sleep(1000)
        // 获取窗口状态 - 全屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 1`);
        expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
        //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
        // 判断是否存在最大化 - true
        test =
          await assertMaximizeComponentExist(windowStatus, windowClass)
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect true`);
        expect(test).assertTrue()
        // 模拟用户移动窗口到左边缘，可触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 200, 200)
        await sleep(1000)
        // 获取窗口状态 - 分屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })
    /**
     * @tc.name   test_setSupportedWindowModes_threeElement
     * @tc.number SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0100
     * @tc.desc   传参三个元素
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setSupportedWindowModes_threeElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        const message = 'test_setSupportedWindowModes_threeElement'
        let windowStageStart = await startAbility(message, context)
        let promise = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN,
        bundleManager.SupportWindowMode.SPLIT, bundleManager.SupportWindowMode.FLOATING]);
        promise.then(() => {
          console.info('Succeed in setting window support modes');
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            
            done();
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect().assertFail();
        done();
      }
      ;
    });

    /**
     * @tc.name   test_setSupportedWindowModes_fourSameElement
     * @tc.number SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0200
     * @tc.desc   传参4个fullscreen，验证成功设置和801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setSupportedWindowModes_fourSameElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_setSupportedWindowModes_fourSameElement'
        let windowStageStart = await startAbility(message, context)
        let promise = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN,
        bundleManager.SupportWindowMode.FULL_SCREEN, bundleManager.SupportWindowMode.FULL_SCREEN,
        bundleManager.SupportWindowMode.FULL_SCREEN]);
        promise.then(() => {
          console.info('Succeed in setting window support modes');
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            
            done();
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect().assertFail();
        done();
      }
      ;
    });

    /**
     * @tc.name   test_setSupportedWindowModes_fiveElement
     * @tc.number SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0300
     * @tc.desc   传参列表5个元素，验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setSupportedWindowModes_fiveElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_setSupportedWindowModes_fiveElement'
        let windowStageStart = await startAbility(message, context)
        let promise = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN,
        bundleManager.SupportWindowMode.SPLIT, bundleManager.SupportWindowMode.FLOATING,
        bundleManager.SupportWindowMode.FLOATING, bundleManager.SupportWindowMode.FLOATING]);
        promise.then(() => {
          console.info('Succeed in setting window support modes');
          expect().assertFail()
          done()
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801 || err.code == 401) {
            console.error(`The device not support setSupportedWindowModes`);
            
            done();
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect().assertFail();
        done();
      }
      ;
    });

    /**
     * @tc.name   test_setSupportedWindowModes_nullElement
     * @tc.number SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0400
     * @tc.desc   传参[]，验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setSupportedWindowModes_nullElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_setSupportedWindowModes_nullElement'
        let windowStageStart = await startAbility(message, context)
        let promise = windowStageStart.setSupportedWindowModes([]);
        promise.then(() => {
          console.info('Succeed in setting window support modes');
          expect().assertFail()
          done()
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801 || err.code == 401) {
            console.error(`The device not support setSupportedWindowModes`);
            
            done();
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect().assertFail();
        done();
      }
      ;
    });

    /**
     * @tc.name   test_setSupportedWindowModes_onlySplit
     * @tc.number SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0500
     * @tc.desc   传参[split]，验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setSupportedWindowModes_onlySplit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_setSupportedWindowModes_onlySplit'
        let windowStageStart = await startAbility(message, context)
        let promise = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.SPLIT]);
        promise.then(() => {
          console.info('Succeed in setting window support modes');
          expect().assertFail()
          done()
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801 || err.code == 401) {
            console.error(`The device not support setSupportedWindowModes`);
            
            done();
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect().assertFail();
        done();
      }
      ;
    });

    /**
     * @tc.name   test_setSupportedWindowModes_afterTerminateAbility
     * @tc.number SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0600
     * @tc.desc   销毁ability, 验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setSupportedWindowModes_afterTerminateAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_setSupportedWindowModes_afterTerminateAbility'
        let windowStageStart = await startAbility(message, context)
        await terminateAbility(message);
        await sleep(1000);
        let promise = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.SPLIT]);
        promise.then(() => {
          console.info('Succeed in setting window support modes');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801 || err.code == 1300002) {
            console.error(`The device not support setSupportedWindowModes`);
            
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        if (err.code == 1300002) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      ;
    });

    /**
     * @tc.name   test_setSupportedWindowModes_modeChange_isImmersive
     * @tc.number SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0700
     * @tc.desc   [full_screen] ——> [float] ——> [full_screen],验证设置后mode和沉浸式改变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setSupportedWindowModes_modeChange_isImmersive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_setSupportedWindowModes_modeChange_isImmersive';
        let windowStageStart = await startAbility(message, context)
        let promise_primary = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN]);
        promise_primary.then(() => {
          console.info('Succeed in setting window support modes');
          let status_primary = windowStageStart.getMainWindowSync().getWindowStatus();
          console.info(`${message} status_primary:${status_primary}, window.WindowStatusType.FULL_SCREEN:${window.WindowStatusType.FULL_SCREEN}`);
          expect(status_primary).assertEqual(window.WindowStatusType.FULL_SCREEN)
          let isImmersive_primary = windowStageStart.getMainWindowSync().getImmersiveModeEnabledState();
          console.info(`${message} isImmersive_primary:${isImmersive_primary}`);
          if (isFreeWindowMode) {
            expect(isImmersive_primary).assertTrue();
          } else {
            expect(isImmersive_primary).assertEqual(false);
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} primary Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            
          } else {
            expect().assertFail();
          }
          done();
        });

        let promise_float = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FLOATING]);
        promise_float.then(() => {
          console.info('Succeed in setting window support modes');
          let status_float = windowStageStart.getMainWindowSync().getWindowStatus();
          console.info(`${message} status_float:${status_float}, window.WindowStatusType.FLOATING:${window.WindowStatusType.FLOATING}`);
          if (isFreeWindowMode) {
            expect(status_float).assertEqual(window.WindowStatusType.FLOATING);
          } else {
            expect(status_float).assertEqual(window.WindowStatusType.FULL_SCREEN);
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} float Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            
          } else {
            expect().assertFail();
          }
          done();
        });

        let promise_fullscreen =
          windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN]);
        promise_fullscreen.then(() => {
          console.info('Succeed in setting window support modes');
          
          let status_fullscreen = windowStageStart.getMainWindowSync().getWindowStatus();
          console.info(`${message} status_fullscreen:${status_fullscreen}, window.WindowStatusType.FULL_SCREEN:${window.WindowStatusType.FULL_SCREEN}`);
          expect(status_fullscreen).assertEqual(window.WindowStatusType.FULL_SCREEN);
          let isImmersive_fullscreen = windowStageStart.getMainWindowSync().getImmersiveModeEnabledState();
          console.info(`${message} isImmersive_fullscreen:${isImmersive_fullscreen}`);
          if (isFreeWindowMode) {
            expect(isImmersive_fullscreen).assertTrue();
            done()
          } else {
            expect(isImmersive_fullscreen).assertEqual(false);
            done()
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} fullscreen Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect().assertFail();
        done();
      }
      ;

    });


    /**
     * @tc.name   test_on_windowWillClose_resolve_true
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0100
     * @tc.desc   resolve为true,验证窗口不销毁
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_resolve_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_resolve_true'
      let result: boolean = false;
      const callback = () => {
        return new Promise < boolean > ((resolve, reject) => {
          result = true;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        if (isFreeWindowMode) {
          windowClassStart.on('windowWillClose', callback);
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          await button.click();
          await sleep(1000);
          windowClassStart.off('windowWillClose', callback);
          if (!result) {
            expect().assertFail();
          }
          ;
          try {
            const windowClassFind = window.findWindow(windowName)
            console.info(`The window ${windowClassFind} still exist`);
          } catch (err) {
            console.error(`The window does not exist`);
            expect().assertFail();
          }
        }
        done();
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          
          console.error(`The device not support on(windowWillClose)`);
        } else {
          expect().assertFail();
        }
        ;
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_resolve_false
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0200
     * @tc.desc   resolve为false,验证窗口销毁
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_resolve_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_resolve_false'
      let result: boolean = true;
      let windowName: string | undefined;
      const callback = () => {
        return new Promise < boolean > ((resolve, reject) => {
          result = false;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        if (isFreeWindowMode) {
          windowClassStart.on('windowWillClose', callback);
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          await button.click();
          await sleep(1000);
          let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
          AppStorage.setOrCreate('startNum', startNum - 1);
          if (result) {
            expect().assertFail();
          }
          ;
          try {
            const windowClassFind = window.findWindow(windowName);
            console.error(`The window ${windowClassFind} still exist`);
            windowClassFind.off('windowWillClose');
            expect().assertFail();
          } catch (err) {
            console.info(`The window does not exist`);
            expect(err.code).assertEqual(1300002);
          }
        }

        done();
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message}`);
        try {
          const windowClassFind = window.findWindow(windowName)
          console.error(`The window ${windowClassFind} still exist`);
          windowClassFind.off('windowWillClose');
        } catch (err) {
          console.info(`The window does not exist`);
        }
        if (err.code == 801) {
          
          console.error(`The device not support on(windowWillClose)`);
        } else {
          expect().assertFail();
        }
        ;
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_executeAfterOff
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0300
     * @tc.desc   回调执行过程中执行off，验证1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_executeAfterOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_executeAfterOff'
      let result: boolean = true;
      const callback = async () => {
        console.log(`${message} enter callback`)
        await sleep(3000);
        return new Promise < boolean > ((resolve, reject) => {
          console.log(`${message} callback return`)
          result = false;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        if (isFreeWindowMode) {
          windowClassStart.on('windowWillClose', callback);
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          await button.click();
          await sleep(1000);
          let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
          AppStorage.setOrCreate('startNum', startNum - 1);
          windowClassStart.off('windowWillClose', callback);
          console.log(`${message} succeed off listen`)
          expect().assertFail();
          done();
        } else {
          done();
        }

      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 1300002 || err.code == 801) {
          
          console.error(`The device not support on(windowWillClose)`);
        } else {
          expect().assertFail();
        }
        ;
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_offWithoutOn
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0400
     * @tc.desc   不注册，执行off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_offWithoutOn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_offWithoutOn'
      if (isFreeWindowMode == false) {
        
        done();
      } else {
        try {
          let windowStageStart = await startAbility(message, context);
          await sleep(10000);
          let windowClassFind = windowStageStart.getMainWindowSync();
          let windowName = windowClassFind.getUIContext().getWindowName();
          windowClassFind.off('windowWillClose');
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          await button.click();
          let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
          AppStorage.setOrCreate('startNum', startNum - 1);
          await sleep(1000);
          try {
            const windowClassFind = window.findWindow(windowName)
            console.error(`The window ${windowClassFind} still exist`);
            expect().assertFail();
          } catch (err) {
            console.info(`The window does not exist`);
            expect(err.code).assertEqual(1300002)
          }
          done();
        } catch (err) {
          console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
          if (err.code == 801) {
            
            console.error(`The device not support on(windowWillClose)`);
          } else {
            expect().assertFail();
          }
          ;
          done();
        }
        ;
      }

    });

    /**
     * @tc.name   test_on_windowWillClose_reject
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0500
     * @tc.desc   执行reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_reject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_reject';
      let windowName: string | undefined;
      const callback = () => {
        return new Promise < boolean > ((resolve, reject) => {
          reject();
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        if (isFreeWindowMode) {
          windowClassStart.on('windowWillClose', callback);
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          await button.click();
          await sleep(1000);
          let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
          AppStorage.setOrCreate('startNum', startNum - 1);
          try {
            const windowClassFind = window.findWindow(windowName);
            console.error(`The window ${windowClassFind} still exist`);
            windowClassFind.off('windowWillClose');
            expect().assertFail();
          } catch (err) {
            console.info(`The window does not exist`);
            expect(err.code).assertEqual(1300002)
          }
        }

        done();
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        try {
          const windowClassFind = window.findWindow(windowName)
          console.error(`The window ${windowClassFind} still exist`);
          windowClassFind.off('windowWillClose');
        } catch (err) {
          console.info(`The window does not exist`);
        }
        if (err.code == 801) {
          
          console.error(`The device not support on(windowWillClose)`);
        } else {
          expect().assertFail();
        }
        ;
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_multiOn_UniqueOff
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0600
     * @tc.desc   注册多个，取消一个
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_multiOn_UniqueOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_multiOn_UniqueOff';
      let windowName: string | undefined;
      let result: boolean = true;
      const callback1 = () => {
        return new Promise < boolean > ((resolve, reject) => {
          result = false;
          resolve(result);
        })
      }
      const callback2 = () => {
        return new Promise < boolean > ((resolve, reject) => {
          let result: boolean = true;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync()
        let windowName = windowClassStart.getUIContext().getWindowName();
        if (isFreeWindowMode) {
          windowClassStart.on('windowWillClose', callback1);
          windowClassStart.on('windowWillClose', callback2);
          windowClassStart.off('windowWillClose', callback2);
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          await button.click();
          await sleep(1000);
          let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
          AppStorage.setOrCreate('startNum', startNum - 1);
          if (result) {
            expect().assertFail();
          }
          ;
          try {
            const windowClassFind = window.findWindow(windowName);
            console.error(`The window ${windowClassFind} still exist`);
            windowClassFind.off('windowWillClose');
            expect().assertFail();
          } catch (err) {
            console.info(`The window does not exist`);
            expect(err.code).assertEqual(1300002);
          }
        }

        done();
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        try {
          const windowClassFind = window.findWindow(windowName)
          console.error(`The window ${windowClassFind} still exist`);
          windowClassFind.off('windowWillClose');
        } catch (err) {
          console.info(`The window does not exist`);
        }
        if (err.code == 801) {
          
          console.error(`The device not support on(windowWillClose)`);
        } else {
          expect().assertFail();
        }
        ;
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_multiOn_AllOff
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0700
     * @tc.desc   注册多个，off所有
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_multiOn_AllOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_multiOn_AllOff';
      let windowName: string | undefined;
      let result: boolean = false;
      const callback1 = () => {
        return new Promise < boolean > ((resolve, reject) => {
          result = false;
          resolve(result);
        })
      }
      const callback2 = () => {
        return new Promise < boolean > ((resolve, reject) => {
          result = true;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        if (isFreeWindowMode) {
          windowClassStart.on('windowWillClose', callback1);
          windowClassStart.on('windowWillClose', callback2);
          windowClassStart.off('windowWillClose');
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          await button.click();
          await sleep(1000);
          let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
          AppStorage.setOrCreate('startNum', startNum - 1);
          if (result) {
            expect().assertFail();
          }
          ;
          try {
            const windowClassFind = window.findWindow(windowName)
            console.error(`The window ${windowClassFind} still exist`);
            windowClassFind.off('windowWillClose');
            expect().assertFail();
          } catch (err) {
            console.info(`The window does not exist`);
            expect(err.code).assertEqual(1300002);
          }
        }

        done();
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        try {
          const windowClassFind = window.findWindow(windowName)
          console.error(`The window ${windowClassFind} still exist`);
          windowClassFind.off('windowWillClose');
        } catch (err) {
          console.info(`The window does not exist`);
        }
        if (err.code == 801) {
          
          console.error(`The device not support on(windowWillClose)`);
        } else {
          expect().assertFail();
        }
        ;
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_subWindow_result_false
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0800
     * @tc.desc   子窗result为false,验证窗口销毁
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_subWindow_result_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_subWindow_result_false'
      let result: boolean = true;
      const callback = () => {
        console.log(`${message} callback come in... `);
        return new Promise < boolean > ((resolve, reject) => {
          result = false;
          resolve(result);
        })
      };
      let options: window.SubWindowOptions = {
        title: 'subwindow0',
        decorEnabled: true,
      };

      try {
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        // let promise = windowStage.createSubWindow('subwindow0');
        promise.then(async (data) => {
          console.log(`${message} subwindow0 create `);
          const subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          subWindowClass.moveWindowToAsync(0, 100);
          await subWindowClass.showWindow();
          await sleep(1000);
          if (isFreeWindowMode) {
            subWindowClass.on('windowWillClose', callback);
            let button = await driver.findComponent(ON.id('EnhanceCloseBtn'))
            await button.click()
            await sleep(1000);
            try {
              window.findWindow('subwindow0');
              console.info(`${message} subwindow0 is existing`);
              subWindowClass.off('windowWillClose');
              expect().assertFail();
            } catch (exception) {
              console.info(`${message} subwindow0 is not existing`);
            }
            expect(result).assertFalse();
          }

          done();
        }).catch(async (err: BusinessError) => {
          console.error(`${message} Failed to create subwindow, Cause code ${err.code}, message ${err.message} `);
          try {
            const windowClassFind = window.findWindow('subwindow0')
            console.error(`${message} The window ${windowClassFind} still exist`);
            windowClassFind.off('windowWillClose');
          } catch (err) {
            console.info(`${message} The window does not exist`);
          }
          if (err.code == 801 || err.code == 1300002) {
            
            console.error(`${message} The device not support on(windowWillClose)`);
          } else {
            expect().assertFail();
          }
          ;
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        expect().assertFail();
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_subWindow_result_true
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0900
     * @tc.desc   子窗result为true,验证窗口不销毁
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_subWindow_result_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_subWindow_result_true'
      let result: boolean = false;
      const callback = () => {
        return new Promise < boolean > ((resolve, reject) => {
          result = true;
          resolve(result);
        })
      };
      let options: window.SubWindowOptions = {
        title: 'subwindow0',
        decorEnabled: true,
      };
      try {
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          const subWindowClass = data;
          subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          subWindowClass.moveWindowToAsync(0, 200);
          subWindowClass.showWindow();
          await sleep(1000);
          if (isFreeWindowMode) {
            subWindowClass.on('windowWillClose', callback);
            let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
            await button.click();
            await sleep(1000);
            subWindowClass.off('windowWillClose', callback);
            try {
              window.findWindow('subwindow0');
              console.info(`subwindow0 is existing`);
              subWindowClass.off('windowWillClose', callback);
            } catch (exception) {
              console.info(`subwindow0 is not existing`);
              expect().assertFail();
            }
            expect(result).assertTrue();
          }
          done();
        }).catch(async (err: BusinessError) => {
          console.error(`${message} Failed to create subwindow, Cause code ${err.code}, message ${err.message}`);
          try {
            const windowClassFind = window.findWindow('subwindow0')
            console.error(`The window ${windowClassFind} still exist`);
            windowClassFind.off('windowWillClose');
          } catch (err) {
            console.info(`The window does not exist`);
          }
          if (err.code == 801 || err.code == 1300002) {
            
            console.error(`The device not support on(windowWillClose)`);
          } else {
            expect().assertFail();
          }
          ;
          done();
        })
      } catch (err) {
        console.error(`Failed to register callback, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_subWindow_reject
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_1000
     * @tc.desc   子窗reject,验证窗口销毁
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_subWindow_reject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_subWindow_reject'
      const callback = () => {
        return new Promise < boolean > ((resolve, reject) => {
          reject();
        })
      };
      let options: window.SubWindowOptions = {
        title: 'subwindow0',
        decorEnabled: true,
      };
      try {
        let promise = windowStage.createSubWindowWithOptions('subwindow0', options);
        await promise.then(async (data) => {
          const subWindowClass = data;
          subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          subWindowClass.moveWindowToAsync(0, 200);
          subWindowClass.showWindow();
          await sleep(1000);
          if (isFreeWindowMode) {
            subWindowClass.on('windowWillClose', callback);
            let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
            await button.click();
            await sleep(1000);
            try {
              window.findWindow('subwindow0');
              console.info(`subwindow0 is existing`);
              subWindowClass.off('windowWillClose');
              expect().assertFail();
            } catch (exception) {
              console.info(`subwindow0 is not existing`);
              
            };
          }
          done();
        }).catch(async (err: BusinessError) => {
          console.error(`${message} Failed to create subwindow, Cause code ${err.code}, message ${err.message} `);
          try {
            const windowClassFind = window.findWindow('subwindow0')
            console.error(`The window ${windowClassFind} still exist`);
            windowClassFind.off('windowWillClose');
          } catch (err) {
            console.info(`The window does not exist`);
          }
          if (err.code == 801 || err.code == 1300002) {
            
            console.error(`The device not support on(windowWillClose)`);
          } else {
            expect().assertFail();
          }
          ;
          done();
        })
      } catch (err) {
        console.error(`Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        expect().assertFail();
        done();
      }
      ;
    });

    /**
     * @tc.name   test_on_windowWillClose_minimize_maximize_recover_beforeOff
     * @tc.number SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_1100
     * @tc.desc   销毁前最大化、最小化、还原
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_windowWillClose_minimize_maximize_recover_beforeOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_minimize_maximize_recover_beforeOff'
      let windowName: string | undefined;
      let result: boolean = true;
      const callback = () => {
        return new Promise < boolean > (async (resolve, reject) => {
          await sleep(3000);
          result = false;
          console.info(`${message} start resolve`);
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        if (isFreeWindowMode) {
          windowClassStart.on('windowWillClose', callback);
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
          await button.click();
          let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
          AppStorage.setOrCreate('startNum', startNum - 1);
          let promise1 = windowClassStart.minimize();
          await promise1.then(() => {
            console.info(`${message} succeed minimize window`);
            
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to minimize window, Cause code ${err.code}, message ${err.message} `);
            expect().assertFail();
            done();
          });
          let promise2 = windowClassStart.maximize();
          await promise2.then(() => {
            console.info(`${message} succeed maximize window`);
            
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to maximize window, Cause code ${err.code}, message ${err.message} `);
            expect().assertFail();
            done();
          });
          let promise3 = windowClassStart.recover();
          await promise3.then(() => {
            console.info(`${message} succeed recover window`);
            
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to recover window, Cause code ${err.code}, message ${err.message} `);
            expect().assertFail();
            done();
          });
          await sleep(4000);
          console.info(`${message} result: ${result}`)
          if (result) {
            expect().assertFail();
          }
          ;
          try {
            const windowClassFind = window.findWindow(windowName)
            console.error(`${message} The window ${windowClassFind} still exist`);
            windowClassFind.off('windowWillClose', callback);
            expect().assertFail();
          } catch (err) {
            console.info(`${message} The window does not exist, Cause code ${err.code}, message ${err.message}`);
            expect(err.code).assertEqual(1300002)
          }
        }

        done();
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        try {
          const windowClassFind = window.findWindow(windowName)
          console.error(`${message} The window ${windowClassFind} still exist`);
          windowClassFind.off('windowWillClose');
        } catch (err) {
          console.info(`${message} The window does not exist`);
        }
        if (err.code == 801) {
          
          console.error(`${message} The device not support on(windowWillClose)`);
        } else {
          expect().assertFail();
        }
        ;
        done();
      }
      ;
    });

    /**
     * @tc.name   test_MoveConfiguration
     * @tc.number SUB_BASIC_WMS_MOVE_CONFIGURATION_0100
     * @tc.desc   验证moveWindowToAsync参数MoveConfiguration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_MoveConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isFreeWindowMode == false) {
        
        done();
      } else {
        const message = 'test_MoveConfiguration!'
        try {
          let windowStageStart = await startAbility(message, context);
          let windowClassStart = windowStageStart.getMainWindowSync();
          let displayId = windowClassStart.getWindowProperties().displayId
          let moveConfiguration: window.MoveConfiguration = {
            displayId: displayId
          }
          let promise = windowClassStart.moveWindowToAsync(300, 300, moveConfiguration);
          promise.then(() => {
            console.info(`${message} succeed in moveWindowToAsync`);
          }).catch(async (err: BusinessError) => {
            console.error(`${message} promise Failed to moveWindowToAsync, Cause code ${err.code}, message ${err.message} `);
            expect(err.code).assertEqual(801);
            done();
          })
          await sleep(1000)
          let rect = windowClassStart.getWindowProperties().windowRect;
          console.info(`${message} windowRect:${JSON.stringify(rect)}`);
          expect(rect.left).assertEqual(300);
          expect(rect.top).assertEqual(300);
          done();
        } catch (err) {
          console.log(`${message} Failed to test MoveConfiguration.errcode:${err.code}, Cause: ${err.message}`)
          expect(err.code).assertEqual(801);
          done();
        }
      }

    });

    /**
     * @tc.name   test_on_subWindowClose
     * @tc.number SUB_BASIC_WMS_ON_SUB_WINDOW_CLOSE_0100
     * @tc.desc   验证test_on_subWindowClose，result为false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_on_subWindowClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (isFreeWindowMode == false) {
        
        done();
      } else {
        const message = 'test_on_subWindowClose!'
        let result: boolean = true;
        let windowStageStart = await startAbility(message, context);
        let options: window.SubWindowOptions = {
          title: 'subwindow0',
          decorEnabled: true,
        };
        const callback = () => {
          result = false;
          return result
        }
        try {
          let promise = windowStageStart.createSubWindowWithOptions('subwindow0', options);
          promise.then(async (data) => {
            const subWindowClass = data;
            subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
            subWindowClass.moveWindowToAsync(0, 200);
            subWindowClass.showWindow();
            await sleep(1000);
            subWindowClass.on("subWindowClose", callback);
            let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
            await button.click();
            await sleep(1000);
            if (result) {
              expect().assertFail();
              done();
            }
            try {
              window.findWindow('subwindow0')
              console.error(`subwindow0 is existing`);
              subWindowClass.off('subWindowClose', callback);
              expect().assertFail();
            } catch (exception) {
              console.info(`subwindow0 is not existing`);
              
            }
            ;
            done();
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to create subwindow, Cause code ${err.code}, message ${err.message}`);
            try {
              const windowClassFind = window.findWindow('subwindow0')
              console.error(`The window ${windowClassFind} still exist`);
              windowClassFind.off('subWindowClose', callback);
            } catch (err) {
              console.info(`The window does not exist`);
            }
            expect().assertFail();
            ;
            done();
          })
        } catch (err) {
          console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_off_subWindowClose
     * @tc.number SUB_BASIC_WMS_ON_SUB_WINDOW_CLOSE_0200
     * @tc.desc   验证test_off_subWindowClose，result为true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_off_subWindowClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (isFreeWindowMode == false) {
        
        done();
      } else {
        const message = 'test_off_subWindowClose!'
        let result: boolean = false;
        let windowStageStart = await startAbility(message, context);
        let options: window.SubWindowOptions = {
          title: 'subwindow0',
          decorEnabled: true,
        };
        const callback = () => {
          result = true;
          return result
        }
        try {
          let promise = windowStageStart.createSubWindowWithOptions('subwindow0', options);
          promise.then(async (data) => {
            const subWindowClass = data;
            subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
            subWindowClass.moveWindowToAsync(0, 200);
            subWindowClass.showWindow();
            await sleep(1000);
            subWindowClass.on("subWindowClose", callback);
            let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
            await button.click();
            await sleep(1000);
            if (!result) {
              expect().assertFail();
              done();
            }
            try {
              window.findWindow('subwindow0');
              console.info(`subwindow0 is still existing`);
              subWindowClass.off('windowWillClose');
              
            } catch (exception) {
              console.error(`subwindow0 is not existing`);
              expect().assertFail();
            }
            ;
            done();
          }).catch((err: BusinessError) => {
            console.error(`${message} Failed to create subwindow, Cause code ${err.code}, message ${err.message}`);
            try {
              const windowClassFind = window.findWindow('subwindow0')
              console.info(`The window ${windowClassFind} still exist`);
              windowClassFind.off('subWindowClose');
            } catch (err) {
              console.info(`The window does not exist`);
            }
            expect().assertFail();
            ;
            done();
          })
        } catch (err) {
          console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message}`);
          expect().assertFail();
          done();
        }
      }
    });


    /**
     * @tc.name   testgetParentWindow
     * @tc.number SUB_BASIC_WMS_getParentWindow_0300
     * @tc.desc   testgetParentWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetParentWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = "testgetParentWindow";
      let msgStr = 'jsunittest ' + message + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(message, context);
      let mainWindow = windowStageStart.getMainWindowSync();
      let windowId = mainWindow.getWindowProperties().id;
      console.info(msgStr + 'windowId :' + windowId)
      try {
        let windowClass = await windowStage.createSubWindow('testgetParentWindow');
        windowClass.setParentWindow(windowId).then(async () => {
          console.info(msgStr + 'Succeeded in  setParentWindow window.')
          let parentClass = windowClass.getParentWindow();
          let parentId = parentClass.getWindowProperties().id;
          console.info(msgStr + 'parentId :' + parentId)
          expect(parentId).assertEqual(windowId);
          await windowClass.destroyWindow();
          await terminateAbility(message)
          done()
        }).catch(async (e: BusinessError) => {
          console.error(msgStr + `Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);
          await terminateAbility(message)
          if (e.code == 801) {
            done();
          } else {
            expect(false).assertFail();
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await terminateAbility(message)
        expect(false).assertFail();
        done();
      }

    })

    /**
     * @tc.name   testOnWindowWillClose401
     * @tc.number SUB_BASIC_WMS_OnWindowWillClose_401_0100
     * @tc.desc   testOnWindowWillClose401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowWillClose401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowWillClose401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      const callback = () => {
        return new Promise < boolean > ((resolve, reject) => {
          // 是否关闭该窗口
          let result: boolean = true;
          resolve(result);
        });
      }
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.on(null, callback);
        console.log(msgStr + 'Succeeded on windowWillClose ');
        expect(false).assertFail();
        done()
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }

    })
    /**
     * @tc.name   testOffWindowWillClose401
     * @tc.number SUB_BASIC_WMS_OnWindowWillClose_401_0200
     * @tc.desc   testOffWindowWillClose401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowWillClose401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowWillClose401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      const callback = () => {
        return new Promise < boolean > ((resolve, reject) => {
          // 是否关闭该窗口
          let result: boolean = true;
          resolve(result);
        });
      }
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.off(null, callback);
        console.log(msgStr + 'Succeeded off windowWillClose ');
        expect(false).assertFail();
        done()
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }

    })
    /**
     * @tc.name   testonWindowWillClose1300004
     * @tc.number SUB_BASIC_WMS_OnWindowWillClose_1300004_0300
     * @tc.desc   testonWindowWillClose1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testonWindowWillClose1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testonWindowWillClose1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "test",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass = await window.createWindow(config);
      const callback = () => {
        return new Promise < boolean > ((resolve, reject) => {
          // 是否关闭该窗口
          let result: boolean = true;
          resolve(result);
        });
      }
      try {
        windowClass.on('windowWillClose', callback);
        console.log(msgStr + 'Succeeded on windowWillClose ');
        expect(false).assertFail();
        done()
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await windowClass.destroyWindow();
        if (e.code == 801) {
          done();
        } else {
          expect(e.code).assertEqual(1300004);
          done()
        }
      }

    })

    /**
     * @tc.name   testOnwindowStatusDidChange_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_0100
     * @tc.desc   testOnwindowStatusDidChange_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnwindowStatusDidChange_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testOnwindowStatusDidChange_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = await windowStage.createSubWindow('testOnwindowStatusDidChange_1300002');
        await windowClass.destroyWindow();
        await sleep(500);
        const callback = (data: window.WindowStatusType) => {
          console.log(`${msgStr} callback data: ${JSON.stringify(data)}`);
        }
        windowClass.on('windowStatusDidChange', callback);
        console.log(msgStr + 'Succeeded on windowStatusDidChange ');
        done()
      } catch (err) {
        console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300002);
          done()
        }
      }
    })

    /**
     * @tc.name   testOffwindowStatusDidChange_1300002
     * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_0200
     * @tc.desc   testOffwindowStatusDidChange_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOffwindowStatusDidChange_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testOffwindowStatusDidChange_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = await windowStage.createSubWindow('testOffwindowStatusDidChange_1300002');
      try {
        const callback = (data: window.WindowStatusType) => {
          console.log(`${msgStr} callback data: ${JSON.stringify(data)}`);
        }
        windowClass.on('windowStatusDidChange', callback);
        await windowClass.destroyWindow();
        windowClass.off('windowStatusDidChange', callback);
        console.log(msgStr + 'Succeeded on windowStatusDidChange ');
        done()
      } catch (err) {
        console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300002);
          done()
        }
      }
    })

    /**
     * @tc.name   testOnwindowStatusDidChange_recover
     * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_0300
     * @tc.desc   testOnwindowStatusDidChange_recover
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnwindowStatusDidChange_recover', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testOnwindowStatusDidChange_recover";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      if (isFreeWindowMode == false) {
        
        done();
      } else {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowStatusType = windowClass.getWindowStatus();
          console.info(caseName + ' windowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));
          if (windowStatusType == window.WindowStatusType.MAXIMIZE) {
            await windowClass.recover();
            await sleep(200);
          }
          let windowRect = windowClass.getWindowProperties().windowRect;
          console.log(`${msgStr} windowRect: ${JSON.stringify(windowRect)}`);
          await windowClass.maximize();
          await sleep(200);
          const callback = (data: window.WindowStatusType) => {
            console.log(`${msgStr} callback data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(window.WindowStatusType.FLOATING);
            let windowRect2 = windowClass.getWindowProperties().windowRect;
            console.log(`${msgStr} windowRect2: ${JSON.stringify(windowRect2)}`);
            expect(Math.abs(windowRect.left - windowRect2.left)).assertLessOrEqual(1);
            expect(Math.abs(windowRect.top - windowRect2.top)).assertLessOrEqual(1);
            expect(Math.abs(windowRect.width - windowRect2.width)).assertLessOrEqual(1);
            expect(Math.abs(windowRect.height - windowRect2.height)).assertLessOrEqual(1);
            windowClass.off('windowStatusDidChange', callback);
            done()
          }
          windowClass.on('windowStatusDidChange', callback);
          console.log(msgStr + 'Succeeded on windowStatusDidChange ');
          await windowClass.recover();
          await sleep(200);
        } catch (err) {
          console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        }
      }
    })

    /**
     * @tc.name   testOnwindowStatusDidChange_maxmize
     * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_0400
     * @tc.desc   testOnwindowStatusDidChange_maxmize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnwindowStatusDidChange_maxmize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testOnwindowStatusDidChange_maxmize";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      if (isFreeWindowMode == false) {
        
        done();
      } else {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowStatusType = windowClass.getWindowStatus();
          console.info(caseName + ' windowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));
          if (windowStatusType == window.WindowStatusType.MAXIMIZE) {
            await windowClass.recover();
            await sleep(200);
          }
          let windowRect = windowClass.getWindowProperties().windowRect;
          console.log(`${msgStr} windowRect: ${JSON.stringify(windowRect)}`);
          const callback = async (data: window.WindowStatusType) => {
            console.log(`${msgStr} callback data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(window.WindowStatusType.FULL_SCREEN);
            let windowRect2 = windowClass.getWindowProperties().windowRect;
            console.log(`${msgStr} windowRect2: ${JSON.stringify(windowRect2)}`);
            expect(windowRect2.width - windowRect.width).assertLarger(0);
            expect(windowRect2.height - windowRect.height).assertLarger(0);
            windowClass.off('windowStatusDidChange', callback);
            await windowClass.recover();
            await sleep(200);
            done()
          }
          windowClass.on('windowStatusDidChange', callback);
          console.log(msgStr + 'Succeeded on windowStatusDidChange ');
          await windowClass.maximize();
          await sleep(200)
        } catch (err) {
          console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        }
      }
    })

    /**
     * @tc.name   testOnwindowStatusDidChange_maxmize_EXIT_IMMERSIVE
     * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_0500
     * @tc.desc   testOnwindowStatusDidChange_maxmize_EXIT_IMMERSIVE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnwindowStatusDidChange_maxmize_EXIT_IMMERSIVE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testOnwindowStatusDidChange_maxmize_EXIT_IMMERSIVE";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      if (isFreeWindowMode == false) {
        
        done();
      } else {
        try {
          let windowClass = windowStage.getMainWindowSync();
          let windowStatusType = windowClass.getWindowStatus();
          console.info(caseName + ' windowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));
          if (windowStatusType == window.WindowStatusType.MAXIMIZE) {
            await windowClass.recover();
            await sleep(200);
          }
          let windowRect = windowClass.getWindowProperties().windowRect;
          console.log(`${msgStr} windowRect: ${JSON.stringify(windowRect)}`);
          const callback = async (data: window.WindowStatusType) => {
            console.log(`${msgStr} callback data: ${JSON.stringify(data)}`);
            expect(data).assertEqual(window.WindowStatusType.MAXIMIZE);
            let windowRect2 = windowClass.getWindowProperties().windowRect;
            console.log(`${msgStr} windowRect2: ${JSON.stringify(windowRect2)}`);
            expect(windowRect2.width - windowRect.width).assertLarger(0);
            expect(windowRect2.height - windowRect.height).assertLarger(0);
            windowClass.off('windowStatusDidChange', callback);
            await windowClass.recover();
            await sleep(200);
            done()
          }
          windowClass.on('windowStatusDidChange', callback);
          console.log(msgStr + 'Succeeded on windowStatusDidChange ');
          await windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE);
          await sleep(200)
        } catch (err) {
          console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        }
      }
    })

    /**
     * @tc.name   testOnwindowStatusDidChange_mimimize
     * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_0600
     * @tc.desc   testOnwindowStatusDidChange_mimimize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnwindowStatusDidChange_mimimize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testOnwindowStatusDidChange_mimimize";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = await windowStage.createSubWindow('testOnwindowStatusDidChange_mimimize');
        await windowClass.setUIContent('testability/pages/First/index2');
        await windowClass.showWindow();
        await sleep(300);
        const callback = async (data: window.WindowStatusType) => {
          console.log(`${msgStr} callback data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(window.WindowStatusType.MINIMIZE);
          windowClass.off('windowStatusDidChange', callback);
          await windowClass.destroyWindow();
          await sleep(200);
          done()
        }
        windowClass.on('windowStatusDidChange', callback);
        console.log(msgStr + 'Succeeded on windowStatusDidChange ');
        await windowClass.minimize();
        await sleep(200)
      } catch (err) {
        console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
        if (err.code == 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
      // }
    })
    /**
     * @tc.name   testOnwindowStatusDidChange_SPLIT_SCREEN
     * @tc.number SUB_BASIC_WMS_WINDOW_STATUS_DID_CHANGE_0700
     * @tc.desc   testOnwindowStatusDidChange_SPLIT_SCREEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnwindowStatusDidChange_SPLIT_SCREEN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testOnwindowStatusDidChange_SPLIT_SCREEN';
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING & SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);

        const callback = async (data: window.WindowStatusType) => {
          console.log(`${message} callback data: ${JSON.stringify(data)}`);
          expect(data).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
          windowClass.off('windowStatusDidChange', callback);
          await sleep(200);
          done()
        }
        windowClass.on('windowStatusDidChange', callback);
        console.log(message + 'Succeeded on windowStatusDidChange ');

        // 模拟用户移动窗口到左边缘，可触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 200, 200)
        await sleep(2000)
      } else {
        console.info(`${message} not support`);
        done()
      }
    })


    /**
     * @tc.name   testShiftAppWindowTouchEvent_null
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_TOUCH_EVENT_0100
     * @tc.desc   testShiftAppWindowTouchEvent_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShiftAppWindowTouchEvent_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testShiftAppWindowTouchEvent_null";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        window.shiftAppWindowTouchEvent(null, null, null).then(() => {
          console.info(`${caseName} Succeeded in calling shiftAppWindowTouchEvent.`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(401);
          done()
        }
      }
    })

    /**
     * @tc.name   testShiftAppWindowTouchEvent_undefined
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_TOUCH_EVENT_0200
     * @tc.desc   testShiftAppWindowTouchEvent_undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShiftAppWindowTouchEvent_undefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testShiftAppWindowTouchEvent_undefined";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        window.shiftAppWindowTouchEvent(undefined, undefined, undefined).then(() => {
          console.info(`${caseName} Succeeded in calling shiftAppWindowTouchEvent.`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(401);
          done()
        }
      }
    })

    /**
     * @tc.name   testShiftAppWindowTouchEvent_1300002
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_TOUCH_EVENT_0300
     * @tc.desc   testShiftAppWindowTouchEvent_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShiftAppWindowTouchEvent_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testShiftAppWindowTouchEvent_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      if (isFreeWindowMode == true) {
        let subWindowClass = await windowStage.createSubWindow('testShiftAppWindowTouchEvent_1300002');
        await sleep(200);
        // let windowLimits = subWindowClass.getWindowLimits();
        // console.log(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        await subWindowClass.resize(1000, 1000);
        await sleep(300);
        await subWindowClass.setUIContent("testability/pages/WindowTest/StartMoving2");
        await sleep(200);
        await subWindowClass.showWindow();
        await sleep(1000);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.log(`${caseName} subWindowId: ${JSON.stringify(subWindowId)}`);
        AppStorage.setOrCreate('subWindowId2', subWindowId);
        try {
          let driver = await Driver.create();
          await sleep(1000);
          let blank = await driver.findComponent(ON.id('startMoving2'))
          await sleep(1000)
          let point = await blank.getBoundsCenter();
          await driver.drag(point.x, point.y, point.x + 50, point.y + 50, 200);
          await sleep(1000);
          let text = await driver.findComponent(ON.id('startMovingText2'));
          await sleep(1000)
          let textDragged = await text.getText();
          console.log(`${caseName} textDragged: ${JSON.stringify(textDragged)}`);
          if (textDragged == 'success') {
            expect(true).assertFalse()
          } else if (textDragged == 'startMoving 801' || textDragged == '801') {
            done();
          } else if (textDragged == '1300002') {
            done();
          } else {
            console.error(`${caseName} Error.`);
            expect(true).assertFalse()
          }
          await subWindowClass.destroyWindow();
          done();
        } catch (err) {
          console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
          await subWindowClass.destroyWindow();
          if (err.code == 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        }
      } else {
        done();
      }

    })

    /**
     * @tc.name   testShiftAppWindowTouchEvent_1300016
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_TOUCH_EVENT_0400
     * @tc.desc   testShiftAppWindowTouchEvent_1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShiftAppWindowTouchEvent_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testShiftAppWindowTouchEvent_1300016";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      if (isFreeWindowMode == true) {
        let subWindowClass = await windowStage.createSubWindow('testShiftAppWindowTouchEvent_1300016');
        await sleep(200);
        let windowLimits = subWindowClass.getWindowLimits();
        console.log(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        await subWindowClass.resize((windowLimits.minWidth as number) + 500, (windowLimits.minHeight as number) + 500);
        await subWindowClass.setUIContent("testability/pages/WindowTest/StartMoving3");
        await sleep(200);
        await subWindowClass.showWindow();
        await sleep(1000);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.error(`${caseName} subWindowId: ${JSON.stringify(subWindowId)}`);
        AppStorage.setOrCreate('subWindowId3', subWindowId);


        try {
          let driver = await Driver.create();
          await sleep(1000);
          let blank = await driver.findComponent(ON.id('startMoving3'))
          await sleep(1000)
          let point = await blank.getBoundsCenter();
          await driver.drag(point.x, point.y, point.x + 50, point.y + 50, 200);
          await sleep(1000);
          let text = await driver.findComponent(ON.id('startMovingText3'));
          await sleep(1000)
          let textDragged = await text.getText();

          console.log(`${caseName} textDragged: ${JSON.stringify(textDragged)}`);
          if (textDragged == 'success') {
            expect(true).assertFalse()
          } else if (textDragged == 'startMoving 801' || textDragged == '801') {
            done();
          } else if (textDragged == '1300016') {
            done();
          } else {
            console.error(`${caseName} Error.`);
            expect(true).assertFalse()
          }
          await subWindowClass.destroyWindow();
          done();
        } catch (err) {
          console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
          await subWindowClass.destroyWindow();
          if (err.code == 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        }
      } else {
        done();
      }

    })

    /**
     * @tc.name   testShiftAppWindowTouchEvent_1300004
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_TOUCH_EVENT_0500
     * @tc.desc   testShiftAppWindowTouchEvent_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShiftAppWindowTouchEvent_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testShiftAppWindowTouchEvent_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      if (isFreeWindowMode == true) {
        let mainWindow = windowStage.getMainWindowSync();
        let mainWindowId = mainWindow.getWindowProperties().id;
        console.log(`${caseName} mainwindowId: ${JSON.stringify(mainWindowId)}`);
        AppStorage.setOrCreate('mainWindowId4', mainWindowId);
        let config: window.Configuration = {
          name: "dialog",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        const subWindowClass = await window.createWindow(config);
        await sleep(200);
        await subWindowClass.setUIContent("testability/pages/WindowTest/StartMoving4");
        await sleep(200);
        subWindowClass.moveWindowToAsync(0, 200);
        await subWindowClass.showWindow();
        await sleep(1000);
        let subWindowId = subWindowClass.getWindowProperties().id;
        console.log(`${caseName} subWindowId: ${JSON.stringify(subWindowId)}`);
        AppStorage.setOrCreate('subWindowId4', subWindowId);
        try {
          let driver = await Driver.create();
          await sleep(1000);
          let blank = await driver.findComponent(ON.id('startMoving4'))
          await sleep(1000)
          let point = await blank.getBoundsCenter();
          await driver.drag(point.x, point.y, point.x + 50, point.y + 50, 200);
          await sleep(1000);
          let text = await driver.findComponent(ON.id('startMovingText4'));
          await sleep(1000)
          let textDragged = await text.getText();

          console.log(`${caseName} textDragged: ${JSON.stringify(textDragged)}`);
          if (textDragged == 'success') {
            expect(true).assertFalse()
          } else if (textDragged == 'startMoving 801' || textDragged == '801') {
            done();
          } else if (textDragged == '1300004') {
            done();
          } else {
            console.error(`${caseName} Error.`);
            expect(true).assertFalse()
          }
          await subWindowClass.destroyWindow();
          done();
        } catch (err) {
          console.error(`${caseName} failed, error: ${JSON.stringify(err)}`);
          await subWindowClass.destroyWindow();
          if (err.code == 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        }
      } else {
        done();
      }

    })



    /**
     * @tc.name   testOutlineEnabled_True
     * @tc.number testOutlineEnabled_0100
     * @tc.desc   Test the function value of outlineEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOutlineEnabled_True', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testOutlineEnabled_True';
      let windowClass: window.Window;
      let options: window.SubWindowOptions = {
        title: 'testOutlineEnabled_True',
        decorEnabled: true,
        outlineEnabled: true
      };
      windowStage.createSubWindowWithOptions('testOutlineEnabled_True', options).then(async (data) => {
        windowClass = data
        console.log(`${message} createSubWindowWithOptions success`);
        await windowClass.setUIContent("testability/pages/Index");
        windowClass.resize(1000, 1200)
        await windowClass.showWindow()
        await sleep(500)
        await windowClass.destroyWindow()
        
        done();
      }).catch(async (err: BusinessError) => {
        console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (err.code == 801 || err.code == 1300002) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          done();
        } else {
          expect(false).assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   testOutlineEnabled_False
     * @tc.number testOutlineEnabled_0200
     * @tc.desc   Test the function value of outlineEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOutlineEnabled_False', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testOutlineEnabled_False';
      let windowClass: window.Window;
      let options: window.SubWindowOptions = {
        title: 'testOutlineEnabled_False',
        decorEnabled: true,
        outlineEnabled: false
      };
      windowStage.createSubWindowWithOptions('testOutlineEnabled_False', options).then(async (data) => {
        windowClass = data
        console.log(`${message} createSubWindowWithOptions success`);
        await windowClass.setUIContent("testability/pages/Index");
        windowClass.resize(1000, 1200)
        await windowClass.showWindow()
        await sleep(500)
        await windowClass.destroyWindow()
        
        done();
      }).catch(async (err: BusinessError) => {
        console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (err.code == 801 || err.code == 1300002) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          done();
        } else {
          expect(false).assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   testOutlineEnabled_Undifined
     * @tc.number testOutlineEnabled_0300
     * @tc.desc   Test the function value of outlineEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOutlineEnabled_Undifined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testOutlineEnabled_Undifined';
      let windowClass: window.Window;
      let options: window.SubWindowOptions = {
        title: 'testOutlineEnabled_Undifined',
        decorEnabled: true,
        outlineEnabled: undefined
      };
      windowStage.createSubWindowWithOptions('testOutlineEnabled_Undifined', options).then(async (data) => {
        windowClass = data
        console.log(`${message} createSubWindowWithOptions success`);
        await windowClass.setUIContent("testability/pages/Index");
        windowClass.resize(1000, 1200)
        await windowClass.showWindow()
        await sleep(500)
        await windowClass.destroyWindow()
        
        done();
      }).catch(async (err: BusinessError) => {
        console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (err.code == 801 || err.code == 1300002) {
          console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          done();
        } else {
          expect(false).assertFalse();
          done();
        }
      })
    })
    /**
     * @tc.name   testSetDragKeyFramePolicy_EnableWithDefaultValue
     * @tc.number testSetDragKeyFramePolicy_0100
     * @tc.desc   Test the function when enable with default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDragKeyFramePolicy_EnableWithDefaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetDragKeyFramePolicy_EnableWithDefaultValue';
      console.log(message + ' begin.');
      if (isPCStatus != '') {
        console.info(`${message} not pc, skip`);
        
        done();
        return;
      }
      let keyFramePolicy: window.KeyFramePolicy = {
        enable: true
      };
      try {
        let windowClass: window.Window = windowStage.getMainWindowSync();
        windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
          console.info(`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
          expect(ret.enable).assertEqual(keyFramePolicy.enable);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`${message} Failed with error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetDragKeyFramePolicy_EnableWithNotDefaultValue
     * @tc.number testSetDragKeyFramePolicy_0200
     * @tc.desc   Test the function when enable with not default value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDragKeyFramePolicy_EnableWithNotDefaultValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetDragKeyFramePolicy_EnableWithNotDefaultValue';
      console.log(message + ' begin.');
      if (isPCStatus != '') {
        console.info(`${message} not pc, skip`);
        
        done();
        return;
      }
      let keyFramePolicy: window.KeyFramePolicy = {
        enable: true,
        interval: 200,
        distance: 2000,
        animationDuration: 200,
        animationDelay: 200
      };
      try {
        let windowClass: window.Window = windowStage.getMainWindowSync();
        windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
          console.info(`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
          expect(ret.enable).assertEqual(keyFramePolicy.enable);
          expect(ret.interval).assertEqual(keyFramePolicy.interval);
          expect(ret.distance).assertEqual(keyFramePolicy.distance);
          expect(ret.animationDuration).assertEqual(keyFramePolicy.animationDuration);
          expect(ret.animationDelay).assertEqual(keyFramePolicy.animationDelay);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`${message} Failed with error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetDragKeyFramePolicy_EnableWithFloatValue
     * @tc.number testSetDragKeyFramePolicy_0300
     * @tc.desc   Test the function when enable with not float value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDragKeyFramePolicy_EnableWithFloatValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetDragKeyFramePolicy_EnableWithFloatValue';
      console.log(message + ' begin.');
      if (isPCStatus != '') {
        console.info(`${message} not pc, skip`);
        
        done();
        return;
      }
      let keyFramePolicy: window.KeyFramePolicy = {
        enable: true,
        interval: 200.0,
        distance: 2000.9,
        animationDuration: 200.4,
        animationDelay: 200.5
      };
      try {
        let windowClass: window.Window = windowStage.getMainWindowSync();
        windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
          console.info(`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
          expect(ret.enable).assertEqual(keyFramePolicy.enable);
          expect(ret.interval).assertEqual(Math.floor(keyFramePolicy.interval === undefined ? 0 : keyFramePolicy.interval));
          expect(ret.distance).assertEqual(Math.floor(keyFramePolicy.distance === undefined ? 0 : keyFramePolicy.distance));
          expect(ret.animationDuration).assertEqual(Math.floor(keyFramePolicy.animationDuration === undefined ? 0 : keyFramePolicy.animationDuration));
          expect(ret.animationDelay).assertEqual(Math.floor(keyFramePolicy.animationDelay === undefined ? 0 : keyFramePolicy.animationDelay));
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`${message} Failed with error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetDragKeyFramePolicy_NegativeValueFail
     * @tc.number testSetDragKeyFramePolicy_0400
     * @tc.desc   Test the function when failed with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDragKeyFramePolicy_NegativeValueFail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetDragKeyFramePolicy_NegativeValueFail';
      console.log(message + ' begin.');
      if (isPCStatus != '') {
        console.info(`${message} not pc, skip`);
        
        done();
        return;
      }
      let keyFramePolicy: window.KeyFramePolicy = {
        enable: true,
        interval: -200,
        distance: -2000,
        animationDuration: -200,
        animationDelay: -200
      };
      try {
        let windowClass: window.Window = windowStage.getMainWindowSync();
        windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
          console.info(`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`${message} Failed with error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(1300016);
        done();
      }
    })
    /**
     * @tc.name   testSetDragKeyFramePolicy_ZeroValueFail
     * @tc.number testSetDragKeyFramePolicy_0500
     * @tc.desc   Test the function when failed with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDragKeyFramePolicy_ZeroValueFail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetDragKeyFramePolicy_ZeroValueFail';
      console.log(message + ' begin.');
      if (isPCStatus != '') {
        console.info(`${message} not pc, skip`);
        
        done();
        return;
      }
      let keyFramePolicy: window.KeyFramePolicy = {
        enable: true,
        interval: 0,
        distance: 0,
        animationDuration: 0,
        animationDelay: 0
      };
      try {
        let windowClass: window.Window = windowStage.getMainWindowSync();
        windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
          console.info(`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`${message} Failed with error: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(1300016);
        done();
      }
    })
    /**
     * @tc.name   testSetDragKeyFramePolicy_SubWindowFail
     * @tc.number testSetDragKeyFramePolicy_0600
     * @tc.desc   Test the function when failed with subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDragKeyFramePolicy_SubWindowFail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetDragKeyFramePolicy_SubWindowFail';
      console.log(message + ' begin.');
      if (isPCStatus != '') {
        console.info(`${message} not pc, skip`);
        
        done();
        return;
      }
      let keyFramePolicy: window.KeyFramePolicy = {
        enable: true
      };
      let subWindowClass: window.Window | undefined = await windowStage.createSubWindow(message);
      if (subWindowClass === undefined) {
        console.error(`${message} Fail to createSubWindow`);
        expect().assertFail();
        done();
        return;
      }
      try {
        subWindowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
          console.info(`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          } else {
            expect(err.code).assertEqual(1300004);
          }
          done();
        });
      } catch (err) {
        console.error(`${message} Failed with error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      } finally {
        await sleep(1000);
        await subWindowClass.destroyWindow();
      }
    })
    /**
     * @tc.name   testSetDragKeyFramePolicy_1300002
     * @tc.number testSetDragKeyFramePolicy_0700
     * @tc.desc   Test the function when failed with 1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDragKeyFramePolicy_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetDragKeyFramePolicy_1300002';
      console.log(message + ' begin.');
      if (isPCStatus != '') {
        console.info(`${message} not pc, skip`);
        
        done();
        return;
      }
      let keyFramePolicy: window.KeyFramePolicy = {
        enable: true
      };
      let subWindowClass: window.Window | undefined = await windowStage.createSubWindow(message);
      if (subWindowClass === undefined) {
        console.error(`${message} Fail to createSubWindow`);
        expect().assertFail();
        done();
        return;
      }
      try {
        await subWindowClass.destroyWindow();
        await sleep(500);
        subWindowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
          console.info(`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          } else {
            expect(err.code).assertEqual(1300002);
          }
          done();
        });
      } catch (err) {
        console.error(`${message} Failed with error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetDragKeyFramePolicy_Disable
     * @tc.number testSetDragKeyFramePolicy_0800
     * @tc.desc   Test the function when disable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetDragKeyFramePolicy_Disable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testSetDragKeyFramePolicy_Disable';
      console.log(message + ' begin.');
      if (isPCStatus != '') {
        console.info(`${message} not pc, skip`);
        
        done();
        return;
      }
      let keyFramePolicy: window.KeyFramePolicy = {
        enable: false
      };
      try {
        let windowClass: window.Window = windowStage.getMainWindowSync();
        windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
          console.info(`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
          expect(ret.enable).assertEqual(keyFramePolicy.enable);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`${message} Failed with error: ${JSON.stringify(err)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testWindowStatusChange_0100
     * @tc.number testWindowStatusChange_0100
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowStatusChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testWindowStatusChange_0100';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
        ]
      };
      let windowStatusChange: window.WindowStatusType | undefined = undefined;
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        windowClass.on('windowStatusChange', (WindowStatusType) => {
          console.info(message + ' Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(WindowStatusType));
          windowStatusChange = WindowStatusType;
        });
        await sleep(1000)
        // 模拟用户移动窗口到左边缘，触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 200, 200)
        await sleep(1000)
        // 获取窗口状态 - 分屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        expect(windowStatusChange).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        windowClass.off('windowStatusChange')
        done();
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.name   testWindowStatusChange_0200
     * @tc.number testWindowStatusChange_0200
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowStatusChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testWindowStatusChange_0200';
      let windowStatusChange: window.WindowStatusType | undefined = undefined;
      if (isPCStatus != '') {
        let windowClass = windowStage.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatusType = windowClass.getWindowStatus();
        console.info(message + ' windowClass.getWindowStatus(). windowStatusType: ' + windowStatusType);
        if (windowStatusType == window.WindowStatusType.MAXIMIZE) {
          await windowClass.recover();
          await sleep(200);
        }
        windowClass.on('windowStatusChange', (WindowStatusType) => {
          console.info(message + ' Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(WindowStatusType));
          windowStatusChange = WindowStatusType;
        });
        await sleep(1000)
        await windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE)
        await sleep(1000)
        console.error(message + ' Succeeded in maximize(window.MaximizePresentation.EXIT_IMMERSIVE). windowStatusChange: ' + JSON.stringify(windowStatusChange));
        expect(windowStatusChange).assertEqual(window.WindowStatusType.MAXIMIZE);
        await windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
        await sleep(1000)
        console.error(message + ' Succeeded in maximize(window.MaximizePresentation.ENTER_IMMERSIVE). windowStatusChange: ' + JSON.stringify(windowStatusChange));
        expect(windowStatusChange).assertEqual(window.WindowStatusType.FULL_SCREEN);
        await windowClass.recover();
        await sleep(1000)
        console.error(message + ' Succeeded in recover. windowStatusChange: ' + JSON.stringify(windowStatusChange));
        expect(windowStatusChange).assertEqual(window.WindowStatusType.FLOATING);
        await sleep(1000)
        await windowClass.minimize();
        await sleep(1000)
        console.error(message + ' Succeeded in minimize. windowStatusChange: ' + JSON.stringify(windowStatusChange));
        let windowStatusType2 = windowClass.getWindowStatus();
        expect(windowStatusChange).assertEqual(window.WindowStatusType.MINIMIZE);
        expect(windowStatusType2).assertEqual(window.WindowStatusType.MINIMIZE);
        windowClass.off('windowStatusChange')
        await windowClass.restore();
        done();
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
    * @tc.name    test_getWindowStateSnapshot_1300002
    * @tc.number  SUB_BASIC_WMS_GET_WINDOW_STATE_SNAPSHOT_0100
    * @tc.desc    test_sgetWindowStateSnapshot_subWindow_Destroy
    * @tc.type    FUNCTION
    * @tc.size    MEDIUMTEST
    * @tc.level   LEVEL3
    */
    it('test_getWindowStateSnapshot_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_getWindowStateSnapshot_1300002';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow = await windowStage.createSubWindow('test_getWindowStateSnapshot_1300002');
      await subWindow.destroyWindow();
      try {
        let promise = subWindow.getWindowStateSnapshot();
        promise.then((data) => {
          let jsonObj: object = JSON.parse(data);
          console.info(`${caseName}: Succeeded. data=${data}, isPcMod=${jsonObj["isPcMode"]}`);
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName}: getWindowStateSnapshot Failed. Cause code: ${err.code}, cancel message: ${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message).assertEqual('This window state is abnormal.[window][getWindowStateSnapshot]msg: The window is not created or destroyed');
          done();
        });
      } catch (exception) {
        console.error(`${caseName}: Failed, Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   test_getWindowStateSnapshot_mainWindow
     * @tc.number SUB_BASIC_WMS_GET_WINDOW_STATE_SNAPSHOT_0200
     * @tc.desc   test_sgetWindowStateSnapshot_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getWindowStateSnapshot_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_getWindowStateSnapshot_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try {
        let promise = mainWindow.getWindowStateSnapshot();
        promise.then((data) => {
          let jsonObj: object = JSON.parse(data);
          console.info(`${caseName}: Succeeded. data=${data}, isPcMod=${jsonObj["isPcMode"]}`);
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName}: getWindowStateSnapshot Failed. Cause code: ${err.code}, cancel message: ${err.message}`);
          if (!canIUse('SystemCapability.Window.SessionManager')) {
            expect(err.code).assertEqual(801);
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][getWindowStateSnapshot]msg: get window state snapshot failed');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName}: Failed, Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    });


  })
}