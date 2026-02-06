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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import ohosWindow from '@ohos.window';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import settings from '@ohos.settings';
import { image } from '@kit.ImageKit';
import * as LoadContentByName from '../testability/pages/WindowTest/LoadContentByName';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { StartOptions, bundleManager } from '@kit.AbilityKit';

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
export default function windowModalTest() {
  describe('windowModalTest', () => {
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
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let isAutoWindow:string = '';
    let isPCStatus: string = '';
    let driver: Driver;
    let isFreeWindowMode = false;
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType.TYPE_FLOAT));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsUnittest beforeAll systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.USER_PROPERTY);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      driver = Driver.create();
      
    })
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

    /**
     * @tc.name   testsetSubWindowModal_Function_Promise1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0100
     * @tc.desc   Test the function value of setSubWindowModal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testsetSubWindowModal_Function_Promise1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testsetSubWindowModal_Function_Promise2
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0200
     * @tc.desc   Test the function value of setSubWindowModal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testsetSubWindowModal_Function_Promise2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testsetSubWindowModal_Function_Promise3
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0300
     * @tc.desc   Test the function value of setSubWindowModal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testsetSubWindowModal_Function_Promise3", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   test_SubWindow_IsModal_true
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0100
     * @tc.desc   test_SubWindow_IsModal_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_SubWindow_IsModal_true", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SubWindow_IsModal_true";
      console.log(msgStr + "begin");
      let num = 0;
      let minWidth = 0;
      let minHeight = 0;
      let subWindowClass: ohosWindow.Window;
      let windowClass = await windowStage.getMainWindow();
      try {
        let promise = windowStage.createSubWindow('test_SubWindow_IsModal_true');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          minWidth = Number(subWindowClass.getWindowLimits().minWidth);
          minHeight = Number(subWindowClass.getWindowLimits().minHeight);
          console.log('Window WindowLimits:' + minWidth +' '+ minHeight);
          await subWindowClass.resize(minWidth+200, minHeight+200);
          await subWindowClass.moveWindowToAsync(100, 100);
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
              await sleep(4000);
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
          if(err.code == 801){
            console.log(msgStr + `getWindowLimits 当前设备类型不支持系统能力SystemCapability.Window.SessionManager, message: ${err.message}`);
            done();
          }else{
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
          }

          
        });
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        done();
      }
    })
    /**
     * @tc.name   test_SubWindow_IsModal_false
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0200
     * @tc.desc   test_SubWindow_IsModal_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_SubWindow_IsModal_false", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SubWindow_IsModal_false";
      console.log(msgStr + "begin");
      let minWidth = 0;
      let minHeight = 0;
      let num = 0;
      let subWindowClass: ohosWindow.Window;
      let windowClass = await windowStage.getMainWindow();
      try {
        let promise = windowStage.createSubWindow('test_SubWindow_IsModal_false');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          minWidth = Number(subWindowClass.getWindowLimits().minWidth);
          minHeight = Number(subWindowClass.getWindowLimits().minHeight);
          console.log('Window WindowLimits:' + minWidth +' '+ minHeight);
          await subWindowClass.resize(minWidth+200, minHeight+200);
          await subWindowClass.moveWindowToAsync(100, 100);
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
          if(err.code == 801){
            console.log(msgStr + `getWindowLimits 当前设备类型不支持系统能力SystemCapability.Window.SessionManager, message: ${err.message}`);
            done();
          }else{
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }

          
        });
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause code:' + JSON.stringify(error.code) + error.message);
        done();
      }
    })
    /**
     * @tc.name   test_SubWindow_hide_IsModal_true
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0300
     * @tc.desc   test_SubWindow_hide_IsModal_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_SubWindow_hide_IsModal_true", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_SubWindow_hide_IsModal_true";
      console.log(msgStr + "begin");
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
     * @tc.name   test_setSubWindowModal_isModal_null_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0400
     * @tc.desc   test_setSubWindowModal_isModal_null_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_setSubWindowModal_isModal_null_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   test_setSubWindowModal_ModalityType_TypeError_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0500
     * @tc.desc   test_setSubWindowModal_ModalityType_TypeError_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_setSubWindowModal_ModalityType_TypeError_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   test_setSubWindowModal_ModalityType_incorrect_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0600
     * @tc.desc   test_setSubWindowModal_ModalityType_incorrect_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_setSubWindowModal_ModalityType_incorrect_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   test_setSubWindowModal_ModalityType_isModal_false_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0700
     * @tc.desc   test_setSubWindowModal_ModalityType_isModal_false_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_setSubWindowModal_ModalityType_isModal_false_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   test_setSubWindowModal_ModalityType_null_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0800
     * @tc.desc   test_setSubWindowModal_ModalityType_null_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_setSubWindowModal_ModalityType_null_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   test_setSubWindowModal_ModalityType_enum
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_0900
     * @tc.desc   test_setSubWindowModal_ModalityType_enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_setSubWindowModal_ModalityType_enum", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "test_setSubWindowModal_ModalityType_enum";
      console.log(msgStr + "begin");
      expect(ohosWindow.ModalityType.WINDOW_MODALITY).assertEqual(0);
      expect(ohosWindow.ModalityType.APPLICATION_MODALITY).assertEqual(1);
      done();
    })

    /**
     * @tc.name   test_setSubWindowModal_subWindow_destory_1300002
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_1000
     * @tc.desc   test_setSubWindowModal_subWindow_destory_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_setSubWindowModal_subWindow_destory_1300002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   test_setSubWindowModal_MainWindow_1300004
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_1100
     * @tc.desc   test_setSubWindowModal_MainWindow_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_setSubWindowModal_MainWindow_1300004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   testCreateSubWindowWithOptions_name_is_null_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0100
     * @tc.desc   testCreateSubWindowWithOptions_name_is_null_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCreateSubWindowWithOptions_name_is_null_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   testCreateSubWindowWithOptions_modalityType_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0200
     * @tc.desc   testCreateSubWindowWithOptions_modalityType_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCreateSubWindowWithOptions_modalityType_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   testCreateSubWindowWithOptions_modalityType_is_INCORRECT_401
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0300
     * @tc.desc   testCreateSubWindowWithOptions_modalityType_is_INCORRECT_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCreateSubWindowWithOptions_modalityType_is_INCORRECT_401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0400
     * @tc.desc   testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testCreateSubWindowWithOptions_modalityType_APPLICATION_MODALITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.name   testCreateSubWindowWithOptions_modalityType_WINDOW_MODALITY
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_CREATE_SUBWINDOW_WITH_OPTIONS_0500
     * @tc.desc   testCreateSubWindowWithOptions_modalityType_WINDOW_MODALITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testCreateSubWindowWithOptions_modalityType_WINDOW_MODALITY", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetSubWindowModalModalityType_0100
     * @tc.number testSetSubWindowModalModalityType_0100
     * @tc.desc   testSetSubWindowModalModalityType_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testSetSubWindowModalModalityType_0200
     * @tc.number testSetSubWindowModalModalityType_0200
     * @tc.desc   testSetSubWindowModalModalityType_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testSetSubWindowModalModalityType_0300
     * @tc.number testSetSubWindowModalModalityType_0300
     * @tc.desc   testSetSubWindowModalModalityType_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testSetSubWindowModalModalityType_0400
     * @tc.number testSetSubWindowModalModalityType_0400
     * @tc.desc   testSetSubWindowModalModalityType_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSubWindowModalModalityType_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testCreateSubWindowWithOptionsModalityType_0100
     * @tc.number testCreateSubWindowWithOptionsModalityType_0100
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testCreateSubWindowWithOptionsModalityType_0200
     * @tc.number testCreateSubWindowWithOptionsModalityType_0200
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testCreateSubWindowWithOptionsModalityType_0300
     * @tc.number testCreateSubWindowWithOptionsModalityType_0300
     * @tc.desc   Test the function value of setWindowTitleMoveEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSubWindowWithOptionsModalityType_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   testSetWindowModalTrue
     * @tc.number testSetWindowModalTrue
     * @tc.desc   testSetWindowModalTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowModalTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetWindowModalTrueTest';
      let windowClass = windowStage.getMainWindowSync()
      await windowClass.setUIContent('testability/pages/WindowTest/Modality')
      await sleep(300);
      let windowRect = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowRect = ${JSON.stringify(windowRect)}`)
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(1500)
      let btnPoint = await btn.getBoundsCenter()
      console.info(`${message} btnPoint = ${JSON.stringify(btnPoint)}`);
      let windowStageStart = await startAbility(message, context)
      try {
        let promise = windowStageStart.setWindowModal(true);
        promise.then(async () => {
          console.info(`${message} Succeeded in setting window modal`);
          let windowClassStart = windowStageStart.getMainWindowSync()
          let windowLimits = windowClassStart.getWindowLimits();
          console.info(`${message} windowLimits = ${JSON.stringify(windowLimits)}`);
          windowClassStart.resizeAsync(windowLimits.minWidth, windowLimits.minHeight)
          windowClassStart.moveWindowToAsync(50, 50)
          await sleep(1000)
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
          console.info(`${message} windowPoint = ${JSON.stringify(windowPoint)}`);
          console.info(`${message} window width = ${windowPoint.bottom - windowPoint.top}, expect 800`);
          console.info(`${message} window height = ${windowPoint.right - windowPoint.left}, expect 700`);
          expect(windowPoint.bottom - windowPoint.top).assertEqual(windowLimits.minHeight)
          expect(windowPoint.right - windowPoint.left).assertEqual(windowLimits.minWidth)
          await sleep(300);
          await terminateAbility(message);
          done()
        }).catch(async (err: BusinessError) => {
          await terminateAbility(message);
          if (!isFreeWindowMode) {
            console.error(`${message} Capability not supported. Failed to call the API due to limited device capabilities`);
            expect(err.code).assertEqual(801);
            done();
          } else {
            console.error(`${message} Failed to set window modal. Cause code: ${err.code}, message: ${err.message}`)
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        await terminateAbility(message);
        if (exception.code == 801) {
          console.error(`${message} Capability not supported. Failed to call the API due to limited device capabilities`);
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
     * @tc.name   testSetWindowModalFalse
     * @tc.number testSetWindowModalFalse
     * @tc.desc   testSetWindowModalFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowModalFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetWindowModalFalseTest';
      let windowClass = windowStage.getMainWindowSync()
      await windowClass.setUIContent('testability/pages/WindowTest/Modality')
      await sleep(300);
      let windowRect = windowClass.getWindowProperties().windowRect
      console.info(`${message} windowRect = ${JSON.stringify(windowRect)}`)
      let btn = await driver.findComponent(ON.id('ModalityText'))
      await sleep(1000)
      let btnPoint = await btn.getBoundsCenter()
      let windowStageStart = await startAbility(message, context);
      try {
        let promise = windowStageStart.setWindowModal(false);
        promise.then(async () => {
          console.info(`${message} Succeeded in setting window modal`);
          let windowClassStart = windowStageStart.getMainWindowSync()
          await windowClassStart.resizeAsync(700, 200)
          await windowClassStart.moveWindowToAsync(50, 50)
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
          await sleep(300);
          await terminateAbility(message);
          done()
        }).catch(async (err: BusinessError) => {
          await terminateAbility(message);
          if (!isFreeWindowMode) {
            console.error(`${message}  Capability not supported. Failed to call the API due to limited device capabilities`);
            expect(err.code).assertEqual(801);
            done();
          } else {
            console.error(`${message} Failed to set window modal. Cause code: ${err.code}, message: ${err.message}`)
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        await terminateAbility(message);
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

    
   

    
   

    

    
    
    
    
    
    
    


    

    
    


  })
}
