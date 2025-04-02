/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect } from "@ohos/hypium";
import ohosWindow from '@ohos.window';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import { Driver, ON } from '@ohos.UiTest';
import settings from '@ohos.settings';

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

export default function windowPromiseTest() {
  describe('windowPromise_test', () => {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG: boolean = true;
    let commonRGBColorArr: Array<string> = ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(255,255,255)', 'rgb(0,0,0)', 'rgb(249,0,230)', 'rgb(102,102,102)', 'rgb(255,247,0)'];
    let commonNUMBERColorArr: Array<string> = ['#00FF0000', '#0000FF00', '#000000FF', '#00FFFFFF', '#00000000', '#00F900E6', '#00666666', '#00FFF700'];
    let commonKEYColorArr: Array<string> = ['red', 'green', 'blue', 'white', 'black', 'pink', 'grey', 'yellow'];
    let systemWindowTypeArr: Array<string> = [];
    let systemWindowTypeDicArr: Array<string> = [];
    let systemWindowTypeDic: Record<string, number> = {
      'TYPE_FLOAT': 8,
    }
    let currentDeviceIsRk = false;
    let currentDeviceIsPC = false;
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let deviceType: string = '';
    let isAutoWindow:string = '';
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      deviceType = deviceInfo.deviceType;
      console.log('jsUnittest beforeAll deviceType =' + deviceType);
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsRk = deviceTypeInfo === 'default' ? true : false;
      currentDeviceIsPC = deviceTypeInfo === '2in1' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType);
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType.TYPE_FLOAT));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsUnittest beforeAll systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.DEVICE_SHARED);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0100
     * @tc.name      : testsetSubWindowModal_Function_Promise1
     * @tc.desc      : Test the function value of setSubWindowModal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testsetSubWindowModal_Function_Promise1", 0, async (done: Function) => {
      let msgStr = "testsetSubWindowModal_Function_Promise1 ";
      console.log(msgStr + " begin");
      try {
        console.log(msgStr + " try begin");
        let options: ohosWindow.SubWindowOptions = {
          title: 'title',
          decorEnabled: true
        };
        let promise = windowStage.createSubWindowWithOptions('mySubWindow1', options);
        promise.then((data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          data.setSubWindowModal(true).then(() => {
            console.info(msgStr + 'Succeeded in setting subwindow modal true');
            expect(true).assertTrue();
            data.destroyWindow();
            done();
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set subwindow modal. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        }).catch((error: BusinessError) => {
          console.log(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('Failed to create the subwindow. Cause: ' + JSON.stringify(error));
        if (error.code == 1300002) {
          expect().assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0100
     * @tc.name      : testsetSubWindowModal_Function_Promise2
     * @tc.desc      : Test the function value of setSubWindowModal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testsetSubWindowModal_Function_Promise2", 0, async (done: Function) => {
      let msgStr = "testsetSubWindowModal_Function_Promise2 ";
      console.log(msgStr + " begin");
      try {
        console.log(msgStr + " try begin");
        let options: ohosWindow.SubWindowOptions = {
          title: 'title2',
          decorEnabled: true
        };
        let promise = windowStage.createSubWindowWithOptions('mySubWindow2', options);
        promise.then((data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          data.setSubWindowModal(false).then(() => {
            console.info(msgStr + 'Succeeded in setting subwindow modal true');
            expect(true).assertTrue();
            data.destroyWindow();
            done();
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set subwindow modal. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        }).catch((error: BusinessError) => {
          console.log(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('Failed to create the subwindow. Cause: ' + JSON.stringify(error));
        if (error.code == 1300002) {
          expect().assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0100
     * @tc.name      : testsetSubWindowModal_Function_Promise3
     * @tc.desc      : Test the function value of setSubWindowModal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testsetSubWindowModal_Function_Promise3", 0, async (done: Function) => {
      let msgStr = "testsetSubWindowModal_Function_Promise3 ";
      console.log(msgStr + " begin");
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          wnd.setSubWindowModal(true).then(() => {
            console.info(msgStr + 'Succeeded in setting subwindow modal');
            expect().assertFail();
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set subwindow modal. Cause:' + JSON.stringify(err));
            expect(err.code == 1300004).assertTrue();
            done();
          });
        } catch (exception) {
          console.error(msgStr + ' Failed to setSubWindowModal. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      });
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0100
         * @tc.name      : test_SubWindow_IsModal_true
         * @tc.desc      : test_SubWindow_IsModal_true
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("test_SubWindow_IsModal_true", 0, async (done: Function) => {
      let msgStr = "test_SubWindow_IsModal_true";
      console.log(msgStr + "begin");
      let driver: Driver = Driver.create();
      let num = 0;
      let subWindowClass: ohosWindow.Window;
      let windowClass = await windowStage.getMainWindow();
      try {
        let promise = windowStage.createSubWindow('test_SubWindow_IsModal_true');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.resize(1000, 500);
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await subWindowClass.showWindow();
          try {
            await subWindowClass.setSubWindowModal(true).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              windowClass.on('noInteractionDetected', 4, () => {
                num++;
                console.log(msgStr + 'The num1 is :' + num);
                windowClass.off('noInteractionDetected');
                expect(true).assertTrue();
              });
              subWindowClass.on('noInteractionDetected', 5, () => {
                num--;
                console.log(msgStr + 'The num2 is :' + num);
                subWindowClass.off('noInteractionDetected');
                expect(false).assertTrue();
              });
              let buttonOne = await driver.findComponent(ON.text('这是子窗'));
              await buttonOne.click();
              let buttonTwo = await driver.findComponent(ON.text('Hello World'));
              await buttonTwo.click();
              await sleep(3000);
              console.log(msgStr + 'The num is :' + num);
              expect(num).assertEqual(1);
              windowClass.off('noInteractionDetected');
              subWindowClass.off('noInteractionDetected');
              subWindowClass.destroyWindow();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              subWindowClass.destroyWindow();
              if (err.code == 801) {
                console.log(msgStr + 'The device not support setSubWindowModal');
                expect(true).assertTrue();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0200
     * @tc.name      : test_SubWindow_IsModal_false
     * @tc.desc      : test_SubWindow_IsModal_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("test_SubWindow_IsModal_false", 0, async (done: Function) => {
      let msgStr = "test_SubWindow_IsModal_false";
      console.log(msgStr + "begin");
      let driver: Driver = Driver.create();
      let num = 0;
      let subWindowClass: ohosWindow.Window;
      let windowClass = await windowStage.getMainWindow();
      try {
        let promise = windowStage.createSubWindow('test_SubWindow_IsModal_false');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.resize(1000, 500);
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await subWindowClass.showWindow();
          try {
            await subWindowClass.setSubWindowModal(false).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              windowClass.on('noInteractionDetected', 4, () => {
                num++;
                console.log(msgStr + 'The num1 is :' + num);
                windowClass.off('noInteractionDetected');
                expect(false).assertTrue();
              });
              subWindowClass.on('noInteractionDetected', 5, () => {
                num++;
                console.log(msgStr + 'The num2 is :' + num);
                subWindowClass.off('noInteractionDetected');
                expect(false).assertTrue();
              });
              let buttonOne = await driver.findComponent(ON.text('这是子窗'));
              await buttonOne.click();
              let buttonTwo = await driver.findComponent(ON.text('Hello World'));
              await buttonTwo.click();
              await sleep(3000);
              console.log(msgStr + 'The num is :' + num);
              expect(num).assertEqual(0);
              windowClass.off('noInteractionDetected');
              subWindowClass.off('noInteractionDetected');
              subWindowClass.destroyWindow();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              subWindowClass.destroyWindow();
              if (err.code == 801) {
                console.log(msgStr + 'The device not support setSubWindowModal');
                expect(true).assertTrue();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0300
     * @tc.name      : test_SubWindow_hide_IsModal_true
     * @tc.desc      : test_SubWindow_hide_IsModal_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("test_SubWindow_hide_IsModal_true", 0, async (done: Function) => {
      let msgStr = "test_SubWindow_hide_IsModal_true";
      console.log(msgStr + "begin");
      let driver: Driver = Driver.create();
      let num = 0;
      let subWindowClass: ohosWindow.Window;
      let windowClass = await windowStage.getMainWindow();
      try {
        let promise = windowStage.createSubWindow('test_SubWindow_hide_IsModal_true');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          try {
            await subWindowClass.setSubWindowModal(true).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              windowClass.on('noInteractionDetected', 4, () => {
                num++;
                console.log(msgStr + 'The num is :' + num);
                expect(num).assertEqual(1);
                windowClass.off('noInteractionDetected');
                subWindowClass.destroyWindow();
                done();
              });
              let buttonTwo = await driver.findComponent(ON.text('Hello World'));
              await buttonTwo.click();
              await sleep(3000);
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.log(msgStr + 'The device not support setSubWindowModal');
                expect(true).assertTrue();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0400
     * @tc.name      : test_setSubWindowModal_isModal_null_401
     * @tc.desc      : test_setSubWindowModal_isModal_null_401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("test_setSubWindowModal_isModal_null_401", 0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_isModal_null_401";
      console.log(msgStr + "begin");
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_setSubWindowModal_isModal_null_401');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          try {
            await subWindowClass.setSubWindowModal(null).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              expect(false).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.log(msgStr + 'The device not support setSubWindowModal');
                subWindowClass.destroyWindow();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(401);
            subWindowClass.destroyWindow();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed :' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0500
         * @tc.name      : test_setSubWindowModal_ModalityType_TypeError_401
         * @tc.desc      : test_setSubWindowModal_ModalityType_TypeError_401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("test_setSubWindowModal_ModalityType_TypeError_401", 0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_ModalityType_TypeError_401";
      console.log(msgStr + "begin");
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_setSubWindowModal_ModalityType_TypeError_401');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          try {
            await subWindowClass.setSubWindowModal(true, 123).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              expect(false).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.log(msgStr + 'The device not support setSubWindowModal');
                subWindowClass.destroyWindow();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(401);
            subWindowClass.destroyWindow();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed :' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0600
         * @tc.name      : test_setSubWindowModal_ModalityType_incorrect_401
         * @tc.desc      : test_setSubWindowModal_ModalityType_incorrect_401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("test_setSubWindowModal_ModalityType_incorrect_401", 0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_ModalityType_incorrect_401";
      console.log(msgStr + "begin");
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_setSubWindowModal_ModalityType_incorrect_401');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          try {
            await subWindowClass.setSubWindowModal(true, 123).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              expect(false).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.log(msgStr + 'The device not support setSubWindowModal');
                subWindowClass.destroyWindow();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(401);
            subWindowClass.destroyWindow();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed :' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0700
         * @tc.name      : test_setSubWindowModal_ModalityType_isModal_false_401
         * @tc.desc      : test_setSubWindowModal_ModalityType_isModal_false_401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("test_setSubWindowModal_ModalityType_isModal_false_401", 0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_ModalityType_isModal_false_401";
      console.log(msgStr + "begin");
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_setSubWindowModal_ModalityType_isModal_false_401');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          try {
            await subWindowClass.setSubWindowModal(false, ohosWindow.ModalityType.WINDOW_MODALITY).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              expect(false).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.log(msgStr + 'The device not support setSubWindowModal');
                subWindowClass.destroyWindow();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(401);
            subWindowClass.destroyWindow();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed :' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0800
         * @tc.name      : test_setSubWindowModal_ModalityType_null_401
         * @tc.desc      : test_setSubWindowModal_ModalityType_null_401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("test_setSubWindowModal_ModalityType_null_401", 0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_ModalityType_null_401";
      console.log(msgStr + "begin");
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_setSubWindowModal_ModalityType_null_401');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          try {
            await subWindowClass.setSubWindowModal(false, ohosWindow.ModalityType.WINDOW_MODALITY).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              expect(false).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.log(msgStr + 'The device not support setSubWindowModal');
                subWindowClass.destroyWindow();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(error.code).assertEqual(401);
            subWindowClass.destroyWindow();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed :' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0900
         * @tc.name      : test_setSubWindowModal_ModalityType_enum
         * @tc.desc      : test_setSubWindowModal_ModalityType_enum
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("test_setSubWindowModal_ModalityType_enum", 0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_ModalityType_enum";
      console.log(msgStr + "begin");
      expect(ohosWindow.ModalityType.WINDOW_MODALITY).assertEqual(0);
      expect(ohosWindow.ModalityType.APPLICATION_MODALITY).assertEqual(1);
      done();
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_1000
         * @tc.name      : test_setSubWindowModal_subWindow_destory_1300002
         * @tc.desc      : test_setSubWindowModal_subWindow_destory_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("test_setSubWindowModal_subWindow_destory_1300002", 0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_subWindow_destory_1300002";
      console.log(msgStr + "begin");
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_setSubWindowModal_subWindow_destory_1300002');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          try {
            await subWindowClass.destroyWindow();
            await subWindowClass.setSubWindowModal(true, ohosWindow.ModalityType.WINDOW_MODALITY).then(async () => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
              expect(false).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 1300002) {
                console.log(msgStr + 'The SubWindow is destroyed');
                expect(true).assertTrue();
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (error) {
            console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed :' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
             * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_1100
             * @tc.name      : test_setSubWindowModal_MainWindow_1300004
             * @tc.desc      : test_setSubWindowModal_MainWindow_1300004
             * @tc.size      : MediumTest
             * @tc.type      : Function
             * @tc.level     : Level3
             */
    it("test_setSubWindowModal_MainWindow_1300004", 0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_MainWindow_1300004";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        await windowClass.setSubWindowModal(true, ohosWindow.ModalityType.APPLICATION_MODALITY).then(async () => {
          console.info(msgStr + 'Succeeded in setting subwindow modal');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300004) {
            console.log(msgStr + 'The mainWindow not support setSubWindowModal');
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.error(msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0100
         * @tc.name      : testCreateSubWindowWithOptions_name_is_null_401
         * @tc.desc      : testCreateSubWindowWithOptions_name_is_null_401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("testCreateSubWindowWithOptions_name_is_null_401", 0, async (done: Function) => {
      let msgStr = "testCreateSubWindowWithOptions_name_is_null_401";
      console.log(msgStr + " begin");
      let windowClass: ohosWindow.Window;
      console.log(msgStr + " try begin")
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: false,
      };
      try {
        await windowStage.createSubWindowWithOptions(null, options)
          .then((data) => {
            windowClass = data;
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            done();
          })
          .catch((err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.log(msgStr + '入参错误,error code:' + error.code);
        expect(error.code).assertEqual(401);
        done();
      }

    })

    /**
             * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0200
             * @tc.name      : testCreateSubWindowWithOptions_modalityType_401
             * @tc.desc      : testCreateSubWindowWithOptions_modalityType_401
             * @tc.size      : MediumTest
             * @tc.type      : Function
             * @tc.level     : Level3
             */
    it("testCreateSubWindowWithOptions_modalityType_401", 0, async (done: Function) => {
      let msgStr = "testCreateSubWindowWithOptions_modalityType_401";
      console.log(msgStr + " begin");
      let windowClass: ohosWindow.Window;
      console.log(msgStr + " try begin")
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: false,
        modalityType: ohosWindow.ModalityType.APPLICATION_MODALITY
      };
      try {
        await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_modalityType_401', options)
          .then((data) => {
            windowClass = data;
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            done();
          })
          .catch((err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.log(msgStr + '入参错误,error code:' + error.code);
        expect(error.code).assertEqual(401);
        done();
      }

    })

    /**
             * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0300
             * @tc.name      : testCreateSubWindowWithOptions_modalityType_is_INCORRECT_401
             * @tc.desc      : testCreateSubWindowWithOptions_modalityType_is_INCORRECT_401
             * @tc.size      : MediumTest
             * @tc.type      : Function
             * @tc.level     : Level3
             */
    it("testCreateSubWindowWithOptions_modalityType_is_INCORRECT_401", 0, async (done: Function) => {
      let msgStr = "testCreateSubWindowWithOptions_modalityType_is_INCORRECT_401";
      console.log(msgStr + " begin");
      let windowClass: ohosWindow.Window;
      console.log(msgStr + " try begin")
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true,
        modalityType: 5
      };
      try {
        await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_modalityType_is_INCORRECT_401', options)
          .then((data) => {
            windowClass = data;
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            done();
          })
          .catch((err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          });
      } catch (error) {
        console.log(msgStr + '入参错误,error code:' + error.code);
        expect(error.code).assertEqual(401);
        done();
      }

    })
    /**
       * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0400
       * @tc.name      : testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY
       * @tc.desc      : testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level3
      */
    it("testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY", 0, async (done: Function) => {
      let msgStr = "testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY";
      console.log(msgStr + " begin");
      let windowClass: ohosWindow.Window;
      console.log(msgStr + " try begin")
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true,
        modalityType: ohosWindow.ModalityType.APPLICATION_MODALITY
      };
      try {
        await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY', options)
          .then((data) => {
            windowClass = data;
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            windowClass.destroyWindow();
            expect(true).assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
      } catch (error) {
        console.log(msgStr + ',error code:' + error.code);
        if(error.code==801){
          console.log(msgStr + 'The device not support APPLICATION_MODALITY');
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }

    })

    /**
           * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0500
           * @tc.name      : testCreateSubWindowWithOptions_modalityType_WINDOW_MODALITY
           * @tc.desc      : testCreateSubWindowWithOptions_modalityType_WINDOW_MODALITY
           * @tc.size      : MediumTest
           * @tc.type      : Function
           * @tc.level     : Level3
          */
    it("testCreateSubWindowWithOptions_modalityType_WINDOW_MODALITY", 0, async (done: Function) => {
      let msgStr = "testCreateSubWindowWithOptions_modalityType_WINDOW_MODALITY";
      console.log(msgStr + " begin");
      let windowClass: ohosWindow.Window;
      console.log(msgStr + " try begin")
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true,
        modalityType: ohosWindow.ModalityType.WINDOW_MODALITY
      };
      try {
        await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_modalityType_WINDOW_MODALITY', options)
          .then((data) => {
            windowClass = data;
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            windowClass.destroyWindow();
            expect(true).assertTrue();
            done();
          })
          .catch((error: BusinessError) => {
            console.log(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
            if (error.code == 1300002) {
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
      } catch (error) {
        console.log(msgStr + ',error code:' + error.code);
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0010
     * @tc.name      : testSetDefaultDensityEnabled_true
     * @tc.desc      : Test the function value of setDefaultDensityEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetDefaultDensityEnabled_true", 0, async (done: Function) => {
      let msgStr = "testSetDefaultDensityEnabled_true";
      console.log(msgStr + "begin");
      try {
        windowStage.setDefaultDensityEnabled(true);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('Failed to set default density enabled. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0020
     * @tc.name      : testSetDefaultDensityEnabled_true
     * @tc.desc      : Test the function value of setDefaultDensityEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetDefaultDensityEnabled_false", 0, async (done: Function) => {
      let msgStr = "testSetDefaultDensityEnabled_false";
      console.log(msgStr + "begin");
      try {
        windowStage.setDefaultDensityEnabled(false);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('Failed to set default density enabled. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0030
     * @tc.name      : testRectChangeOptions_on
     * @tc.desc      : Test the function value of testRectChangeOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testRectChangeOptions_on", 0, async (done: Function) => {
      let msgStr = "testRectChangeOptions_on";
      console.log(msgStr + "begin");
      try {
        let windowClass = await windowStage.getMainWindow();
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: ohosWindow.RectChangeReason;
        windowClass.on('windowRectChange', (data: ohosWindow.RectChangeOptions) => {
          console.log(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        });
        expect(true).assertTrue();
        done();
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0040
     * @tc.name      : testRectChangeOptions_off
     * @tc.desc      : Test the function value of testRectChangeOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testRectChangeOptions_off", 0, async (done: Function) => {
      let msgStr = "testRectChangeOptions_off";
      console.log(msgStr + "begin");
      try {
        let windowClass = await windowStage.getMainWindow();
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: ohosWindow.RectChangeReason;
        windowClass.off('windowRectChange');
        console.log(msgStr + 'Succeeded window rect changes');
        expect(true).assertTrue();
        done();
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0050
     * @tc.name      : testRectChangeReason_enum
     * @tc.desc      : Test the function value of RectChangeReason
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testRectChangeReason_enum", 0, async (done: Function) => {
      let msgStr = "testRectChangeReason_enum";
      console.log(msgStr + "begin");
      try {
        expect(0).assertEqual(ohosWindow.RectChangeReason.UNDEFINED);
        console.log(`ohosWindow.RectChangeReason.UNDEFINED: ${ohosWindow.RectChangeReason.UNDEFINED}`);
        expect(1).assertEqual(ohosWindow.RectChangeReason.MAXIMIZE);
        console.log(`ohosWindow.RectChangeReason.MAXIMIZE: ${ohosWindow.RectChangeReason.MAXIMIZE}`);
        expect(2).assertEqual(ohosWindow.RectChangeReason.RECOVER);
        console.log(`ohosWindow.RectChangeReason.RECOVER: ${ohosWindow.RectChangeReason.RECOVER}`);
        expect(3).assertEqual(ohosWindow.RectChangeReason.MOVE);
        console.log(`ohosWindow.RectChangeReason.MOVE: ${ohosWindow.RectChangeReason.MOVE}`);
        expect(4).assertEqual(ohosWindow.RectChangeReason.DRAG);
        console.log(`ohosWindow.RectChangeReason.DRAG: ${ohosWindow.RectChangeReason.DRAG}`);
        expect(5).assertEqual(ohosWindow.RectChangeReason.DRAG_START);
        console.log(`ohosWindow.RectChangeReason.DRAG_START: ${ohosWindow.RectChangeReason.DRAG_START}`);
        expect(6).assertEqual(ohosWindow.RectChangeReason.DRAG_END);
        console.log(`ohosWindow.RectChangeReason.DRAG_END: ${ohosWindow.RectChangeReason.DRAG_END}`);
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to testRectChangeReason_enum' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0600
     * @tc.name      : testRectChangeOptions_on_resize
     * @tc.desc      : Test the function value of testRectChangeOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testRectChangeOptions_on_resize", 0, async (done: Function) => {
      let msgStr = "testRectChangeOptions_on_resize";
      console.log(msgStr + "begin");
      try {
        let windowClass = await windowStage.getMainWindow();
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: ohosWindow.RectChangeReason;
        windowClass.on('windowRectChange', (data: ohosWindow.RectChangeOptions) => {
          console.log(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        });
        await windowClass.resize(1000, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          windowClass.off('windowRectChange');
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal.');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0700
         * @tc.name      : testRectChangeOptions_on_moveWindowTo
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("testRectChangeOptions_on_moveWindowTo", 0, async (done: Function) => {
      let msgStr = "testRectChangeOptions_on_moveWindowTo";
      console.log(msgStr + "begin");
      try {
        let windowClass = await windowStage.getMainWindow();
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: ohosWindow.RectChangeReason;
        windowClass.on('windowRectChange', (data: ohosWindow.RectChangeOptions) => {
          console.log(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          windowClass.off('windowRectChange');
          expect(true).assertTrue();
          done();
        });
        await windowClass.moveWindowTo(500, 500).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(1000);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to move the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal..');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0800
         * @tc.name      : testRectChangeOptions_on_TwoCallback
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("testRectChangeOptions_on_TwoCallback", 0, async (done: Function) => {
      let msgStr = "testRectChangeOptions_on_TwoCallback";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let num = 0;
      const callback1 = () => {
        num++;
        console.info(msgStr + 'callback1 is called,num = ' + num);
        windowClass.off('windowRectChange', callback1);
      };
      const callback2 = () => {
        num++;
        console.info(msgStr + 'callback2 is called,num = ' + num);
        windowClass.off('windowRectChange', callback2);
      };
      try {
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: ohosWindow.RectChangeReason;
        windowClass.on('windowRectChange', callback1);
        windowClass.on('windowRectChange', callback2);
        await windowClass.resize(800, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          expect(num).assertEqual(2);
          windowClass.off('windowRectChange');
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal.');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0900
         * @tc.name      : testRectChangeOptions_off_callback1
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("testRectChangeOptions_off_callback1", 0, async (done: Function) => {
      let msgStr = "testRectChangeOptions_off_callback1";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let num = 0;
      const callback1 = () => {
        num++;
        console.info(msgStr + 'callback1 is called,num = ' + num);
        windowClass.off('windowRectChange', callback1);
      };
      const callback2 = () => {
        num--;
        console.info(msgStr + 'callback2 is called,num = ' + num);
        windowClass.off('windowRectChange', callback2);
      };
      try {
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: ohosWindow.RectChangeReason;
        windowClass.on('windowRectChange', callback1);
        windowClass.on('windowRectChange', callback2);
        windowClass.off('windowRectChange', callback1);
        await windowClass.resize(1100, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          expect(num).assertEqual(-1);
          windowClass.off('windowRectChange');
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal.');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1000
         * @tc.name      : testRectChangeOptions_off_all_callback
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
    it("testRectChangeOptions_off_all_callback", 0, async (done: Function) => {
      let msgStr = "testRectChangeOptions_off_all_callback";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let num = 0;
      const callback1 = () => {
        num++;
        console.info(msgStr + 'callback1 is called,num = ' + num);
        windowClass.off('windowRectChange', callback1);
      };
      const callback2 = () => {
        num++;
        console.info(msgStr + 'callback2 is called,num = ' + num);
        windowClass.off('windowRectChange', callback2);
      };
      try {
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        };
        let reason: ohosWindow.RectChangeReason;
        windowClass.on('windowRectChange', callback1);
        windowClass.on('windowRectChange', callback2);
        windowClass.off('windowRectChange');
        await windowClass.resize(1200, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(500);
          expect(num).assertEqual(0);
          windowClass.off('windowRectChange');
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300002) {
            console.info(msgStr + 'This window state is abnormal.');
            windowClass.off('windowRectChange');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0100
         * @tc.name      : test_setWindowGrayScale_0
         * @tc.desc      : test_setWindowGrayScale_0
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_0", 0, async (done: Function) => {
      let msgStr = "test_setWindowGrayScale_0";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        let grayScale = 0;
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale 0.');
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error.code));
        expect().assertFail();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0200
         * @tc.name      : test_setWindowGrayScale_0.5
         * @tc.desc      : test_setWindowGrayScale_0.5
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_0.5", 0, async (done: Function) => {
      let msgStr = "test_setWindowGrayScale_0.5";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let grayScale = 0.5;
      try {
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale 0.5.');
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0300
         * @tc.name      : test_setWindowGrayScale_1
         * @tc.desc      : test_setWindowGrayScale_1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_1", 0, async (done: Function) => {
      let msgStr = "test_setWindowGrayScale_1";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let grayScale = 1;
      try {
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale 1.');
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0400
         * @tc.name      : test_setWindowGrayScale_-1
         * @tc.desc      : test_setWindowGrayScale_-1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_-1", 0, async (done: Function) => {
      let msgStr = "test_setWindowGrayScale_-1";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let grayScale = -1;
      try {
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale -1.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error.code));
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0500
         * @tc.name      : test_setWindowGrayScale_2
         * @tc.desc      : test_setWindowGrayScale_2
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_2", 0, async (done: Function) => {
      let msgStr = "test_setWindowGrayScale_2";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let grayScale = 2;
      try {
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale 2.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error.code));
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0600
         * @tc.name      : test_subWindow_setWindowGrayScale_1
         * @tc.desc      : test_subWindow_setWindowGrayScale_1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_subWindow_setWindowGrayScale_1", 0, async (done: Function) => {
      let msgStr = "test_subWindow_setWindowGrayScale_1";
      console.log(msgStr + "begin");
      let grayScale = 1;
      try {
        await windowStage.createSubWindow('test_subWindow_setWindowGrayScale_2').then(async (data) => {
          let subWindowClass = data;
          console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.setUIContent('testability/pages/First/index2').then(() => {
            console.info(msgStr + 'Succeeded in setUiContent.');
            subWindowClass.setWindowGrayScale(grayScale).then(() => {
              console.info(msgStr + 'Succeeded in setting the grayScale 1.');
              expect(true).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.log(msgStr + `Failed to setUiContent. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch((err: BusinessError) => {
          console.log(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_ON_WINDOW_RECTCHANGE_0100
         * @tc.name      : test_on_windowRectChange
         * @tc.desc      : test_on_windowRectChange
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */

    it("test_on_windowRectChange", 2, async (done: Function) => {
      let msgStr = "test_on_windowRectChange";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('windowRectChange', (data: ohosWindow.RectChangeOptions) => {
          console.info(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          console.info(msgStr + 'Succeeded window rect changes. reason: ' + JSON.stringify(data.reason));
        });
        windowClass.off('windowRectChange');
        console.log(msgStr + 'Succeeded to off the windowRectChange');
        expect(true).assertTrue();
        done();
      } catch (error) {
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100
     * @tc.name      : test_setImmersiveModeEnabledState_true
     * @tc.desc      : test_setImmersiveModeEnabledState_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100", 2, async (done: Function) => {
      let msgStr = "SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0100";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        let enabled = true;
        windowClass.setImmersiveModeEnabledState(enabled);
        let isEnabled = windowClass.getImmersiveModeEnabledState();
        console.log(msgStr + 'success to setImmersiveModeEnabledState enabled:' + isEnabled);
        if(deviceType != '2in1' || isAutoWindow =='false'){
          expect(isEnabled).assertEqual(true);
          done();
        }else{
          expect(isEnabled).assertEqual(false);
          done();
        }
        
      } catch (error) {
        console.log(msgStr + 'Failed to setImmersiveModeEnabledState enable' + JSON.stringify(error.code) +
          error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200
     * @tc.name      : test_setImmersiveModeEnabledState_false
     * @tc.desc      : test_setImmersiveModeEnabledState_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200", 2, async (done: Function) => {
      let msgStr = "SUB_BASIC_WMS_SPCIAL_XTS_SET_IMMERSIVEMODE_ENABLEDATATE_0200";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        let enabled = false;
        windowClass.setImmersiveModeEnabledState(enabled);
        let isEnabled = windowClass.getImmersiveModeEnabledState();
        console.log(msgStr + 'success to setImmersiveModeEnabledState disenabled:' + isEnabled);
        expect(isEnabled).assertEqual(false);
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to setImmersiveModeEnabledState disEnable' + JSON.stringify(error.code) +
          error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOWMASK_0100
     * @tc.name      : test_mainWindow_setWindowMask
     * @tc.desc      : test_mainWindow_setWindowMask
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("test_mainWindow_setWindowMask", 2, async (done: Function) => {
      let msgStr = "test_mainWindow_setWindowMask";
      console.log(msgStr + "begin");
      let windowMask: Array<Array<number>> = new Array < Array < number >> ();
      for (let i = 0; i < 500; i++) {
        let arr: Array<number> = new Array < number > (500);
        for (let j = 0; j < 500; j++) {
          if (i + j < 500) {
            arr[j] = 0;
          } else {
            arr[j] = 1;
          }
        }
        windowMask.push(arr);
      }
      console.log(msgStr + " windowMask OK ");
      let windowClass = await windowStage.getMainWindow();
      try {
        let promise = windowClass.setWindowMask(windowMask);
        promise.then(() => {
          console.log(msgStr + 'Succeeded in setting the window mask.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to set the window mask. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
          done();
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowMask' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持 setWindowMask');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0100
     * @tc.name      : test_mainWindow_on_noInteractionDetected
     * @tc.desc      : test_mainWindow_on_noInteractionDetected
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("test_mainWindow_on_noInteractionDetected", 2, async (done: Function) => {
      let msgStr = "test_mainWindow_on_noInteractionDetected";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time: number;
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', 2, () => {
          console.info(msgStr + 'no interaction in 2s');
          time2 = new Date().getTime();
          time = time2 - time1;
          console.log(msgStr + ':time:' + time);
          expect(time).assertLess(3000);
          expect(time).assertLarger(1500);
          windowClass.off('noInteractionDetected');
          done();
        });
        time1 = new Date().getTime();
        await sleep(2000);
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0200
     * @tc.name      : test_mainWindow_off_noInteractionDetected
     * @tc.desc      : test_mainWindow_off_noInteractionDetected
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("test_mainWindow_off_noInteractionDetected", 2, async (done: Function) => {
      let msgStr = "test_mainWindow_off_noInteractionDetected";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', 2, () => {
          console.info(msgStr + 'no interaction in 2s');
          expect(false).assertTrue();
          done();
        });
        windowClass.off('noInteractionDetected');
        await sleep(3000);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0300
     * @tc.name      : test_subWindow_on_noInteractionDetected
     * @tc.desc      : test_subWindow_on_noInteractionDetected
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("test_subWindow_on_noInteractionDetected", 2, async (done: Function) => {
      let msgStr = "test_subWindow_on_noInteractionDetected";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time: number;
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_subWindow_on_noInteractionDetected');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await subWindowClass.showWindow();
          subWindowClass.on('noInteractionDetected', 2, () => {
            console.info(msgStr + 'no interaction in 2s');
            time2 = new Date().getTime();
            time = time2 - time1;
            console.log(msgStr + ':time:' + time);
            expect(time).assertLess(3000);
            expect(time).assertLarger(1500);
            subWindowClass.off('noInteractionDetected');
            subWindowClass.hide();
            done();
          });
          time1 = new Date().getTime();
          await sleep(2000);
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          subWindowClass.destroyWindow();
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
            expect(true).assertTrue();
            done();
          } else {
            console.log(msgStr + 'Failed to setWindowMask');
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0400
     * @tc.name      : test_mainWindow_on_noInteractionDetected_two
     * @tc.desc      : test_mainWindow_on_noInteractionDetected_two
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("test_mainWindow_on_noInteractionDetected_two", 2, async (done: Function) => {
      let msgStr = "test_mainWindow_on_noInteractionDetected_two";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time3: number;
      let Num: number = 0;
      const callback1 = () => {
        console.info(msgStr + 'no interaction callback1');
        time2 = new Date().getTime();
        let time = time2 - time1;
        console.log(msgStr + 'callback1:time:' + time);
        expect(time).assertLess(3000);
        expect(time).assertLarger(1500);
        Num++;
      };
      const callback2 = () => {
        console.info(msgStr + 'no interaction callback2');
        time3 = new Date().getTime();
        let time = time3 - time1;
        console.log(msgStr + 'callback2:time:' + time);
        expect(time).assertLess(4000);
        expect(time).assertLarger(2500);
        Num++;
      };
      try {
        let windowClass = await windowStage.getMainWindow();
        windowClass.on('noInteractionDetected', 2, callback1);
        windowClass.on('noInteractionDetected', 3, callback2);
        time1 = new Date().getTime();
        await sleep(4000);
        console.log(msgStr + ':Num:' + Num);
        expect(Num).assertEqual(2);
        windowClass.off('noInteractionDetected');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0500
     * @tc.name      : test_mainWindow_on_noInteractionDetected_One
     * @tc.desc      : test_mainWindow_on_noInteractionDetected_One
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("test_mainWindow_on_noInteractionDetected_One", 2, async (done: Function) => {
      let msgStr = "test_mainWindow_on_noInteractionDetected_One";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time3: number;
      let Num: number = 0;
      const callback1 = () => {
        console.info(msgStr + 'no interaction callback1');
        time2 = new Date().getTime();
        let time = time2 - time1;
        console.log(msgStr + 'callback1:time:' + time);
        expect(time).assertLess(3000);
        expect(time).assertLarger(1500);
        Num++;
      };
      const callback2 = () => {
        console.info(msgStr + 'no interaction callback2');
        time3 = new Date().getTime();
        let time = time3 - time1;
        console.log(msgStr + 'callback2:time:' + time);
        expect(time).assertLess(4000);
        expect(time).assertLarger(2500);
        Num++;
      };
      try {
        let windowClass = await windowStage.getMainWindow();
        windowClass.on('noInteractionDetected', 2, callback1);
        windowClass.on('noInteractionDetected', 3, callback2);
        windowClass.off('noInteractionDetected', callback2);
        time1 = new Date().getTime();
        await sleep(3000);
        console.log(msgStr + ':Num:' + Num);
        expect(Num).assertEqual(1);
        windowClass.off('noInteractionDetected');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0600
     * @tc.name      : test_mainWindow_off_noInteractionDetected_All
     * @tc.desc      : test_mainWindow_off_noInteractionDetected_All
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it("test_mainWindow_on_noInteractionDetected_Two", 2, async (done: Function) => {
      let msgStr = "test_mainWindow_on_noInteractionDetected_Two";
      console.log(msgStr + "begin");
      let time1: number;
      let time2: number;
      let time3: number;
      let Num: number = 0;
      const callback1 = () => {
        console.info(msgStr + 'no interaction callback1');
        time2 = new Date().getTime();
        let time = time2 - time1;
        console.log(msgStr + 'callback1:time:' + time);
        expect(time).assertLess(3000);
        expect(time).assertLarger(1500);
        Num++;
      };
      const callback2 = () => {
        console.info(msgStr + 'no interaction callback2');
        time3 = new Date().getTime();
        let time = time3 - time1;
        console.log(msgStr + 'callback2:time:' + time);
        expect(time).assertLess(4000);
        expect(time).assertLarger(2500);
        Num++;
      };
      try {
        let windowClass = await windowStage.getMainWindow();
        windowClass.on('noInteractionDetected', 2, callback1);
        windowClass.on('noInteractionDetected', 3, callback2);
        windowClass.off('noInteractionDetected');
        time1 = new Date().getTime();
        await sleep(3000);
        console.log(msgStr + ':Num:' + Num);
        expect(Num).assertEqual(0);
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0700
     * @tc.name      : test_mainWindow_on_noInteractionDetected_Not_triggered
     * @tc.desc      :  test_mainWindow_on_noInteractionDetected_Not_triggered
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it(" test_mainWindow_on_noInteractionDetected_Not_triggered", 2, async (done: Function) => {
      let msgStr = " test_mainWindow_on_noInteractionDetected_Not_triggered";
      console.log(msgStr + "begin");
      let driver: Driver = Driver.create();
      let flag = false;
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', 2, () => {
          console.info(msgStr + 'no interaction in 2s');
          flag = true;
          expect(false).assertTrue();
          done();
        });
        await sleep(1000);
        await driver.click(800, 800);
        console.log(msgStr + ':flag:' + flag);
        expect(flag).assertEqual(false);
        windowClass.off('noInteractionDetected');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0800
     * @tc.name      : test_mainWindow_on_noInteractionDetected_0.5
     * @tc.desc      :  test_mainWindow_on_noInteractionDetected_0.5
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it(" test_mainWindow_on_noInteractionDetected_0_5", 2, async (done: Function) => {
      let msgStr = " test_mainWindow_on_noInteractionDetected_0.5";
      console.log(msgStr + "begin");
      let flag = false;
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', 0.5, () => {
          console.info(msgStr + 'no interaction in 2s');
          flag = true;
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else if (error.code == 401) {
          console.log(msgStr + '入参错误，不支持0.5');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_ON_NOINTERCATIONDETECTED_0900
     * @tc.name      : test_mainWindow_on_noInteractionDetected_-1
     * @tc.desc      :  test_mainWindow_on_noInteractionDetected_-1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */

    it(" test_mainWindow_on_noInteractionDetected__1", 2, async (done: Function) => {
      let msgStr = " test_mainWindow_on_noInteractionDetected_-1";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('noInteractionDetected', -1, () => {
          console.info(msgStr + 'no interaction in 2s');
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        if (error.code == 801) {
          console.log(msgStr + '此设备不支持注册noInteractionDetected监听');
          expect(true).assertTrue();
          done();
        } else if (error.code == 401) {
          console.log(msgStr + '入参错误，不支持-1');
          expect(true).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to setWindowMask');
          expect(false).assertTrue();
          done();
        }
      }
    })
  })
}
