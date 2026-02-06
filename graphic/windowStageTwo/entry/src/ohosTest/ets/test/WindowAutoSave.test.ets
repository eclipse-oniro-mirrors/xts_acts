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

async function startAbility2(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let key1 = 'AAAABBBBtest1';
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility2',
    parameters: { // 自定义信息
      instanceKey: key1,
    }
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest2') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility2(caseName: string) {
  let pageContext = AppStorage.get('contextTest2') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}


export default function windowAutoSaveTest() {
  describe('windowAutoSaveTest', () => {
    // let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let isPCStatus: string = '';
    let mainWindowClass:ohosWindow.Window;
    let isAutoWindow:string = '';
    let isFreeWindowMode = false;
    let isPCMode:boolean = false;
    let isSupportFreeWindowMode:boolean = false;
    let driver: Driver;
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
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.USER_PROPERTY);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      let promise = mainWindowClass.getWindowStateSnapshot();
        promise.then((data) => {
          let jsonObj: object = JSON.parse(data);
          console.info(`beforeAll: Succeeded. data=${data}, isPcMod=${jsonObj["isPcMode"]},isSupportFreeWindowMode=${jsonObj["isSupportFreeWindowMode"]}`);
          isPCMode = jsonObj["isPcMode"];
          isSupportFreeWindowMode = jsonObj["isSupportFreeWindowMode"];
        }).catch((err: BusinessError) => {
          console.error(`beforeAll: getWindowStateSnapshot Failed. Cause code: ${err.code}, cancel message: ${err.message}`);
        });
        console.info(`beforeAll: isPCMode=${isPCMode}`);
      driver = Driver.create();
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
     * @tc.name   testSetWindowRectAutoSaveTrue_0100
     * @tc.number testSetWindowRectAutoSaveTrue_0100
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }
          else {
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
     * @tc.name   testSetWindowRectAutoSaveTrue_0200
     * @tc.number testSetWindowRectAutoSaveTrue_0200
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSaveTrue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestTrue_0200';
      // 拉起Ability
      if(isPCStatus != '' || isPCMode == true){
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
          
          await mainWindowClass.recover();
          
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
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
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
    }else{
      done();
    }

    })

    /**
     * @tc.name   testSetWindowRectAutoSaveTrue_0300
     * @tc.number testSetWindowRectAutoSaveTrue_0300
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
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
     * @tc.name   testSetWindowRectAutoSaveTrue_0400
     * @tc.number testSetWindowRectAutoSaveTrue_0400
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
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
     * @tc.name   testSetWindowRectAutoSaveTrue_0500
     * @tc.number testSetWindowRectAutoSaveTrue_0500
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
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
     * @tc.name   testSetWindowRectAutoSaveTrue_0600
     * @tc.number testSetWindowRectAutoSaveTrue_0600
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
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
     * @tc.name   testSetWindowRectAutoSaveTrue_0700
     * @tc.number testSetWindowRectAutoSaveTrue_0700
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          if(isFreeWindowMode){
            await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          }else{
            await terminateAbility(message);
          }
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
          if(isFreeWindowMode){
            expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE) 
            //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
            expect(isLayoutFullScreen).assertFalse()
            done()
          }else{
            expect(windowStatusType).assertEqual(window.WindowStatusType.FULL_SCREEN) 
            //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
            expect(isLayoutFullScreen).assertEqual(false)
            done()
          }
          
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
     * @tc.name   testSetWindowRectAutoSaveTrue_0800
     * @tc.number testSetWindowRectAutoSaveTrue_0800
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          if(isFreeWindowMode){
            await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          }else{
            await terminateAbility(message);
          }
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
          if(isFreeWindowMode){
            expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE) 
            //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
            expect(isLayoutFullScreen).assertFalse()
            done()
          }else{
            expect(windowStatusType).assertEqual(window.WindowStatusType.FULL_SCREEN) 
            //开发不兼容变更，附下changelog：https://gitee.com/openharmony/docs/pulls/65733
            expect(isLayoutFullScreen).assertEqual(false)
            done()
          }
          
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
     * @tc.name   testSetWindowRectAutoSaveFalse_0100
     * @tc.number testSetWindowRectAutoSaveFalse_0100
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
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
     * @tc.name   testSetWindowRectAutoSaveFalse_0200
     * @tc.number testSetWindowRectAutoSaveFalse_0200
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSaveFalse_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'setWindowRectAutoSaveTestFalse_0200';
      // 拉起Ability
      if(isPCStatus != ''|| isPCMode == true){
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
          
          await mainWindowClass.recover();
          
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
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
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
    }else{
      done();
    }

    })

    /**
     * @tc.name   testSetWindowRectAutoSaveFalse_0300
     * @tc.number testSetWindowRectAutoSaveFalse_0300
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
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
     * @tc.name   testSetWindowRectAutoSaveFalse_0400
     * @tc.number testSetWindowRectAutoSaveFalse_0400
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
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
     * @tc.name   testSetWindowRectAutoSaveFalse_0500
     * @tc.number testSetWindowRectAutoSaveFalse_0500
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
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
     * @tc.name   testSetWindowRectAutoSaveFalse_0600
     * @tc.number testSetWindowRectAutoSaveFalse_0600
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
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
     * @tc.name   testSetWindowRectAutoSaveFalse_0700
     * @tc.number testSetWindowRectAutoSaveFalse_0700
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          if(isFreeWindowMode){
            await windowClassStart.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          }else{
            await terminateAbility(message);
          }
          
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
     * @tc.name   testSetWindowRectAutoSaveFalse_0800
     * @tc.number testSetWindowRectAutoSaveFalse_0800
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
          if(isFreeWindowMode){
            await windowClassStart.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          }else{
            await terminateAbility(message);
          }
          
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
     * @tc.name   test_setWindowRectAutoSave_401
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0100
     * @tc.desc   test_setWindowRectAutoSave_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setWindowRectAutoSave_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_setWindowRectAutoSave_401';
      console.log(caseName + 'begin');
      try{
        windowStage.setWindowRectAutoSave(null,null);
        expect().assertFail()
        done();
      } catch(err) {
        console.log(`${caseName} :setWindowRectAutoSave fail1:`+err.code);
        expect(err.code).assertEqual(401);
        done()
      }
    });

    /**
     * @tc.name   test_setWindowRectAutoSave_801
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0200
     * @tc.desc   test_setWindowRectAutoSave_801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setWindowRectAutoSave_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setWindowRectAutoSave_801';
      console.log(caseName + 'begin');
      try{
        windowStage.setWindowRectAutoSave(true, true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          done()
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          if (err.code === 801) {
            done();
          } else {
            expect().assertFail()
            done()
          }
        });
      } catch(err) {
        console.log(`${caseName} :setWindowRectAutoSave fail1:`+err.code);
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   test_setWindowRectAutoSave_1300002
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0300
     * @tc.desc   test_setWindowRectAutoSave_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setWindowRectAutoSave_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_setWindowRectAutoSave_1300002';
      console.log(caseName + 'begin');
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowStageStart = await startAbility2(caseName, context);
      await terminateAbility2(caseName);
      try {
        await windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowRectAutoSave.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowRectAutoSave. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done()
      }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0100
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0100
     * @tc.desc   test_SetWindowRectAutoSave_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SetWindowRectAutoSave_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0100 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          mainWindow.moveWindowToAsync(300, 400)
          mainWindow.resizeAsync(1000, 1200);
          await sleep(300);
          let windowRect1 = mainWindow.getWindowProperties().windowRect;
          console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
          await sleep(300);
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0200
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0200
     * @tc.desc   test_SetWindowRectAutoSave_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SetWindowRectAutoSave_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0200 ';
      console.log(caseName + 'begin');
      if(isPCStatus != ''|| isPCMode == true){
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200);
          let windowRect1 = mainWindow.getWindowProperties().windowRect;
          console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
          await sleep(300);
          // 二分屏
          let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
          await sleep(1000)
          let titlePoint = await title.getBounds()
          await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
          await sleep(1000)
          // 关闭Ability&退出分屏
          await driver.click(2340, 977);
          await terminateAbility2(caseName)
          
          await mainWindowClass.recover();
          
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    }else{
      done();
    }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0300
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0300
     * @tc.desc   test_SetWindowRectAutoSave_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SetWindowRectAutoSave_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0300 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          let windowRect1 = mainWindow.getWindowProperties().windowRect;
          console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
          await mainWindow.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          let windowStatusType = mainWindow2.getWindowStatus()
          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE)
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0400
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0400
     * @tc.desc   test_SetWindowRectAutoSave_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SetWindowRectAutoSave_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0400 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          let windowRect1 = mainWindow.getWindowProperties().windowRect;
          console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
          await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0500
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0500
     * @tc.desc   test_SetWindowRectAutoSave_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowRectAutoSave_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0500 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          let windowRect1 = mainWindow.getWindowProperties().windowRect;
          console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
          await mainWindow.minimize()
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0600
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0600
     * @tc.desc   test_SetWindowRectAutoSave_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowRectAutoSave_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0600 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0700
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0700
     * @tc.desc   test_SetWindowRectAutoSave_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowRectAutoSave_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0700 ';
      console.log(caseName + 'begin');
      if(isPCStatus != ''|| isPCMode == true){
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          // 二分屏
          let title = await driver.findComponent(ON.id('ContainerModalTitleRow'))
          await sleep(1000)
          let titlePoint = await title.getBounds()
          await driver.drag(titlePoint.left + 100, titlePoint.top + 10, 0, titlePoint.top + 10, 5000)
          await sleep(1000)
          // 关闭Ability&退出分屏
          await driver.click(2340, 977);
          await terminateAbility2(caseName)
          
          await mainWindowClass.recover();
          
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    }else{
      done();
    }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0800
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0800
     * @tc.desc   test_SetWindowRectAutoSave_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowRectAutoSave_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0800 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_0900
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_0900
     * @tc.desc   test_SetWindowRectAutoSave_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowRectAutoSave_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0900 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE)
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          }else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   test_SetWindowRectAutoSave_1000
     * @tc.number SUB_BASIC_WMS_SetWindowRectAutoSave_1000
     * @tc.desc   test_SetWindowRectAutoSave_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SetWindowRectAutoSave_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_1000 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let windowRect1 = mainWindow.getWindowProperties().windowRect;
        console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
        windowStageStart.setWindowRectAutoSave(false,false).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          await mainWindow.moveWindowToAsync(300, 400)
          await mainWindow.resizeAsync(1000, 1200)
          await mainWindow.minimize()
          await terminateAbility2(caseName)
          let windowStageStart2 = await startAbility2(caseName, context);
          let mainWindow2 = windowStageStart2.getMainWindowSync();
          let windowRect2 = mainWindow2.getWindowProperties().windowRect
          console.info(caseName + 'windowRect2: ' + JSON.stringify(windowRect2));
          expect(Math.abs(windowRect2.left-windowRect1.left)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-windowRect1.top)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-windowRect1.width)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-windowRect1.height)).assertLessOrEqual(1);
          await windowStageStart2.setWindowRectAutoSave(false,false);
          await terminateAbility2(caseName)
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          await terminateAbility2(caseName)
          if (err.code == 801) {
            console.info(caseName + 'this deviceType does not support the Capability.');
            done()
          } else if(!isFreeWindowMode){
            expect(err.code).assertEqual(1300010);
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await terminateAbility2(caseName)
        expect().assertFail()
        done()
      }
    });
   

    /**
     * @tc.name   testisWindowRectAutoSave
     * @tc.number testisWindowRectAutoSave
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testisWindowRectAutoSave', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'isWindowRectAutoSaveTest';
      windowStage.setWindowRectAutoSave(true)
      await sleep(1000);
      try {
        windowStage.isWindowRectAutoSave().then((result) => {
          console.info(`${message} isWindowRectAutoSave = ${result}, expect true.`)
          if(isFreeWindowMode || isSupportFreeWindowMode){
            expect(result).assertEqual(true);
          }else{
            expect(result).assertEqual(false);
          }
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
          expect(result).assertEqual(false);
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




  })
}