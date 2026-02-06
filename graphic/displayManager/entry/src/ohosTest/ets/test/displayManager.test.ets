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
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import { image } from '@kit.ImageKit';
import { screenshot } from '@kit.ArkUI';

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

export default function displayTest() {
  console.log('describe displayTest start!!!')
  const TRUE_FLAG = true;

  describe('displayTest', () => {
    let windowStage: window.WindowStage;
    beforeAll(() => {
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5100
     * @tc.name   : testFoldAngleChange_On_Off
     * @tc.desc   : register and unregister fold angle changes
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
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
     * @tc.number : SUB_BASIC_WMS_DMS_XTS_DISPLAY_JS_API_5110
     * @tc.name   : testFoldAngleChange_ON_Off_Off
     * @tc.desc   : repeat unregister fold angle changes
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5120
     * @tc.name   : testFoldAngleChange_Off
     * @tc.desc   : unregister of the fold angle changes without register
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 0
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5130
     * @tc.name   : testCaptureStatusChange_On_Off
     * @tc.desc   : register and unregister capture status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5140
     * @tc.name   : testCaptureStatusChange_On_Off_Off
     * @tc.desc   : repeat unregister capture status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5150
     * @tc.name   : testCaptureStatusChange_Off
     * @tc.desc   : unregister the capture status of the device without register
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5160
     * @tc.name   : testIsCaptured
     * @tc.desc   : check current device capture status
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testIsCaptured', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0100
     * @tc.name   : test_getAvailableArea_default
     * @tc.desc   : test_getAvailableArea_default
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('test_getAvailableArea_default', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0200
     * @tc.name   : test_getAvailableArea_subWindow
     * @tc.desc   : test_getAvailableArea_subWindow
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0300
     * @tc.name   : test_getAvailableArea_setWindowSystemBarEnable
     * @tc.desc   : test_getAvailableArea_setWindowSystemBarEnable
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_GET_AVAILABLEAREA_0400
     * @tc.name   : test_getAvailableArea_ststus_bar_hide
     * @tc.desc   : test_getAvailableArea_ststus_bar_hide
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0100
     * @tc.name   : test_on_availableAreaChange
     * @tc.desc   : test_on_availableAreaChange
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('test_on_availableAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0200
     * @tc.name   : test_on_availableAreaChange_triggers
     * @tc.desc   : test_on_availableAreaChange_triggers
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0300
     * @tc.name   : test_on_availableAreaChange_Two_callback
     * @tc.desc   : test_on_availableAreaChange_Two_callback
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0400
     * @tc.name   : test_on_availableAreaChange_off_callback1
     * @tc.desc   : test_on_availableAreaChange_off_callback1
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0500
     * @tc.name   : test_on_availableAreaChange_off_callback_all
     * @tc.desc   : test_on_availableAreaChange_off_callback_all
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_ON_AVAILABLECHANFGE_0600
     * @tc.name   : test_off_availableAreaChange
     * @tc.desc   : test_off_availableAreaChange
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('test_off_availableAreaChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'test_off_availableAreaChange';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let displayClass: display.Display;
      try {
          displayClass = display.getDefaultDisplaySync();
          displayClass.off('availableAreaChange');
          expect(true).assertTrue();
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
     * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5170
     * @tc.name   : testGetAllDisplayPhysicalResolution
     * @tc.desc   : get all display physical resolution
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 3
     */
    it('testGetAllDisplayPhysicalResolution', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'TestGetAllDisplayPhysicalResolution';
      display.getAllDisplayPhysicalResolution().then((resolutionObjects) => {
        console.info(`${caseName} Obtaining physical resolution length: ${resolutionObjects.length}`);
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
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${caseName}: Failed to obtain physical resolution. Code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })

    /**
         * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5180
         * @tc.name   : testGetAvailableWidthAndHeight
         * @tc.desc   : get display available width and height
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_FOLDSTATUS_0100
     * @tc.name      : test_FoldStatus_enum
     * @tc.desc      : test_FoldStatus_enum
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_ERRORCODE_0100
     * @tc.name      : test_CreateVirtualScreen_ErrorCode1400001
     * @tc.desc      : test_CreateVirtualScreen_ErrorCode1400001 when got invalid size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_ERRORCODE_0200
     * @tc.name      : test_CreateVirtualScreen_ErrorCode401
     * @tc.desc      : test_CreateVirtualScreen_ErrorCode_401 when got arguments with null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_0100
     * @tc.name      : test_CreateVirtualScreen01
     * @tc.desc      : test_CreateVirtualScreen01 
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_DESTROY_VIRTUALSCREEN_ERRORCODE_0100
     * @tc.name      : test_DestroyVirtualScreenErrorcode401
     * @tc.desc      : test_DestroyVirtualScreenErrorcode_401 when got invalid screendId like -1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_DESTROY_VIRTUALSCREEN_ERRORCODE_0200
     * @tc.name      : test_DestroyVirtualScreenErrorcode401_02
     * @tc.desc      : test_DestroyVirtualScreenErrorcode_401 when destroy a screen that has already been destroyed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_MAKEUNIQUE_ERRORCODE_0100
     * @tc.name      : test_MakeUniqueErrorcode_401
     * @tc.desc      : test_MakeUniqueErrorcode_401 when got invalid screenId like -1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_MAKEUNIQUE_ERRORCODE_0200
     * @tc.name      : test_MakeUniqueErrorcode_1400001
     * @tc.desc      : test_MakeUniqueErrorcode_1400001 when makeUnique a virtual screen that has already been destroyed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_MAKEUNIQUE_0100
     * @tc.name      : test_MakeUnique_01
     * @tc.desc      : test_MakeUnique_01
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SET_VIRTUALSCREEN_SURFACE_ERRORCODE_0100
     * @tc.name      : test_setVirtualScreenSurface_ErrorCode401
     * @tc.desc      : test_setVirtualScreenSurface_ErrorCode401 when got a invalid screenId like -1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SET_VIRTUALSCREEN_SURFACE_ERRORCODE_0200
     * @tc.name      : test_setVirtualScreenSurface_ErrorCode401_02
     * @tc.desc      : test_setVirtualScreenSurface_ErrorCode401 when got non existent surfaceId like ''
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : testGetDisplayByIdSyncErrCode401_0100
     * @tc.name      : getDisplayByIdSync
     * @tc.desc      : getDisplayByIdSync
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level1
     */
    it('getDisplayByIdSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
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
     * @tc.number    : testOnFoldAngleChangeErrCode401_0100
     * @tc.name      : on_foldAngleChange
     * @tc.desc      : on_foldAngleChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
     * @tc.number    : testOffFoldAngleChangeErrCode401_0100
     * @tc.name      : off_foldAngleChange
     * @tc.desc      : off_foldAngleChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
     * @tc.number    : testOnCaptureStatusChangeErrCode401_0100
     * @tc.name      : on_captureStatusChange
     * @tc.desc      : on_captureStatusChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
     * @tc.number    : testOffCaptureStatusChangeErrCode401_0100
     * @tc.name      : off_captureStatusChange
     * @tc.desc      : off_captureStatusChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
     * @tc.number    : testOnAvailableAreaChangeErrCode401_0100
     * @tc.name      : on_availableAreaChange
     * @tc.desc      : on_availableAreaChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
     * @tc.number    : testOffAvailableAreaChangeErrCode401_0100
     * @tc.name      : off_availableAreaChange
     * @tc.desc      : off_availableAreaChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
     * @tc.number : SUB_BASIC_WMS_GET_CUTOUT_INFO_0100
     * @tc.name   : test_GetCutoutInfo
     * @tc.desc   : test_GetCutoutInfo
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 1
     */
    it('test_GetCutoutInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(`jsunittets ${caseName} fail to get display available info :` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_ScreenShape_0100
     * @tc.name       : test_ScreenShape_0100
     * @tc.desc       : test_ScreenShape_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('test_ScreenShape_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_DisplaySourceMode_0100
     * @tc.name      : test_DisplaySourceMode_enum
     * @tc.desc      : test_DisplaySourceMode_enum
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_DisplaySourceMode_0200
     * @tc.name      : test_display_DisplaySourceMode
     * @tc.desc      : test_display_DisplaySourceMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_ON_add_401_0100
     * @tc.name       : testOnaddErrCode401_0100
     * @tc.desc       : testOnaddErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_ON_add_401_0200
     * @tc.name       : testoffaddErrCode401_0100
     * @tc.desc       : testoffaddErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_ON_foldStatusChange_401_0100
     * @tc.name       : testonfoldStatusChange401_0100
     * @tc.desc       : testonfoldStatusChange401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_ON_foldStatusChange_401_0200
     * @tc.name       : testofffoldStatusChange401_0100
     * @tc.desc       : testofffoldStatusChange401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_ON_displayModeChange_401_0100
     * @tc.name       : testondisplayModeChange401
     * @tc.desc       : testondisplayModeChange401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_ON_displayModeChange_401_0200
     * @tc.name       : testoffdisplayModeChange401
     * @tc.desc       : testoffdisplayModeChange401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_DMS_REFRESH_LEVEL_0100
     * @tc.name       : testMainScreenSupportRefreshRate
     * @tc.desc       : 验证主屏刷新率支持的档位
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_DMS_REFRESH_LEVEL_0200
     * @tc.name       : testVirtualScreenSupportRefreshRate
     * @tc.desc       : 验证虚拟屏刷新率支持的档位
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0100
     * @tc.name       : testConvertRelativeToGlobalCoordinatewithPositionOutofRange
     * @tc.desc       : 验证convertRelativeToGlobalCoordinate接口position超出int32报1400004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0200
     * @tc.name       : testConvertRelativeToGlobalCoordinatewithInvalidDisplayid
     * @tc.desc       : 验证convertRelativeToGlobalCoordinate接口display<0或>=0且display不存在报1400004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0300
     * @tc.name       : testConvertRelativeToGlobalCoordinatewithVirtualDisplay
     * @tc.desc       : 验证虚拟屏调用convertRelativeToGlobalCoordinate接口报1400004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0400
     * @tc.name       : testConvertRelativeToGlobalCoordinate
     * @tc.desc       : 验证convertRelativeToGlobalCoordinate接口在除RK外的设备正常调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0500
     * @tc.name       : testConvertGlobalToRelativeCoordinatewithPositionOutofRange
     * @tc.desc       : 验证convertGlobalToRelativeCoordinate接口position超出int32报1400004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0600
     * @tc.name       : testConvertGlobalToRelativeCoordinatewithInvalidDisplayid
     * @tc.desc       : 验证convertGlobalToRelativeCoordinate接口传入displayId<0报1400004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0700
     * @tc.name       : testConvertGlobalToRelativeCoordinatewithVirtualDisplay
     * @tc.desc       : 验证虚拟屏调用convertGlobalToRelativeCoordinate接口报1400004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0800
     * @tc.name       : testConvertGlobalToRelativeCoordinatewithDisplayid
     * @tc.desc       : 验证convertGlobalToRelativeCoordinate接口，传入displayId，在除RK外的设备正常调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_CONVERTCOORDINATE_0900
     * @tc.name       : testConvertGlobalToRelativeCoordinatewithoutDisplayid
     * @tc.desc       : 验证convertGlobalToRelativeCoordinate接口，不传入displayId，在除RK外的设备正常调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_GET_LIVE_CREASE_REGION_0100
     * @tc.name       : testGetLiveCreaseRegion
     * @tc.desc       : 验证折叠设备可查询到折痕区域，非折叠设备折痕区域返回空
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
            expect(true).assertTrue();
          } else {
            for (let i = 0; i < region.creaseRects.length; i++) {
              expect(region.creaseRects[i].left).assertLargerOrEqual(0);
              expect(region.creaseRects[i].top).assertLargerOrEqual(0);
              expect(region.creaseRects[i].width).assertLargerOrEqual(0);
              expect(region.creaseRects[i].height).assertLargerOrEqual(0);
            }
          }
        } else {
          expect(region.creaseRects.length).assertEqual(0)
        }
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
     * @tc.number     : SUB_BASIC_WMS_GET_LIVE_CREASE_REGION_0200
     * @tc.name       : testGetLiveCreaseRegionwithVirtualScreen
     * @tc.desc       : 验证虚拟盘折痕区域返回空
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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

  })
}