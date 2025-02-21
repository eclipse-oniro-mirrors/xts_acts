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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import display from '@ohos.display';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';

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
    it('testFoldAngleChange_On_Off', 0, async (done: Function) => {
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
    it('testFoldAngleChange_ON_Off_Off', 0, async (done: Function) => {
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
     * @tc.level  : Level 3
     */
    it('testFoldAngleChange_Off', 0, async (done: Function) => {
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
    it('testCaptureStatusChange_On_Off', 0, async (done: Function) => {
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
    it('testCaptureStatusChange_On_Off_Off', 0, async (done: Function) => {
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
    it('testCaptureStatusChange_Off', 0, async (done: Function) => {
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
     * @tc.level  : Level 3
     */
    it('testIsCaptured', 0, async (done: Function) => {
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
     * @tc.level  : Level 0
     */
    it('test_getAvailableArea_default', 0, async (done: Function) => {
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
    it('test_getAvailableArea_subWindow', 2, async (done: Function) => {
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
    it('test_getAvailableArea_setWindowSystemBarEnable', 2, async (done: Function) => {
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
    it('test_getAvailableArea_ststus_bar_hide', 3, async (done: Function) => {
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
    it('test_on_availableAreaChange', 3, async (done: Function) => {
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
    it('test_on_availableAreaChange_triggers', 2, async (done: Function) => {
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
    it('test_on_availableAreaChange_Two_callback', 2, async (done: Function) => {
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
    it('test_on_availableAreaChange_off_callback1', 2, async (done: Function) => {
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
    it('test_on_availableAreaChange_off_callback_all', 2, async (done: Function) => {
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
    it('test_off_availableAreaChange', 2, async (done: Function) => {
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
    it('testGetAllDisplayPhysicalResolution', 0, (done: Function) => {
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
         * @tc.level  : Level 3
         */
    it('testGetAvailableWidthAndHeight', 0, (done: Function) => {
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
  })
}