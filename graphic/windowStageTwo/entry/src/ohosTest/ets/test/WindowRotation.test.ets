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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import deviceInfo from '@ohos.deviceInfo';
import { display } from '@kit.ArkUI';
import { StartOptions,Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@kit.TestKit';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'NavtionStartAbility'
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
  let windowStageStart = AppStorage.get('windowStageStart') as window.WindowStage;
  return windowStageStart
}
async function startAbility1(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'NavtionStartAbility2'
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
  let windowStageStart = AppStorage.get('windowStageStart') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('pageContext') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function windowRotationTest() {
  describe('windowRotationTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    let isSupportRotate = false;
    let deviceType:string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    let driver = Driver.create();
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
      let mainWindow = windowStage.getMainWindowSync();
      await mainWindow.setPreferredOrientation(window.Orientation.PORTRAIT)
      await sleep(300);
      let Orientation1 = display.getDefaultDisplaySync().orientation;
      await mainWindow.setPreferredOrientation(window.Orientation.LANDSCAPE);
      await sleep(300);
      let Orientation2 = display.getDefaultDisplaySync().orientation;
      if(Orientation1 != Orientation2){
        isSupportRotate = true;
      }else{
        isSupportRotate = false;
      }
      await mainWindow.setPreferredOrientation(window.Orientation.PORTRAIT);
      await sleep(300);
      console.log(`beforeAll isSupportRotate: ${JSON.stringify(isSupportRotate)},Orientation1: ${JSON.stringify(Orientation1)},Orientation2: ${JSON.stringify(Orientation2)}`)
    });
    beforeEach(() => {
    });
    afterEach(async ()=>{
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
        console.log('afterEach fail cause'+error)
      }
    })
    afterAll(() => {
    });

    /**
     * @tc.name   test_RotationChange_0100
     * @tc.number SUB_BASIC_WMS_RotationChange_0100
     * @tc.desc   test_RotationChange_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_RotationChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0100';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowClass = windowStage.getMainWindowSync();
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
          };
        windowClass.on(null, rotationCallback);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   test_RotationChange_0200
     * @tc.number SUB_BASIC_WMS_RotationChange_0200
     * @tc.desc   test_RotationChange_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_RotationChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0200';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0200');
      await subWindowClass.destroyWindow();
      try {
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
          };
        subWindowClass.on('rotationChange', rotationCallback);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.name   test_RotationChange_0300
     * @tc.number SUB_BASIC_WMS_RotationChange_0300
     * @tc.desc   test_RotationChange_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_RotationChange_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0300';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowClass = windowStage.getMainWindowSync();
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
          };
        windowClass.off(null, rotationCallback);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   test_RotationChange_0400
     * @tc.number SUB_BASIC_WMS_RotationChange_0400
     * @tc.desc   test_RotationChange_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_RotationChange_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0400';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0200');
      await subWindowClass.destroyWindow();
      try {
        const rotationCallback: window.RotationChangeCallback<window.RotationChangeInfo, void> =
          (rotationInfo: window.RotationChangeInfo, rotationResult?: window.RotationChangeResult) => {
          };
        subWindowClass.off('rotationChange', rotationCallback);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        done();
      }
    });

    /**
     * @tc.name   test_RotationChange_0500
     * @tc.number SUB_BASIC_WMS_RotationChange_0500
     * @tc.desc   test_RotationChange_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0500';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let subWindowClass:window.Window = await windowStage.createSubWindow('test_RotationChange_0500');
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let rotationCallback = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 200,
              top: 200,
              width: subWindowLimits.minWidth as number,
              height: subWindowLimits.minHeight as number,
            }

            console.error(`${caseName} rotationInfo 1: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult 1: ${JSON.stringify(rotationResult)}`)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            sleep(2000)
            let subWindowProperties1 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties1.windowRect 1: ${JSON.stringify(subWindowProperties1.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(3)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            expect(rotationResult.rectType).assertEqual(window.RectType.RELATIVE_TO_SCREEN);
            expect(rotationResult.windowRect.left).assertEqual(200)
            expect(rotationResult.windowRect.top).assertEqual(200)
            expect(rotationResult.windowRect.width).assertEqual(subWindowLimits.minWidth);
            expect(rotationResult.windowRect.height).assertEqual(subWindowLimits.minHeight);
            return rotationResult;
          } else {
            rotationResult.rectType = window.RectType.RELATIVE_TO_PARENT_WINDOW;
            rotationResult.windowRect = {
              left: 500,
              top: 500,
              width: subWindowLimits.minWidth as number + 50,
              height: subWindowLimits.minHeight as number + 50
            }
            console.error(`${caseName} rotationInfo2: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult2: ${JSON.stringify(rotationResult)}`)
            expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync . info 2: ${JSON.stringify(displayInfo)}`);
            let subWindowProperties2 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties2.windowRect 2: ${JSON.stringify(subWindowProperties2.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(3);
            expect(rotationInfo.displayId).assertEqual(displayInfo.id);
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            return rotationResult;
          }
        }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await sleep(4000);
        let subWindowProperties3 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindowProperties3.windowRect 3: ${JSON.stringify(subWindowProperties3.windowRect)}`);
        expect(subWindowProperties3.windowRect.left).assertEqual(200);
        expect(subWindowProperties3.windowRect.top).assertEqual(200);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minWidth);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minHeight);
        subWindowClass.off('rotationChange', rotationCallback);
        await subWindowClass.destroyWindow();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_0600
     * @tc.number SUB_BASIC_WMS_RotationChange_0600
     * @tc.desc   test_RotationChange_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0600';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let subWindowClass:window.Window = await windowStage.createSubWindow('test_RotationChange_0600');
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let rotationCallback = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 100,
              top: 100,
              width: subWindowLimits.minWidth as number,
              height: subWindowLimits.minHeight as number,
            }

            console.error(`${caseName} rotationInfo 1: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult 1: ${JSON.stringify(rotationResult)}`)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            sleep(2000)
            let subWindowProperties1 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties1.windowRect 1: ${JSON.stringify(subWindowProperties1.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(2)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            expect(rotationResult.rectType).assertEqual(window.RectType.RELATIVE_TO_SCREEN);
            expect(rotationResult.windowRect.left).assertEqual(100)
            expect(rotationResult.windowRect.top).assertEqual(100)
            expect(rotationResult.windowRect.width).assertEqual(subWindowLimits.minWidth);
            expect(rotationResult.windowRect.height).assertEqual(subWindowLimits.minHeight);
            return rotationResult;
          } else {
            rotationResult.rectType = window.RectType.RELATIVE_TO_PARENT_WINDOW;
            rotationResult.windowRect = {
              left: 500,
              top: 500,
              width: subWindowLimits.minWidth as number + 50,
              height: subWindowLimits.minHeight as number + 50
            }
            console.error(`${caseName} rotationInfo2: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult2: ${JSON.stringify(rotationResult)}`)
            expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync . info 2: ${JSON.stringify(displayInfo)}`);
            let subWindowProperties2 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties2.windowRect 2: ${JSON.stringify(subWindowProperties2.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(2);
            expect(rotationInfo.displayId).assertEqual(displayInfo.id);
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            return rotationResult;
          }
        }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED)
        await sleep(4000);
        let subWindowProperties3 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindowProperties3.windowRect 3: ${JSON.stringify(subWindowProperties3.windowRect)}`);
        expect(subWindowProperties3.windowRect.left).assertEqual(100);
        expect(subWindowProperties3.windowRect.top).assertEqual(100);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minWidth);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minHeight);
        subWindowClass.off('rotationChange', rotationCallback);
        await subWindowClass.destroyWindow();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_0700
     * @tc.number SUB_BASIC_WMS_RotationChange_0700
     * @tc.desc   test_RotationChange_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0700';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let subWindowClass:window.Window = await windowStage.createSubWindow('test_RotationChange_0700');
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let rotationCallback = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 0,
              top: 0,
              width: subWindowLimits.minWidth as number,
              height: subWindowLimits.minHeight as number,
            }

            console.error(`${caseName} rotationInfo 1: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult 1: ${JSON.stringify(rotationResult)}`)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            sleep(2000)
            let subWindowProperties1 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties1.windowRect 1: ${JSON.stringify(subWindowProperties1.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(1)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            expect(rotationResult.rectType).assertEqual(window.RectType.RELATIVE_TO_SCREEN);
            expect(rotationResult.windowRect.left).assertEqual(0)
            expect(rotationResult.windowRect.top).assertEqual(0)
            expect(rotationResult.windowRect.width).assertEqual(subWindowLimits.minWidth);
            expect(rotationResult.windowRect.height).assertEqual(subWindowLimits.minHeight);
            return rotationResult;
          } else {
            rotationResult.rectType = window.RectType.RELATIVE_TO_PARENT_WINDOW;
            rotationResult.windowRect = {
              left: 500,
              top: 500,
              width: subWindowLimits.minWidth as number + 50,
              height: subWindowLimits.minHeight as number + 50
            }
            console.error(`${caseName} rotationInfo2: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult2: ${JSON.stringify(rotationResult)}`)
            expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync . info 2: ${JSON.stringify(displayInfo)}`);
            let subWindowProperties2 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties2.windowRect 2: ${JSON.stringify(subWindowProperties2.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(1);
            expect(rotationInfo.displayId).assertEqual(displayInfo.id);
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            return rotationResult;
          }
        }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED)
        await sleep(4000);
        let subWindowProperties3 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindowProperties3.windowRect 3: ${JSON.stringify(subWindowProperties3.windowRect)}`);
        expect(subWindowProperties3.windowRect.left).assertEqual(0);
        expect(subWindowProperties3.windowRect.top).assertEqual(0);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minWidth);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minHeight);
        subWindowClass.off('rotationChange', rotationCallback);
        await subWindowClass.destroyWindow();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_0800
     * @tc.number SUB_BASIC_WMS_RotationChange_0800
     * @tc.desc   test_RotationChange_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0800';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let windowProperties = windowClass.getWindowProperties()
        console.log(`${caseName} :main windowProperties.windowRect: ${JSON.stringify(windowProperties.windowRect)}`);
        let windowLimits = windowClass.getWindowLimits()
        console.log(`${caseName} :mainWindow getWindowLimits. info: ${JSON.stringify(windowLimits)}`);
        let rotationCallback = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 100,
              top: 100,
              width: 100,
              height: 100,
            }
            return rotationResult;
          } else {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 200,
              top: 200,
              width: 300,
              height: 300,
            }
            return rotationResult;
          }
        }
        windowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await sleep(4000);
        let windowProperties2 = windowClass.getWindowProperties()
        console.log(`${caseName} :main windowProperties2.windowRect: ${JSON.stringify(windowProperties2.windowRect)}`);
        let displayInfo = display.getDefaultDisplaySync();
        console.error(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
        expect(Math.abs(windowProperties.windowRect.left-windowProperties2.windowRect.left)).assertLessOrEqual(1);
        expect(Math.abs(windowProperties.windowRect.top-windowProperties2.windowRect.top)).assertLessOrEqual(1);
        expect(Math.abs(windowProperties.windowRect.height-windowProperties2.windowRect.width)).assertLessOrEqual(1);
        expect(Math.abs(windowProperties.windowRect.width-windowProperties2.windowRect.height)).assertLessOrEqual(1);
        windowClass.off('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_0900
     * @tc.number SUB_BASIC_WMS_RotationChange_0900
     * @tc.desc   test_RotationChange_0900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_0900';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let subWindowClass = await windowStage.createSubWindow('test_RotationChange_0900');
      let timer = 0;
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        await sleep(100);
        let windowProperties1 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindow windowProperties1.windowRect: ${JSON.stringify(windowProperties1.windowRect)}`);
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let rotationCallback1 = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 100,
              top: 100,
              width: subWindowLimits.minWidth as number,
              height:subWindowLimits.minHeight as number,

            }
            timer ++;
            console.log(`${caseName} rotationCallback1 :timer: ${JSON.stringify(timer)}`);
            return rotationResult;
          } else {
            return;
          }
        }
        let rotationCallback2 = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 200,
              top: 200,
              width: subWindowLimits.minWidth as number + 10,
              height: subWindowLimits.minHeight as number + 5,
            }
            timer ++;
            console.log(`${caseName} rotationCallback2 :timer: ${JSON.stringify(timer)}`);
            return rotationResult;
          } else {
            return;
          }
        }
        subWindowClass.on('rotationChange', rotationCallback1);
        subWindowClass.on('rotationChange', rotationCallback2);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await sleep(4000);
        let windowProperties2 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindow windowProperties2.windowRect: ${JSON.stringify(windowProperties2.windowRect)}`);
        console.log(`${caseName} :timer: ${JSON.stringify(timer)}`);
        expect(windowProperties2.windowRect.left-200).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.top-200).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.width-(subWindowLimits.minWidth as number + 10)).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.height-(subWindowLimits.minHeight as number + 5)).assertLessOrEqual(1);
        expect(timer).assertEqual(2);
        subWindowClass.off('rotationChange');

        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_1000
     * @tc.number SUB_BASIC_WMS_RotationChange_1000
     * @tc.desc   test_RotationChange_1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_1000';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let subWindowClass = await windowStage.createSubWindow('test_RotationChange_1000');
      let timer = 0;
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        await sleep(100);
        let windowProperties1 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindow windowProperties1.windowRect: ${JSON.stringify(windowProperties1.windowRect)}`);
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let rotationCallback1 = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 100,
              top: 100,
              width: subWindowLimits.minWidth as number,
              height:subWindowLimits.minHeight as number,

            }
            timer ++;
            console.log(`${caseName} rotationCallback1 :timer: ${JSON.stringify(timer)}`);
            return rotationResult;
          } else {
            return;
          }
        }

        subWindowClass.on('rotationChange', rotationCallback1);
        subWindowClass.off('rotationChange', rotationCallback1);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await sleep(4000);
        let windowProperties2 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindow windowProperties2.windowRect: ${JSON.stringify(windowProperties2.windowRect)}`);
        console.log(`${caseName} :timer: ${JSON.stringify(timer)}`);
        expect(windowProperties2.windowRect.left-windowProperties1.windowRect.left).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.top-windowProperties1.windowRect.left).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.width-windowProperties1.windowRect.width).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.height-windowProperties1.windowRect.height).assertLessOrEqual(1);
        expect(timer).assertEqual(0);
        subWindowClass.off('rotationChange');

        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_1100
     * @tc.number SUB_BASIC_WMS_RotationChange_1100
     * @tc.desc   test_RotationChange_1100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_1100';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let subWindowClass = await windowStage.createSubWindow('test_RotationChange_1100');
      let timer = 0;
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        await sleep(100);
        let windowProperties1 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindow windowProperties1.windowRect: ${JSON.stringify(windowProperties1.windowRect)}`);
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let rotationCallback1 = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 100,
              top: 100,
              width: subWindowLimits.minWidth as number,
              height:subWindowLimits.minHeight as number,

            }
            timer ++;
            console.log(`${caseName} rotationCallback1 :timer: ${JSON.stringify(timer)}`);
            return rotationResult;
          } else {
            return;
          }
        }

        subWindowClass.on('rotationChange', rotationCallback1);
        subWindowClass.off('rotationChange');
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await sleep(4000);
        let windowProperties2 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindow windowProperties2.windowRect: ${JSON.stringify(windowProperties2.windowRect)}`);
        console.log(`${caseName} :timer: ${JSON.stringify(timer)}`);
        expect(windowProperties2.windowRect.left-windowProperties1.windowRect.left).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.top-windowProperties1.windowRect.left).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.width-windowProperties1.windowRect.width).assertLessOrEqual(1);
        expect(windowProperties2.windowRect.height-windowProperties1.windowRect.height).assertLessOrEqual(1);
        expect(timer).assertEqual(0);
        subWindowClass.off('rotationChange');

        await subWindowClass.destroyWindow()
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_1200
     * @tc.number SUB_BASIC_WMS_RotationChange_1200
     * @tc.desc   test_RotationChange_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_1200';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let config: window.Configuration = {
        name: "test_RotationChange_1200",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      const subWindowClass = await window.createWindow(config);
      console.info(`${caseName} Succeeded in creating the dialog window.`);
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let rotationCallback = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;//这里换成相对屏幕
            rotationResult.windowRect = {
              left: 200,
              top: 200,
              width: subWindowLimits.minWidth as number,
              height: subWindowLimits.minHeight as number,
            }

            console.error(`${caseName} rotationInfo 1: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult 1: ${JSON.stringify(rotationResult)}`)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            sleep(2000)
            let subWindowProperties1 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties1.windowRect 1: ${JSON.stringify(subWindowProperties1.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(3)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            expect(rotationResult.rectType).assertEqual(window.RectType.RELATIVE_TO_SCREEN);
            expect(rotationResult.windowRect.left).assertEqual(200)
            expect(rotationResult.windowRect.top).assertEqual(200)
            expect(rotationResult.windowRect.width).assertEqual(subWindowLimits.minWidth);
            expect(rotationResult.windowRect.height).assertEqual(subWindowLimits.minHeight);
            return rotationResult;
          } else {
            rotationResult.rectType = window.RectType.RELATIVE_TO_PARENT_WINDOW;
            rotationResult.windowRect = {
              left: 500,
              top: 500,
              width: subWindowLimits.minWidth as number + 50,
              height: subWindowLimits.minHeight as number + 50
            }
            console.error(`${caseName} rotationInfo2: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult2: ${JSON.stringify(rotationResult)}`)
            expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync . info 2: ${JSON.stringify(displayInfo)}`);
            let subWindowProperties2 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties2.windowRect 2: ${JSON.stringify(subWindowProperties2.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(3);
            expect(rotationInfo.displayId).assertEqual(displayInfo.id);
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            return rotationResult;
          }
        }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await sleep(4000);
        let subWindowProperties3 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindowProperties3.windowRect 3: ${JSON.stringify(subWindowProperties3.windowRect)}`);
        expect(subWindowProperties3.windowRect.left).assertEqual(200);
        expect(subWindowProperties3.windowRect.top).assertEqual(200);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minWidth);
        expect(subWindowProperties3.windowRect.height).assertEqual(subWindowLimits.minHeight);
        subWindowClass.off('rotationChange', rotationCallback);
        await subWindowClass.destroyWindow();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_1300
     * @tc.number SUB_BASIC_WMS_RotationChange_1300
     * @tc.desc   test_RotationChange_1300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_1300';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let subWindowClass:window.Window = await windowStage.createSubWindow('test_RotationChange_1300');
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        let windowClass = windowStage.getMainWindowSync();
        let mainWindowProperties = windowClass.getWindowProperties();
        console.error(`${caseName} :mainWindowProperties.windowRect: ${JSON.stringify(mainWindowProperties.windowRect)}`);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(2000)
        let rotationCallback = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_PARENT_WINDOW,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_PARENT_WINDOW;//这里换成相对屏幕
            rotationResult.windowRect = {
              left: 50,
              top: 50,
              width: subWindowLimits.minWidth as number,
              height: subWindowLimits.minHeight as number,
            }

            console.error(`${caseName} rotationInfo 1: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult 1: ${JSON.stringify(rotationResult)}`)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            sleep(2000)
            let subWindowProperties1 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties1.windowRect 1: ${JSON.stringify(subWindowProperties1.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(3)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            expect(rotationResult.rectType).assertEqual(window.RectType.RELATIVE_TO_PARENT_WINDOW);
            expect(rotationResult.windowRect.left).assertEqual(50)
            expect(rotationResult.windowRect.top).assertEqual(50)
            expect(rotationResult.windowRect.width).assertEqual(subWindowLimits.minWidth);
            expect(rotationResult.windowRect.height).assertEqual(subWindowLimits.minHeight);
            return rotationResult;
          } else {
            rotationResult.rectType = window.RectType.RELATIVE_TO_PARENT_WINDOW;
            rotationResult.windowRect = {
              left: 500,
              top: 500,
              width: subWindowLimits.minWidth as number + 50,
              height: subWindowLimits.minHeight as number + 50
            }
            console.error(`${caseName} rotationInfo2: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult2: ${JSON.stringify(rotationResult)}`)
            expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync . info 2: ${JSON.stringify(displayInfo)}`);
            let subWindowProperties2 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties2.windowRect 2: ${JSON.stringify(subWindowProperties2.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(3);
            expect(rotationInfo.displayId).assertEqual(displayInfo.id);
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            return rotationResult;
          }
        }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await sleep(4000);
        let subWindowProperties3 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindowProperties3.windowRect 3: ${JSON.stringify(subWindowProperties3.windowRect)}`);
        expect(subWindowProperties3.windowRect.left).assertEqual(mainWindowProperties.windowRect.left+50);
        expect(subWindowProperties3.windowRect.top).assertEqual(mainWindowProperties.windowRect.top+50);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minWidth);
        expect(subWindowProperties3.windowRect.height).assertEqual(subWindowLimits.minHeight);
        subWindowClass.off('rotationChange', rotationCallback);
        await subWindowClass.destroyWindow();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   test_RotationChange_1400
     * @tc.number SUB_BASIC_WMS_RotationChange_1400
     * @tc.desc   test_RotationChange_1400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('test_RotationChange_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'test_RotationChange_1400';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      if(isSupportRotate){
        let subWindowClass:window.Window = await windowStage.createSubWindow('test_RotationChange_1400');
      try {
        let subWindowLimits = subWindowClass.getWindowLimits()
        console.error(`${caseName} :subWindow getWindowLimits. info: ${JSON.stringify(subWindowLimits)}`);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.setBackgroundColor('#FF00FF00');
        subWindowClass.resizeAsync(300,300);
        await subWindowClass.showWindow();
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE)
        await sleep(2000)
        let rotationCallback = (rotationInfo: window.RotationChangeInfo): window.RotationChangeResult | void => {
          let rotationResult: window.RotationChangeResult = {
            rectType: window.RectType.RELATIVE_TO_SCREEN,
            windowRect: {
              left: 0,
              top: 0,
              width: 0,
              height: 0,
            }
          };
          console.log(`${caseName} :rotationCallback rotationInfo: ${JSON.stringify(rotationInfo)}`);
          if (rotationInfo.type === window.RotationChangeType.WINDOW_WILL_ROTATE) {
            rotationResult.rectType = window.RectType.RELATIVE_TO_SCREEN;
            rotationResult.windowRect = {
              left: 200,
              top: 200,
              width: subWindowLimits.minWidth as number,
              height: subWindowLimits.minHeight as number,
            }

            console.error(`${caseName} rotationInfo 1: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult 1: ${JSON.stringify(rotationResult)}`)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
            sleep(2000)
            let subWindowProperties1 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties1.windowRect 1: ${JSON.stringify(subWindowProperties1.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(0)
            expect(rotationInfo.displayId).assertEqual(displayInfo.id)
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            expect(rotationResult.rectType).assertEqual(window.RectType.RELATIVE_TO_SCREEN);
            expect(rotationResult.windowRect.left).assertEqual(200)
            expect(rotationResult.windowRect.top).assertEqual(200)
            expect(rotationResult.windowRect.width).assertEqual(subWindowLimits.minWidth);
            expect(rotationResult.windowRect.height).assertEqual(subWindowLimits.minHeight);
            return rotationResult;
          } else {
            rotationResult.rectType = window.RectType.RELATIVE_TO_PARENT_WINDOW;
            rotationResult.windowRect = {
              left: 500,
              top: 500,
              width: subWindowLimits.minWidth as number + 50,
              height: subWindowLimits.minHeight as number + 50
            }
            console.error(`${caseName} rotationInfo2: ${JSON.stringify(rotationInfo)}`);
            console.error(`${caseName} rotationResult2: ${JSON.stringify(rotationResult)}`)
            expect(rotationInfo.type).assertEqual(window.RotationChangeType.WINDOW_DID_ROTATE)
            let displayInfo = display.getDefaultDisplaySync();
            console.error(`${caseName} :display.getDefaultDisplaySync . info 2: ${JSON.stringify(displayInfo)}`);
            let subWindowProperties2 = subWindowClass.getWindowProperties()
            console.error(`${caseName} :subWindowProperties2.windowRect 2: ${JSON.stringify(subWindowProperties2.windowRect)}`);
            expect(rotationInfo.orientation).assertEqual(0);
            expect(rotationInfo.displayId).assertEqual(displayInfo.id);
            expect(rotationInfo.displayRect.left).assertEqual(0)
            expect(rotationInfo.displayRect.top).assertEqual(0)
            expect(rotationInfo.displayRect.width).assertEqual(displayInfo.width);
            expect(rotationInfo.displayRect.height).assertEqual(displayInfo.height);
            return rotationResult;
          }
        }
        subWindowClass.on('rotationChange', rotationCallback);
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
        await sleep(4000);
        let subWindowProperties3 = subWindowClass.getWindowProperties()
        console.error(`${caseName} :subWindowProperties3.windowRect 3: ${JSON.stringify(subWindowProperties3.windowRect)}`);
        expect(subWindowProperties3.windowRect.left).assertEqual(200);
        expect(subWindowProperties3.windowRect.top).assertEqual(200);
        expect(subWindowProperties3.windowRect.width).assertEqual(subWindowLimits.minWidth);
        expect(subWindowProperties3.windowRect.height).assertEqual(subWindowLimits.minHeight);
        subWindowClass.off('rotationChange', rotationCallback);
        await subWindowClass.destroyWindow();
        await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow()
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
      }else{
        done();
      }
      
    });

    /**
     * @tc.name   testTwoPagesWithoutSetPreferredOrientation
     * @tc.number SUB_BASIC_WMS_FUNCTION_ROTATION_NO_ANIMATION_0100
     * @tc.desc   Test the function value of preferredOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTwoPagesWithoutSetPreferredOrientation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testTwoPagesWithoutSetPreferredOrientation';
      if(isSupportRotate){
        
        // 1、拉起另一个Abllity主窗
        let windowStageStart = await startAbility(caseName, context);
        try {
          let displayOri = AppStorage.get('displayOri') as display.Orientation;
          console.log(caseName + ' displayOri : ' + displayOri);
          let btn1 = await driver.findComponent(ON.id('page2'))
          console.log(caseName + ' btn1 : ' + btn1);
          await btn1.click()
          await sleep(1000)
          let testOrientation1 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation1: ${testOrientation1}.`);
          expect(testOrientation1).assertEqual(displayOri);

          let btn2 = await driver.findComponent(ON.id('page1'))
          console.log(caseName + ' btn2 : ' + btn2);
          await btn2.click()
          await sleep(1000)
          let testOrientation2 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation2: ${testOrientation2}.`);
          expect(testOrientation2).assertEqual(displayOri);
          await terminateAbility(caseName);
          await sleep(200)
          done();
        } catch (e) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }
      }else{
        done();
      }

    });

    /**
     * @tc.name   testSetPreferredOrientationLandscapeToPortrait_Inverted
     * @tc.number SUB_BASIC_WMS_FUNCTION_ROTATION_NO_ANIMATION_0200
     * @tc.desc   Test the function value of preferredOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPreferredOrientationLandscapeToPortrait_Inverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetPreferredOrientationLandscapeToPortrait_Inverted';
      if(isSupportRotate){
        
        // 1、拉起另一个Abllity主窗
        let windowStageStart = await startAbility1(caseName, context);
        try {
          let displayOri = AppStorage.get('displayOri') as display.Orientation;
          console.log(caseName + ' displayOri : ' + displayOri);
          let btn1 = await driver.findComponent(ON.id('nonePage'))
          console.log(caseName + ' btn1 : ' + btn1);
          await btn1.click()
          await sleep(1000)
          let btn2 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn2 : ' + btn2);
          await btn2.click()
          await sleep(2000)
          let testOrientation1 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation1: ${testOrientation1}.`);
          expect(testOrientation1).assertEqual(displayOri);

          let btn3 = await driver.findComponent(ON.id('landscape_page'))
          console.log(caseName + ' btn3 : ' + btn3);
          await btn3.click()
          await sleep(1000)
          let btn4 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn4 : ' + btn4);
          await btn4.click()
          await sleep(2000)
          let testOrientation2 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation2: ${testOrientation2}.`);
          expect(testOrientation2 === displayOri || testOrientation2 === display.Orientation.LANDSCAPE_INVERTED).assertTrue();

          let btn5 = await driver.findComponent(ON.id('portrait_inverted_page'))
          console.log(caseName + ' btn5 : ' + btn5);
          await btn5.click()
          await sleep(1000)
          let btn6 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn6 : ' + btn6);
          await btn6.click()
          await sleep(2000)
          let testOrientation3 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation3: ${testOrientation3}.`);
          expect(testOrientation3 === displayOri || testOrientation3 === display.Orientation.PORTRAIT_INVERTED).assertTrue();

          await terminateAbility(caseName);
          await sleep(200)
          done();
        } catch (e) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }
      }else{
        done();
      }

    });
    /**
     * @tc.name   testSetPreferredOrientationLandscape_InvertedToPortrait
     * @tc.number SUB_BASIC_WMS_FUNCTION_ROTATION_NO_ANIMATION_0300
     * @tc.desc   Test the function value of preferredOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPreferredOrientationLandscape_InvertedToPortrait', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetPreferredOrientationLandscape_InvertedToPortrait';
      if(isSupportRotate){
        // 1、拉起另一个Abllity主窗
        let windowStageStart = await startAbility1(caseName, context);
        try {
          let displayOri = AppStorage.get('displayOri') as display.Orientation;
          console.log(caseName + ' displayOri : ' + displayOri);
          let btn1 = await driver.findComponent(ON.id('nonePage'))
          console.log(caseName + ' btn1 : ' + btn1);
          await btn1.click()
          await sleep(1000)
          let btn2 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn2 : ' + btn2);
          await btn2.click()
          await sleep(2000)
          let testOrientation1 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation1: ${testOrientation1}.`);
          expect(testOrientation1).assertEqual(displayOri);

          let btn3 = await driver.findComponent(ON.id('landscape_invertedPage'))
          console.log(caseName + ' btn3 : ' + btn3);
          await btn3.click()
          await sleep(1000)
          let btn4 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn4 : ' + btn4);
          await btn4.click()
          await sleep(2000)
          let testOrientation2 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation2: ${testOrientation2}.`);
          expect(testOrientation2 === displayOri || testOrientation2 === display.Orientation.LANDSCAPE).assertTrue();

          let btn5 = await driver.findComponent(ON.id('portraitPage'))
          console.log(caseName + ' btn5 : ' + btn5);
          await btn5.click()
          await sleep(1000)
          let btn6 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn6 : ' + btn6);
          await btn6.click()
          await sleep(2000)
          let testOrientation3 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation3: ${testOrientation3}.`);
          expect(testOrientation3).assertEqual(display.Orientation.PORTRAIT);

          await terminateAbility(caseName);
          await sleep(200)
          done();
        } catch (e) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }
      }else{
        done();
      }

    });
    /**
     * @tc.name   testSetPreferredOrientationUserPortraitToUserLandscape
     * @tc.number SUB_BASIC_WMS_FUNCTION_ROTATION_NO_ANIMATION_0400
     * @tc.desc   Test the function value of preferredOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPreferredOrientationUserPortraitToUserLandscape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetPreferredOrientationUserPortraitToUserLandscape';
      if(isSupportRotate){
        // 1、拉起另一个Abllity主窗
        let windowStageStart = await startAbility1(caseName, context);
        try {
          let displayOri = AppStorage.get('displayOri') as display.Orientation;
          console.log(caseName + ' displayOri : ' + displayOri);
          let btn1 = await driver.findComponent(ON.id('nonePage'))
          console.log(caseName + ' btn1 : ' + btn1);
          await btn1.click()
          await sleep(1000)
          let btn2 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn2 : ' + btn2);
          await btn2.click()
          await sleep(2000)
          let testOrientation1 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation1: ${testOrientation1}.`);
          expect(testOrientation1).assertEqual(displayOri);

          let btn3 = await driver.findComponent(ON.id('user_rotation_portraitPage'))
          console.log(caseName + ' btn3 : ' + btn3);
          await btn3.click()
          await sleep(1000)
          let btn4 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn4 : ' + btn4);
          await btn4.click()
          await sleep(2000)
          let testOrientation2 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation2: ${testOrientation2}.`);
          expect(testOrientation2).assertEqual(display.Orientation.PORTRAIT);

          let btn5 = await driver.findComponent(ON.id('user_rotation_landscapePage'))
          console.log(caseName + ' btn5 : ' + btn5);
          await btn5.click()
          await sleep(1000)
          let btn6 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn6 : ' + btn6);
          await btn6.click()
          await sleep(2000)
          let testOrientation3 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation3: ${testOrientation3}.`);
          expect(testOrientation3 === displayOri || testOrientation3 === display.Orientation.LANDSCAPE_INVERTED).assertTrue();

          await terminateAbility(caseName);
          await sleep(200)
          done();
        } catch (e) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }
      }else{
        done();
      }

    });

    /**
     * @tc.name   testSetPreferredOrientationUserPortraitInvertedToUserLandscapeInverted
     * @tc.number SUB_BASIC_WMS_FUNCTION_ROTATION_NO_ANIMATION_0500
     * @tc.desc   Test the function value of preferredOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPreferredOrientationUserPortraitInvertedToUserLandscapeInverted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetPreferredOrientationUserPortraitInvertedToUserLandscapeInverted';
      if(isSupportRotate){
        // 1、拉起另一个Abllity主窗
        let windowStageStart = await startAbility1(caseName, context);
        try {
          let displayOri = AppStorage.get('displayOri') as display.Orientation;
          console.log(caseName + ' displayOri : ' + displayOri);
          let btn1 = await driver.findComponent(ON.id('nonePage'))
          console.log(caseName + ' btn1 : ' + btn1);
          await btn1.click()
          await sleep(1000)
          let btn2 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn2 : ' + btn2);
          await btn2.click()
          await sleep(2000)
          let testOrientation1 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation1: ${testOrientation1}.`);
          expect(testOrientation1).assertEqual(displayOri);

          let btn3 = await driver.findComponent(ON.id('user_rotation_portrait_invertedPage'))
          console.log(caseName + ' btn3 : ' + btn3);
          await btn3.click()
          await sleep(1000)
          let btn4 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn4 : ' + btn4);
          await btn4.click()
          await sleep(2000)
          let testOrientation2 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation2: ${testOrientation2}.`);
          expect(testOrientation2 === displayOri || testOrientation2 === display.Orientation.PORTRAIT_INVERTED).assertTrue();

          let btn5 = await driver.findComponent(ON.id('user_rotation_landscape_invertedPage'))
          console.log(caseName + ' btn5 : ' + btn5);
          await btn5.click()
          await sleep(1000)
          let btn6 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn6 : ' + btn6);
          await btn6.click()
          await sleep(2000)
          let testOrientation3 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation3: ${testOrientation3}.`);
          expect(testOrientation3 === displayOri || testOrientation3 === display.Orientation.LANDSCAPE).assertTrue();

          await terminateAbility(caseName);
          await sleep(200)
          done();
        } catch (e) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }
      }else{
        done();
      }

    });
    /**
     * @tc.name   testSetPreferredOrientationFollowDeskTop
     * @tc.number SUB_BASIC_WMS_FUNCTION_ROTATION_NO_ANIMATION_0600
     * @tc.desc   Test the function value of preferredOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetPreferredOrientationFollowDeskTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetPreferredOrientationFollowDeskTop';
      if(isSupportRotate){
        // 1、拉起另一个Abllity主窗
        let windowStageStart = await startAbility1(caseName, context);
        try {
          let displayOri = AppStorage.get('displayOri') as display.Orientation;
          console.log(caseName + ' displayOri : ' + displayOri);
          let btn1 = await driver.findComponent(ON.id('nonePage'))
          console.log(caseName + ' btn1 : ' + btn1);
          await btn1.click()
          await sleep(1000)
          let btn2 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn2 : ' + btn2);
          await btn2.click()
          await sleep(2000)
          let testOrientation1 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation1: ${testOrientation1}.`);
          expect(testOrientation1).assertEqual(displayOri);

          let btn3 = await driver.findComponent(ON.id('follow_desktopPage'))
          console.log(caseName + ' btn3 : ' + btn3);
          await btn3.click()
          await sleep(1000)
          let btn4 = await driver.findComponent(ON.id('getOrientation'))
          console.log(caseName + ' btn4 : ' + btn4);
          await btn4.click()
          await sleep(2000)
          let testOrientation2 = AppStorage.get('testOrientation') as display.Orientation;
          console.log(`${caseName} testOrientation2: ${testOrientation2}.`);
          expect(testOrientation2).assertEqual(displayOri);

          await terminateAbility(caseName);
          await sleep(200)
          done();
        } catch (e) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }
      }else{
        done();
      }

    });


    /**
     * @tc.name   testGetPreferredOrientation_enum
     * @tc.number SUB_BASIC_WMS_GetPreferredOrientation_API_0100
     * @tc.desc   Sets the display direction property of the window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPreferredOrientation_enum', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetPreferredOrientation_enum';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin: window.Window = windowStage.getMainWindowSync();
      console.log(msgStr + 'windowStage.getMainWindow :' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      let num = 0
      let orientationItem = ['UNSPECIFIED', 'PORTRAIT', 'LANDSCAPE', 'PORTRAIT_INVERTED',
        'LANDSCAPE_INVERTED', 'AUTO_ROTATION', 'AUTO_ROTATION_PORTRAIT', 'AUTO_ROTATION_LANDSCAPE',
        'AUTO_ROTATION_RESTRICTED', 'AUTO_ROTATION_PORTRAIT_RESTRICTED', 'AUTO_ROTATION_LANDSCAPE_RESTRICTED', 'LOCKED',
        'AUTO_ROTATION_UNSPECIFIED',
        'USER_ROTATION_PORTRAIT', 'USER_ROTATION_LANDSCAPE', 'USER_ROTATION_PORTRAIT_INVERTED',
        'USER_ROTATION_LANDSCAPE_INVERTED', 'FOLLOW_DESKTOP', 'UNSPECIFIED'];
      for (let i = 0; i < orientationItem.length; i++) {
        await sleep(900)
        await sleep(900)
        let orientation: window.Orientation = window.Orientation[orientationItem[i]]
        console.log(msgStr + 'i : ' + i + ' ,orientation : ' + orientation);
        console.log(msgStr + 'i : ' + i + ' ,window.Orientation : ' + JSON.stringify(orientationItem[i]));
        await (mainWin as window.Window).setPreferredOrientation(orientation).then(async () => {
          console.log(msgStr + 'success set window.setPreferredOrientation : ' + orientation);
          await sleep(500);
          let CurrentOrientation = mainWin.getPreferredOrientation();
          expect(CurrentOrientation).assertEqual(orientation);
          num++
          if (num == orientationItem.length) {
            done();
          }
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'window.setPreferredOrientation failed set error:' + orientation);
        });
        await sleep(900)
        await sleep(300)
      }
    })


    /**
     * @tc.name   testConvertOrientationAndRotationFromWindowOrientationToDisplayOrientation
     * @tc.number SUB_WMS_CONVERT_ORIENTATION_AND_ROTATION_0100
     * @tc.desc   testConvertOrientationAndRotationFromWindowOrientationToDisplayOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertOrientationAndRotationFromWindowOrientationToDisplayOrientation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testConvertOrientationAndRotationFromWindowOrientationToDisplayOrientation';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let subWindowClass: window.Window | undefined;
      try {
        let windowClass = windowStage.getMainWindowSync();
        if (canIUseRes) {
          for (let inputValue = 0; inputValue < 4; inputValue++) {
            let outputValue = windowClass.convertOrientationAndRotation(window.RotationInfoType.WINDOW_ORIENTATION, window.RotationInfoType.DISPLAY_ORIENTATION, inputValue);
            console.info(caseName + 'from-to outputValue ' + inputValue + ' : ' + JSON.stringify(outputValue));
            expect(outputValue).assertEqual(inputValue);
            let outputValue2 = windowClass.convertOrientationAndRotation(window.RotationInfoType.DISPLAY_ORIENTATION, window.RotationInfoType.WINDOW_ORIENTATION, inputValue);
            console.info(caseName + 'to-from outputValue2 ' + inputValue + ' : ' + JSON.stringify(outputValue2));
            expect(outputValue2).assertEqual(inputValue);
          }
          expect(window.RotationInfoType.WINDOW_ORIENTATION).assertEqual(0);
          expect(window.RotationInfoType.DISPLAY_ORIENTATION).assertEqual(1);
          subWindowClass = await windowStage.createSubWindow('testConvertOrientationAndRotationFromWindowOrientationToDisplayOrientation');
          try{
            await subWindowClass.destroyWindow();
            let outputValue3 = subWindowClass.convertOrientationAndRotation(window.RotationInfoType.WINDOW_ORIENTATION, window.RotationInfoType.DISPLAY_ORIENTATION, 0);
            console.error(caseName + 'subWindowClass convertOrientationAndRotation, outputValue3: ' + JSON.stringify(outputValue3));
            expect(false).assertTrue();
            done();
          }catch (err) {
            console.error(caseName + 'subWindowClass failed convertOrientationAndRotation, err: ' + JSON.stringify(err)+'errCode:' + JSON.stringify(err.code));
            expect(err.code).assertEqual(1300002);
            done();
          }

        } else {
          let outputValue = windowClass.convertOrientationAndRotation(window.RotationInfoType.WINDOW_ORIENTATION, window.RotationInfoType.DISPLAY_ORIENTATION, 0);
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        await subWindowClass?.destroyWindow()
        if (!canIUseRes||(deviceType != 'phone' && deviceType != 'tablet')) {
          expect(err.code).assertEqual(801);
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })


    /**
     * @tc.name   testConvertOrientationAndRotationFromWindowOrientationToDisplayRotation
     * @tc.number SUB_WMS_CONVERT_ORIENTATION_AND_ROTATION_0200
     * @tc.desc   testConvertOrientationAndRotationFromWindowOrientationToDisplayRotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertOrientationAndRotationFromWindowOrientationToDisplayRotation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testConvertOrientationAndRotationFromWindowOrientationToDisplayRotation';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      try {
        let windowClass = windowStage.getMainWindowSync();
        if (canIUseRes) {
          for (let inputValue = 0; inputValue < 4; inputValue++) {
            let outputValue = windowClass.convertOrientationAndRotation(window.RotationInfoType.WINDOW_ORIENTATION, window.RotationInfoType.DISPLAY_ROTATION, inputValue);
            console.info(caseName + 'from-to outputValue ' + inputValue + ' : ' + JSON.stringify(outputValue));
            // 如果是 GRL-G态 ，0转化为1,1转化为2,2转化为3,3转化为0
            let displayInfo = await display.getAllDisplayPhysicalResolution();
            if (displayInfo.length == 3) {
              if (inputValue != 3) {
                expect(outputValue).assertEqual(inputValue + 1);
              } else {
                expect(outputValue).assertEqual(0);
              }
            } else {
              expect(outputValue).assertEqual(inputValue);
            }
            let outputValue2 = windowClass.convertOrientationAndRotation(window.RotationInfoType.DISPLAY_ROTATION, window.RotationInfoType.WINDOW_ORIENTATION, inputValue);
            console.info(caseName + 'to-from outputValue2 ' + inputValue + ' : ' + JSON.stringify(outputValue2));
            // 如果是 GRL-G态 ，0转化为3,1转化为0,2转化为1,3转化为2
            if (displayInfo.length == 3) {
              if (inputValue != 0) {
                expect(outputValue).assertEqual(3);
              } else {
                expect(outputValue).assertEqual(inputValue - 1);
              }
            } else {
              expect(outputValue2).assertEqual(inputValue);
            }
          }
          expect(window.RotationInfoType.WINDOW_ORIENTATION).assertEqual(0);
          expect(window.RotationInfoType.DISPLAY_ROTATION).assertEqual(2);
          done()
        } else {
          let outputValue3 = windowClass.convertOrientationAndRotation(window.RotationInfoType.WINDOW_ORIENTATION, window.RotationInfoType.DISPLAY_ROTATION, 0);
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        if (!canIUseRes||(deviceType != 'phone' && deviceType != 'tablet')) {
          expect(err.code).assertEqual(801);
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testConvertOrientationAndRotationFromDisplayOrientationToDisplayRotation
     * @tc.number SUB_WMS_CONVERT_ORIENTATION_AND_ROTATION_0300
     * @tc.desc   testConvertOrientationAndRotationFromDisplayOrientationToDisplayRotation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertOrientationAndRotationFromDisplayOrientationToDisplayRotation', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testConvertOrientationAndRotationFromDisplayOrientationToDisplayRotation';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      try {
        let windowClass = windowStage.getMainWindowSync();
        if (canIUseRes) {
          for (let inputValue = 0; inputValue < 4; inputValue++) {
            let outputValue = windowClass.convertOrientationAndRotation(window.RotationInfoType.DISPLAY_ORIENTATION, window.RotationInfoType.DISPLAY_ROTATION, inputValue);
            console.info(caseName + 'from-to outputValue ' + inputValue + ' : ' + JSON.stringify(outputValue));
            // 如果是 GRL-G态 ，0转化为1,1转化为2,2转化为3,3转化为0
            let displayInfo = await display.getAllDisplayPhysicalResolution();
            if (displayInfo.length == 3) {
              if (inputValue != 3) {
                expect(outputValue).assertEqual(inputValue + 1);
              } else {
                expect(outputValue).assertEqual(0);
              }
            } else {
              expect(outputValue).assertEqual(inputValue);
            }
            let outputValue2 = windowClass.convertOrientationAndRotation(window.RotationInfoType.DISPLAY_ROTATION, window.RotationInfoType.DISPLAY_ORIENTATION, inputValue);
            console.info(caseName + 'to-from outputValue2 ' + inputValue + ' : ' + JSON.stringify(outputValue2));
            // 如果是 GRL-G态 ，0转化为3,1转化为0,2转化为1,3转化为2
            if (displayInfo.length == 3) {
              if (inputValue != 0) {
                expect(outputValue).assertEqual(3);
              } else {
                expect(outputValue).assertEqual(inputValue - 1);
              }
            } else {
              expect(outputValue2).assertEqual(inputValue);
            }
          }
          expect(window.RotationInfoType.DISPLAY_ORIENTATION).assertEqual(1);
          expect(window.RotationInfoType.DISPLAY_ROTATION).assertEqual(2);
          done()
        } else {
          let outputValue3 = windowClass.convertOrientationAndRotation(window.RotationInfoType.WINDOW_ORIENTATION, window.RotationInfoType.DISPLAY_ROTATION, 0);
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        if (!canIUseRes||(deviceType != 'phone' && deviceType != 'tablet')) {
          expect(err.code).assertEqual(801);
          done()
        } else {
          expect(err.code).assertEqual(401);
          done();
        }
      }
    })

    /**
     * @tc.name   testConvertOrientationAndRotationwithInvaidParams
     * @tc.number SUB_WMS_CONVERT_ORIENTATION_AND_ROTATION_0400
     * @tc.desc   testConvertOrientationAndRotationwithInvaidParams
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testConvertOrientationAndRotationwithInvaidParams', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testConvertOrientationAndRotationwithInvaidParams';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      try {
        let windowClass = windowStage.getMainWindowSync();
        let inputValues = [3.1, 3.6, 4, -1];
        for (let i = 0; i < inputValues.length; i++) {
          let outputValue = windowClass.convertOrientationAndRotation(window.RotationInfoType.WINDOW_ORIENTATION, window.RotationInfoType.DISPLAY_ORIENTATION, inputValues[i]);
          console.info(caseName + 'from-to outputValue ' + i + ' : ' + JSON.stringify(outputValue));
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        if (!canIUseRes||(deviceType != 'phone' && deviceType != 'tablet')) {
          expect(err.code).assertEqual(801);
          done()
        } else {
          expect(err.code).assertEqual(401);
          done();
        }
      }
    })


  })
}