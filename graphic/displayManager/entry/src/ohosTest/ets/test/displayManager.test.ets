/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium'
import display from '@ohos.display';
import window from '@ohos.window';
import screen from '@ohos.screen';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import { image } from '@kit.ImageKit';
import { screenshot } from '@kit.ArkUI';
import common from '@ohos.app.ability.common';
import { StartOptions } from '@kit.AbilityKit';
import floatingBall from '@ohos.window.floatingBall';
import settings from '@ohos.settings';
import deviceInfo from '@ohos.deviceInfo';

function checkIsCaptured() {
  let status = false;
  try {
    status = display.isCaptured();
    console.log('checkIsCaptured status:' + status);
  } catch (exception) {
    console.error('checkIsCaptured Failed to unregister callback: ' + JSON.stringify(exception));
  }
  return status;
}

async function sleep(time: number) {
  return new Promise < string > ((resolve, reject) => {
    setTimeout(() => {
      resolve("ok");
    }, time);
  })
}

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
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
  let windowStageStart = AppStorage.get('windowStageStart') as window.WindowStage;
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

export default function displayTest() {
  console.log('describe displayTest start!!!')
  const TRUE_FLAG = true;

  describe('displayTest', () => {
    let windowStage: window.WindowStage;
    let context: common.UIAbilityContext;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    let isFreeWindowMode = false;
    let isSupportRotate = false;
    let deviceType:string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    beforeAll(async () => {
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
      console.error(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.error(`beforeAll isPCStatus: `+ isPCStatus);
      
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      try {
          let driver = Driver.create();
          let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.log('findComponent allowed: ' + JSON.stringify(allowed));
          if(allowed){
            await allowed.click();
          }
      } catch (err) {
          console.error('findComponent allowed failed: ' + JSON.stringify(err));
      }
      await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT)
      await sleep(300);
      let Orientation1 = display.getDefaultDisplaySync().orientation;
      await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
      await sleep(300);
      let Orientation2 = display.getDefaultDisplaySync().orientation;
      if(Orientation1 != Orientation2){
        isSupportRotate = true;
      }else{
        isSupportRotate = false;
      }
      await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
      await sleep(300);
      console.log(`beforeAll isSupportRotate: ${JSON.stringify(isSupportRotate)},Orientation1: ${JSON.stringify(Orientation1)},Orientation2: ${JSON.stringify(Orientation2)}`)
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.name   testFoldAngleChange_On_Off
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5100
     * @tc.desc   register and unregister fold angle changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFoldAngleChange_On_Off', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testFoldAngleChange_On_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback = (angles: Array<number>) => {
        console.info(msgStr + 'Listening enabled. angles length: ' + angles.length);
        let angleLen = angles.length;
        for (let i = 0; i < angleLen; i++) {
          console.info(msgStr + 'Listening enabled. angles[' + i + ']=' + angles[i]);
        }
      };
      try {
        display.on('foldAngleChange', callback);
      }
      catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        display.off("foldAngleChange");
        done();
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testFoldAngleChange_ON_Off_Off
     * @tc.number SUB_BASIC_WMS_DMS_XTS_DISPLAY_JS_API_5110
     * @tc.desc   repeat unregister fold angle changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFoldAngleChange_ON_Off_Off', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testFoldAngleChange_ON_Off_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback = (angles: Array<number>) => {
        console.info(msgStr + 'Listening enabled. angles length: ' + angles.length);
        let angleLen = angles.length;
        for (let i = 0; i < angleLen; i++) {
          console.info(msgStr + 'Listening enabled. angles[' + i + ']=' + angles[i]);
        }
      };
      try {
        display.on('foldAngleChange', callback);
      }
      catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        display.off("foldAngleChange");
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        display.off("foldAngleChange");
        done();
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testFoldAngleChange_Off
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5120
     * @tc.desc   unregister of the fold angle changes without register
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFoldAngleChange_Off', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testFoldAngleChange_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        display.off("foldAngleChange");
        done();
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testCaptureStatusChange_On_Off
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5130
     * @tc.desc   register and unregister capture status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCaptureStatusChange_On_Off', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCaptureStatusChange_On_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback = (status: boolean) => {
        console.info(msgStr + 'capture status: ' + status);
        done();
      };
      try {
        display.on('captureStatusChange', callback);
      }
      catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        display.off("captureStatusChange");
        done();
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testCaptureStatusChange_On_Off_Off
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5140
     * @tc.desc   repeat unregister capture status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCaptureStatusChange_On_Off_Off', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCaptureStatusChange_On_Off_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback = (status: boolean) => {
        console.info(msgStr + 'capture status: ' + status);
      };
      try {
        display.on('captureStatusChange', callback);
      }
      catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        display.off("captureStatusChange");
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        display.off("captureStatusChange");
        done();
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testCaptureStatusChange_Off
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5150
     * @tc.desc   unregister the capture status of the device without register
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCaptureStatusChange_Off', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCaptureStatusChange_Off';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        display.off("captureStatusChange");
        done();
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   testIsCaptured
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5160
     * @tc.desc   check current device capture status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsCaptured', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testIsCaptured';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let status = display.isCaptured();
        console.log(msgStr + 'status:' + status);
        expect(status).assertFalse();
        done();
      }
      catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_getAvailableArea_default
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0100
     * @tc.desc   test_getAvailableArea_default
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getAvailableArea_default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_getAvailableArea_default';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display | null = null;
      try {
        displayClass = display.getDefaultDisplaySync();
        let promise = displayClass.getAvailableArea();
        promise.then((data) => {
          console.info(msgStr + 'Succeeded get the available area in this display. data: ' + JSON.stringify(data));
          expect(data.left).assertEqual(0);
          expect(data.width).assertLarger(0);
          expect(data.height).assertLarger(0);
          if (displayClass) {
            expect(data.width).assertEqual(displayClass.availableWidth);
            expect(data.height).assertEqual(displayClass.availableHeight);
          }
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + 'The device not support getAvailableArea');
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      }
      catch (exception) {
        console.error(msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_getAvailableArea_subWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0200
     * @tc.desc   test_getAvailableArea_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getAvailableArea_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'test_getAvailableArea_subWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window;
      let displayClass: display.Display | null = null;
      let storage: LocalStorage = new LocalStorage();
      storage.setOrCreate('storageSimpleProp', 121);
      try {
        let promise1 = windowStage.createSubWindow('test_getAvailableArea_subWindow');
        promise1.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          subWindow = data;
          console.log(msgStr + "create the subWindow success");
          let promise2 = subWindow.loadContent('testability/pages/Index2', storage);
          promise2.then(async () => {
            console.info(msgStr + 'Succeeded in loading the content.');
            await subWindow.showWindow();
            console.info(msgStr + ' showWindow success');
            try {
              displayClass = display.getDefaultDisplaySync();
              let promise = displayClass.getAvailableArea();
              promise.then((data) => {
                console.info(msgStr + 'Succeeded get the available area in this display. data: ' + JSON.stringify(data));
                expect(data.left).assertEqual(0);
                expect(data.width).assertLarger(0);
                expect(data.height).assertLarger(0);
                if (displayClass) {
                  expect(data.width).assertEqual(displayClass.availableWidth);
                  expect(data.height).assertEqual(displayClass.availableHeight);
                }
                subWindow.destroyWindow();
                done();
              }).catch((err: BusinessError) => {
                console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                  console.info(msgStr + 'The device not support getAvailableArea');
                  subWindow.destroyWindow();
                  done();
                }
                else {
                  subWindow.destroyWindow();
                  expect().assertFail();
                  done();
                }
              });
            }
            catch (exception) {
              console.error(msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
              subWindow.destroyWindow();
              expect().assertFail();
              done();
            }
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
            subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          });
        }).catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        });
      }
      catch (err) {
        console.error(msgStr + `Failed to the case. Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   test_getAvailableArea_setWindowSystemBarEnable
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0300
     * @tc.desc   test_getAvailableArea_setWindowSystemBarEnable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getAvailableArea_setWindowSystemBarEnable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'test_getAvailableArea_setWindowSystemBarEnable';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display;
      try {
        let mainWindowClass = await windowStage.getMainWindow();
        displayClass = display.getDefaultDisplaySync();
        let promise1 = displayClass.getAvailableArea();
        promise1.then(async (data) => {
          let AvailableArea = data;
          console.info(msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
          await mainWindowClass.setWindowSystemBarEnable([]);
          console.info(msgStr + ' setWindowSystemBarEnable success');
          let promise = displayClass.getAvailableArea();
          promise.then(async (data) => {
            console.info(msgStr + 'Succeeded get the available area in this display. data: ' + JSON.stringify(data));
            expect(data.left).assertEqual(AvailableArea.left);
            expect(data.top).assertEqual(AvailableArea.top);
            expect(data.width).assertEqual(AvailableArea.width);
            expect(data.height).assertEqual(AvailableArea.height);
            await mainWindowClass.setWindowSystemBarEnable(['status', 'navigation']);
            console.info(msgStr + ' setWindowSystemBarEnable success');
            done();
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
            if (err.code == 801) {
              console.info(msgStr + 'The device not support getAvailableArea');
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + 'The device not support getAvailableArea');
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      }
      catch (exception) {
        console.error(msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_getAvailableArea_ststus_bar_hide
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0400
     * @tc.desc   test_getAvailableArea_ststus_bar_hide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAvailableArea_ststus_bar_hide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'test_getAvailableArea_ststus_bar_hide';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display;
      try {
        let mainWindowClass = await windowStage.getMainWindow();
        displayClass = display.getDefaultDisplaySync();
        let promise1 = displayClass.getAvailableArea();
        promise1.then(async (data) => {
          let AvailableArea = data;
          console.info(msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
          await mainWindowClass.setWindowLayoutFullScreen(true).then(async () => {
            console.info(msgStr + ' setWindowLayoutFullScreen success');
            await sleep(1000);
            let displayClass1 = display.getDefaultDisplaySync();
            let promise = displayClass1.getAvailableArea();
            promise.then((data1) => {
              console.info(msgStr + 'Succeeded get the available area in this display. data1: ' + JSON.stringify(data1));
              if (AvailableArea.top == 0) {
                mainWindowClass.setWindowLayoutFullScreen(false);
                done();
              }
              else if (AvailableArea.top != 0) {
                expect(data1.top).assertEqual(0);
                mainWindowClass.setWindowLayoutFullScreen(false);
                done();
              }
              else {
                expect(false).assertTrue();
                done();
              }
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.info(msgStr + 'The device not support getAvailableArea');
                done();
              }
              else {
                expect().assertFail();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to set setWindowLayoutFullScreen. Code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          })

        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + 'The device not support getAvailableArea');
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      }
      catch (exception) {
        console.error(msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_on_availableAreaChange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0100
     * @tc.desc   test_on_availableAreaChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_on_availableAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_on_availableAreaChange';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display | null = null;
      displayClass = display.getDefaultDisplaySync();
      try {
        displayClass.on('availableAreaChange', (data: display.Rect) => {
          console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
          done();
        });
        displayClass.off('availableAreaChange');
        done();
      }
      catch (err) {
        console.error(msgStr + `Failed to on availableAreaChange. Code: ${err.code}, message: ${err.message}`);
        if (err.code == 801) {
          console.info(msgStr + 'The device not support getAvailableArea');
          done();
        }
        else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_on_availableAreaChange_triggers
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0200
     * @tc.desc   test_on_availableAreaChange_triggers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_on_availableAreaChange_triggers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'test_on_availableAreaChange_triggers';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display;
      try {
        let mainWindowClass = await windowStage.getMainWindow();
        displayClass = display.getDefaultDisplaySync();
        let promise1 = displayClass.getAvailableArea();
        promise1.then(async (data) => {
          let AvailableArea = data;
          console.info(msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
          if (AvailableArea.top == 0) {
            done();
          }
          else if (AvailableArea.top != 0) {
            displayClass.on('availableAreaChange', (data: display.Rect) => {
              console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
              sleep(500);
              expect(data.height).assertLarger(AvailableArea.height);
              displayClass.off('availableAreaChange');
              mainWindowClass.recover();
              done();
            });
            await mainWindowClass.setWindowLayoutFullScreen(true);
            console.info(msgStr + ' setWindowLayoutFullScreen success');
            await sleep(500);
          }
          else {
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + 'The device not support getAvailableArea');
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      }
      catch (exception) {
        console.error(msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_on_availableAreaChange_Two_callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0300
     * @tc.desc   test_on_availableAreaChange_Two_callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_on_availableAreaChange_Two_callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'test_on_availableAreaChange_Two_callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display;
      let num = 0;
      let callback1: Callback<display.Rect> = (data: display.Rect) => {
        num++;
        console.info('Listening callback1 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
      };
      let callback2: Callback<display.Rect> = (data: display.Rect) => {
        num++;
        console.info('Listening callback2 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
      };
      try {
        let mainWindowClass = await windowStage.getMainWindow();
        displayClass = display.getDefaultDisplaySync();
        let promise1 = displayClass.getAvailableArea();
        promise1.then(async (data) => {
          let AvailableArea = data;
          console.info(msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
          if (AvailableArea.top == 0) {
            done();
          }
          else if (AvailableArea.top != 0) {
            displayClass.on('availableAreaChange', callback1);
            displayClass.on('availableAreaChange', callback2);
            await mainWindowClass.setWindowLayoutFullScreen(true);
            console.info(msgStr + ' setWindowLayoutFullScreen success');
            await sleep(1000);
            expect(num).assertEqual(4);
            displayClass.off('availableAreaChange');
            mainWindowClass.recover();
            done();
          }
          else {
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + 'The device not support getAvailableArea');
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      }
      catch (exception) {
        console.error(msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_on_availableAreaChange_off_callback1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0400
     * @tc.desc   test_on_availableAreaChange_off_callback1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_on_availableAreaChange_off_callback1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'test_on_availableAreaChange_off_callback1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display;
      let num = 0;
      let callback1: Callback<display.Rect> = (data: display.Rect) => {
        num--;
        console.info('Listening callback1 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
      };
      let callback2: Callback<display.Rect> = (data: display.Rect) => {
        num++;
        console.info('Listening callback2 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
      };
      try {
        let mainWindowClass = await windowStage.getMainWindow();
        displayClass = display.getDefaultDisplaySync();
        let promise1 = displayClass.getAvailableArea();
        promise1.then(async (data) => {
          let AvailableArea = data;
          console.info(msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
          if (AvailableArea.top == 0) {
            done();
          }
          else if (AvailableArea.top != 0) {
            displayClass.on('availableAreaChange', callback1);
            displayClass.on('availableAreaChange', callback2);
            displayClass.off('availableAreaChange', callback2);
            await mainWindowClass.setWindowLayoutFullScreen(true);
            console.info(msgStr + ' setWindowLayoutFullScreen success');
            await sleep(1000);
            expect(num).assertEqual(2);
            displayClass.off('availableAreaChange');
            mainWindowClass.recover();
            done();
          }
          else {
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + 'The device not support getAvailableArea');
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      }
      catch (exception) {
        console.error(msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_on_availableAreaChange_off_callback_all
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0500
     * @tc.desc   test_on_availableAreaChange_off_callback_all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_on_availableAreaChange_off_callback_all', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'test_on_availableAreaChange_off_callback_all';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display;
      let num = 0;
      let callback1: Callback<display.Rect> = (data: display.Rect) => {
        num++;
        console.info('Listening callback1 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
      };
      let callback2: Callback<display.Rect> = (data: display.Rect) => {
        num++;
        console.info('Listening callback2 enabled. Data: ' + JSON.stringify(data)+' , num:'+num);
      };
      try {
        let mainWindowClass = await windowStage.getMainWindow();
        displayClass = display.getDefaultDisplaySync();
        let promise1 = displayClass.getAvailableArea();
        promise1.then(async (data) => {
          let AvailableArea = data;
          console.info(msgStr + 'Succeeded get the available area in this display. AvailableArea: ' + JSON.stringify(AvailableArea));
          if (AvailableArea.top == 0) {
            done();
          }
          else if (AvailableArea.top != 0) {
            displayClass.on('availableAreaChange', callback1);
            displayClass.on('availableAreaChange', callback2);
            displayClass.off('availableAreaChange');
            await mainWindowClass.setWindowLayoutFullScreen(true);
            console.info(msgStr + ' setWindowLayoutFullScreen success');
            await sleep(1000);
            expect(num).assertEqual(0);
            mainWindowClass.recover();
            done();
          }
          else {
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to get the available area in this display. Code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + 'The device not support getAvailableArea');
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      }
      catch (exception) {
        console.error(msgStr + `Failed to obtain the default display object. Code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_off_availableAreaChange
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0600
     * @tc.desc   test_off_availableAreaChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_off_availableAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_off_availableAreaChange';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display;
      try {
          displayClass = display.getDefaultDisplaySync();
          displayClass.off('availableAreaChange');
          done();
      }
      catch (err) {
        console.error(msgStr + `Failed to obtain the default display object. Code: ${err.code}, message: ${err.message}`);
        if (err.code == 801) {
          console.info(msgStr + 'The device not support getAvailableArea');
          done();
        }
        else {
          expect().assertFail();
          done();
        }
      }
    });
    /**
     * @tc.name   testGetAllDisplayPhysicalResolution
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5170
     * @tc.desc   get all display physical resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllDisplayPhysicalResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetAllDisplayPhysicalResolution';
      display.getAllDisplayPhysicalResolution().then((resolutionObjects) => {
        console.info(`${caseName} Obtaining physical resolution length: ${resolutionObjects.length}`);
        expect(resolutionObjects.length).assertLargerOrEqual(0);
        for (let i = 0; i < resolutionObjects.length; i++) {
          const resolutionObject = resolutionObjects[i];
          console.info(`${caseName}: ${i} foldDisplayMode: ${resolutionObject.foldDisplayMode}, physicalWidth: ${resolutionObject.physicalWidth}, physicalHeight: ${resolutionObject.physicalHeight}`)
          expect(resolutionObject !== null).assertTrue();
          expect(resolutionObject.physicalWidth).assertLarger(0);
          expect(resolutionObject.physicalHeight).assertLarger(0);
          done();
        }
      }).catch((err: BusinessError) => {
        if (err.code == 801) {
          console.info(`${caseName}: The current device type does not support to setWindowSystemBarEnable`);
          done();
        } else {
          console.error(`${caseName}: Failed to obtain physical resolution. Code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })

    /**
     * @tc.name   testGetAvailableWidthAndHeight
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5180
     * @tc.desc   get display available width and height
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAvailableWidthAndHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testGetAvailableWidthAndHeight';
      console.info(`jsunittets ${caseName} begin`);
      try {
        let displayInfo = display.getDefaultDisplaySync();
        console.info(`${caseName} availableWidth: ${displayInfo.availableWidth}`);
        console.info(`${caseName} availableHeight: ${displayInfo.availableHeight}`);
        expect(displayInfo.availableWidth).assertLargerOrEqual(0);
        expect(displayInfo.availableHeight).assertLargerOrEqual(0);
        done();
      } catch (error) {
        console.error(`jsunittets ${caseName} fail to get display available info :`+ error);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   test_FoldStatus_enum
     * @tc.number SUB_BASIC_WMS_FOLDSTATUS_0100
     * @tc.desc   test_FoldStatus_enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_FoldStatus_enum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_FoldStatus_enum';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      expect(display.FoldStatus.FOLD_STATUS_EXPANDED_WITH_SECOND_EXPANDED).assertEqual(11);
      expect(display.FoldStatus.FOLD_STATUS_EXPANDED_WITH_SECOND_HALF_FOLDED).assertEqual(21);
      expect(display.FoldStatus. FOLD_STATUS_FOLDED_WITH_SECOND_EXPANDED).assertEqual(12);
      expect(display.FoldStatus.FOLD_STATUS_FOLDED_WITH_SECOND_HALF_FOLDED).assertEqual(22);
      expect(display.FoldStatus. FOLD_STATUS_HALF_FOLDED_WITH_SECOND_EXPANDED).assertEqual(13);
      expect(display.FoldStatus.FOLD_STATUS_HALF_FOLDED_WITH_SECOND_HALF_FOLDED).assertEqual(23);
      done();

    });
    /**
     * @tc.name   test_CreateVirtualScreen_ErrorCode1400001
     * @tc.number SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_ERRORCODE_0100
     * @tc.desc   test_CreateVirtualScreen_ErrorCode1400001 when got invalid size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_CreateVirtualScreen_ErrorCode1400001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_CreateVirtualScreen_ErrorCode1400001 ';
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: -1,
        height: 2340,
        density: 2,
        surfaceId: ''
      }
      try {
        display.createVirtualScreen(option).then((screenId: number) => {
          console.info(caseName + 'succeeded in create virtual screen, data : ' + JSON.stringify(screenId));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(caseName + 'failed to create the virtual screen, err : ' + JSON.stringify(err));
          expect(err.code == 1400001).assertTrue();
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in createVirtualScreen, err : ' + JSON.stringify(err));
        if (err.code != 801) {
          expect().assertFail();
        }
        done();
      }
    });
    /**
     * @tc.name   test_CreateVirtualScreen_ErrorCode401
     * @tc.number SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_ERRORCODE_0200
     * @tc.desc   test_CreateVirtualScreen_ErrorCode_401 when got arguments with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_CreateVirtualScreen_ErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_CreateVirtualScreen_ErrorCode401 ';
      try {
        display.createVirtualScreen(null).then((screenId: number) => {
          console.info(caseName + 'succeeded in create virtual screen, data : ' + JSON.stringify(screenId));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(caseName + 'failed to create the virtual screen, err : ' + JSON.stringify(err));
          expect(err.code == 401).assertTrue();
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in createVirtualScreen, err : ' + JSON.stringify(err));
        if (err.code != 801 && err.code != 401) {
          expect().assertFail();
        }
        done();
      }
    });
    /**
     * @tc.name   test_CreateVirtualScreen01
     * @tc.number SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_0100
     * @tc.desc   test_CreateVirtualScreen01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_CreateVirtualScreen01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_CreateVirtualScreen01 ';
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 100,
        height: 2340,
        density: 2,
        surfaceId: ''
      }
      try {
        await display.createVirtualScreen(option).then(async (screenId: number) => {
          console.info(caseName + 'succeeded in create virtual screen, data : ' + JSON.stringify(screenId));
          await display.destroyVirtualScreen(screenId).then(() => {
            console.log(caseName + 'succeeded in destroyVirtualScreen');
            done();
          }).catch((err: BusinessError) => {
            console.log(caseName + 'failed to destroyVirtualScreen, err : ' + JSON.stringify(err));
            expect().assertFail();
            done();
          })
        })
      } catch (err) {
        console.log(caseName + 'error in createVirtualScreen, err : ' + JSON.stringify(err));
        expect(err.code == 801).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   test_DestroyVirtualScreenErrorcode401
     * @tc.number SUB_BASIC_WMS_DESTROY_VIRTUALSCREEN_ERRORCODE_0100
     * @tc.desc   test_DestroyVirtualScreenErrorcode_401 when got invalid screendId like -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_DestroyVirtualScreenErrorcode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_DestroyVirtualScreenErrorcode401 ';
      try {
        await display.destroyVirtualScreen(-1).then(() => {
          console.info(caseName + 'succeeded in destroy virtual screen, data : ');
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in destroyVirtualScreen, err : ' + JSON.stringify(err));
        expect(err.code == 801 || err.code == 401).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   test_DestroyVirtualScreenErrorcode401_02
     * @tc.number SUB_BASIC_WMS_DESTROY_VIRTUALSCREEN_ERRORCODE_0200
     * @tc.desc   test_DestroyVirtualScreenErrorcode_401 when destroy a screen that has already been destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_DestroyVirtualScreenErrorcode401_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_DestroyVirtualScreenErrorcode401_02 ';
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 1,
        height: 2340,
        density: 2,
        surfaceId: ''
      }
      try {
        await display.createVirtualScreen(option).then(async (screenId: number) => {
          console.info(caseName + 'Succeeded in creating ther virtual screen. Data: ' + JSON.stringify(screenId));
          await display.destroyVirtualScreen(screenId).then(() => {
            console.info(caseName + 'Succeeded in destroyVirtualScreen1');
          }).catch((err: BusinessError) => {
            console.info(caseName + 'Failed in destroyVirtualScreen1');
            expect().assertFail();
            done();
          })
          await display.destroyVirtualScreen(screenId).then(() => {
            console.info(caseName + 'Succeeded in destroyVirtualScreen2');
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.info(caseName + 'Failed in destroyVirtualScreen2');
            expect(err.code == 401);
            done();
          })
        })
      } catch (err) {
        console.log(caseName + 'error in destroyVirtualScreen, err : ' + JSON.stringify(err));
        expect(err.code == 801);
        done();
      }
    });
    /**
     * @tc.name   test_MakeUniqueErrorcode_401
     * @tc.number SUB_BASIC_WMS_MAKEUNIQUE_ERRORCODE_0100
     * @tc.desc   test_MakeUniqueErrorcode_401 when got invalid screenId like -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_MakeUniqueErrorcode_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_MakeUniqueErrorcode_401 ';
      try {
        await display.makeUnique(-1).then(()=>{
          console.log(caseName + 'Succeeded in makeUnique');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(caseName + 'Error in makeUnique, err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in destroyVirtualScreen, err : ' + JSON.stringify(err));
        expect(err.code == 401 || err.code == 801).assertTrue()
        done();
      }
    });
    /**
     * @tc.name   test_MakeUniqueErrorcode_1400001
     * @tc.number SUB_BASIC_WMS_MAKEUNIQUE_ERRORCODE_0200
     * @tc.desc   test_MakeUniqueErrorcode_1400001 when makeUnique a virtual screen that has already been destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_MakeUniqueErrorcode_1400001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_MakeUniqueErrorcode_1400001 ';
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 1,
        height: 2340,
        density: 2,
        surfaceId: ''
      }
      try {
        let vid = await display.createVirtualScreen(option);
        console.log(caseName + 'Success in createVirtualScreen, screendId : ' + vid);
        await display.destroyVirtualScreen(vid);
        console.log(caseName + 'Success in destroyVirtualScreen');

        display.makeUnique(vid).then(() => {
          console.log(caseName + 'Success in make unique screen');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.log(caseName + 'Failed to makeUnique, err: ' + JSON.stringify(err));
          
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in destroyVirtualScreen, err : ' + JSON.stringify(err));
        expect(err.code == 801);
        done();
      }
    });
    /**
     * @tc.name   test_MakeUnique_01
     * @tc.number SUB_BASIC_WMS_MAKEUNIQUE_0100
     * @tc.desc   test_MakeUnique_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_MakeUnique_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_MakeUnique_01 ';
      let options: window.SubWindowOptions = {
        title: 'test_MakeUnique_01',
        decorEnabled: true,
      }
      
      try {
        await windowStage.createSubWindowWithOptions('test_MakeUnique_01', options).then(async (subWindowClass) => {
          subWindowClass.setUIContent('testability/pages/makeUniqueTest')
          await subWindowClass.resizeAsync(1000, 1200);
          await subWindowClass.moveWindowToAsync(100, 100)
          subWindowClass.showWindow();

          let driver = Driver.create();
          let btn = await driver.findComponent(ON.id('button'));

          if (btn == undefined) {
            console.log(caseName + 'device not support');
          } else {
            await btn.click();
            await sleep(1000);

            let hw = await driver.findComponent(ON.id('testResult'));
            let testNum = await hw.getText();
            console.log(caseName + 'testResult : ' + testNum);
            expect(testNum == 'success' || testNum == 'not support').assertTrue();
          }
          await sleep(1000);
          await subWindowClass.destroy();
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in makeunique, err : ' + JSON.stringify(err));
        if (err.code != 1300002) {
          expect().assertFail();
        }
        done();
      }
    });
    /**
     * @tc.name   test_setVirtualScreenSurface_ErrorCode401
     * @tc.number SUB_BASIC_WMS_SET_VIRTUALSCREEN_SURFACE_ERRORCODE_0100
     * @tc.desc   test_setVirtualScreenSurface_ErrorCode401 when got a invalid screenId like -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setVirtualScreenSurface_ErrorCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setVirtualScreenSurface_ErrorCode401 ';
      try {
        await display.setVirtualScreenSurface(-1, '').then(() => {
          console.log(caseName + 'success in setVirtualScreenSurface');
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in setVirtualScreenSurface, err : ' + JSON.stringify(err));
        expect(err.code == 401 || err.code == 801).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   test_setVirtualScreenSurface_ErrorCode401_02
     * @tc.number SUB_BASIC_WMS_SET_VIRTUALSCREEN_SURFACE_ERRORCODE_0200
     * @tc.desc   test_setVirtualScreenSurface_ErrorCode401 when got non existent surfaceId like ''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setVirtualScreenSurface_ErrorCode401_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_setVirtualScreenSurface_ErrorCode401_02 ';
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 1,
        height: 2340,
        density: 2,
        surfaceId: ''
      };
      try {
        let screenId: number = await display.createVirtualScreen(option);
        console.log(caseName + 'success in createVirtualScreen ' + screenId);
        await display.setVirtualScreenSurface(screenId, '').then(() => {
          console.log(caseName + 'success in setVirtualScreenSurface');
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(caseName + 'error in setVirtualScreenSurface, err : ' + JSON.stringify(err));
        expect(err.code == 401 || err.code == 801).assertTrue();
        done();
      }
    });



    /**
     * @tc.name   getDisplayByIdSync
     * @tc.number testGetDisplayByIdSyncErrCode401_0100
     * @tc.desc   getDisplayByIdSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDisplayByIdSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let caseName = "getDisplayByIdSync";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        display.getDisplayByIdSync(null);
        console.error(msgStr + 'Succeeded in calling getDisplayByIdSync.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call getDisplayByIdSync. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done()
      }
    });

    /**
     * @tc.name   on_foldAngleChange
     * @tc.number testOnFoldAngleChangeErrCode401_0100
     * @tc.desc   on_foldAngleChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('on_foldAngleChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = "on_foldAngleChange";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        const callback = (res: Array<number>) => {}
        display.on(null, callback);
        console.error(msgStr + 'Succeeded in calling on_foldAngleChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call on_foldAngleChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done()
      }
    });

    /**
     * @tc.name   off_foldAngleChange
     * @tc.number testOffFoldAngleChangeErrCode401_0100
     * @tc.desc   off_foldAngleChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('off_foldAngleChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = "off_foldAngleChange";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        const callback = (res: Array<number>) => {}
        display.off(null, callback);
        console.error(msgStr + 'Succeeded in calling off_foldAngleChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call off_foldAngleChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done()
      }
    });

    /**
     * @tc.name   on_captureStatusChange
     * @tc.number testOnCaptureStatusChangeErrCode401_0100
     * @tc.desc   on_captureStatusChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('on_captureStatusChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = "on_captureStatusChange";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        const callback = (res: boolean) => {}
        display.on(null, callback);
        console.error(msgStr + 'Succeeded in calling on_captureStatusChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call on_captureStatusChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done()
      }
    });

    /**
     * @tc.name   off_captureStatusChange
     * @tc.number testOffCaptureStatusChangeErrCode401_0100
     * @tc.desc   off_captureStatusChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('off_captureStatusChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = "off_captureStatusChange";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        const callback = (res: boolean) => {}
        display.off(null, callback);
        console.error(msgStr + 'Succeeded in calling off_captureStatusChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call off_captureStatusChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done()
      }
    });

    /**
     * @tc.name   on_availableAreaChange
     * @tc.number testOnAvailableAreaChangeErrCode401_0100
     * @tc.desc   on_availableAreaChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('on_availableAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = "on_availableAreaChange";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let displayClass: display.Display | null = null;
        displayClass = display.getDefaultDisplaySync();
        const callback = (res: display.Rect) => {}
        displayClass.on(null, callback);
        console.error(msgStr + 'Succeeded in calling on_availableAreaChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call on_availableAreaChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done()
      }
    });

    /**
     * @tc.name   off_availableAreaChange
     * @tc.number testOffAvailableAreaChangeErrCode401_0100
     * @tc.desc   off_availableAreaChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('off_availableAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      let caseName = "off_availableAreaChange";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let displayClass: display.Display | null = null;
        displayClass = display.getDefaultDisplaySync();
        const callback = (res: display.Rect) => {}
        displayClass.off(null, callback);
        console.error(msgStr + 'Succeeded in calling off_availableAreaChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call off_availableAreaChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        done()
      }
    });


    /**
     * @tc.name   test_GetCutoutInfo
     * @tc.number SUB_BASIC_WMS_GET_CUTOUT_INFO_0100
     * @tc.desc   test_GetCutoutInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_GetCutoutInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'test_GetCutoutInfo';
      console.info(`jsunittets ${caseName} begin`);
      try {
        let displayClass: display.Display | null = null;
        displayClass = display.getDefaultDisplaySync();
        let info = await displayClass.getCutoutInfo();
        console.info(`${caseName} CutoutInfo.boundingRects: ${info.boundingRects}`);
        console.info(`${caseName} CutoutInfo.waterfallDisplayAreaRects.left: ${info.waterfallDisplayAreaRects.left}`);
        console.info(`${caseName} CutoutInfo.waterfallDisplayAreaRects.top: ${info.waterfallDisplayAreaRects.top}`);
        console.info(`${caseName} CutoutInfo.waterfallDisplayAreaRects.right: ${info.waterfallDisplayAreaRects.right}`);
        console.info(`${caseName} CutoutInfo.waterfallDisplayAreaRects.bottom: ${info.waterfallDisplayAreaRects.bottom}`);
        done();
      } catch (error) {
        console.error(`jsunittets ${caseName} fail to get display available info :` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   test_ScreenShape_0100
     * @tc.number SUB_BASIC_WMS_ScreenShape_0100
     * @tc.desc   test_ScreenShape_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_ScreenShape_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "test_ScreenShape_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        expect(display.ScreenShape.RECTANGLE).assertEqual(0)
        expect(display.ScreenShape.ROUND).assertEqual(1)
        done();
      } catch (error) {
        console.error(`jsunittets ${caseName} fail to test_ScreenShape, cause:` + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_DisplaySourceMode_enum
     * @tc.number SUB_BASIC_WMS_DisplaySourceMode_0100
     * @tc.desc   test_DisplaySourceMode_enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_DisplaySourceMode_enum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_DisplaySourceMode_enum';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      expect(display.DisplaySourceMode.NONE).assertEqual(0);
      expect(display.DisplaySourceMode.MAIN).assertEqual(1);
      expect(display.DisplaySourceMode.MIRROR).assertEqual(2);
      expect(display.DisplaySourceMode.EXTEND).assertEqual(3);
      expect(display.DisplaySourceMode.ALONE).assertEqual(4);
      done();
    });

    /**
     * @tc.name   test_display_DisplaySourceMode
     * @tc.number SUB_BASIC_WMS_DisplaySourceMode_0200
     * @tc.desc   test_display_DisplaySourceMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_display_DisplaySourceMode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_display_DisplaySourceMode';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass = display.getDefaultDisplaySync();
      console.info(msgStr + 'getDefaultDisplaySync DisplaySourceMode: ' + JSON.stringify(displayClass.sourceMode));
      console.info(msgStr + 'getDefaultDisplaySync ScreenShape: ' + JSON.stringify(displayClass.screenShape));
      console.info(msgStr + 'getDefaultDisplaySync x: ' + JSON.stringify(displayClass.x));
      console.info(msgStr + 'getDefaultDisplaySync y: ' + JSON.stringify(displayClass.y));
      done();
    });
    /**
     * @tc.name   testOnaddErrCode401_0100
     * @tc.number SUB_BASIC_WMS_ON_add_401_0100
     * @tc.desc   testOnaddErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnaddErrCode401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnaddErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let callback: Callback<number> = (data: number) => {
        console.info('Listening enabled. Data: ' + JSON.stringify(data));
      };

      try {
        display.on(null, callback);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(msgStr  + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.name   testoffaddErrCode401_0100
     * @tc.number SUB_BASIC_WMS_ON_add_401_0200
     * @tc.desc   testoffaddErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testoffaddErrCode401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testoffaddErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let callback: Callback<number> = (data: number) => {
        console.info('Listening enabled. Data: ' + JSON.stringify(data));
      };

      try {
        display.off(null, callback);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(msgStr +  'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.name   testonfoldStatusChange401_0100
     * @tc.number SUB_BASIC_WMS_ON_foldStatusChange_401_0100
     * @tc.desc   testonfoldStatusChange401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testonfoldStatusChange401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testonfoldStatusChange401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let callback: Callback<display.FoldStatus> = (data: display.FoldStatus) => {
        console.info('Listening enabled. Data: ' + JSON.stringify(data));
      };

      try {
        display.on(null, callback);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.name   testofffoldStatusChange401_0100
     * @tc.number SUB_BASIC_WMS_ON_foldStatusChange_401_0200
     * @tc.desc   testofffoldStatusChange401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testofffoldStatusChange401_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testofffoldStatusChange401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let callback: Callback<display.FoldStatus> = (data: display.FoldStatus) => {
        console.info('Listening enabled. Data: ' + JSON.stringify(data));
      };

      try {
        display.off(null, callback);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.name   testondisplayModeChange401
     * @tc.number SUB_BASIC_WMS_ON_displayModeChange_401_0100
     * @tc.desc   testondisplayModeChange401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testondisplayModeChange401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testondisplayModeChange401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let callback: Callback<display.FoldDisplayMode> = (data: display.FoldDisplayMode) => {
        console.info('Listening enabled. Data: ' + JSON.stringify(data));
      }
      try {
        display.on(null, callback);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.name   testoffdisplayModeChange401
     * @tc.number SUB_BASIC_WMS_ON_displayModeChange_401_0200
     * @tc.desc   testoffdisplayModeChange401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testoffdisplayModeChange401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testoffdisplayModeChange401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let callback: Callback<display.FoldDisplayMode> = (data: display.FoldDisplayMode) => {
        console.info('Listening enabled. Data: ' + JSON.stringify(data));
      }

      try {
        display.off(null, callback);
        expect().assertFail();
        done();
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(e.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.name   testMainScreenSupportRefreshRate
     * @tc.number SUB_BASIC_WMS_DMS_REFRESH_LEVEL_0100
     * @tc.desc   验证主屏刷新率支持的档位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMainScreenSupportRefreshRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testMainScreenSupportRefreshRate";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      //正整数
      let regNum = /^[1-9]\d*/
      try {
        let result = display.getDisplayByIdSync(0).supportedRefreshRates;
        console.log(`${caseName} display.getDisplayByIdSync(0): ${JSON.stringify(result)}`);
        if (result === undefined) {
          done();
        } else if(result !=null) {
          let length = result.length;
          console.log(`${caseName} dresult.length: ${length}`);
          for(let i=0;i<length-1;i++){
            console.log(`${caseName} i: i:${result[i]}`);
            //判断是否为正整数
            expect(regNum.test(String(result[i]))).assertTrue();
            //判断递增
            expect(result[i]).assertLess(result[i+1]);
          }
          done();
        }
      } catch (e) {
        console.error(`${caseName} Failed.err:${JSON.stringify(e)}`);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testVirtualScreenSupportRefreshRate
     * @tc.number SUB_BASIC_WMS_DMS_REFRESH_LEVEL_0200
     * @tc.desc   验证虚拟屏刷新率支持的档位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVirtualScreenSupportRefreshRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testVirtualScreenSupportRefreshRate";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 1,
        height: 2340,
        density: 2,
        surfaceId: ''
      };
      try {
        let screenId: number = await display.createVirtualScreen(option);
        console.log(caseName + ' success in createVirtualScreen ' + screenId);
        let result = display.getDisplayByIdSync(screenId).supportedRefreshRates;
        console.log(`${caseName} display.getDisplayByIdSync(0): ${JSON.stringify(result)}`);
        expect(result?.length).assertLarger(0);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. err: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    })

    /**
     * @tc.name   testConvertRelativeToGlobalCoordinatewithPositionOutofRange
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0100
     * @tc.desc   验证convertRelativeToGlobalCoordinate接口position超出int32报1400004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConvertRelativeToGlobalCoordinatewithPositionOutofRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testConvertRelativeToGlobalCoordinatewithPositionOutofRange";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let displayClass = display.getDefaultDisplaySync();
        console.log(`${caseName} displayClass.id: ${displayClass.id}`);
        const exceedMax = 2147483648;
        let position: display.Position = {
          x: exceedMax,
          y: exceedMax
        };
        let param: display.RelativePosition = {
          displayId: displayClass.id,
          position: position
        }
        display.convertRelativeToGlobalCoordinate(param);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. err: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1400004)
        done()
      }
    })

    /**
     * @tc.name   testConvertRelativeToGlobalCoordinatewithInvalidDisplayid
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0200
     * @tc.desc   验证convertRelativeToGlobalCoordinate接口display<0或>=0且display不存在报1400004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConvertRelativeToGlobalCoordinatewithInvalidDisplayid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testConvertRelativeToGlobalCoordinatewithInvalidDisplayid";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let position: display.Position = {
          x: 100,
          y: 100
        };
        let param1: display.RelativePosition = {
          displayId: -1,
          position: position
        }
        display.convertRelativeToGlobalCoordinate(param1);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed1. err: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1400004)
      }

      try {
        let position: display.Position = {
          x: 100,
          y: 100
        };
        let param2: display.RelativePosition = {
          displayId: 1,
          position: position
        }
        display.convertRelativeToGlobalCoordinate(param2);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed2. err: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1400004)
        done()
      }
    })

    /**
     * @tc.name   testConvertRelativeToGlobalCoordinatewithVirtualDisplay
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0300
     * @tc.desc   验证虚拟屏调用convertRelativeToGlobalCoordinate接口报1400004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConvertRelativeToGlobalCoordinatewithVirtualDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testConvertRelativeToGlobalCoordinatewithVirtualDisplay";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 100,
        height: 2340,
        density: 2,
        surfaceId: ''
      };
      try {
        let screenId: number = await display.createVirtualScreen(option);
        console.log(caseName + ' success in createVirtualScreen ' + screenId);
        let displays = await display.getAllDisplays();
        console.log(caseName + ' getAllDisplays: ' + JSON.stringify(displays));
        let outDisplayId = -1;
        for (let i = 0; i< displays.length; i++) {
          if (displays[i].id == screenId) {
            outDisplayId = displays[i].id;
            break;
          }
        }
        console.log(caseName + ' outDisplayId: ' + outDisplayId);
        let position: display.Position = {
          x: 50,
          y: 50
        };
        let param: display.RelativePosition = {
          displayId: outDisplayId,
          position: position
        }
        display.convertRelativeToGlobalCoordinate(param);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed2. err: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done()
        } else {
          expect(e.code).assertEqual(1400004)
          done()
        }
      }
    })

    /**
     * @tc.name   testConvertRelativeToGlobalCoordinate
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0400
     * @tc.desc   验证convertRelativeToGlobalCoordinate接口在除RK外的设备正常调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertRelativeToGlobalCoordinate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testConvertRelativeToGlobalCoordinate";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let result = display.getDisplayByIdSync(0);
        console.log(`${caseName} display.getDisplayByIdSync(0): ${JSON.stringify(result)}`);
        let width = result.width / 2;
        let height = result.height / 2;
        console.log(`${caseName} width: ${width}`);
        console.log(`${caseName} height: ${height}`);

        let position: display.Position = {
          x: width,
          y: height
        };
        let param: display.RelativePosition = {
          displayId: 0,
          position: position
        }
        let positionRes = display.convertRelativeToGlobalCoordinate(param);
        console.log(`${caseName} positionRes: ${JSON.stringify(positionRes)}`);
        expect(Math.abs(positionRes.x - width)).assertLargerOrEqual(0)
        expect(Math.abs(positionRes.y - height)).assertLargerOrEqual(0)
        done();
      } catch (e) {
        console.error(`${caseName} Failed2. err: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    })

    /**
     * @tc.name   testConvertGlobalToRelativeCoordinatewithPositionOutofRange
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0500
     * @tc.desc   验证convertGlobalToRelativeCoordinate接口position超出int32报1400004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConvertGlobalToRelativeCoordinatewithPositionOutofRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testConvertGlobalToRelativeCoordinatewithPositionOutofRange";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let displayClass = display.getDefaultDisplaySync();
        console.log(`${caseName} displayClass.id: ${displayClass.id}`);
        const exceedMax = 2147483648;
        let position: display.Position = {
          x: exceedMax,
          y: exceedMax
        };
        display.convertGlobalToRelativeCoordinate(position, displayClass.id);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. err: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1400004)
        done()
      }
    })

    /**
     * @tc.name   testConvertGlobalToRelativeCoordinatewithInvalidDisplayid
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0600
     * @tc.desc   验证convertGlobalToRelativeCoordinate接口传入displayId<0报1400004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConvertGlobalToRelativeCoordinatewithInvalidDisplayid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testConvertGlobalToRelativeCoordinatewithInvalidDisplayid";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let position: display.Position = {
          x: 50,
          y: 50
        };
        display.convertGlobalToRelativeCoordinate(position, -1);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. err: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1400004)
        done()
      }
    })

    /**
     * @tc.name   testConvertGlobalToRelativeCoordinatewithVirtualDisplay
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0700
     * @tc.desc   验证虚拟屏调用convertGlobalToRelativeCoordinate接口报1400004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConvertGlobalToRelativeCoordinatewithVirtualDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testConvertGlobalToRelativeCoordinatewithVirtualDisplay";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 100,
        height: 2340,
        density: 2,
        surfaceId: ''
      };
      try {
        let screenId: number = await display.createVirtualScreen(option);
        console.log(caseName + ' success in createVirtualScreen ' + screenId);
        let displays = await display.getAllDisplays();
        console.log(caseName + ' getAllDisplays: ' + JSON.stringify(displays));
        let outDisplayId = -1;
        for (let i = 0; i< displays.length; i++) {
          if (displays[i].id == screenId) {
            outDisplayId = displays[i].id;
            break;
          }
        }
        console.log(caseName + ' outDisplayId: ' + outDisplayId);
        let position: display.Position = {
          x: 50,
          y: 50
        };
        display.convertGlobalToRelativeCoordinate(position, outDisplayId);
        expect().assertFail();
        done();
      } catch (e) {
        console.error(`${caseName} Failed2. err: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done()
        } else {
          expect(e.code).assertEqual(1400004)
          done()
        }
      }
    })

    /**
     * @tc.name   testConvertGlobalToRelativeCoordinatewithDisplayid
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0800
     * @tc.desc   验证convertGlobalToRelativeCoordinate接口，传入displayId，在除RK外的设备正常调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertGlobalToRelativeCoordinatewithDisplayid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testConvertGlobalToRelativeCoordinatewithDisplayid";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let result = display.getDisplayByIdSync(0);
        console.log(`${caseName} display.getDisplayByIdSync(0): ${JSON.stringify(result)}`);
        let width = result.width / 2;
        let height = result.height / 2;
        console.log(`${caseName} width: ${width}`);
        console.log(`${caseName} height: ${height}`);

        let position: display.Position = {
          x: width,
          y: height
        };
        let relativePosition = display.convertGlobalToRelativeCoordinate(position, 0);
        console.log(`${caseName} relativePosition: ${JSON.stringify(relativePosition)}`);
        expect(Math.abs(relativePosition.position.x - width)).assertLargerOrEqual(0)
        expect(Math.abs(relativePosition.position.y - height)).assertLargerOrEqual(0)
        expect(relativePosition.displayId).assertEqual(0)
        done();
      } catch (e) {
        console.error(`${caseName} Failed2. err: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    })

    /**
     * @tc.name   testConvertGlobalToRelativeCoordinatewithoutDisplayid
     * @tc.number SUB_BASIC_WMS_CONVERTCOORDINATE_0900
     * @tc.desc   验证convertGlobalToRelativeCoordinate接口，不传入displayId，在除RK外的设备正常调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConvertGlobalToRelativeCoordinatewithoutDisplayid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testConvertGlobalToRelativeCoordinatewithoutDisplayid";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let result = display.getDisplayByIdSync(0);
        console.log(`${caseName} display.getDisplayByIdSync(0): ${JSON.stringify(result)}`);
        let width = result.width / 2;
        let height = result.height / 2;
        console.log(`${caseName} width: ${width}`);
        console.log(`${caseName} height: ${height}`);

        let position: display.Position = {
          x: width,
          y: height
        };
        let relativePosition = display.convertGlobalToRelativeCoordinate(position);
        console.log(`${caseName} relativePosition: ${JSON.stringify(relativePosition)}`);
        expect(Math.abs(relativePosition.position.x - width)).assertLargerOrEqual(0)
        expect(Math.abs(relativePosition.position.y - height)).assertLargerOrEqual(0)
        expect(relativePosition.displayId).assertEqual(0)
        done();
      } catch (e) {
        console.error(`${caseName} Failed2. err: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    })

    /**
     * @tc.name   testGetLiveCreaseRegion
     * @tc.number SUB_BASIC_WMS_GET_LIVE_CREASE_REGION_0100
     * @tc.desc   验证折叠设备可查询到折痕区域，非折叠设备折痕区域返回空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLiveCreaseRegion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetLiveCreaseRegion";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let result = display.isFoldable();
        console.log(`${caseName} isFoldable: ${result}`);
        let defaultDisplay = display.getDefaultDisplaySync();
        console.log(`${caseName} defaultDisplay: ${JSON.stringify(defaultDisplay)}`);
        let region = defaultDisplay.getLiveCreaseRegion();
        console.log(`${caseName} region: ${JSON.stringify(region)}`);
        expect(region.displayId).assertEqual(0)
        if (result) {
          if (region.creaseRects.length == 0) {
            done();
          } else {
            for (let i = 0; i < region.creaseRects.length; i++) {
              expect(region.creaseRects[i].left).assertLargerOrEqual(0);
              expect(region.creaseRects[i].top).assertLargerOrEqual(0);
              expect(region.creaseRects[i].width).assertLargerOrEqual(0);
              expect(region.creaseRects[i].height).assertLargerOrEqual(0);
              done();
            }
          }
        } else {
          expect(region.creaseRects.length).assertEqual(0)
          done();
        }
        
      } catch (e) {
        console.error(`${caseName} Failed2. err: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    })

    /**
     * @tc.name   testGetLiveCreaseRegionwithVirtualScreen
     * @tc.number SUB_BASIC_WMS_GET_LIVE_CREASE_REGION_0200
     * @tc.desc   验证虚拟盘折痕区域返回空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLiveCreaseRegionwithVirtualScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testGetLiveCreaseRegionwithVirtualScreen";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      class VirtualScreenOptions {
        name: string = '';
        width: number = 0;
        height: number = 0;
        density: number = 0;
        surfaceId: string = '';
      }
      let option: VirtualScreenOptions = {
        name: 'screen01',
        width: 100,
        height: 2340,
        density: 2,
        surfaceId: ''
      };
      try {
        let screenId: number = await display.createVirtualScreen(option);
        console.log(caseName + ' success in createVirtualScreen ' + screenId);
        let displays = await display.getAllDisplays();
        let outDisplayId = -1;
        for (let i = 0; i< displays.length; i++) {
          if (displays[i].id == screenId) {
            outDisplayId = displays[i].id;
            break;
          }
        }
        console.log(caseName + ' outDisplayId: ' + outDisplayId);
        let defaultDisplay = display.getDefaultDisplaySync();
        console.log(`${caseName} defaultDisplay: ${JSON.stringify(defaultDisplay)}`);
        let region = defaultDisplay.getLiveCreaseRegion();
        console.log(`${caseName} region: ${JSON.stringify(region)}`);
        expect(region.displayId).assertEqual(0)
        expect(region.creaseRects.length).assertLargerOrEqual(0)
        done();
      } catch (e) {
        console.error(`${caseName} Failed2. err: ${JSON.stringify(e)}`);
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    })
    /**
     * @tc.name   testisFoldable
     * @tc.number SUB_BASIC_WMS_FUNCTION_ISFOLDABLE_0100
     * @tc.desc   Test the function value of getSubWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testisFoldable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testisFoldable';
      try {
        let isFoldable = display.isFoldable();
        console.log(`${caseName} isFoldable. : ${JSON.stringify(isFoldable)}`);
        expect(isFoldable == true || isFoldable == false).assertEqual(true);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   testgetAllDisplay_promise_null
     * @tc.number SUB_BASIC_WMS_FUNCTION_GETALLDISPLAY_0100
     * @tc.desc   testgetAllDisplay_promise_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testgetAllDisplay_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testgetAllDisplay_promise_null';
      let mainWindow = windowStage.getMainWindowSync();
      const callback = async (data: window.WindowStageLifecycleEventType) => {
        console.info(caseName+ ` Succeeded in enabling the listener for window stage event changes. Data: ${JSON.stringify(data)}`);
        if (data === window.WindowStageLifecycleEventType.HIDDEN) {
          console.info(caseName+ ' current window stage event is HIDDEN');
          let displays = await display.getAllDisplay();
          console.info(caseName+` Succeeded in obtaining all the display objects. Data: ${JSON.stringify(displays)}`);
          expect(displays.length).assertLargerOrEqual(1);
          windowStage.off('windowStageLifecycleEvent', callback);
          await mainWindow.restore();
          console.info(caseName+ ' restore success');
          done();
        }
      }
      try {
        if(isPCStatus != ''){
          windowStage.on('windowStageLifecycleEvent', callback);
          await mainWindow.minimize();
          console.info(caseName+ ' minimize success');
          await sleep(3000);
        }else {
          done();
        }

      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   testgetAllDisplay_Callback_null
     * @tc.number SUB_BASIC_WMS_FUNCTION_GETALLDISPLAY_0200
     * @tc.desc   testgetAllDisplay_Callback_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetAllDisplay_Callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testgetAllDisplay_Callback_null';
      let mainWindow = windowStage.getMainWindowSync();
      const callback = async (data: window.WindowStageLifecycleEventType) => {
        console.info(caseName+ ` Succeeded in enabling the listener for window stage event changes. Data: ${JSON.stringify(data)}`);
        if (data === window.WindowStageLifecycleEventType.HIDDEN) {
          console.info(caseName+ ' current window stage event is HIDDEN');
          display.getAllDisplay(async (err: BusinessError, data: Array<display.Display>) => {
            const errCode: number = err.code;
            if (errCode) {
              console.error(caseName+ ` Failed to obtain all the display objects. Code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              windowStage.off('windowStageLifecycleEvent', callback);
              await mainWindow.restore();
              console.info(caseName+ ' restore success');
              done();
            }else {
              console.info(caseName+` Succeeded in obtaining all the display objects. Data: ${JSON.stringify(data)}`);
              let displays = data;
              expect(displays.length).assertLargerOrEqual(1);
              windowStage.off('windowStageLifecycleEvent', callback);
              await mainWindow.restore();
              console.info(caseName+ ' restore success');
              done();
            }

          });
        }
      }
      try {
        if(isPCStatus != ''){
          windowStage.on('windowStageLifecycleEvent', callback);
          await mainWindow.minimize();
          console.info(caseName+ ' minimize success');
          await sleep(3000);
        }else {
          done();
        }

      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   testgetAllDisplays_Callback_null
     * @tc.number SUB_BASIC_WMS_FUNCTION_GETALLDISPLAYS_0100
     * @tc.desc   testgetAllDisplays_Callback_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetAllDisplays_Callback_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testgetAllDisplays_Callback_null';
      let mainWindow = windowStage.getMainWindowSync();
      const callback = async (data: window.WindowStageLifecycleEventType) => {
        console.info(caseName+ ` Succeeded in enabling the listener for window stage event changes. Data: ${JSON.stringify(data)}`);
        if (data === window.WindowStageLifecycleEventType.HIDDEN) {
          console.info(caseName+ ' current window stage event is HIDDEN');
          display.getAllDisplays(async (err: BusinessError, data: Array<display.Display>) => {
            const errCode: number = err.code;
            if (errCode) {
              console.error(caseName+ ` Failed to obtain all the display objects. Code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              windowStage.off('windowStageLifecycleEvent', callback);
              await mainWindow.restore();
              console.info(caseName+ ' restore success');
              done();
            }else {
              console.info(caseName+` Succeeded in obtaining all the display objects. Data: ${JSON.stringify(data)}`);
              let displays = data;
              expect(displays.length).assertLargerOrEqual(1);
              windowStage.off('windowStageLifecycleEvent', callback);
              await mainWindow.restore();
              console.info(caseName+ ' restore success');
              done();
            }

          });
        }
      }
      try {
        if(isPCStatus != ''){
          windowStage.on('windowStageLifecycleEvent', callback);
          await mainWindow.minimize();
          console.info(caseName+ ' minimize success');
          await sleep(3000);
        }else {
          done();
        }

      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   testgetAllDisplays_promise_null
     * @tc.number SUB_BASIC_WMS_FUNCTION_GETALLDISPLAYS_0200
     * @tc.desc   testgetAllDisplays_promise_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetAllDisplays_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testgetAllDisplays_promise_null';
      let mainWindow = windowStage.getMainWindowSync();
      const callback = async (data: window.WindowStageLifecycleEventType) => {
        console.info(caseName+ ` Succeeded in enabling the listener for window stage event changes. Data: ${JSON.stringify(data)}`);
        if (data === window.WindowStageLifecycleEventType.HIDDEN) {
          console.info(caseName+ ' current window stage event is HIDDEN');
          let displays = await display.getAllDisplays();
          console.info(caseName+` Succeeded in obtaining all the display objects. Data: ${JSON.stringify(displays)}`);
          expect(displays.length).assertLargerOrEqual(1);
          windowStage.off('windowStageLifecycleEvent', callback);
          await mainWindow.restore();
          console.info(caseName+ ' restore success');
          done();
        }
      }
      try {
        if(isPCStatus != ''){
          windowStage.on('windowStageLifecycleEvent', callback);
          await mainWindow.minimize();
          console.info(caseName+ ' minimize success');
          await sleep(3000);
        }else {
          done();
        }

      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   testgetAllDisplayPhysicalResolution_promise_null
     * @tc.number SUB_BASIC_WMS_FUNCTION_GETALLDISPLAY_PHYSICAL_RESOLUTION_0100
     * @tc.desc   testgetAllDisplayPhysicalResolution_promise_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testgetAllDisplayPhysicalResolution_promise_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testgetAllDisplayPhysicalResolution_promise_null';
      let mainWindow = windowStage.getMainWindowSync();
      const callback = async (data: window.WindowStageLifecycleEventType) => {
        console.info(caseName+ ` Succeeded in enabling the listener for window stage event changes. Data: ${JSON.stringify(data)}`);
        if (data === window.WindowStageLifecycleEventType.HIDDEN) {
          console.info(caseName+ ' current window stage event is HIDDEN');
          let resolutionObjects = await display.getAllDisplayPhysicalResolution();
          console.info(caseName+` Succeeded in obtaining all the resolutionObjects . Data: ${JSON.stringify(resolutionObjects)}`);
          expect(resolutionObjects.length).assertLargerOrEqual(1);
          windowStage.off('windowStageLifecycleEvent', callback);
          await mainWindow.restore();
          console.info(caseName+ ' restore success');
          done();
        }
      }
      try {
        if(isPCStatus != ''){
          windowStage.on('windowStageLifecycleEvent', callback);
          await mainWindow.minimize();
          console.info(caseName+ ' minimize success');
          await sleep(3000);
        }else {
          done();
        }

      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_GET_BRIGHTNESS_INFO_0100
     * @tc.name       testGetBrightnessInfowithMainDisplayid
     * @tc.desc       查询主屏亮度信息
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testGetBrightnessInfowithMainDisplayid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testGetBrightnessInfowithMainDisplayid';
      try {
        let brightnessInfo = display.getBrightnessInfo(0);
        console.log(`${caseName} brightnessInfo: ${JSON.stringify(brightnessInfo)}`);
        expect(brightnessInfo.sdrNits).assertLarger(0);
        expect(brightnessInfo.currentHeadroom).assertLarger(0);
        expect(brightnessInfo.maxHeadroom).assertLarger(0);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code == 801) {
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_GET_BRIGHTNESS_INFO_0200
     * @tc.name       testGetBrightnessInfowithVirtualDisplayid
     * @tc.desc       查询虚拟屏亮度信息
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testGetBrightnessInfowithVirtualDisplayid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testGetBrightnessInfowithVirtualDisplayid';
      try {
        let option: display.VirtualScreenConfig = {
          name: 'screen01',
          width: 100,
          height: 2340,
          density: 2,
          surfaceId: ''
        };
        let screenId: number = await display.createVirtualScreen(option);
        console.log(caseName + ' success in createVirtualScreen ' + screenId);
        let brightnessInfo = display.getBrightnessInfo(screenId);
        await sleep(300)
        console.log(`${caseName} brightnessInfo: ${JSON.stringify(brightnessInfo)}`);
        expect(brightnessInfo.sdrNits).assertEqual(500);
        expect(brightnessInfo.currentHeadroom).assertEqual(1);
        expect(brightnessInfo.maxHeadroom).assertEqual(1);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code == 801) {
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_GET_BRIGHTNESS_INFO_0300
     * @tc.name       testGetBrightnessInfowithNonExistedDisplayId
     * @tc.desc       查询大于0但不存在的屏幕亮度信息
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level3
     */
    it('testGetBrightnessInfowithNonExistedDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetBrightnessInfowithNonExistedDisplayId';
      try {
        let brightnessInfo = display.getBrightnessInfo(2000);
        console.log(`${caseName} brightnessInfo: ${JSON.stringify(brightnessInfo)}`);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code == 801) {
          done()
        } else {
          expect(e.code).assertEqual(1400004);
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_GET_BRIGHTNESS_INFO_0400
     * @tc.name       testGetBrightnessInfowithNegativeDisplayId
     * @tc.desc       查询小于0不存在的屏幕亮度信息
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level3
     */
    it('testGetBrightnessInfowithNegativeDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetBrightnessInfowithNegativeDisplayId';
      try {
        let brightnessInfo = display.getBrightnessInfo(-1);
        console.log(`${caseName} brightnessInfo: ${JSON.stringify(brightnessInfo)}`);
        expect(false).assertTrue();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code == 801) {
          done()
        } else {
          expect(e.code).assertEqual(1400004);
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_ON_BRIGHTNESS_CHANGE_0100
     * @tc.name       testOnBrightnessInfoChange_0100
     * @tc.desc       主屏通过调节窗口亮度触发屏幕亮度信息变化，取消全部监听
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testOnBrightnessInfoChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testOnBrightnessInfoChange_0100';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setWindowBrightness(1);
        await sleep(100);
        let brightnessChangeCount1 = 0;
        let brightnessChangeCount2 = 0;
        let callback1Triggered = false;
        let callback2Triggered = false;

        const callback1 = (displayId: number, brightnessInfo: display.BrightnessInfo) => {
          console.info(caseName + ' Callback1 triggered');
          console.info(`${caseName} DisplayId: ${displayId}, BrightnessInfo: ${JSON.stringify(brightnessInfo)}`);
          brightnessChangeCount1 = brightnessChangeCount1 + 1;
          callback1Triggered = true;
          expect(displayId).assertEqual(0);
          expect(brightnessInfo.sdrNits).assertLarger(0);
          expect(brightnessInfo.currentHeadroom).assertLarger(0);
          expect(brightnessInfo.maxHeadroom).assertLarger(0);
          console.info(`${caseName} Callback1: brightnessChangeCount1 = ${brightnessChangeCount1}`);
        };

        const callback2 = (displayId: number, brightnessInfo: display.BrightnessInfo) => {
          console.info(caseName + ' Callback2 triggered');
          console.info(`${caseName} DisplayId: ${displayId}, BrightnessInfo: ${JSON.stringify(brightnessInfo)}`);
          brightnessChangeCount2 = brightnessChangeCount2 + 1;
          callback2Triggered = true;
          expect(displayId).assertEqual(0);
          expect(brightnessInfo.sdrNits).assertLarger(0);
          expect(brightnessInfo.currentHeadroom).assertLarger(0);
          expect(brightnessInfo.maxHeadroom).assertLarger(0);
          console.info(`${caseName} Callback2: brightnessChangeCount2 = ${brightnessChangeCount2}`);
        };
        display.on('brightnessInfoChange', callback1);
        display.on('brightnessInfoChange', callback2);
        console.info(caseName + ' Brightness change listeners registered successfully');
        await windowClass.setWindowBrightness(0);
        await sleep(100);
        while (!callback1Triggered) {
          await sleep(100);
        }
        console.info(`${caseName} brightnessChangeCount1 = ${brightnessChangeCount1}`);
        while (!callback2Triggered) {
          await sleep(100);
        }
        console.info(`${caseName} brightnessChangeCount2 = ${brightnessChangeCount2}`);
        expect(brightnessChangeCount1).assertLarger(0);
        expect(brightnessChangeCount2).assertLarger(0);
        display.off('brightnessInfoChange');
        await sleep(100);
        brightnessChangeCount1 = 0;
        brightnessChangeCount2 = 0;
        await windowClass.setWindowBrightness(1);
        await sleep(3000);
        console.info(`${caseName} after off brightnessChangeCount1 = ${brightnessChangeCount1}`);
        console.info(`${caseName} after off brightnessChangeCount2 = ${brightnessChangeCount2}`);
        expect(brightnessChangeCount1).assertEqual(0);
        expect(brightnessChangeCount2).assertEqual(0);
        await windowClass.setWindowBrightness(-1);
        await sleep(100);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        if (e.code == 801) {
          done()
        } else {
          display.off('brightnessInfoChange');
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_ON_BRIGHTNESS_CHANGE_0200
     * @tc.name       testOnBrightnessInfoChange_0200
     * @tc.desc       主屏通过调节窗口亮度触发屏幕亮度信息变化，取消指定监听
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testOnBrightnessInfoChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testOnBrightnessInfoChange_0200';
      try {
        let windowClass = await windowStage.getMainWindow();
        await windowClass.setWindowBrightness(1);
        await sleep(100);
        let brightnessChangeCount1 = 0;
        let brightnessChangeCount2 = 0;
        let callback1Triggered = false;
        let callback2Triggered = false;

        const callback1 = (displayId: number, brightnessInfo: display.BrightnessInfo) => {
          console.info(caseName + ' Callback1 triggered');
          console.info(`${caseName} DisplayId: ${displayId}, BrightnessInfo: ${JSON.stringify(brightnessInfo)}`);
          brightnessChangeCount1 = brightnessChangeCount1 + 1;
          callback1Triggered = true;
          expect(displayId).assertEqual(0);
          expect(brightnessInfo.sdrNits).assertLarger(0);
          expect(brightnessInfo.currentHeadroom).assertLarger(0);
          expect(brightnessInfo.maxHeadroom).assertLarger(0);
          console.info(`${caseName} Callback1: brightnessChangeCount1 = ${brightnessChangeCount1}`);
        };

        const callback2 = (displayId: number, brightnessInfo: display.BrightnessInfo) => {
          console.info(caseName + ' Callback2 triggered');
          console.info(`${caseName} DisplayId: ${displayId}, BrightnessInfo: ${JSON.stringify(brightnessInfo)}`);
          brightnessChangeCount2 = brightnessChangeCount2 + 1;
          callback2Triggered = true;
          expect(displayId).assertEqual(0);
          expect(brightnessInfo.sdrNits).assertLarger(0);
          expect(brightnessInfo.currentHeadroom).assertLarger(0);
          expect(brightnessInfo.maxHeadroom).assertLarger(0);
          console.info(`${caseName} Callback2: brightnessChangeCount2 = ${brightnessChangeCount2}`);
        };
        display.on('brightnessInfoChange', callback1);
        display.on('brightnessInfoChange', callback2);
        console.info(caseName + ' Brightness change listeners registered successfully');
        await windowClass.setWindowBrightness(0);
        await sleep(100);
        while (!callback1Triggered) {
          await sleep(100);
        }
        console.info(`${caseName} brightnessChangeCount1 = ${brightnessChangeCount1}`);
        expect(brightnessChangeCount1).assertLargerOrEqual(1);
        while (!callback2Triggered) {
          await sleep(100);
        }
        console.info(`${caseName} brightnessChangeCount2 = ${brightnessChangeCount2}`);
        expect(brightnessChangeCount2).assertLarger(0);
        display.off('brightnessInfoChange', callback1);
        await sleep(100);
        brightnessChangeCount1 = 0;
        brightnessChangeCount2 = 0;
        await windowClass.setWindowBrightness(1);
        await sleep(3000);
        console.info(`${caseName} after off callback1 brightnessChangeCount1 = ${brightnessChangeCount1}`);
        console.info(`${caseName} after off callback2 brightnessChangeCount2 = ${brightnessChangeCount2}`);
        expect(brightnessChangeCount1).assertEqual(0);
        expect(brightnessChangeCount2).assertLargerOrEqual(1);
        await windowClass.setWindowBrightness(-1);
        await sleep(100);
        display.off('brightnessInfoChange');
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        display.off('brightnessInfoChange');
        if (e.code == 801) {
          done()
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_ON_BRIGHTNESS_CHANGE_0300
     * @tc.name       testOnBrightnessInfoChange_0300
     * @tc.desc       异源虚拟屏上调节窗口亮度触发屏幕亮度信息变化，触发主屏亮度信息改变
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level1
     */
    it('testOnBrightnessInfoChange_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'testOnBrightnessInfoChange_0300';
      let subWindowClass: window.Window | undefined;
      try {
        subWindowClass = await windowStage.createSubWindow(caseName);
        subWindowClass.setUIContent('testability/pages/getSurfaceId')
        await subWindowClass.resizeAsync(1000, 1200);
        await subWindowClass.moveWindowToAsync(100, 300)
        subWindowClass.showWindow();

        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('button'));

        let screenId = 0;
        if (btn == undefined) {
          console.log(caseName + 'device not support');
        } else {
          await btn.click();
          await sleep(1000);

          let hw = await driver.findComponent(ON.id('testResult'));
          let testNum = await hw.getText();
          console.log(caseName + 'testResult : ' + testNum);
          expect(testNum == 'success').assertTrue();
          if (testNum == 'not support') {
            await subWindowClass.destroyWindow();
            done();
          } else {
            let screenIdStr = await driver.findComponent(ON.id('screenId'));
            console.log(caseName + 'screenIdStr : ' + screenIdStr);
            screenId = Number(screenIdStr);
          }
        }

        let options: StartOptions = {
          displayId: screenId
        }
        let windowStageStart = await startAbility(caseName, context, options);
        let windowClass = windowStageStart.getMainWindowSync();

        await windowClass.setWindowBrightness(0);
        await sleep(100);
        let brightnessChangeCount1 = 0;
        let callback1Triggered = false;

        const callback1 = (displayId: number, brightnessInfo: display.BrightnessInfo) => {
          console.info(caseName + ' Callback1 triggered');
          console.info(`${caseName} DisplayId: ${displayId}, BrightnessInfo: ${JSON.stringify(brightnessInfo)}`);
          brightnessChangeCount1 = brightnessChangeCount1 + 1;
          callback1Triggered = true;
          expect(displayId).assertEqual(0);
          expect(brightnessInfo.sdrNits).assertLarger(0);
          expect(brightnessInfo.currentHeadroom).assertLarger(0);
          expect(brightnessInfo.maxHeadroom).assertLarger(0);
          console.info(`${caseName} Callback1: brightnessChangeCount1 = ${brightnessChangeCount1}`);
        };

        display.on('brightnessInfoChange', callback1);
        console.info(caseName + ' Brightness change listeners registered successfully');
        await windowClass.setWindowBrightness(1);
        await sleep(100);
        while (!callback1Triggered) {
          await sleep(100);
        }
        console.info(`${caseName} brightnessChangeCount1 = ${brightnessChangeCount1}`);
        expect(brightnessChangeCount1).assertLargerOrEqual(1);
        display.off('brightnessInfoChange', callback1);
        await sleep(100);
        await windowClass.setWindowBrightness(-1);
        await sleep(100);
        display.off('brightnessInfoChange');
        await subWindowClass.destroyWindow();
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await subWindowClass?.destroyWindow();
        if (e.code == 801) {
          done()
        } else {
          display.off('brightnessInfoChange');
          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_GET_DISPLAY_BYID_0100
     * @tc.name    testGetDisplayById__1
     * @tc.desc    getDisplayByIdSync入参传入-1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testGetDisplayById__1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'testGetDisplayById__1';
      try {
        let displayClass = display.getDisplayByIdSync(-1);
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual('Parameter error.[display][getDisplayByIdSync]msg: displayid is invalid, less than 0');
        done();
      }
    })

    /**
     * @tc.number     SUB_BASIC_DMS_VIRTUAL_SCREEN_SUPPORT_FOCUS_0100
     * @tc.name       testCreateVirtualScreenwithSupportsFocusIsTrue
     * @tc.desc       testCreateVirtualScreenwithSupportsFocusIsTrue
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testCreateVirtualScreenwithSupportsFocusIsTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testCreateVirtualScreenwithSupportsFocusIsTrue';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      try {
        display.createVirtualScreen({
          name: 'createVirtualScreen1',
          width: 1080,
          height: 2720,
          density: 2,
          surfaceId: '',
          supportsFocus: true
        }).then(async (displayId: number) => {
          display.makeUnique(displayId).then(async () => {
            console.log(caseName + 'succeeded in makeUnique');
            let options: StartOptions = {
              displayId: displayId
            }
            let windowStageStart = await startAbility(caseName, context, options);
            let windowClass = windowStageStart.getMainWindowSync();
            await windowClass.setWindowFocusable(true);
            await terminateAbility(caseName);
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + 'failed in makeUnique, err : ' + JSON.stringify(err));
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              await terminateAbility(caseName);
              expect(false).assertTrue();
              done();
            }
          })
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'failed in createVirtualScreen, err : ' + JSON.stringify(err));
          if (!isSupport) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            await terminateAbility(caseName);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await terminateAbility(caseName);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_VIRTUAL_SCREEN_SUPPORT_FOCUS_0200
     * @tc.name       testCreateVirtualScreenwithSupportsFocusIsDefault
     * @tc.desc       testCreateVirtualScreenwithSupportsFocusIsDefault
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testCreateVirtualScreenwithSupportsFocusIsDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testCreateVirtualScreenwithSupportsFocusIsDefault';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      try {
        display.createVirtualScreen({
          name: 'createVirtualScreen2',
          width: 1080,
          height: 2720,
          density: 2,
          surfaceId: '',
          supportsFocus: undefined
        }).then(async (displayId: number) => {
          display.makeUnique(displayId).then(async () => {
            console.log(caseName + 'succeeded in makeUnique');
            let options: StartOptions = {
              displayId: displayId
            }
            let windowStageStart = await startAbility(caseName, context, options);
            let windowClass = windowStageStart.getMainWindowSync();
            await windowClass.setWindowFocusable(true);
            await terminateAbility(caseName);
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + 'failed in makeUnique, err : ' + JSON.stringify(err));
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              await terminateAbility(caseName);
              expect(false).assertTrue();
              done();
            }
          })
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'failed in createVirtualScreen, err : ' + JSON.stringify(err));
          if (!isSupport) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            await terminateAbility(caseName);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await terminateAbility(caseName);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_VIRTUAL_SCREEN_SUPPORT_FOCUS_0300
     * @tc.name       testCreateVirtualScreenwithSupportsFocusIsDefault2
     * @tc.desc       testCreateVirtualScreenwithSupportsFocusIsDefault2
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testCreateVirtualScreenwithSupportsFocusIsDefault2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testCreateVirtualScreenwithSupportsFocusIsDefault2';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      try {
        display.createVirtualScreen({
          name: 'createVirtualScreen3',
          width: 1080,
          height: 2720,
          density: 2,
          surfaceId: '',
        }).then(async (displayId: number) => {
          display.makeUnique(displayId).then(async () => {
            console.log(caseName + 'succeeded in makeUnique');
            let options: StartOptions = {
              displayId: displayId
            }
            let windowStageStart = await startAbility(caseName, context, options);
            let windowClass = windowStageStart.getMainWindowSync();
            await windowClass.setWindowFocusable(true);
            await terminateAbility(caseName);
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + 'failed in makeUnique, err : ' + JSON.stringify(err));
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              await terminateAbility(caseName);
              expect(false).assertTrue();
              done();
            }
          })
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'failed in createVirtualScreen, err : ' + JSON.stringify(err));
          if (!isSupport) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            await terminateAbility(caseName);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await terminateAbility(caseName);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_DMS_VIRTUAL_SCREEN_NOT_SUPPORT_FOCUS_0100
     * @tc.name       testCreateVirtualScreenwithSupportsFocusIsFalse
     * @tc.desc       testCreateVirtualScreenwithSupportsFocusIsFalse
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level0
     */
    it('testCreateVirtualScreenwithSupportsFocusIsFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testCreateVirtualScreenwithSupportsFocusIsFalse';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      try {
        display.createVirtualScreen({
          name: 'createVirtualScreen4',
          width: 1080,
          height: 2720,
          density: 2,
          surfaceId: '',
          supportsFocus: false
        }).then(async (displayId: number) => {
          display.makeUnique(displayId).then(async () => {
            console.log(caseName + 'succeeded in makeUnique');
            let options: StartOptions = {
              displayId: displayId
            }
            let windowStageStart = await startAbility(caseName, context, options);
            let windowClass = windowStageStart.getMainWindowSync();
            await windowClass.setWindowFocusable(true);
            await terminateAbility(caseName);
            done();
          }).catch(async (err: BusinessError) => {
            console.error(caseName + 'failed in makeUnique, err : ' + JSON.stringify(err));
            display.destroyVirtualScreen(displayId);
            if (err.code == 801) {
              expect(err.code).assertEqual(801)
              done();
            } else {
              expect(err.code).assertEqual(1300002)
              done();
            }
          })
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'failed in createVirtualScreen, err : ' + JSON.stringify(err));
          if (!isSupport) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(err.code).assertEqual(1300002)
            done();
          }
        })
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(1300002)
        done();
      }
    });

    /**
     * @tc.name   testGetRoundedCorner
     * @tc.number SUB_DMS_GET_ROUNDED_CORNER_0100
     * @tc.desc   逻辑屏getRoundedCorner接口查询屏幕圆角信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRoundedCorner', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetRoundedCorner ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      try {
        let displayInfo = display.getDefaultDisplaySync();
        console.info(caseName + ' displayInfo: ' + JSON.stringify(displayInfo));
        let roundedCorner = displayInfo.getRoundedCorner();
        console.info(caseName + ' roundedCorner: ' + JSON.stringify(roundedCorner));
        console.info(caseName + ' roundedCorner length: ' + JSON.stringify(roundedCorner.length));
        if (deviceType == 'phone'||deviceType == 'tablet') {
          expect(roundedCorner.length).assertLarger(0)
          expect(roundedCorner[0].type).assertEqual(0)
          expect(roundedCorner[0].position.x).assertEqual(roundedCorner[0].radius)
          expect(roundedCorner[0].position.y).assertEqual(roundedCorner[0].radius)
          expect(roundedCorner[1].type).assertEqual(1)
          expect(roundedCorner[1].position.x).assertEqual(displayInfo.width - roundedCorner[1].radius)
          expect(roundedCorner[1].position.y).assertEqual(roundedCorner[1].radius)
          expect(roundedCorner[2].type).assertEqual(2)
          expect(roundedCorner[2].position.x).assertEqual(displayInfo.width - roundedCorner[2].radius)
          expect(roundedCorner[2].position.y).assertEqual(displayInfo.height - roundedCorner[2].radius)
          expect(roundedCorner[3].type).assertEqual(3)
          expect(roundedCorner[3].position.x).assertEqual(roundedCorner[3].radius)
          expect(roundedCorner[3].position.y).assertEqual(displayInfo.height - roundedCorner[3].radius)
        } else {
          expect(roundedCorner.length).assertEqual(0)
        }
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
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
     * @tc.name   testGetRoundedCornerwithVirtualDisplay
     * @tc.number SUB_DMS_GET_ROUNDED_CORNER_0200
     * @tc.desc   虚拟屏getRoundedCorner接口查询屏幕圆角信息返回空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetRoundedCornerwithVirtualDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testGetRoundedCornerwithVirtualDisplay ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      try {
        display.createVirtualScreen({
          name: 'createVirtualScreen3',
          width: 1080,
          height: 2720,
          density: 2,
          surfaceId: '',
        }).then(async (displayId: number) => {
          let displayInfo = display.getDisplayByIdSync(displayId);
          console.info(caseName + ' displayInfo: ' + JSON.stringify(displayInfo));
          let roundedCorner = displayInfo.getRoundedCorner();
          console.info(caseName + ' roundedCorner: ' + JSON.stringify(roundedCorner));
          console.info(caseName + ' roundedCorner length: ' + JSON.stringify(roundedCorner.length));
          expect(roundedCorner.length).assertEqual(0);
          await display.destroyVirtualScreen(displayId);
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'failed in createVirtualScreen, err : ' + JSON.stringify(err));
          if (!canIUseRes) {
            expect(err.code).assertEqual(801)
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        })
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
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
     * @tc.name   testGetRoundedCorner_RoundedCornerInfo_enum
     * @tc.number SUB_DMS_GET_ROUNDED_CORNER_0400
     * @tc.desc   getRoundedCorner接口查询屏幕圆角对象信息的断言
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetRoundedCorner_RoundedCornerInfo_enum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testGetRoundedCorner_RoundedCornerInfo_enum ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      try {
        let displayInfo = display.getDefaultDisplaySync();
        console.info(caseName + ' displayInfo: ' + JSON.stringify(displayInfo));
        let roundedCorner = displayInfo.getRoundedCorner();
        console.info(caseName + ' roundedCorner: ' + JSON.stringify(roundedCorner));
        console.info(caseName + ' roundedCorner length: ' + JSON.stringify(roundedCorner.length));
        if (deviceType == 'phone'||deviceType == 'tablet') {
          expect(roundedCorner[0].type).assertEqual(0)
          expect(roundedCorner[0].position.x).assertLarger(0)
          expect(roundedCorner[0].position.y).assertLarger(0)
          expect(roundedCorner[0].radius).assertLarger(0)
          expect(roundedCorner[1].type).assertEqual(1)
          expect(roundedCorner[1].position.x).assertLarger(0)
          expect(roundedCorner[1].position.y).assertLarger(0)
          expect(roundedCorner[1].radius).assertLarger(0)
          expect(roundedCorner[2].type).assertEqual(2)
          expect(roundedCorner[2].position.x).assertLarger(0)
          expect(roundedCorner[2].position.y).assertLarger(0)
          expect(roundedCorner[2].radius).assertLarger(0)
          expect(roundedCorner[3].type).assertEqual(3)
          expect(roundedCorner[3].position.x).assertLarger(0)
          expect(roundedCorner[3].position.y).assertLarger(0)
          expect(roundedCorner[3].radius).assertLarger(0)
        }
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
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
     * @tc.name   testOnChangeWithAttribute_width_height_setPreferOrientation
     * @tc.number SUB_WMS_DMS_CHANGE_WITH_ATTRIBUTE_SETPERFERORIENTATION_0100
     * @tc.desc   testOnChangeWithAttribute_width_height_setPreferOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnChangeWithAttribute_width_height_setPreferOrientation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testOnChangeWithAttribute_width_height_setPreferOrientation ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowClass = windowStage.getMainWindowSync();
      try {
        if(isSupportRotate == true){
          let index1 = 0;
          let index2 = 0;
          const callback1 = (res: number)=>{
            console.info(caseName + ' callback1 res: ' + res);
            index1++;
            console.info(caseName + ' callback1 index1: ' + index1);
          }
          const callback2 = (res: number)=>{
            console.info(caseName + ' callback2 res: ' + res);
            index2++;
            console.info(caseName + ' callback2 index2: ' + index2);
          }
          display.onChangeWithAttribute(['width'], callback1);
          display.onChangeWithAttribute(['height'], callback2);
          await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
          await sleep(3000);
          console.info(caseName + ' setPreferredOrientation LANDSCAPE index1: ' + index1);
          console.info(caseName + ' setPreferredOrientation LANDSCAPE index2: ' + index2);
          expect(index1).assertEqual(1);
          expect(index2).assertEqual(1);
          display.off('change', callback1);
          await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
          await sleep(3000);
          console.info(caseName + ' setOrientation index1: ' + index1);
          console.info(caseName + ' setOrientation index2: ' + index2);
          expect(index1).assertEqual(1);
          expect(index2).assertEqual(2);
          display.off('change');
          await sleep(3000);
          console.info(caseName + ' setPreferredOrientation PORTRAIT index1: ' + index1);
          console.info(caseName + ' setPreferredOrientation PORTRAIT index2: ' + index2);
          expect(index1).assertEqual(1);
          expect(index2).assertEqual(2);
          done();
        }else{
          done();
        }

      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
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
     * @tc.name   testOnChangeWithAttribute_rotation_orientation_setPreferOrientation
     * @tc.number SUB_WMS_DMS_CHANGE_WITH_ATTRIBUTE_SETPERFERORIENTATION_0200
     * @tc.desc   testOnChangeWithAttribute_rotation_orientation_setPreferOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnChangeWithAttribute_rotation_orientation_setPreferOrientation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testOnChangeWithAttribute_rotation_orientation_setPreferOrientation ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowClass = windowStage.getMainWindowSync();

      try {
        if(isSupportRotate == true) {
          let index1 = 0;
          let index2 = 0;
          const callback1 = (res: number) => {
            console.info(caseName + ' callback1 res: ' + res);
            index1++;
            console.info(caseName + ' callback1 index1: ' + index1);
          }
          const callback2 = (res: number) => {
            console.info(caseName + ' callback2 res: ' + res);
            index2++;
            console.info(caseName + ' callback2 index2: ' + index2);
          }
          display.onChangeWithAttribute(['rotation'], callback1);
          display.onChangeWithAttribute(['orientation'], callback2);
          await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
          await sleep(3000);
          console.info(caseName + ' setPreferredOrientation LANDSCAPE index1: ' + index1);
          console.info(caseName + ' setPreferredOrientation LANDSCAPE index2: ' + index2);
          expect(index1).assertEqual(1);
          expect(index2).assertEqual(1);
          display.off('change', callback1);
          await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED);
          await sleep(3000);
          console.info(caseName + ' setOrientation index1: ' + index1);
          console.info(caseName + ' setOrientation index2: ' + index2);
          expect(index1).assertEqual(1);
          expect(index2).assertEqual(2);
          display.off('change');
          await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
          await sleep(3000);
          console.info(caseName + ' setPreferredOrientation PORTRAIT index1: ' + index1);
          console.info(caseName + ' setPreferredOrientation PORTRAIT index2: ' + index2);
          expect(index1).assertEqual(1);
          expect(index2).assertEqual(2);
          done();
        }else{
          done();
        }
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
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
     * @tc.name   testOnChangeWithAttribute_rotation_orientation_setPreferOrientation2
     * @tc.number SUB_WMS_DMS_CHANGE_WITH_ATTRIBUTE_SETPERFERORIENTATION_0300
     * @tc.desc   testOnChangeWithAttribute_rotation_orientation_setPreferOrientation2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnChangeWithAttribute_rotation_orientation_setPreferOrientation2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testOnChangeWithAttribute_rotation_orientation_setPreferOrientation2 ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let windowClass = windowStage.getMainWindowSync();
      let diaplayId = display.getDefaultDisplaySync().id;
      console.info(caseName + 'diaplayId: ' + diaplayId);
      try {
        if(isSupportRotate == true) {
          let index1 = 0;
          const callback1 = (res: number) => {
            console.info(caseName + ' callback1 res: ' + res);
            expect(res).assertEqual(diaplayId);
            index1++;
            console.info(caseName + ' callback1 index1: ' + index1);
          }
          display.onChangeWithAttribute(['rotation', 'densityDPI'], callback1);
          await windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE);
          await sleep(3000);
          console.info(caseName + ' setPreferredOrientation LANDSCAPE index1: ' + index1);
          expect(index1).assertEqual(1);
          display.off('change', callback1);
          await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
          await sleep(3000);
          console.info(caseName + ' setPreferredOrientation PORTRAIT index1: ' + index1);
          expect(index1).assertEqual(1);
          done();
        }else{
          done();
        }
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
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
     * @tc.name   testEnumCornerType
     * @tc.number SUB_WMS_DMS_ENUM_CORNER_TYPE_0100
     * @tc.desc   testEnumCornerType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnumCornerType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testEnumCornerType ';
      console.log(caseName + 'begin');
      try {
        console.info(caseName + ' display.CornerType: ' + JSON.stringify(display.CornerType));
        expect(display.CornerType.TOP_LEFT).assertEqual(0);
        expect(display.CornerType.TOP_RIGHT).assertEqual(1);
        expect(display.CornerType.BOTTOM_RIGHT).assertEqual(2);
        expect(display.CornerType.BOTTOM_LEFT).assertEqual(3);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        done()
      }
    });

  })
}