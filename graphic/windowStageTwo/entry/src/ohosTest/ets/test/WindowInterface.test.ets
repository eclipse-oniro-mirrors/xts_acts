/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { common, StartOptions, bundleManager } from '@kit.AbilityKit';
import ohosWindow from '@ohos.window';
import { Driver,  ON  } from '@ohos.UiTest';
import window from '@ohos.window';
import settings from '@ohos.settings';
import { BusinessError } from '@kit.BasicServicesKit';
import Want from '@ohos.app.ability.Want';
import { ColorMetrics } from '@kit.ArkUI';



let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

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
  let windowStageStart = AppStorage.get('windowStageStart') as ohosWindow.WindowStage;
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

async function assertMaximizeComponentExist(windowState: number, windowRect?: window.Rect,
  windowClass?: window.Window) {
  let driver = Driver.create()
  if (windowState == 2||windowState == 1) {
    await driver.mouseMoveTo({ x: 100, y: 0 })
  } else {
    await windowClass?.moveWindowToAsync(windowRect?.left, windowRect?.top)
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

export default function windowInterface() {
  describe('windowInterface', () => {
    // let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let isPCStatus: string = '';
    let mainWindowClass:ohosWindow.Window;
    let isAutoWindow:string = '';
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      context = AppStorage.get('context') as common.UIAbilityContext;
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      mainWindowClass = windowStage.getMainWindowSync();
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.DEVICE_SHARED);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
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
        console.log('afterEach fail cause'+error)
      }
      
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      let windowClass = windowStage.getMainWindowSync()
      windowClass.setUIContent('testability/pages/Index')
      // Presets a clear action, which is performed after all test cases of
      // the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : testStartMoving_0100
     * @tc.name      : testStartMoving_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartMoving_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startMovingTest_0100';
      await sleep(1000)
      let driver = await Driver.create();
      let windowClass = windowStage.getMainWindowSync();
      await windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
      await sleep(1000)
      let windowPoint = await windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      let blank = await driver.findComponent(ON.id('startMoving'))
      await sleep(1000)
      let point = await blank.getBoundsCenter();
      await driver.drag(point.x, point.y, point.x - 50, point.y - 50, 200);
      await sleep(1000)
      let text = await driver.findComponent(ON.id('startMovingText'));
      await sleep(1000)
      let textDragged = await text.getText()
      if (textDragged == 'startMoving success') {
        let windowPointDragged = await windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
        expect(windowPointDragged.left).assertEqual(windowPoint.left - 50)
        expect(windowPointDragged.top).assertEqual(windowPoint.top - 50)
        done()
      } else if (textDragged == 'startMoving 801') {
        expect(true).assertTrue();
        done()
      } else {
        console.error(`${message} Error`);
        expect(true).assertFalse()
        done()
      }
    })

/**
     * @tc.number    : testSetResizeByDragEnabledTrue_0100
     * @tc.name      : testSetResizeByDragEnabledTrue_0100
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
it('testSetResizeByDragEnabledTrue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetResizeByDragEnabledTrueTest_0100';
  let windowClass = windowStage.getMainWindowSync()
  let enabled = true;
  let driver = await Driver.create();
  if (isPCStatus != '') {
    try {
      windowClass.setResizeByDragEnabled(enabled, async (err) => {
        if (err.code == 801) {
          console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
          expect(false).assertFalse();
          done();
        } else if (err.code && err.code != 801) {
          console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`)
          expect().assertFail();
          done();
        }
        console.info(`${message} Succeeded in setting the function of disabling the resize by drag window.`);
        let windowPoint = await windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
        await driver.mouseMoveTo({x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top})
        await sleep(2000)
        await driver.mouseDrag({x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top}, {x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 100},2000)
        await sleep(1000)
        let windowPointDragged = await windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPointDraged = ${JSON.stringify(windowPointDragged)}`)
        expect(windowPointDragged.width).assertEqual(windowPoint.width)
        expect(windowPointDragged.height).assertEqual(windowPoint.height - 100)
        done()
      });
    } catch (exception) {
      console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
      expect().assertFail();
      done();
    }
  } else {
    console.info(`${message} not support`);
    done()
  }
})

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0100
     * @tc.name      : testSetWindowRectAutoSaveTrue_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0100';
      let windowClass = windowStage.getMainWindowSync();
      await windowClass.setUIContent('testability/pages/Index');
      await sleep(1000)
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小位置一致
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0200
     * @tc.name      : testSetWindowRectAutoSaveTrue_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0200';
      let driver = Driver.create()
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 二分屏
          let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
          await sleep(1000)
          let titlePoint = await title.getBounds()
          await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
          await sleep(1000)
          // 关闭Ability&退出分屏
          await driver.click(2340, 977);
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小位置一致
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0300
     * @tc.name      : testSetWindowRectAutoSaveTrue_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0300';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 最大化
          await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          windowClassStart = windowStageStart.getMainWindowSync()
          let windowStatusType = windowClassStart.getWindowStatus();
          console.info(`${message} windowStatusType = ${windowStatusType} , expect 2`)
          let isLayoutFullScreen = windowClassStart.getWindowProperties().isLayoutFullScreen
          console.info(`${message} isLayoutFullScreen = ${isLayoutFullScreen} , expect false`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // 窗口全屏，非沉浸式
          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE) 
          //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
          expect(isLayoutFullScreen).assertFalse()
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0400
     * @tc.name      : testSetWindowRectAutoSaveTrue_0400
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0400';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          await sleep(1000)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 沉浸式
          await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小位置一致
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0500
     * @tc.name      : testSetWindowRectAutoSaveTrue_0500
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0500';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 最小化
          await windowClassStart.minimize()
          // 关闭Ability
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小位置一致
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0600
     * @tc.name      : testSetWindowRectAutoSaveTrue_0600
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0600';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)
          // windowRect1 & windowRect2 的大小一致
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0700
     * @tc.name      : testSetWindowRectAutoSaveTrue_0700
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0700';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 窗口最大化（非沉浸式）
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          // 窗口全屏，非沉浸式
          windowClassStart = windowStageStart.getMainWindowSync()
          let windowStatusType = windowClassStart.getWindowStatus();
          console.info(`${message} windowStatusType = ${windowStatusType} , expect 2`)
          let isLayoutFullScreen = windowClassStart.getWindowProperties().isLayoutFullScreen
          console.info(`${message} windowRect = ${JSON.stringify(windowClassStart.getWindowProperties().windowRect)}`)
          console.info(`${message} isLayoutFullScreen = ${isLayoutFullScreen} , expect false`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)

          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE) 
          //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
          expect(isLayoutFullScreen).assertFalse()
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveTrue_0800
     * @tc.name      : testSetWindowRectAutoSaveTrue_0800
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveTrue_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0800';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      // 设置setWindowRectAutoSave = true
      try {
        windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 窗口最大化（沉浸式）
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          // 拉起Ability
          windowStageStart = await startAbility(message, context)
          // 窗口全屏，非沉浸式
          windowClassStart = windowStageStart.getMainWindowSync()
          let windowStatusType = windowClassStart.getWindowStatus();
          console.info(`${message} windowStatusType = ${windowStatusType} , expect 2`)
          let isLayoutFullScreen = windowClassStart.getWindowProperties().isLayoutFullScreen
          console.info(`${message} isLayoutFullScreen = ${isLayoutFullScreen} , expect false`)
          // 恢复
          await windowStageStart.setWindowRectAutoSave(false)

          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE) 
          //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
          expect(isLayoutFullScreen).assertFalse()
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0100
     * @tc.name      : testSetWindowRectAutoSaveFalse_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0100';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
      console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
      // 设置setWindowRectAutoSave = false
      try {
         windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          await sleep(1000)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect2 为窗口默认创建大小
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0200
     * @tc.name      : testSetWindowRectAutoSaveFalse_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0200';
      let driver = Driver.create()
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
      console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
      // 设置setWindowRectAutoSave = false
      try {
         windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 二分屏
          let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
          await sleep(1000)
          let titlePoint = await title.getBounds()
          await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
          await sleep(1000)
          // 关闭Ability&退出分屏
          await driver.click(2340, 977);
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect2 为窗口默认创建大小
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0300
     * @tc.name      : testSetWindowRectAutoSaveFalse_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0300';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
      console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
      // 设置setWindowRectAutoSave = false
      try {
         windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 最大化
          await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // 窗口全屏，非沉浸式
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0400
     * @tc.name      : testSetWindowRectAutoSaveFalse_0400
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0400';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
      console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
      // 设置setWindowRectAutoSave = false
      try {
         windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 沉浸式
          await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          // 关闭Ability
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect2 为窗口默认创建大小
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

      /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0500
     * @tc.name      : testSetWindowRectAutoSaveFalse_0500
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0500';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
      console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
      // 设置setWindowRectAutoSave = false
      try {
         windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 最小化
          await windowClassStart.minimize()
          // 关闭Ability
          await terminateAbility(message)
          await sleep(1000)
          // 重新拉起Ability
          windowStageStart = await startAbility(message, context)
          let windowRect2 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect2 为窗口默认创建大小
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0600
     * @tc.name      : testSetWindowRectAutoSaveFalse_0600
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0600';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
      console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
      // 设置setWindowRectAutoSave = false
      try {
         windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 更改窗口大小&位置
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.moveWindowToAsync(300, 400)
          await windowClassStart.resizeAsync(1000, 1200)
          // 拉起Ability
          let windowStageStart2 = await startAbility(message, context)
          let windowRect2 = windowStageStart2.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          // windowRect1 & windowRect2 的大小一致
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0700
     * @tc.name      : testSetWindowRectAutoSaveFalse_0700
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0700';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
      console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
      // 设置setWindowRectAutoSave = false
      try {
         windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 窗口最大化（非沉浸式）
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          // 拉起Ability
          let windowStageStart2 = await startAbility(message, context)
          // 窗口全屏，非沉浸式
          let windowRect2 = windowStageStart2.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          await terminateAbilityCycle('afterEach')
          // windowRect1 & windowRect2 的大小一致
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowRectAutoSaveFalse_0800
     * @tc.name      : testSetWindowRectAutoSaveFalse_0800
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowRectAutoSaveFalse_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0800';
      // 拉起Ability
      let windowStageStart = await startAbility(message, context)
      let windowRect1 = windowStageStart.getMainWindowSync().getWindowProperties().windowRect
      console.info(`${message} windowRect1 = ${JSON.stringify(windowRect1)}`)
      // 设置setWindowRectAutoSave = false
      try {
         windowStageStart.setWindowRectAutoSave(false).then(async () => {
          console.info(`${message} setWindowRectAutoSave`)
          // 窗口最大化（沉浸式）
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          // 拉起Ability
          let windowStageStart2 = await startAbility(message, context)
          // 窗口全屏，非沉浸式
          let windowRect2 = windowStageStart2.getMainWindowSync().getWindowProperties().windowRect
          console.info(`${message} windowRect2 = ${JSON.stringify(windowRect2)}`)
          await terminateAbilityCycle('afterEach')
          // windowRect1 & windowRect2 的大小一致
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0100
     * @tc.name      : testStartOptionsSupportWindowModes_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.number    : testStartOptionsSupportWindowModes_0200
     * @tc.name      : testStartOptionsSupportWindowModes_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0200';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.SPLIT
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test = await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass);
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
        await sleep(1000)
        // 获取窗口状态 - 分屏
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await driver.click(2340, 977);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        done();
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0300
     * @tc.name      : testStartOptionsSupportWindowModes_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0300';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      if (isPCStatus != '') {
        // startAbility - SupportWindowMode.FLOATING
        let windowStageStart = await startAbility(message, context, options)
        let windowClass = windowStageStart.getMainWindowSync()
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
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
     * @tc.number    : testStartOptionsSupportWindowModes_0400
     * @tc.name      : testStartOptionsSupportWindowModes_0400
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0400';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
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
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - false
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
        await sleep(1000)
        console.info(`${message} EnhanceMaximizeBtn existence or not: ${test}, expect false`);
        expect(test).assertFalse()
        // 模拟用户移动窗口到左边缘，触发分屏
        let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
        await sleep(1000)
        let titlePoint = await title.getBounds()
        await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
        await sleep(1000)
        // 获取窗口状态 - 自由窗口
        windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 5`);
        await driver.click(2340, 977);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0500
     * @tc.name      : testStartOptionsSupportWindowModes_0500
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0500';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
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
        // 获取窗口状态 - 自由窗口
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 4`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        // 判断是否存在最大化 - true
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
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
        await driver.click(2340, 977);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testStartOptionsSupportWindowModes_0600
     * @tc.name      : testStartOptionsSupportWindowModes_0600
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0600';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
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
        // 获取窗口状态 - 全屏
        let windowStatus = windowClass.getWindowStatus()
        console.info(`${message} windowStatus: ${windowStatus}, expect 1`);
        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
        // 判断是否存在最大化 - true
        let test = await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
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
     * @tc.number    : testStartOptionsSupportWindowModes_0700
     * @tc.name      : testStartOptionsSupportWindowModes_0700
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartOptionsSupportWindowModes_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startOptionsSupportWindowModesTest_0700';
      let mainWindowRect = windowStage.getMainWindowSync().getWindowProperties().windowRect
      let driver = Driver.create()
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
        // 判断是否存在最大化 - true
        let test =
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
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
          await assertMaximizeComponentExist(windowStatus, mainWindowRect, windowClass)
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
        await driver.click(2340, 977);
        await sleep(1000)
        expect(windowStatus).assertEqual(window.WindowStatusType.SPLIT_SCREEN);
        done()
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testisWindowRectAutoSave
     * @tc.name      : testisWindowRectAutoSave
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testisWindowRectAutoSave', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'isWindowRectAutoSaveTest';
      windowStage.setWindowRectAutoSave(true)
      await sleep(1000);
      try {
        windowStage.isWindowRectAutoSave().then((result) => {
          console.info(`${message} isWindowRectAutoSave = ${result}, expect true.`)
          expect(result).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
      windowStage.setWindowRectAutoSave(false)
      await sleep(1000);
      try {
        windowStage.isWindowRectAutoSave().then((result) => {
          console.info(`${message} isWindowRectAutoSave = ${result}, expect false.`)
          expect(result).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
        expect().assertFail();
        done();
      }
    })



    /**
     * @tc.number    : testStartMoving_0200
     * @tc.name      : testStartMoving_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartMoving_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startMovingTest_0200';
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      windowStage.createSubWindowWithOptions('subWindow', options).then(async (data) => {
        let windowClass = data
        await windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
        windowClass.resize(1000, 1200)
        await windowClass.showWindow()
        await sleep(1000)
        let driver = Driver.create();
        await sleep(1000)
        let windowPoint = windowClass.getWindowProperties().windowRect
        console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
        let blank = await driver.findComponent(ON.id('startMoving'))
        await sleep(1000)
        let point = await blank.getBoundsCenter();
        await driver.drag(point.x, point.y, point.x + 100, point.y + 100, 200);
        let text = await driver.findComponent(ON.id('startMovingText'));
        await sleep(1000)
        let textDragged = await text.getText()
        if (textDragged == 'startMoving success') {
          let windowPointDragged = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
          expect(windowPointDragged.left).assertEqual(windowPoint.left + 100)
          expect(windowPointDragged.top).assertEqual(windowPoint.top + 100)
        } else if (textDragged == 'startMoving 801') {
          expect(true).assertTrue();
        } else {
          console.error(`${message} Error`);
          expect(true).assertFalse()
        }
        await windowClass.destroyWindow()
        // await sleep(10000)
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
     * @tc.number    : testStartMoving_0300
     * @tc.name      : testStartMoving_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testStartMoving_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'startMovingTest_0300';
      let windowClass = windowStage.getMainWindowSync();
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      try {
        windowClass.createSubWindowWithOptions('subWindow', options).then(async (data) => {
          let windowClass = data
          await windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          await windowClass.showWindow()
          await sleep(1000)
          let driver = Driver.create();
          await sleep(1000)
          let windowPoint = windowClass.getWindowProperties().windowRect
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
          let blank = await driver.findComponent(ON.id('startMoving'))
          await sleep(1000)
          let point = await blank.getBoundsCenter();
          await driver.drag(point.x, point.y, point.x + 100, point.y + 100, 200);
          let text = await driver.findComponent(ON.id('startMovingText'));
          await sleep(1000)
          let textDragged = await text.getText()
          if (textDragged == 'startMoving success') {
            let windowPointDragged = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoint = ${JSON.stringify(windowPointDragged)}`)
            expect(windowPointDragged.left).assertEqual(windowPoint.left + 100)
            expect(windowPointDragged.top).assertEqual(windowPoint.top + 100)
          } else if (textDragged == 'startMoving 801') {
            expect(true).assertTrue();
          } else {
            console.error(`${message} Error`);
            expect(true).assertFalse()
          }
          windowClass.destroyWindow()
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse();
            done();
          } else {
            console.error(`${message} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertFalse();
            done();
          }
        })
      } catch (exception) {
        console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertFalse();
        done();
      }

    })

    /**
     * @tc.number    : testSetWindowTitleMoveEnabled_0100
     * @tc.name      : testSetWindowTitleMoveEnabled_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0100';
      let windowClass = windowStage.getMainWindowSync();
      let driver =  Driver.create()
      let windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      if(isPCStatus != ''|| isAutoWindow =='true'){
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
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
          done();
        }
      }
      
      

    })

    /**
     * @tc.number    : testSetWindowTitleMoveEnabled_0200
     * @tc.name      : testSetWindowTitleMoveEnabled_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0200';
      let windowClass = windowStage.getMainWindowSync();
      let driver =  Driver.create()
      let windowPoint = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
      if(isPCStatus != ''|| isAutoWindow =='true'){
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
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
          done();
        }
      }

    })

    /**
     * @tc.number    : testSetWindowTitleMoveEnabled_0300
     * @tc.name      : testSetWindowTitleMoveEnabled_0300
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0300';
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      windowStage.createSubWindowWithOptions('subWindow', options).then(async (data) => {
        let windowClass = data
        windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
        windowClass.resize(1000, 1200)
        windowClass.showWindow()
        await sleep(1000)
        let driver =  Driver.create()
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
            expect(true).assertTrue();
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
     * @tc.number    : testSetWindowTitleMoveEnabled_0400
     * @tc.name      : testSetWindowTitleMoveEnabled_0400
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0400';
      let windowClass = windowStage.getMainWindowSync();
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: true
      };
      try {
        windowClass.createSubWindowWithOptions('subWindow', options).then(async (data) => {
          let windowClass = data
          windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          windowClass.showWindow()
          await sleep(1000)
          let driver =  Driver.create()
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
              expect(true).assertTrue();
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
     * @tc.number    : testSetWindowTitleMoveEnabled_0500
     * @tc.name      : testSetWindowTitleMoveEnabled_0500
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowTitleMoveEnabled_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let message = 'setWindowTitleMoveEnabledTest_0500';
      let windowClass = windowStage.getMainWindowSync();
      let options: window.SubWindowOptions = {
        title: 'subWindow',
        decorEnabled: false
      };
      try {
        windowClass.createSubWindowWithOptions('subWindow', options).then(async (data) => {
          let windowClass = data
          windowClass.setUIContent("testability/pages/WindowTest/StartMoving");
          windowClass.resize(1000, 1200)
          windowClass.showWindow()
          await sleep(1000)
          let driver =  Driver.create()
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
              expect(true).assertTrue();
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
     * @tc.number    : testSetSubWindowModalModalityType_0100
     * @tc.name      : testSetSubWindowModalModalityType_0100
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSubWindowModalModalityType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setSubWindowModalModalityTypeTest_0100';
      let windowClass = windowStage.getMainWindowSync()
      await windowClass.setUIContent('testability/pages/WindowTest/Modality')
      await sleep(300);
      let driver =  Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(1000)
      let btnCenter = await btn.getBoundsCenter()
      try {
        let subWindow = windowStage.createSubWindow("testSubWindow");
        subWindow.then(async (data) => {
          if (data == null) {
            console.error("Failed to create the subWindow. Cause: The data is empty");
            return;
          }
          let windowClass = data;
          await windowClass.setUIContent('testability/pages/Index')
          await windowClass.resizeAsync(400, 500)
          await windowClass.moveWindowToAsync(400, 400)
          await windowClass.showWindow()
          let promise = windowClass.setSubWindowModal(true, window.ModalityType.WINDOW_MODALITY);
          promise.then(async () => {
            console.info(`${message} setSubWindowModal success`)
            await driver.click(btnCenter.x, btnCenter.y)
            let btnText = await btn.getText()
            console.info(`${message} btnText = ${btnText}, expect Modality`)
            expect(btnText).assertEqual('Modality')
            await windowClass.destroyWindow()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
              expect(false).assertFalse()
            } else {
              console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail()
            }
          });
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })
    /**
     * @tc.number    : testSetSubWindowModalModalityType_0200
     * @tc.name      : testSetSubWindowModalModalityType_0200
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSubWindowModalModalityType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setSubWindowModalModalityTypeTest_0200';
      let windowClass = windowStage.getMainWindowSync()
      await windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let driver =  Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(1000)
      let btnCenter = await btn.getBoundsCenter()
      try {
        let subWindow = windowStage.createSubWindow("testSubWindow");
        subWindow.then(async (data) => {
          if (data == null) {
            console.error("Failed to create the subWindow. Cause: The data is empty");
            return;
          }
          let windowClass = data;
          await windowClass.setUIContent('testability/pages/Index')
          await windowClass.resizeAsync(400, 500)
          await windowClass.moveWindowToAsync(400, 400)
          await windowClass.showWindow()
          let promise = windowClass.setSubWindowModal(true, window.ModalityType.APPLICATION_MODALITY);
          promise.then(async () => {
            console.info(`${message} setSubWindowModal success`)
            await driver.click(btnCenter.x, btnCenter.y)
            let btnText = await btn.getText()
            console.info(`${message} btnText = ${btnText}, expect Modality`)
            expect(btnText).assertEqual('Modality')
            await windowClass.destroyWindow()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
              expect(false).assertFalse()
            } else {
              console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail()
            }
          });
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.number    : testSetSubWindowModalModalityType_0300
     * @tc.name      : testSetSubWindowModalModalityType_0300
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSubWindowModalModalityType_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setSubWindowModalModalityTypeTest_0400';
      let windowClass = windowStage.getMainWindowSync()
      try {
        let promise = windowClass.setSubWindowModal(true, window.ModalityType.APPLICATION_MODALITY);
        promise.then(() => {
          console.info(`${message} setSubWindowModal success`)
          expect().assertFail()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse()
          } else if (err.code == 1300004) {
            console.error(`${message} Unauthorized operation.`);
            expect(false).assertFalse()
          } else {
            console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail()
          }
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }

      done()
    })

    /**
     * @tc.number    : testSetSubWindowModalModalityType_0400
     * @tc.name      : testSetSubWindowModalModalityType_0400
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSubWindowModalModalityType_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setSubWindowModalModalityTypeTest_0300';
      try {
        let subWindow = windowStage.createSubWindow("testSubWindow");
        subWindow.then((data) => {
          if (data == null) {
            console.error("Failed to create the subWindow. Cause: The data is empty");
            return;
          }
          let windowClass = data
          let promise = windowClass.setSubWindowModal(false, window.ModalityType.APPLICATION_MODALITY);
          promise.then(async() => {
            console.info(`${message} setSubWindowModal success`)
            await windowClass.destroyWindow();
            expect().assertFail()
          }).catch((err: BusinessError) => {
            if (err.code == 401) {
              console.info(`${message} Parameter error.`);
              expect(false).assertFalse()
            } else {
              console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail()
            }
          });
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.number    : testCreateSubWindowWithOptionsModalityType_0100
     * @tc.name      : testCreateSubWindowWithOptionsModalityType_0100
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindowWithOptionsModalityType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testCreateSubWindowWithOptionsModalityType_0100';
      let windowClass = windowStage.getMainWindowSync()
      await windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let driver =  Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(1000)
      let btnCenter = await btn.getBoundsCenter()
      let options: window.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true,
        modalityType: window.ModalityType.WINDOW_MODALITY
      };
      try {
        windowStage.createSubWindowWithOptions('mySubWindow1', options).then(async (windowClass) => {
          console.info(`${message} setSubWindowModal success`)
          await windowClass.setUIContent('testability/pages/Index')
          await windowClass.resizeAsync(400, 500)
          await windowClass.moveWindowToAsync(100, 400)
          await windowClass.showWindow()
          await driver.click(btnCenter.x, btnCenter.y)
          let btnText = await btn.getText()
          console.info(`${message} btnText = ${btnText}, expect Modality`)
          expect(btnText).assertEqual('Modality')
          windowClass.destroyWindow()
        }).catch((err: BusinessError) => {
          if (err.code == 1300002) {
            console.info(`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
            expect(false).assertFalse()
          } else {
            console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail()
          }
        });
      } catch (exception) {
        console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail()
      }
      done()
    })

    /**
     * @tc.number    : testCreateSubWindowWithOptionsModalityType_0200
     * @tc.name      : testCreateSubWindowWithOptionsModalityType_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindowWithOptionsModalityType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testCreateSubWindowWithOptionsModalityTypeTest_0200';
      let windowClass = windowStage.getMainWindowSync()
      await windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let driver =  Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(1000)
      let btnCenter = await btn.getBoundsCenter()
      let options: window.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true,
        modalityType: window.ModalityType.APPLICATION_MODALITY
      };
      try {
        windowStage.createSubWindowWithOptions('mySubWindow', options).then(async (windowClass) => {
          console.info(`${message} setSubWindowModal success`)
          await windowClass.setUIContent('testability/pages/Index')
          await windowClass.resizeAsync(400, 500)
          await windowClass.moveWindowToAsync(100, 400)
          await windowClass.showWindow()
          await driver.click(btnCenter.x, btnCenter.y)
          let btnText = await btn.getText()
          console.info(`${message} btnText = ${btnText}, expect Modality`)
          expect(btnText).assertEqual('Modality')
          windowClass.destroyWindow()
        }).catch((err: BusinessError) => {
          if (err.code == 401 || err.code == 801) {
            console.info(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}.`);
            expect(false).assertFalse()
          } else {
            console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail()
          }
        });
      } catch (exception) {
        if (exception.code == 801) {
          console.info(`${message} Failed to set subwindow modal. Cause code: ${exception.code}, message: ${exception.message}.`);
          expect(false).assertFalse()
        } else {
          console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
        }
      }
      done()
    })

    /**
     * @tc.number    : testCreateSubWindowWithOptionsModalityType_0200
     * @tc.name      : testCreateSubWindowWithOptionsModalityType_0200
     * @tc.desc      : Test the function value of setWindowTitleMoveEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindowWithOptionsModalityType_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testCreateSubWindowWithOptionsModalityTypeTest_0300';
      let options: window.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: false,
        modalityType: window.ModalityType.APPLICATION_MODALITY
      };
      try {
        windowStage.createSubWindowWithOptions('mySubWindow', options).then(() => {
          console.info(`${message} setSubWindowModal success`)
          expect().assertFail()
        }).catch((err: BusinessError) => {
          if (err.code == 401) {
            console.info(`${message}  Parameter error.`);
            expect(false).assertFalse()
          } else {
            console.error(`${message} Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail()
          }
        });
      } catch (exception) {
        if (exception.code == 401) {
          console.info(`${message}  Parameter error.`);
          expect(false).assertFalse()
        } else {
          console.error(`${message} Failed to create the subWindow. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail()
        }
      }
      done()
    })

    

    /**
     * @tc.number    : testSetResizeByDragEnabledTrue_0200
     * @tc.name      : testSetResizeByDragEnabledTrue_0200
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetResizeByDragEnabledTrue_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetResizeByDragEnabledTrueTest_0200';
      if (isPCStatus != '') {
        try {
          let options: window.SubWindowOptions = {
            title: 'subWindow',
            decorEnabled: true
          };
          windowStage.createSubWindowWithOptions('subWindow', options).then(async (subWindowClass) => {
            subWindowClass.setUIContent("testability/pages/Index");
            await subWindowClass.resizeAsync(1000, 1200)
            await subWindowClass.moveWindowToAsync(300, 200)
            await subWindowClass.showWindow()
            let enabled = true;
            let promise = subWindowClass.setResizeByDragEnabled(enabled);
            promise.then(async () => {
              console.info(`${message} Succeeded in setting the function of disabling the resize by drag window.`);
              let windowPoint = subWindowClass.getWindowProperties().windowRect
              console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
              let driver =  Driver.create()
              await driver.mouseMoveTo({x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 5})
              await sleep(1000)
              await driver.mouseDrag({x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 5}, {x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 100},2000)
              await sleep(1000)
              let windowPointDragged = subWindowClass.getWindowProperties().windowRect
              console.info(`${message} windowPointDraged = ${JSON.stringify(windowPointDragged)}`)
              expect(windowPointDragged.width).assertEqual(windowPoint.width)
              expect(windowPointDragged.height).assertEqual(windowPoint.height - 95)
              done()
            }).catch((err: BusinessError) => {
              if (err.code == 801) {
                console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
                expect(false).assertFalse();
                done();
              } else {
                console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`)
                expect().assertFail();
                done();
              }
            });
          })
        } catch (exception) {
          console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
          expect().assertFail();
          done();
        }
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testSetResizeByDragEnabledFalse_0100
     * @tc.name      : testSetResizeByDragEnabledFalse_0100
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetResizeByDragEnabledFalse_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetResizeByDragEnabledFalseTest_0100';
      let windowClass = windowStage.getMainWindowSync()
      if (isPCStatus != '') {
        try {
          let enabled = false;
          let promise = windowClass.setResizeByDragEnabled(enabled);
          promise.then(async () => {
            console.info(`${message} Succeeded in setting the function of disabling the resize by drag window.`);
            let windowPoint = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
            let driver =  Driver.create()
            await driver.mouseMoveTo({x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 5})
            await sleep(1000)
            await driver.mouseDrag({x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 5}, {x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top - 100})
            await sleep(1000)
            let windowPointDragged = windowClass.getWindowProperties().windowRect
            console.info(`${message} windowPointDraged = ${JSON.stringify(windowPointDragged)}`)
            expect(windowPointDragged.width).assertEqual(windowPoint.width)
            expect(windowPointDragged.height).assertEqual(windowPoint.height)
            done()
          }).catch((err: BusinessError) => {
            if (err.code == 801) {
              console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
              expect(false).assertFalse();
              done();
            } else {
              console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`)
              expect().assertFail();
              done();
            }
          });
        } catch (exception) {
          console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
          expect().assertFail();
          done();
        }
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testSetResizeByDragEnabledFalse_0200
     * @tc.name      : testSetResizeByDragEnabledFalse_0200
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetResizeByDragEnabledFalse_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetResizeByDragEnabledFalseTest_0200';
      if (isPCStatus != '') {
        let options: window.SubWindowOptions = {
          title: 'subWindow',
          decorEnabled: true
        };
        windowStage.createSubWindowWithOptions('subWindow', options).then(async (subWindowClass) => {
          await subWindowClass.setUIContent("testability/pages/Index");
          await subWindowClass.resizeAsync(1000, 1200)
          await subWindowClass.moveWindowToAsync(300, 200)
          await subWindowClass.showWindow()
          try {
            let enabled = false;
            subWindowClass.setResizeByDragEnabled(enabled, async (err) => {
              if (err.code == 801) {
                console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
                expect(false).assertFalse();
                done();
              } else if (err.code && err.code != 801) {
                console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${err.code}, message: ${err.message}`)
                expect().assertFail();
                done();
              }
              console.info(`${message} Succeeded in setting the function of disabling the resize by drag window.`);
              let windowPoint = subWindowClass.getWindowProperties().windowRect
              console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`)
              let driver = Driver.create()
              await driver.mouseMoveTo({x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 5})
              await sleep(1000)
              await driver.mouseDrag({x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 5}, {x: windowPoint.left + windowPoint.width / 2, y: windowPoint.top + 100})
              await sleep(1000)
              let windowPointDragged = subWindowClass.getWindowProperties().windowRect
              console.info(`${message} windowPointDraged = ${JSON.stringify(windowPointDragged)}`)
              expect(windowPointDragged.width).assertEqual(windowPoint.width)
              expect(windowPointDragged.height).assertEqual(windowPoint.height)
              done()
            });
          } catch (exception) {
            console.error(`${message} Failed to check whether the window support the rect auto-save. Cause code: ${exception.code}, message: ${exception.message}`)
            expect().assertFail();
            done();
          }
        })
      } else {
        console.info(`${message} not support`);
        done()
      }
    })

    /**
     * @tc.number    : testSetWindowModalTrue
     * @tc.name      : testSetWindowModalTrue
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowModalTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetWindowModalTrueTest';
      let windowClass = windowStage.getMainWindowSync()
      await windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let windowRect = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowRect = ${JSON.stringify(windowRect)}`)
      let driver = Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(1500)
      let btnPoint = await btn.getBoundsCenter()
      let windowStageStart = await startAbility(message, context)
      try {
        let promise = windowStageStart.setWindowModal(true);
        promise.then(async () => {
          console.info(`${message} Succeeded in setting window modal`);
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.resizeAsync(700, 800)
          await windowClassStart.moveWindowToAsync(400, 400)
          await driver.click(btnPoint.x, btnPoint.y)
          await sleep(1000)
          let btnTest = await btn.getText()
          console.info(`${message} btnTest = ${btnTest}, expect Modality`);
          expect(btnTest).assertEqual('Modality')
          let testWindow = await driver.findWindow({
            actived: true
          });
          await sleep(1000)
          let windowPoint = await testWindow.getBounds()
          console.info(`${message} window width = ${windowPoint.bottom - windowPoint.top}, expect 800`);
          console.info(`${message} window height = ${windowPoint.right - windowPoint.left}, expect 700`);
          expect(windowPoint.bottom - windowPoint.top).assertEqual(800)
          expect(windowPoint.right - windowPoint.left).assertEqual(700)
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
            expect(false).assertFalse();
            done();
          } else {
            console.error(`${message} Failed to set window modal. Cause code: ${err.code}, message: ${err.message}`)
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        if (exception.code == 801) {
          console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
          expect(false).assertFalse();
          done();
        } else {
          console.error(`${message} Failed to set window modal. Cause code: ${exception.code}, message: ${exception.message}`)
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : testSetWindowModalFalse
     * @tc.name      : testSetWindowModalTrue
     * @tc.desc      :
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowModalFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetWindowModalFalseTest';
      let windowClass = windowStage.getMainWindowSync()
      await windowClass.setUIContent('testability/pages/WindowTest/Modality')
      let windowRect = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowRect = ${JSON.stringify(windowRect)}`)
      let driver = Driver.create()
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(1000)
      let btnPoint = await btn.getBoundsCenter()
      let windowStageStart = await startAbility(message, context)
      try {
        let promise = windowStageStart.setWindowModal(false);
        promise.then(async () => {
          console.info(`${message} Succeeded in setting window modal`);
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.resizeAsync(700, 800)
          await windowClassStart.moveWindowToAsync(400, 400)
          await driver.click(btnPoint.x, btnPoint.y)
          await sleep(1000)
          let btnTest = await btn.getText()
          console.info(`${message} btnTest = ${btnTest}, expect Clicked`);
          expect(btnTest).assertEqual('Clicked')
          let testWindow = await driver.findWindow({
            actived: true
          });
          await sleep(1000)
          let windowPoint = await testWindow.getBounds()
          console.info(`${message} window width = ${windowPoint.bottom - windowPoint.top}, expect ${windowRect.height}`);
          console.info(`${message} window height = ${windowPoint.right - windowPoint.left}, expect ${windowRect.width}`);
          expect(windowPoint.bottom - windowPoint.top).assertEqual(windowRect.height)
          expect(windowPoint.right - windowPoint.left).assertEqual(windowRect.width)
          done()
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
            expect(false).assertFalse();
            done();
          } else {
            console.error(`${message} Failed to set window modal. Cause code: ${err.code}, message: ${err.message}`)
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        if (exception.code == 801) {
          console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
          expect(false).assertFalse();
          done();
        } else {
          console.error(`${message} Failed to set window modal. Cause code: ${exception.code}, message: ${exception.message}`)
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0100
     * @tc.name      : test_setSupportedWindowModes_threeElement
     * @tc.desc      : 传参三个元素
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_setSupportedWindowModes_threeElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_setSupportedWindowModes_threeElement'
        let windowStageStart = await startAbility(message, context)
        let promise = windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.SPLIT, bundleManager.SupportWindowMode.FLOATING]);
        promise.then(() => {
          console.info('Succeed in setting window support modes');
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0200
     * @tc.name      : test_setSupportedWindowModes_fourSameElement
     * @tc.desc      : 传参4个fullscreen，验证成功设置和801
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0300
     * @tc.name      : test_setSupportedWindowModes_fiveElement
     * @tc.desc      : 传参列表5个元素，验证401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0400
     * @tc.name      : test_setSupportedWindowModes_nullElement
     * @tc.desc      : 传参[]，验证401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0500
     * @tc.name      : test_setSupportedWindowModes_onlySplit
     * @tc.desc      : 传参[split]，验证401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0600
     * @tc.name      : test_setSupportedWindowModes_afterTerminateAbility
     * @tc.desc      : 销毁ability, 验证1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        if (err.code == 1300002) {
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
      ;
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SET_SUPPORTED_WINDOW_MODES_0700
     * @tc.name      : test_setSupportedWindowModes_modeChange_isImmersive
     * @tc.desc      : [full_screen] ——> [float] ——> [full_screen],验证设置后mode和沉浸式改变
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          expect(isImmersive_primary).assertTrue();
        }).catch((err: BusinessError) => {
          console.error(`${message} primary Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            expect(true).assertTrue();
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
          expect(status_float).assertEqual(window.WindowStatusType.FLOATING);
        }).catch((err: BusinessError) => {
          console.error(`${message} float Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          done();
        });

        let promise_fullscreen =
          windowStageStart.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN]);
        promise_fullscreen.then(() => {
          console.info('Succeed in setting window support modes');
          expect(true).assertTrue();
          let status_fullscreen = windowStageStart.getMainWindowSync().getWindowStatus();
          console.info(`${message} status_fullscreen:${status_fullscreen}, window.WindowStatusType.FULL_SCREEN:${window.WindowStatusType.FULL_SCREEN}`);
          expect(status_fullscreen).assertEqual(window.WindowStatusType.FULL_SCREEN);
          let isImmersive_fullscreen = windowStageStart.getMainWindowSync().getImmersiveModeEnabledState();
          expect(isImmersive_fullscreen).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(`${message} fullscreen Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (err.code == 801) {
            console.error(`The device not support setSupportedWindowModes`);
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0100
     * @tc.name      : test_createSubWindowWithOptions_windowRect_negativeLeftTop_minWidthHeight
     * @tc.desc      : LeftTop为负整数，WidthHeight为最小值
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
            expect(true).assertTrue();
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801 || err.code == 401) {
          expect(true).assertTrue()
        } else {
          expect().assertFail()
        }
        done();
      }
      ;
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0200
     * @tc.name      : test_createSubWindowWithOptions_windowRect_positiveLeftTop_maxWidthHeight
     * @tc.desc      : LeftTop为正整数，WidthHeight为最大值
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_createSubWindowWithOptions_windowRect_positiveLeftTop_maxWidthHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        const message = 'test_createSubWindowWithOptions_windowRect_positiveLeftTop_maxWidthHeight';
        let limit = context.windowStage.getMainWindowSync().getWindowLimits();
        let options: window.SubWindowOptions = {
          title: 'subwindow0',
          decorEnabled: false,
          windowRect: {
            left: 10000,
            top: 10000,
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
            expect(true).assertTrue();
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          expect(true).assertTrue()
        } else {
          expect().assertFail()
        }
        done();
      }
      ;
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0300
     * @tc.name      : test_createSubWindowWithOptions_windowRect_801
     * @tc.desc      : LeftTop为正整数，验证801
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_createSubWindowWithOptions_windowRect_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0400
     * @tc.name      : test_createSubWindowWithOptions_windowRect_floatLeftTop_floatWidthHeight
     * @tc.desc      : LeftTop为浮点数，WidthHeight为浮点数
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
            width: Number(limit.maxWidth)-0.1,
            height: Number(limit.maxHeight)-0.1
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
            expect(true).assertTrue();
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          expect(true).assertTrue()
        } else {
          expect().assertFail()
        }
        done();
      }
      ;
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0500
     * @tc.name      : test_createSubWindowWithOptions_windowRect_0LeftTop_0WidthHeight
     * @tc.desc      : LeftTop为0，WidthHeight为0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
            expect(true).assertTrue();
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 401 || err.code == 801) {
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
      ;
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0600
     * @tc.name      : test_createSubWindowWithOptions_windowRect_maxAboveWidthHeight
     * @tc.desc      : LeftTop为正整数，WidthHeight为最大值+1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
          expect(Number(options.windowRect?.width)-1).assertEqual(Number(windowRealRect.width));
          expect(Number(options.windowRect?.height)-1).assertEqual(Number(windowRealRect.height));
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801) {
            expect(true).assertTrue();
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          expect(true).assertTrue();
          console.error(`The device not support getWindowLimits`);
        } else {
          expect().assertFail();
        }
        done();
      }
      ;
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0700
     * @tc.name      : test_createSubWindowWithOptions_windowRect_followMinWidthHeight
     * @tc.desc      : LeftTop为正整数，WidthHeight为最小值-1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     *
     * @tc.level     : Level3
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
          expect(Number(options.windowRect?.width)+1).assertEqual(Number(windowRealRect.width));
          expect(Number(options.windowRect?.height)+1).assertEqual(Number(windowRealRect.height));
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to create the subwindow, promise cause code: ${err.code}, message: ${err.message} `)
          if (err.code == 801) {
            expect(true).assertTrue();
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          expect(true).assertTrue()
        } else {
          expect().assertFail()
        }
        done();
      }
      ;
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_OPTION_ADD_PARAMETER_WINDOW_RECT_0800
     * @tc.name      : test_createSubWindowWithOptions_windowRect_NaNLeftTopWidthHeight
     * @tc.desc      : LeftTop为NaN，WidthHeight为NaN
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
            expect(true).assertTrue();
            console.error(`The device not support createSubWindowWithOptions`);
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.error(`Failed to create the subwindow, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 401) {
          expect(true).assertTrue()
        } else {
          expect().assertFail()
        }
        done();
      }
      ;
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0100
     * @tc.name      : test_on_windowWillClose_resolve_true
     * @tc.desc      : resolve为true,验证窗口不销毁
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_resolve_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_resolve_true'
      let result: boolean = false;
      const callback = () => {
        return new Promise<boolean>((resolve, reject) => {
          result = true;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        windowClassStart.on('windowWillClose', callback);
        let driver: Driver = Driver.create()
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
        done();
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 801) {
          expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0200
     * @tc.name      : test_on_windowWillClose_resolve_false
     * @tc.desc      : resolve为false,验证窗口销毁
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_resolve_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_resolve_false'
      let result: boolean = true;
      let windowName: string | undefined;
      const callback = () => {
        return new Promise<boolean>((resolve, reject) => {
          result = false;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        windowClassStart.on('windowWillClose', callback);
        let driver: Driver = Driver.create()
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
          expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0300
     * @tc.name      : test_on_windowWillClose_executeAfterOff
     * @tc.desc      : 回调执行过程中执行off，验证1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_executeAfterOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_executeAfterOff'
      let result: boolean = true;
      const callback = async () => {
        console.log(`${message} enter callback`)
        await sleep(3000);
        return new Promise<boolean>((resolve, reject) => {
          console.log(`${message} callback return`)
          result = false;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        windowClassStart.on('windowWillClose', callback);
        let driver: Driver = Driver.create()
        let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
        await button.click();
        await sleep(1000);
        let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
        AppStorage.setOrCreate('startNum', startNum - 1);
        windowClassStart.off('windowWillClose', callback);
        console.log(`${message} succeed off listen`)
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${message} Failed to register callback, Cause code ${err.code}, message ${err.message} `);
        if (err.code == 1300002 || err.code == 801) {
          expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0400
     * @tc.name      : test_on_windowWillClose_offWithoutOn
     * @tc.desc      : 不注册，执行off
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_offWithoutOn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_offWithoutOn'
      if (isPCStatus == '' && isAutoWindow != 'true') {
        expect(true).assertTrue();
        done();
      } else {
        try {
          let windowStageStart = await startAbility(message, context);
          await sleep(10000);
          let windowClassFind = windowStageStart.getMainWindowSync();
          let windowName = windowClassFind.getUIContext().getWindowName();
          windowClassFind.off('windowWillClose');
          let driver: Driver = Driver.create();
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0500
     * @tc.name      : test_on_windowWillClose_reject
     * @tc.desc      : 执行reject
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_reject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_reject';
      let windowName: string | undefined;
      const callback = () => {
        return new Promise<boolean>((resolve, reject) => {
          reject();
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        windowClassStart.on('windowWillClose', callback);
        let driver: Driver = Driver.create()
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
          expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0600
     * @tc.name      : test_on_windowWillClose_multiOn_UniqueOff
     * @tc.desc      : 注册多个，取消一个
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_multiOn_UniqueOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_multiOn_UniqueOff';
      let windowName: string | undefined;
      let result: boolean = true;
      const callback1 = () => {
        return new Promise<boolean>((resolve, reject) => {
          result = false;
          resolve(result);
        })
      }
      const callback2 = () => {
        return new Promise<boolean>((resolve, reject) => {
          let result: boolean = true;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync()
        let windowName = windowClassStart.getUIContext().getWindowName();
        windowClassStart.on('windowWillClose', callback1);
        windowClassStart.on('windowWillClose', callback2);
        windowClassStart.off('windowWillClose', callback2);
        let driver: Driver = Driver.create()
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
          expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0700
     * @tc.name      : test_on_windowWillClose_multiOn_AllOff
     * @tc.desc      : 注册多个，off所有
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_multiOn_AllOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_multiOn_AllOff';
      let windowName: string | undefined;
      let result: boolean = false;
      const callback1 = () => {
        return new Promise<boolean>((resolve, reject) => {
          result = false;
          resolve(result);
        })
      }
      const callback2 = () => {
        return new Promise<boolean>((resolve, reject) => {
          result = true;
          resolve(result);
        })
      }
      try {
        let windowStageStart = await startAbility(message, context);
        let windowClassStart = windowStageStart.getMainWindowSync();
        let windowName = windowClassStart.getUIContext().getWindowName();
        windowClassStart.on('windowWillClose', callback1);
        windowClassStart.on('windowWillClose', callback2);
        windowClassStart.off('windowWillClose');
        let driver: Driver = Driver.create()
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
          expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0800
     * @tc.name      : test_on_windowWillClose_subWindow_result_false
     * @tc.desc      : 子窗result为false,验证窗口销毁
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_subWindow_result_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_subWindow_result_false'
      let result: boolean = true;
      const callback = () => {
        return new Promise<boolean>((resolve, reject) => {
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
        await promise.then(async (data) => {
          const subWindowClass = data;
          subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowWillClose', callback);
          let driver: Driver = Driver.create();
          let button = await driver.findComponent(ON.id('EnhanceCloseBtn'))
          await button.click()
          await sleep(1000);
          try {
            window.findWindow('subwindow0');
            console.info(`subwindow0 is existing`);
            subWindowClass.off('windowWillClose');
            expect().assertFail();
          } catch (exception) {
            console.info(`subwindow0 is not existing`);
          }
          expect(result).assertFalse();
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_0900
     * @tc.name      : test_on_windowWillClose_subWindow_result_true
     * @tc.desc      : 子窗result为true,验证窗口不销毁
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_subWindow_result_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_subWindow_result_true'
      let result: boolean = false;
      const callback = () => {
        return new Promise<boolean>((resolve, reject) => {
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
          subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowWillClose', callback);
          let driver: Driver = Driver.create();
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_1000
     * @tc.name      : test_on_windowWillClose_subWindow_reject
     * @tc.desc      : 子窗reject,验证窗口销毁
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_subWindow_reject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_subWindow_reject'
      const callback = () => {
        return new Promise<boolean>((resolve, reject) => {
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
          subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowWillClose', callback);
          let driver: Driver = Driver.create();
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
            expect(true).assertTrue();
          }
          ;
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_ON_WINDOW_WILL_CLOSE_1100
     * @tc.name      : test_on_windowWillClose_minimize_maximize_recover_beforeOff
     * @tc.desc      : 销毁前最大化、最小化、还原
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_on_windowWillClose_minimize_maximize_recover_beforeOff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_on_windowWillClose_minimize_maximize_recover_beforeOff'
      let windowName: string | undefined;
      let result: boolean = true;
      const callback = () => {
        return new Promise<boolean>(async (resolve, reject) => {
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
        windowClassStart.on('windowWillClose', callback);
        let driver: Driver = Driver.create()
        let button = await driver.findComponent(ON.id('EnhanceCloseBtn'));
        await button.click();
        let startNum = (AppStorage.get('startNum') ? AppStorage.get('startNum') : 0) as number;
        AppStorage.setOrCreate('startNum', startNum - 1);
        let promise1 = windowClassStart.minimize();
        await promise1.then(() => {
          console.info(`${message} succeed minimize window`);
          expect(true).assertTrue();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to minimize window, Cause code ${err.code}, message ${err.message} `);
          expect().assertFail();
          done();
        });
        let promise2 = windowClassStart.maximize();
        await promise2.then(() => {
          console.info(`${message} succeed maximize window`);
          expect(true).assertTrue();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to maximize window, Cause code ${err.code}, message ${err.message} `);
          expect().assertFail();
          done();
        });
        let promise3 = windowClassStart.recover();
        await promise3.then(() => {
          console.info(`${message} succeed recover window`);
          expect(true).assertTrue();
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
          expect(true).assertTrue();
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
     * @tc.number     : SUB_BASIC_WMS_MOVE_CONFIGURATION_0100
     * @tc.name       : test_MoveConfiguration
     * @tc.desc       : 验证moveWindowToAsync参数MoveConfiguration
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_MoveConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (isPCStatus == '' && isAutoWindow != 'true') {
        expect(true).assertTrue();
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
     * @tc.number     : SUB_BASIC_WMS_MOVE_GLOBAL_0100
     * @tc.name       : test_moveWindowToGlobal_moveConfiguration
     * @tc.desc       : 验证moveWindowToGlobal参数MoveConfiguration
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_moveWindowToGlobal_moveConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_moveWindowToGlobal_moveConfiguration!'
      let options: window.SubWindowOptions = {
        title: message,
        decorEnabled: true,
      };
      try {
        let promise = context.windowStage.createSubWindowWithOptions(message, options)
        promise.then(async (data) => {
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving');
          await subWindowClass.showWindow();
          let displayId = subWindowClass.getWindowProperties().displayId;
          let moveConfiguration: window.MoveConfiguration = {
            displayId: displayId
          }
          let promise = subWindowClass.moveWindowToGlobal(300, 300, moveConfiguration);
          promise.then(async () => {
            console.info(`${message} succeed in moveWindowToGlobal`);
          }).catch((err: BusinessError) => {
            console.error(`${message} promise Failed to moveWindowToGlobal, Cause code ${err.code}, message ${err.message} `);
            expect(err.code).assertEqual(801);
            done();
          });
          await sleep(1000);
          let rect = subWindowClass.getWindowProperties().windowRect;
          console.info(`${message} after moving windowRect:${JSON.stringify(rect)}`);
          expect(rect.left).assertEqual(300);
          expect(rect.top).assertEqual(300);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to test MoveConfiguration, Cause code ${err.code}, message ${err.message} `);
          if (err.code == 1300002 || err.code == 801){
            expect(true).assertTrue();
          } else {
            expect().assertFail();
          }
          done();
        });
      } catch (err) {
        console.log(`${message} Failed to test MoveConfiguration.errcode:${err.code}, Cause:${JSON.stringify(err.message)}`)
        expect().assertFail();
        done();
      }

    });

    /**
     * @tc.number     : SUB_BASIC_WMS_ON_SUB_WINDOW_CLOSE_0100
     * @tc.name       : test_on_subWindowClose
     * @tc.desc       : 验证test_on_subWindowClose，result为false
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_on_subWindowClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (isPCStatus == '' && isAutoWindow != 'true') {
        expect(true).assertTrue();
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
            subWindowClass.showWindow();
            await sleep(1000);
            subWindowClass.on("subWindowClose", callback);
            let driver: Driver = Driver.create();
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
              expect(true).assertTrue();
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
     * @tc.number     : SUB_BASIC_WMS_ON_SUB_WINDOW_CLOSE_0200
     * @tc.name       : test_off_subWindowClose
     * @tc.desc       :  验证test_off_subWindowClose，result为true
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_off_subWindowClose', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      if (isPCStatus == '' && isAutoWindow != 'true') {
        expect(true).assertTrue();
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
            subWindowClass.showWindow();
            await sleep(1000);
            subWindowClass.on("subWindowClose", callback);
            let driver: Driver = Driver.create();
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
              expect(true).assertTrue();
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
     * @tc.number     : SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_0100
     * @tc.name       : test_setStatusBarColor_401
     * @tc.desc       : setStatusBarColor接口验证401
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setStatusBarColor_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setStatusBarColor_401!'
      try {
        let promise = mainWindowClass.setStatusBarColor(null);
        promise.then(() => {
          console.info(`${message} succeed setStatusBarColor`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_0200
     * @tc.name       : test_setStatusBarColor_801
     * @tc.desc       : setStatusBarColor接口验证801
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setStatusBarColor_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setStatusBarColor_801!'
      try {
        let promise = mainWindowClass.setStatusBarColor(ColorMetrics.rgba(1, 1, 1));
        promise.then(() => {
          console.info(`${message} succeed setStatusBarColor`);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0100
     * @tc.name       : test_setSystemAvoidAreaEnabled_ErrorCode_401
     * @tc.desc       : setSystemAvoidAreaEnabled接口验证401
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_ErrorCode_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_401!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await data.setUIContent('testability/pages/WindowTest/StartMoving')
          await data.showWindow();
          await sleep(1000)
          try {
            let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(null);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect().assertFail();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(err.code).assertEqual(801);
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect(err.code).assertEqual(401);
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0200
     * @tc.name       : test_setSystemAvoidAreaEnabled_ErrorCode_801
     * @tc.desc       : setSystemAvoidAreaEnabled接口验证801
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_ErrorCode_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_801!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await data.setUIContent('testability/pages/WindowTest/StartMoving')
          await data.showWindow();
          await sleep(1000)
          try {
            let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(true);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(true).assertTrue();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(err.code).assertEqual(801);
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect().assertFail();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0300
     * @tc.name       : test_setSystemAvoidAreaEnabled_ErrorCode_1300002
     * @tc.desc       : setSystemAvoidAreaEnabled接口验证1300002
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_ErrorCode_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_1300002!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/WindowTest/StartMoving')
          await dialogWindowClass.showWindow();
          await sleep(1000)
          await dialogWindowClass?.destroyWindow();
          await sleep(1000);
          try {
            let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(true);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              expect().assertFail();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              expect(err.code == 801 || err.code ==1300002).assertTrue();
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            expect().assertFail();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_ErrorCode_0400
     * @tc.name       : test_setSystemAvoidAreaEnabled_ErrorCode_1300004
     * @tc.desc       : setSystemAvoidAreaEnabled接口验证1300004
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_ErrorCode_1300004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_ErrorCode_1300004!'
      try {
        let promise = windowStage.createSubWindow(message)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let subWindowClass = data;
          await subWindowClass.setUIContent('testability/pages/WindowTest/StartMoving')
          await subWindowClass.showWindow();
          await sleep(1000)
          try {
            let promise1 = subWindowClass.setSystemAvoidAreaEnabled(true);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              await subWindowClass?.destroyWindow();
              await sleep(1000);
              expect().assertFail();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              await subWindowClass?.destroyWindow();
              await sleep(1000);
              expect(err.code == 801 || err.code ==1300004).assertTrue();
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await subWindowClass?.destroyWindow();
            await sleep(1000);
            expect().assertFail();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_setSystemAvoidAreaEnabled_0100
     * @tc.name       : test_setSystemAvoidAreaEnabled_dialog
     * @tc.desc       : dialog调用setSystemAvoidAreaEnabled接口
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setSystemAvoidAreaEnabled_dialog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setSystemAvoidAreaEnabled_dialog!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/WindowTest/StartMoving')
          await dialogWindowClass.showWindow();
          await sleep(1000)
          try {
            expect(dialogWindowClass.isSystemAvoidAreaEnabled()).assertEqual(false)
            let promise1 = dialogWindowClass.setSystemAvoidAreaEnabled(true);
            promise1.then(async () => {
              console.info(`${message} succeed setSystemAvoidAreaEnabled`);
              expect(dialogWindowClass.isSystemAvoidAreaEnabled()).assertEqual(true);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(true).assertTrue();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${message} promise promise Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
              await dialogWindowClass?.destroyWindow();
              await sleep(1000);
              expect(err.code).assertEqual(801);
              done();
            })
          }catch (err) {
            console.error(`${message} Failed to setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect(err.code).assertEqual(801);
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test setSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0100
     * @tc.name       : test_isSystemAvoidAreaEnabled_801
     * @tc.desc       : isSystemAvoidAreaEnabled接口验证801
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_isSystemAvoidAreaEnabled_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_isSystemAvoidAreaEnabled_801!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/WindowTest/StartMoving')
          await dialogWindowClass.showWindow();
          await sleep(1000)
          try {
            expect(dialogWindowClass.isSystemAvoidAreaEnabled()).assertEqual(false)
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            done();
          }catch (err) {
            console.error(`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect(err.code).assertEqual(801);
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0200
     * @tc.name       : test_isSystemAvoidAreaEnabled_1300004
     * @tc.desc       : isSystemAvoidAreaEnabled接口验证1300004
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_isSystemAvoidAreaEnabled_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_isSystemAvoidAreaEnabled_1300004!'
      try {
        let promise = windowStage.createSubWindow(message)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/WindowTest/StartMoving')
          await dialogWindowClass.showWindow();
          await sleep(1000)
          try {
            dialogWindowClass.isSystemAvoidAreaEnabled()
            console.info(`${message} succeed assert isSystemAvoidAreaEnabled`);
            await dialogWindowClass?.destroyWindow();
            await sleep(1000);
            expect().assertFail();
            done();
          }catch (err) {
            console.error(`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            await dialogWindowClass?.destroyWindow();
            console.info(`${message} after destroyWindow`);
            await sleep(1000);
            expect(err.code == 801 || err.code ==1300004).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_isSystemAvoidAreaEnabled_ErrorCode_0300
     * @tc.name       : test_isSystemAvoidAreaEnabled_1300002
     * @tc.desc       : isSystemAvoidAreaEnabled接口验证1300002
     * @tc.size       : MediumTestTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_isSystemAvoidAreaEnabled_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_isSystemAvoidAreaEnabled_1300002!'
      let config: window.Configuration = {
        name: message,
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      }
      try {
        let promise = window.createWindow(config)
        promise.then(async (data) => {
          console.info(`${message} succeed createWindow`);
          let dialogWindowClass = data;
          await dialogWindowClass.setUIContent('testability/pages/WindowTest/StartMoving')
          await dialogWindowClass.showWindow();
          await sleep(1000);
          await dialogWindowClass?.destroyWindow();
          await sleep(1000);
          try {
            dialogWindowClass.isSystemAvoidAreaEnabled();
            console.info(`${message} succeed assert isSystemAvoidAreaEnabled`);
            expect().assertFail();
            done();
          }catch (err) {
            console.error(`${message} Failed to assert isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
            expect(err.code == 801 || err.code ==1300002).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to createWindow, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to test isSystemAvoidAreaEnabled, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });
    


  })
}