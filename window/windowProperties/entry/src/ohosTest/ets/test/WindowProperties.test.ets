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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import deviceInfo from '@ohos.deviceInfo';
import settings from '@ohos.settings';
import { image } from '@kit.ImageKit';
import { StartOptions } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import pipWindow from '@ohos.PiPWindow';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility3(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility3',
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

async function startAbility4(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility4',
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
  let windowStageStart = AppStorage.get('windowStageStartTest4') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility4(caseName: string) {
  let pageContext = AppStorage.get('contextTest4') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function windowPropertiesTest() {
    describe('windowProperties_test', () => {
        let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
        let context: common.UIAbilityContext;
        let windowStage: ohosWindow.WindowStage;
        let isAutoWindow: string = '';
        let isPCStatus: string = '';
        let isFreeWindowMode = false;
        beforeAll(async () => {
            context = AppStorage.get('context') as common.UIAbilityContext;
            console.log('windowTest context: ' + JSON.stringify(context))
            windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
            isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
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

        })
        beforeEach(() => {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
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
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })

      /**
       * @tc.name   testSetWatermarkImageForAppWindowswithSizeExceedsScreenSize
       * @tc.number SUB_BASIC_WMS_SET_WATERMARKIMAGE_FOR_APPWINDOWS_0100
       * @tc.desc   验证设置进程水印入参pixelmap大小超过屏幕大小时抛出错误码1300016
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testSetWatermarkImageForAppWindowswithSizeExceedsScreenSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'testSetWatermarkImageForAppWindowswithSizeExceedsScreenSize';
        const rawFile: Uint8Array = await context.resourceManager.getRawFileContent("test2.jpg");
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        }
        let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);

        imageSource.createPixelMap().then((pixelMap: image.PixelMap) => {
          console.info(caseName + " Succeeded in creating pixelmap.");
          try {
            let promise = window.setWatermarkImageForAppWindows(pixelMap);
            promise.then(() => {
              console.info(caseName + " Succeeded in setting watermark image.");
              expect().assertFail();
              done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} Failed to set watermark image. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                done()
              } else {
                expect(err.code).assertEqual(1300016);
                done();
              }
            });
          } catch (exception) {
            console.error(`${caseName} Failed to set watermark image. Exception code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to create PixelMap. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      })

      /**
       * @tc.name   testSetWatermarkImageForAppWindowswithMainWindow
       * @tc.number SUB_BASIC_WMS_SET_WATERMARKIMAGE_FOR_APPWINDOWS_0200
       * @tc.desc   验证主窗设置和取消水印成功
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testSetWatermarkImageForAppWindowswithMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testSetWatermarkImageForAppWindowswithMainWindow';
        const rawFile: Uint8Array = await context.resourceManager.getRawFileContent("test1.jpg");
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        }
        try{
          let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);

          imageSource.createPixelMap().then((pixelMap: image.PixelMap) => {
            console.info(caseName + " Succeeded in creating pixelmap.");
            try {
              let promise = window.setWatermarkImageForAppWindows(pixelMap);
              promise.then(async () => {
                console.info(caseName + " Succeeded in setting watermark image.");
                await window.setWatermarkImageForAppWindows(undefined);
                console.info(caseName + " Succeeded in setWatermarkImageForAppWindows undefined.");
                expect(true).assertTrue();
                done();
              }).catch((err: BusinessError) => {
                console.error(`${caseName} Failed to set watermark image. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                  done()
                } else {
                  expect().assertFail();
                  done();
                }
              });
            } catch (exception) {
              console.error(`${caseName} Failed to set watermark image. Exception code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
              done();
            }
          }).catch((err: BusinessError) => {
            console.error(`${caseName} Failed to create PixelMap. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          });
        }catch (err) {
          console.error(`${caseName} Failed . Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }

      })

      /**
       * @tc.name   testSetWatermarkImageForAppWindowswithMainWindowandSubWindow
       * @tc.number SUB_BASIC_WMS_SET_WATERMARKIMAGE_FOR_APPWINDOWS_0300
       * @tc.desc   验证主窗设置，子窗取消水印成功
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSetWatermarkImageForAppWindowswithMainWindowandSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let caseName = 'testSetWatermarkImageForAppWindowswithMainWindowandSubWindow';
        let subWindowClass = await windowStage.createSubWindow('testSetWatermarkImageForAppWindowswithMainWindowandSubWindow');
        let driver: Driver = Driver.create();
        await sleep(200)
        try {
          let windowLimits = subWindowClass.getWindowLimits();
          console.log(caseName + ' windowLimits:' + JSON.stringify(windowLimits));
          await subWindowClass.resize(windowLimits.minWidth as number+200, windowLimits.minHeight as number+200)
          subWindowClass.moveWindowToAsync(100,150);
          await sleep(200);
          await subWindowClass.setUIContent('testability/pages/First/index4');
          await subWindowClass.showWindow();
          await sleep(1000);
          let btn = await driver.findComponent(ON.id('SubWinTestId'));
          await sleep(1000);
          await btn.click();
          await sleep(1000);
          let errCode = await driver.findComponent(ON.id('errCode'));
          console.log(caseName + ' errCode:' + JSON.stringify(errCode));
          await sleep(1000);
          let errMessage = await driver.findComponent(ON.id('errMessage'));
          console.log(caseName + ' errMessage:' + JSON.stringify(errMessage));
          await sleep(1000);
          let errCodeText = await errCode.getText();
          let errMessageText = await errMessage.getText();
          await sleep(200);
          if (errCodeText == '801') {
            expect(true).assertTrue()
          } else if (errMessageText == 'success') {
            expect(true).assertTrue()
          } else {
            console.error(`${caseName} Failed. Cause: ${JSON.stringify(errMessageText)}`);
            expect().assertFail()
          }
          await subWindowClass.destroyWindow();
          done();
        } catch (err) {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            await subWindowClass.destroyWindow();
            done();
          } else {
            expect().assertFail()
            await subWindowClass.destroyWindow();
            done();
          }
        }
      })

      /**
       * @tc.name   testSetWatermarkImageForAppWindowswithMainWindowandSystemWindow
       * @tc.number SUB_BASIC_WMS_SET_WATERMARKIMAGE_FOR_APPWINDOWS_0400
       * @tc.desc   验证主窗设置，系统窗取消水印成功
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSetWatermarkImageForAppWindowswithMainWindowandSystemWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let caseName = 'testSetWatermarkImageForAppWindowswithMainWindowandSystemWindow';
        let subWindowClass: window.Window | undefined;
        let driver: Driver = Driver.create();
        await sleep(200)
        let config: window.Configuration = {
          name: "testSetWatermarkImageForAppWindowswithMainWindowandSystemWindow",
          windowType: window.WindowType.TYPE_FLOAT,
          ctx: context
        };
        try {
          window.createWindow(config).then(async (data) => {
            subWindowClass = data;
            await subWindowClass.setUIContent('testability/pages/First/index4');
            await subWindowClass.showWindow();
            let btn = await driver.findComponent(ON.id('SubWinTestId'));
            await sleep(2000);
            await btn.click();
            await sleep(1000);
            let errCode = await driver.findComponent(ON.id('errCode'));
            await sleep(1000);
            let errMessage = await driver.findComponent(ON.id('errMessage'));
            await sleep(1000);
            let errCodeText = await errCode.getText();
            let errMessageText = await errMessage.getText();
            await sleep(200);
            if (errCodeText == '801') {
              expect(true).assertTrue()
            } else if (errMessageText == 'success') {
              expect(true).assertTrue()
            } else {
              console.error(`${caseName} Failed. Cause: ${JSON.stringify(errMessageText)}`);
              expect().assertFail()
            }
            await subWindowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code === 1300002) {
              await subWindowClass?.destroyWindow();
              done()
            } else {
              expect().assertFail();
              await subWindowClass?.destroyWindow();
              done()
            }
          });
        } catch (err) {
          console.error(`${caseName} Failed2. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail()
          await subWindowClass?.destroyWindow();
          done();
        }
      })

      /**
       * @tc.name   testSetWatermarkImageForAppWindowsBeforeLoadContent
       * @tc.number SUB_BASIC_WMS_SET_WATERMARKIMAGE_FOR_APPWINDOWS_0500
       * @tc.desc   验证设置进程水印在子窗loadcontent之前调用
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testSetWatermarkImageForAppWindowsBeforeLoadContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let caseName = 'testSetWatermarkImageForAppWindowsBeforeLoadContent';
        const rawFile: Uint8Array = await context.resourceManager.getRawFileContent("test1.jpg");
        let ops: image.SourceOptions = {
          sourceDensity: 98,
        }
        let imageSource: image.ImageSource = image.createImageSource(rawFile.buffer as ArrayBuffer, ops);

        let subWindowClass: window.Window | undefined;

        imageSource.createPixelMap().then(async (pixelMap: image.PixelMap) => {
          console.info(caseName + " Succeeded in creating pixelmap.");
          try {
            subWindowClass = await windowStage.createSubWindow('testSetWatermarkImageForAppWindowsBeforeLoadContent');
            let windowLimits = subWindowClass.getWindowLimits();
            console.log(caseName + ' windowLimits: ' + JSON.stringify(windowLimits));
            await subWindowClass.resize(windowLimits.minWidth as number, windowLimits.minHeight as number);

            let promise = window.setWatermarkImageForAppWindows(pixelMap);
            promise.then(async () => {
              console.info(caseName + " Succeeded in setting watermark image.");
              await window.setWatermarkImageForAppWindows(undefined);
              await subWindowClass?.showWindow();
              await subWindowClass?.destroyWindow()
              expect(true).assertTrue();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to set watermark image. Cause code: ${err.code}, message: ${err.message}`);
              await subWindowClass?.destroyWindow()
              if (err.code == 801) {
                done()
              } else {
                expect().assertFail();
                done();
              }
            });
          } catch (exception) {
            console.error(`${caseName} Failed to set watermark image. Exception code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
              await subWindowClass?.destroyWindow()
              done();
            } else {
              await subWindowClass?.destroyWindow()
              expect().assertFail();
              done();
            }
          }
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed to create PixelMap. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow()
          expect().assertFail();
          done();
        });
      })

    /**
     * @tc.name   test_getAllWindowLayoutInfo_mainWindow
     * @tc.number SUB_BASIC_WMS_GET_ALL_WINDOW_LAYOUT_INFO_0200
     * @tc.desc   test_getAllWindowLayoutInfo_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getAllWindowLayoutInfo_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_getAllWindowLayoutInfo_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        let displayId = mainWindow.getWindowProperties().displayId;
        let promise = window.getAllWindowLayoutInfo(displayId)
        promise.then((data) => {
          console.info(`${caseName} :Succeeded in obtaining all window layout info. Data: ` + JSON.stringify(data));
          console.info(`${caseName} :Succeeded in obtaining all window layout info. Data windowRect: ` + JSON.stringify(data[0].windowRect));
          expect(data.length).assertLargerOrEqual(1);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to obtain all window layout info. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            expect(err.message!=null).assertTrue();
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();

      }

    });
  
        /**
         * @tc.name   testGetWindowDensityInfo
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0100
         * @tc.desc   getWindowDensityInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetWindowDensityInfo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName: string = 'test_testGetWindowDensityInfo';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowClass = await windowStage.getMainWindow();
        try {
            let densityInfo: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo: `, JSON.stringify(densityInfo));
            expect(densityInfo.systemDensity).assertEqual(densityInfo.customDensity);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:getWindowDensityInfo`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensityParamCheck
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0200
         * @tc.desc   getWindowDensityInfo, DPI-1 getWindowDensityInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetCustomDensityParamCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowClass = await windowStage.getMainWindow();
        try {
            let densityInfo1: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            windowStage.setCustomDensity(-1);
            console.info(msgStr + `setCustomDensity -1 success`);
            let densityInfo2: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo2.systemDensity).assertEqual(densityInfo2.customDensity)
            expect(densityInfo1.customDensity).assertEqual(densityInfo2.customDensity)
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensityParamCheck1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0300
         * @tc.desc   有效左边界校验
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSetCustomDensityParamCheck1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck1';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            windowStage.setCustomDensity(0.5);
            console.info(msgStr + `setCustomDensity 0.5 success`);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensityParamCheck2
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0400
         * @tc.desc   effective right boundary
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSetCustomDensityParamCheck2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck2';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            windowStage.setCustomDensity(4.0);
            console.info(msgStr + `setCustomDensity 4.0 success`);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensityParamCheck5
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0500
         * @tc.desc   testGetWindowDensityInfo with aruguments null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetCustomDensityParamCheck5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck5';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            windowStage.setCustomDensity(null);
            console.info(msgStr + `setCustomDensity null`);
            expect().assertFail();
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(exception.code).assertEqual(401);
            expect(exception.message!=null).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensityParamCheck6
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0600
         * @tc.desc   testGetWindowDensityInfo with arguments undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetCustomDensityParamCheck6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck6';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            windowStage.setCustomDensity(undefined);
            console.info(msgStr + `setCustomDensity undefined`);
            expect().assertFail();
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(exception.code).assertEqual(401);
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensity
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0700
         * @tc.desc   new ability set dpi
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetCustomDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_SetCustomDensity';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let want: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity1'
        };
        try {
            await context.startAbility(want);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context1 = AppStorage.get('context1') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
        let windowStage1 = AppStorage.get('windowStage1') as ohosWindow.WindowStage;
        let windowClass1 = await windowStage1.getMainWindow();
        try {
            let densityInfo1: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            expect(densityInfo1.systemDensity).assertLarger(-2);
            expect(densityInfo1.defaultDensity).assertLarger(-2);
            expect(densityInfo1.systemDensity).assertEqual(densityInfo1.customDensity);
            windowStage1.setCustomDensity(4.0);
            console.info(msgStr + `setCustomDensity 4.0 success`);
            let densityInfo2: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo2.customDensity).assertEqual(4);
            expect(densityInfo1.customDensity != densityInfo2.customDensity).assertTrue();
            await context1.terminateSelf();
            await sleep(500);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context1.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensity1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0800
         * @tc.desc   new abilty setDefaultDensityEnabled true
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetCustomDensity1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_SetCustomDensity1';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let want: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity2'
        };
        try {
            await context.startAbility(want);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context2 = AppStorage.get('context2') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context2: ' + JSON.stringify(context2));
        let windowStage2 = AppStorage.get('windowStage2') as ohosWindow.WindowStage;
        let windowClass2 = await windowStage2.getMainWindow();
        try {
            let densityInfo0: window.WindowDensityInfo = windowClass2.getWindowDensityInfo();
            // density取值范围应 大于0 小于等于4，超出该范围报401
            let newDen = (Math.round(densityInfo0.customDensity) + 1) % 4 + 1
            windowStage2.setCustomDensity(newDen);
            console.info(msgStr + `setCustomDensity 3.0 success`);
            let densityInfo1: window.WindowDensityInfo = windowClass2.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            expect(densityInfo1.customDensity).assertEqual(newDen);
            windowStage2.setDefaultDensityEnabled(true);
            console.info(msgStr +`setDefaultDensityEnabled true Success`);
            let densityInfo2: window.WindowDensityInfo = windowClass2.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo2.customDensity).assertEqual(densityInfo2.defaultDensity);
            expect(densityInfo2.customDensity != newDen).assertTrue();
            await context2.terminateSelf();
            await sleep(500);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context2.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensity2
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0900
         * @tc.desc   new abilty setDefaultDensityEnabled false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetCustomDensity2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_SetCustomDensity2';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let want: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity1'
        };
        try {
            await context.startAbility(want);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context1 = AppStorage.get('context1') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
        let windowStage1 = AppStorage.get('windowStage1') as ohosWindow.WindowStage;
        let windowClass1 = await windowStage1.getMainWindow();
        try {
            windowStage1.setCustomDensity(2.0);
            console.info(msgStr + `setCustomDensity 2.0 success`);
            let densityInfo1: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            expect(densityInfo1.customDensity).assertEqual(2);
            windowStage1.setDefaultDensityEnabled(false);
            console.info(msgStr +`setDefaultDensityEnabled false Success`);
            let densityInfo2: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo2.customDensity).assertEqual(2);
            await context1.terminateSelf();
            await sleep(500);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context1.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testSetCustomDensity3
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_1000
         * @tc.desc   multi ability,set ability with diffrent dpi
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetCustomDensity3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_SetCustomDensity3';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let want1: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity1'
        };
        let want2: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity2'
        };
        try {
            await context.startAbility(want2);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context1:common.UIAbilityContext | undefined;
        let context2 = AppStorage.get('context2') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
        console.log(msgStr +'windowTest context2: ' + JSON.stringify(context2));
        let windowStage2 = AppStorage.get('windowStage2') as ohosWindow.WindowStage;
        let windowClass2 = await windowStage2.getMainWindow();
        try {
            windowStage2.setCustomDensity(3.5);
            console.info(msgStr + `setCustomDensity 3.5 success`);
            let densityInfo1: window.WindowDensityInfo = windowClass2.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            await context2.terminateSelf();
            await sleep(500);
            try {
            await context.startAbility(want1);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
            } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
            }
            context1 = AppStorage.get('context1') as common.UIAbilityContext;
            console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
            let windowStage1 = AppStorage.get('windowStage1') as ohosWindow.WindowStage;
            let windowClass1 = await windowStage1.getMainWindow();
            windowStage1.setCustomDensity(2.5);
            console.info(msgStr + `setCustomDensity 2.5 success`);
            let densityInfo2: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo1.customDensity).assertEqual(3.5);
            expect(densityInfo2.customDensity).assertEqual(2.5);
            await context1.terminateSelf();
            await sleep(500);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context1?.terminateSelf();
            await sleep(500);
            await context2.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testOnSetCustomDensity
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_1100
         * @tc.desc   on systemDensityChange
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testOnSetCustomDensity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_testOnSetCustomDensity';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowClass = await windowStage.getMainWindow();
        let want: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity1'
        };
        let g_flag: number = 0
        let callback1: Callback<number> = async (data) => {
            console.info(msgStr +`on_systemDensityChange callback1 data: ${data}`);
            g_flag += 1
            expect(data).assertEqual(2);
        }
        let callback2: Callback<number> = async (data) => {
            console.info(msgStr +`on_systemDensityChange callback2 data: ${data}`);
            g_flag += 1
            expect(data).assertEqual(2);
        }
        try {
            windowClass.on("systemDensityChange", callback1);
            windowClass.on("systemDensityChange", callback2);
            console.info(msgStr +`Succeeded on systemDensityChange twice.`);
        } catch (exception) {
            console.error(msgStr +
            `Failed to on systemDensityChange. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:on_systemDensityChange`);
            expect(exception.message!=null).assertTrue();
            done();
            return;
            } else {
            expect(false).assertTrue();
            done();
            return;
            }
        }
        try {
            await context.startAbility(want);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context1 = AppStorage.get('context1') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
        let windowStage1 = AppStorage.get('windowStage1') as ohosWindow.WindowStage;
        try {
            windowStage1.setCustomDensity(2);
            console.info(msgStr + `setCustomDensity 2 success`);
            await sleep(1000);
            windowClass.off("systemDensityChange");
            console.info(msgStr + `off all systemDensityChange success`);
            await context1.terminateSelf();
            await sleep(500);
            expect(g_flag).assertEqual(0);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context1.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            expect(exception.message!=null).assertTrue();
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
         * @tc.name   testOnSetCustomDensity1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_1200
         * @tc.desc   off systemDensityChange event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testOnSetCustomDensity1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'test_testOnSetCustomDensity1';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowClass = await windowStage.getMainWindow();
        let callback1: Callback<number> = async (data) => {
            console.info(msgStr +`on_systemDensityChange callback1 data: ${data}`);
        }
        let callback2: Callback<number> = async (data) => {
            console.info(msgStr +`on_systemDensityChange callback2 data: ${data}`);
        }
        try {
            windowClass.on("systemDensityChange", callback1);
            windowClass.on("systemDensityChange", callback2);
            console.info(msgStr +`Succeeded on systemDensityChange twice.`);
            windowClass.off("systemDensityChange");
            console.info(msgStr +`Succeeded off all systemDensityChange.`);
        } catch (exception) {
            console.error(msgStr +
            `Failed to on systemDensityChange. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:on_systemDensityChange`);
            expect(exception.message!=null).assertTrue();
            done();
            return;
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        done();
        });
        /**
         * @tc.name   testSetGestureBackEnabledTrue
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8000
         * @tc.desc   Set whether to disable the gesture back function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSetGestureBackEnabledTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledTrue';
            let windowClass = windowStage.getMainWindowSync();
            windowClass.setGestureBackEnabled(true).then(() => {
                console.info(`${caseName} Succeeded in setting gesture back enabled true.`);
                const isGestureBackEnabled = windowClass.isGestureBackEnabled();
                console.info(`${caseName} Succeeded in getting gesture back enabled. Data: ${isGestureBackEnabled}`);
                expect(isGestureBackEnabled).assertTrue();
                done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled`);
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            });
        })
        /**
         * @tc.name   testSetGestureBackEnabledFalse
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8100
         * @tc.desc   Set whether to disable the gesture back function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSetGestureBackEnabledFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledFalse';
            let windowClass = windowStage.getMainWindowSync();
            windowClass.setGestureBackEnabled(false).then(async () => {
                console.info(`${caseName} Succeeded in setting gesture back enabled false.`);
                const isGestureBackEnabled = windowClass.isGestureBackEnabled();
                console.info(`${caseName} Succeeded in getting gesture back enabled. Data: ${isGestureBackEnabled}`);
                expect(isGestureBackEnabled).assertFalse();
                done();
            }).catch((err: BusinessError) => {
              console.error(`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled`);
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            });
        })
        /**
         * @tc.name   testSetGestureBackEnabledInSubWindow
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8200
         * @tc.desc   Set whether to disable the gesture back function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetGestureBackEnabledInSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledInSubWindow';
            let subWindowClass = await windowStage.createSubWindow('subWindow');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('testability/pages/First/index2');
            console.info(`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            console.info(`${caseName} Succeeded in showing the sub window.`);
            subWindowClass.setGestureBackEnabled(true).then(() => {
                console.info(`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    await subWindowClass.destroyWindow();
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName} Unauthorized operation.`);
                    expect(err.code).assertEqual(1300004);
                    expect(err.message!=null).assertTrue();
                    await subWindowClass.destroyWindow();
                    done();
                }
            });
        })
        /**
         * @tc.name   testSetGestureBackEnabledInSysSubWindow
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8300
         * @tc.desc   Set whether to disable the gesture back function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetGestureBackEnabledInSysSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledInSysSubWindow';
            let config: window.Configuration = {
                name: "systemWindow",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context
            };
            let subWindowClass = await window.createWindow(config);
            console.info(`${caseName} Succeeded in creating the system sub window.`);
            await subWindowClass.setUIContent('testability/pages/First/index2');
            console.info(`${caseName} Succeeded in loading the system sub window content.`);
            await subWindowClass.showWindow();
            console.info(`${caseName} Succeeded in showing the system sub window.`);
            subWindowClass.setGestureBackEnabled(true).then(() => {
                console.info(`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    await subWindowClass.destroyWindow();
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName} Unauthorized operation.`);
                    expect(err.code).assertEqual(1300004);
                    await subWindowClass.destroyWindow();
                    expect(err.message!=null).assertTrue();
                    done();
                }
            });
        })
        /**
         * @tc.name   testSetGestureBackEnabledInDestroyWindow
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8400
         * @tc.desc   Set whether to disable the gesture back function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetGestureBackEnabledInDestroyWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledInDestroyWindow';
            let subWindowClass = await windowStage.createSubWindow('subWindow');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('testability/pages/First/index2');
            console.info(`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            console.info(`${caseName} Succeeded in showing the sub window.`);
            await subWindowClass.destroyWindow();
            subWindowClass.setGestureBackEnabled(true).then(() => {
                console.info(`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    expect(err.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName} This window state is abnormal.`);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done();
                }
            });
        })
        /**
         * @tc.name   testGetGestureBackEnabledInSubWindow
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8500
         * @tc.desc   get whether to disable the gesture back function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetGestureBackEnabledInSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetGestureBackEnabledInSubWindow';
            let subWindowClass = await windowStage.createSubWindow('subWindow');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            try {
                await subWindowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the sub window content.`);
                await subWindowClass.showWindow();
                console.info(`${caseName} Succeeded in showing the sub window.`);
                subWindowClass.isGestureBackEnabled();
                expect(false).assertTrue();
                done();
            } catch (exception) {
              console.error(`${caseName} Failed to set gesture back enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    console.info(`${caseName} The current device type does not support to getGestureBackEnabled.`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName} Unauthorized operation.`);
                    expect(exception.code).assertEqual(1300004);
                    expect(exception.message!=null).assertTrue();
                    await subWindowClass.destroyWindow();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetWindowPropertiesInMainWindow
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8600
         * @tc.desc   get the current window properties
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testGetWindowPropertiesInMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
            let caseName = 'TestGetWindowPropertiesInMainWindow';
            try {
                let windowClass = windowStage.getMainWindowSync();
                let properties = windowClass.getWindowProperties();
                console.info(`${caseName} Succeeded get window proerties`);
                expect(properties !== null).assertTrue();
                done();
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testGetWindowPropertiesInSubWindow
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8700
         * @tc.desc   get the current window properties
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetWindowPropertiesInSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
            let caseName = 'TestGetWindowPropertiesInSubWindow';
            try {
                windowStage.createSubWindow('subWindow').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subWindow. Data:` + JSON.stringify(data));
                    let properties = data.getWindowProperties();
                    console.info(`${caseName} Succeeded get window proerties`);
                    expect(properties !== null).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName}: Failed to create the Window. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName}: Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.name   testSetWindowGrayScale0
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0300
         * @tc.desc   test setWindowGrayScale
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testSetWindowGrayScale0", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestSetWindowGrayScale0";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(0).then(() => {
                    console.info(`${caseName}: Succeeded in setting the grayScale 0.`);
                    done();
                }).catch((err: BusinessError) => {
                  console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        console.info(`${caseName}: 此设备不支持setWindowGrayScale能力.`);
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        console.error(`${caseName}: Failed to set the grayScale 0. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Error ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowGrayScale0.5
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0400
         * @tc.desc   test setWindowGrayScale
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testSetWindowGrayScale0.5", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestSetWindowGrayScale0.5";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(0.5).then(() => {
                    console.info(`${caseName}: Succeeded in setting the grayScale 0.5.`);
                    done();
                }).catch((err: BusinessError) => {
                  console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        console.info(`${caseName} 此设备不支持setWindowGrayScale能力.`);
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        console.error(`${caseName} Failed to set the grayScale 0.5. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Error ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowGrayScale1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0500
         * @tc.desc   test setWindowGrayScale
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testSetWindowGrayScale1",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestSetWindowGrayScale1";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(1).then(() => {
                    console.info(`${caseName} Succeeded in setting the grayScale 1.`);
                    done();
                }).catch((err: BusinessError) => {
                  console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        console.info(`${caseName} 此设备不支持setWindowGrayScale能力.`);
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        console.error(`${caseName} Failed to set the grayScale 1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Error ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowGrayScaleNegative1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0600
         * @tc.desc   test setWindowGrayScale
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testSetWindowGrayScaleNegative1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestSetWindowGrayScaleNegative1";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(-1).then(() => {
                    console.info(`${caseName}: Succeeded in setting the grayScale -1.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                  console.error(`${caseName} Failed to set the grayScale -1. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        console.info(`${caseName} 此设备不支持setWindowGrayScale能力.`);
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Parameter Error ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })
        /**
         * @tc.name   testSetWindowGrayScale2
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0700
         * @tc.desc   test setWindowGrayScale
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testSetWindowGrayScale2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestSetWindowGrayScale2";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(2).then(() => {
                    console.info(`${caseName}: Succeeded in setting the grayScale 2.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                  console.error(`${caseName}: Failed to set the grayScale 2. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code == 801) {
                        console.info(`${caseName}: 此设备不支持setWindowGrayScale能力.`);
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        console.error(`${caseName}: Failed to set the grayScale 2. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Parameter ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })
        /**
         * @tc.name   testSubWindowSetWindowGrayScale1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0800
         * @tc.desc   test subWindow setWindowGrayScale
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testSubWindowSetWindowGrayScale1",TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestSubWindowSetWindowGrayScale1";
            try {
                windowStage.createSubWindow('TestSubWindowSetWindowGrayScale1').then(async (data) => {
                    console.info(`${caseName}: Succeeded in creating the subwindow. Data: ${JSON.stringify(data)}`);
                    let subWindowClass = data;
                    await subWindowClass.setUIContent('testability/pages/First/index2')
                    console.info(`${caseName}: Succeeded in setUiContent.`);
                    subWindowClass.setWindowGrayScale(1).then(() => {
                        console.info(`${caseName}: Succeeded in setting the grayScale 1.`);
                        done();
                    }).catch((err: BusinessError) => {
                      console.error(`${caseName}: Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
                        if (err.code == 801) {
                            console.info(`${caseName}: 此设备不支持setWindowGrayScale能力.`);
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            
                            expect().assertFail();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.log(`${caseName}: Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(`${caseName}: Failed to setWindowGrayScale ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testOnRectChangeOptionsResizeSubWindow
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0900
         * @tc.desc   Test the function value of testRectChangeOptions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testOnRectChangeOptionsResizeSubWindow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestOnRectChangeOptionsResizeSubWindow";
            try {
                let subWindowClass = await windowStage.createSubWindow("subwindow");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                await sleep(1000);
                subWindowClass.on('windowSizeChange', async (data) => {
                    console.info(`${caseName} Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    expect(data.width).assertEqual(500);
                    expect(data.height).assertEqual(500);
                    subWindowClass.off('windowSizeChange');
                    await subWindowClass.destroyWindow();
                    done();
                });
                await subWindowClass.resize(500, 500);
                console.info(`${caseName} Succeeded in changing the sub window size.`);
            } catch (error) {
                console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testOnRectChangeOptionsResizeMainWindow
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1000
         * @tc.desc   Test the function value of testRectChangeOptions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testOnRectChangeOptionsResizeMainWindow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestOnRectChangeOptionsResizeMainWindow";
            let windowClass = windowStage.getMainWindowSync();
            try {
              let mainWidth = Number(windowClass.getWindowLimits().minWidth);
              let mainHeight = Number(windowClass.getWindowLimits().minHeight);
              console.info(`${caseName} Succeeded getWindowLimits. Data:mainWidth: ${JSON.stringify(mainWidth)},mainHeight:${JSON.stringify(mainHeight)}`);
                windowClass.on('windowSizeChange', async (data) => {
                    console.info(`${caseName} Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    expect(data.width).assertEqual(mainWidth+800);
                    expect(data.height).assertEqual(mainHeight+300);
                    windowClass.off('windowSizeChange');
                    done();
                });
                await windowClass.resize(mainWidth+800, mainHeight+300);
                console.info(`${caseName} Succeeded in changing the window size.`);
            } catch (error) {
              console.log(`${caseName}: . Cause code: ${error.code}, message: ${error.message}`);
                if (error.code == 1300002) {
                  expect(error.message!=null).assertTrue();
                    try {
                        const windowStatus = windowClass.getWindowStatus();
                        console.info(`${caseName} This window state is: ${windowStatus}. full-screen is not to support resize`);
                        windowClass.off('windowSizeChange');
                        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                        done();
                    } catch (error) {
                        if (error.code === 801) {
                            console.info(`${caseName} The current device type does not support to getWindowStatus`);
                            expect(error.message!=null).assertTrue();
                            windowClass.off('windowSizeChange');
                            done();
                        } else {
                            console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                            windowClass.off('windowSizeChange');
                            expect().assertFail();
                            done();
                        }
                    }
                }else if(error.code == 801) {
                  done();
                }else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    windowClass.off('windowSizeChange');
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testOnRectChangeOptionsMove
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1100
         * @tc.desc   Test the function value of testRectChangeOptions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testOnRectChangeOptionsMove", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestOnRectChangeOptionsMove";
            try {
                let subWindowClass = await windowStage.createSubWindow("TestOnRectChangeOptionsMove");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                await sleep(1000);
                subWindowClass.on('windowRectChange', async (data) => {
                    console.info(`${caseName}: Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    expect(data.rect.left).assertEqual(300);
                    expect(data.rect.top).assertEqual(300);
                    subWindowClass.off('windowRectChange');
                    await subWindowClass.destroyWindow();
                    done();
                });
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
            } catch (error) {
              console.log(`${caseName}:failed . Cause code: ${error.code}, message: ${error.message}`);
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testOffRectChangeOptions
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1200
         * @tc.desc   Test the function value of testRectChangeOptions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testOffRectChangeOptions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestOffRectChangeOptions";
            try {
                let subWindowClass = await windowStage.createSubWindow("subwindow");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                let count = 0;
                let callback = () => {
                    console.info(`${caseName}: Succeeded listen window rect changes.`);
                    count++;
                }
                subWindowClass.on('windowRectChange', callback);
                subWindowClass.off('windowRectChange');
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
                expect(count).assertEqual(0);
                await subWindowClass.destroyWindow();
                done();
            } catch (error) {
              console.log(`${caseName}:failed . Cause code: ${error.code}, message: ${error.message}`);
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testOffOneRectChangeOptions
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1300
         * @tc.desc   Test the function value of testRectChangeOptions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testOffOneRectChangeOptions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestOffOneRectChangeOptions";
            try {
                let subWindowClass = await windowStage.createSubWindow("TestOffOneRectChangeOptions");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                let count1 = 0;
                let count2 = 0;
                let callback1 = () => {
                    console.info(`${caseName}: callback1 Succeeded listen window rect changes.`);
                    count1++;
                }
                let callback2 = () => {
                    console.info(`${caseName}: callback2 Succeeded listen window rect changes.`);
                    count2++;
                }
                subWindowClass.on('windowRectChange', callback1);
                subWindowClass.on('windowRectChange', callback2);
                subWindowClass.off('windowRectChange', callback1);
                await sleep(1000);
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
                expect(count1).assertEqual(0);
                expect(count2).assertLarger(0);
                subWindowClass.off('windowRectChange', callback2);
                await subWindowClass.destroyWindow();
                done();
            } catch (error) {
              console.log(`${caseName}:failed . Cause code: ${error.code}, message: ${error.message}`);
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testOnTwoRectChangeOptions
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1400
         * @tc.desc   Test the function value of testRectChangeOptions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testOnTwoRectChangeOptions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestOnTwoRectChangeOptions";
            try {
                let subWindowClass = await windowStage.createSubWindow("subwindow");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                let count1 = 0;
                let count2 = 0;
                let callback1 = () => {
                    console.info(`${caseName}: callback1 Succeeded listen window rect changes.`);
                    count1++;
                }
                let callback2 = () => {
                    console.info(`${caseName}: callback2 Succeeded listen window rect changes.`);
                    count2++;
                }
                subWindowClass.on('windowRectChange', callback1);
                subWindowClass.on('windowRectChange', callback2);
                await sleep(1000);
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
                expect(count1).assertLarger(0);
                expect(count2).assertLarger(0);
                subWindowClass.off('windowRectChange');
                await subWindowClass.destroyWindow();
                done();
            } catch (error) {
              console.log(`${caseName}:failed . Cause code: ${error.code}, message: ${error.message}`);
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testOffTwoRectChangeOptions
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1500
         * @tc.desc   Test the function value of testRectChangeOptions
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("testOffTwoRectChangeOptions", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = "TestOffTwoRectChangeOptions";
            try {
                let subWindowClass = await windowStage.createSubWindow("subwindow");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                let count1 = 0;
                let count2 = 0;
                let callback1 = () => {
                    console.info(`${caseName}: callback1 Succeeded listen window rect changes.`);
                    count1++;
                }
                let callback2 = () => {
                    console.info(`${caseName}: callback2 Succeeded listen window rect changes.`);
                    count2++;
                }
                subWindowClass.on('windowRectChange', callback1);
                subWindowClass.on('windowRectChange', callback2);
                subWindowClass.off('windowRectChange');
                await sleep(1000);
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
                expect(count1).assertEqual(0);
                expect(count2).assertEqual(0);
                await subWindowClass.destroyWindow();
                done();
            } catch (error) {
              console.log(`${caseName}:failed . Cause code: ${error.code}, message: ${error.message}`);
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    expect(error.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testIsSubWindowSupportWideGamutCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1600
         * @tc.desc   Check whether the subwindow supports the wide color gamut mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testIsSubWindowSupportWideGamutCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestIsSubWindowSupportWideGamutCallback';
            try {
                windowStage.createSubWindow('SubWindow1').then((data) => {
                    let subWindowClass = data;
                    console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
                    subWindowClass.isWindowSupportWideGamut(async (err: BusinessError, data) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to check whether the window support WideGamut. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in checking whether the window support WideGamut Data: ` + JSON.stringify(data));
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testIsSubWindowSupportWideGamutPromise
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1700
         * @tc.desc   Check whether the subwindow supports the wide color gamut mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testIsSubWindowSupportWideGamutPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestIsSubWindowSupportWideGamutPromise';
            try {
                windowStage.createSubWindow('SubWindow2').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.isWindowSupportWideGamut().then(async (data) => {
                        console.info(`${caseName} Succeeded in checking whether the window support WideGamut. Data: ` + JSON.stringify(data));
                        await subWindowClass.destroyWindow();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(`${caseName} Failed to check whether the window support WideGamut. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testIsMainWindowSupportWideGamutCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1800
         * @tc.desc   Check whether the mainWindow supports the wide color gamut mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testIsMainWindowSupportWideGamutCallback',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestIsMainWindowSupportWideGamutCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.isWindowSupportWideGamut((err: BusinessError, data) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to check whether the window support WideGamut. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in checking whether the window support WideGamut Data: ` + JSON.stringify(data));
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Failed to get the window. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testIsMainWindowSupportWideGamutPromise
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1900
         * @tc.desc   Check whether the mainWindow supports the wide color gamut mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testIsMainWindowSupportWideGamutPromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestIsMainWindowSupportWideGamutPromise';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.isWindowSupportWideGamut().then((data) => {
                    console.info(`${caseName} Succeeded in checking whether the window support WideGamut. Data: ` + JSON.stringify(data));
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to check whether the window support WideGamut. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetMainWindowColorSpaceDefaultCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2000
         * @tc.desc   set window colorSpace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetMainWindowColorSpaceDefaultCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetMainWindowColorSpaceDefaultCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowColorSpace(window.ColorSpace.DEFAULT, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set window colorspace. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting window colorspace default.`);
                        let colorSpace = windowClass.getWindowColorSpace();
                        console.info(`${caseName} This window get window color space is: ${colorSpace}`);
                        expect(colorSpace).assertEqual(window.ColorSpace.DEFAULT);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowColorSpaceDefaultCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2100
         * @tc.desc   set window colorSpace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowColorSpaceDefaultCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetSubWindowColorSpaceDefaultCallback';
            try {
                windowStage.createSubWindow('SubWindow3').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowColorSpace(window.ColorSpace.DEFAULT, async (err: BusinessError) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to set window colorspace. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in setting window colorspace default.`);
                            let colorSpace = subWindowClass.getWindowColorSpace();
                            console.info(`${caseName} This window get window color space is: ${colorSpace}`);
                            expect(colorSpace).assertEqual(window.ColorSpace.DEFAULT);
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetMainWindowColorSpaceWideGamutPromise
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2200
         * @tc.desc   set window colorSpace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetMainWindowColorSpaceWideGamutPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetMainWindowColorSpaceDefaultPromise';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowColorSpace(window.ColorSpace.WIDE_GAMUT).then(() => {
                    console.info(`${caseName}: Succeeded in setting window colorspace WIDE_GAMUT.`);
                    let colorSpace = windowClass.getWindowColorSpace();
                    console.info(`${caseName} This window get window color space is: ${colorSpace}`);
                    expect(colorSpace).assertEqual(window.ColorSpace.WIDE_GAMUT);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName}: Failed to set window colorspace. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowColorSpaceWideGamutCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2300
         * @tc.desc   set window colorSpace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowColorSpaceWideGamutCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetSubWindowColorSpaceWideGamutCallback';
            try {
                windowStage.createSubWindow('SubWindow4').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowColorSpace(window.ColorSpace.WIDE_GAMUT, async (err: BusinessError) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to set window colorspace. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in setting window colorspace WIDE_GAMUT.`);
                            let colorSpace = subWindowClass.getWindowColorSpace();
                            console.info(`${caseName} This window get window color space is: ${colorSpace}`);
                            expect(colorSpace).assertEqual(window.ColorSpace.WIDE_GAMUT);
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to set window colorspace. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetMainWindowBackgroundColor
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2400
         * @tc.desc   set main window colorSpace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetMainWindowBackgroundColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetMainWindowBackgroundColor';
            try {
                let windowClass = windowStage.getMainWindowSync();
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName}: Succeeded in setUiContent.`);
                windowClass.setWindowBackgroundColor('#00ff33');
                console.info(`${caseName}: Succeeded in setting window background color.`);
                done();
            } catch (exception) {
                console.error(`${caseName} Failed. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowBackgroundColor
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2500
         * @tc.desc   set sub window colorSpace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowBackgroundColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
            let caseName = 'TestSetSubWindowBackgroundColor';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowStage.createSubWindow('SubWindow5').then(async (data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ${JSON.stringify(data)}`);
                    let subWindowClass = data;
                    await subWindowClass.setUIContent('testability/pages/First/index2');
                    console.info(`${caseName}: Succeeded in setUiContent.`);
                    windowClass.setWindowBackgroundColor('#00ff33');
                    console.info(`${caseName}: Succeeded in setting window background color.`);
                    await subWindowClass.destroyWindow();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to set window colorspace. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowBackgroundColorNoUIContent
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2600
         * @tc.desc   set sub window colorSpace no set UIContent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowBackgroundColorNoUIContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetSubWindowBackgroundColorNoUIContent';
            try {
                let subWindowClass = await windowStage.createSubWindow('SubWindow6');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                subWindowClass.setWindowBackgroundColor('#00ff33');
                console.info(`${caseName}: Succeeded in setting sub window background color.`);
                expect(false).assertTrue();
                done();
            } catch (exception) {
                console.error(`${caseName} Failed to set sub window colorspace. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(1300002);
                expect(exception.message!=null).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessCallbackNegative2
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2700
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessCallbackNegative2',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallbackNegative2';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(-2, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness -2 Parameter error. Cause code: ${err.code}, message: ${err.message}`);
                        expect(errCode).assertEqual(401);
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness -2.`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessCallback1.5
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2800
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessCallback1.5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallback1.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(1.5, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness 1.5. Cause code: ${err.code}, message: ${err.message}`);
                        expect(errCode).assertEqual(401);
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness 1.5.`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessCallback0
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2900
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessCallback0',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallback0';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(0, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness 0. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness 0.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessCallback0.5
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3000
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessCallback0.5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallback0.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(0.5, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness 0.5. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness 0.5.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessCallback1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3100
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessCallback1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'testSetWindowBrightnessCallback1';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(1, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness 1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness 1.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessCallbackDefault
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3200
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessCallbackDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallbackDefault';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(-1, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness -1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness -1.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessPromiseNegative1.5
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3300
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessPromiseNegative1.5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromise_1.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(-1.5).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness -1.5.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} Set the brightness -1.5 Parameter error. Cause code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(401);
                    expect(err.message!=null).assertTrue();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessPromise1.5
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3400
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessPromise1.5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromise1.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(1.5).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness 1.5.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                  console.info(`${caseName} Set the brightness 1.5 Parameter error. Cause code: ${err.code}, message: ${err.message}`)
                    if (err.code === 401) {
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        console.error(`${caseName} Failed to set the brightness 1.5. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessPromise0
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3500
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessPromise0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromise_0';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(0).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness 0.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to set the brightness 0. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessPromise0.5
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3600
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessPromise0.5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromise_0.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(0.5).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness 0.5.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to set the brightness 0.5. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessPromise1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3700
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessPromise1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'testSetWindowBrightnessPromise1';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(1).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness 1.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to set the brightness 1. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowBrightnessPromiseNegative1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3800
         * @tc.desc   set window brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowBrightnessPromiseNegative1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromiseNegative1';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(-1).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness -1.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to set the brightness -1. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowBrightnessPromiseNegative1
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3900
         * @tc.desc   set subwindow brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowBrightnessPromiseNegative1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
            let caseName = 'TestSetSubWindowBrightnessPromiseNegative1';
            try {
                windowStage.createSubWindow('subWindow6').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowBrightness(-1).then(async () => {
                        console.info(`${caseName} Succeeded in setting the brightness -1.`);
                        await subWindowClass.destroyWindow();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(`${caseName} Failed to set the brightness -1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowBrightnessPromiseNegative2
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4000
         * @tc.desc   set subwindow brightness
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowBrightnessPromiseNegative2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
            let caseName = 'TestSetSubWindowBrightnessPromiseNegative2';
            try {
                windowStage.createSubWindow('subWindow7').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowBrightness(-2).then(() => {
                        console.info(`${caseName} Succeeded in setting the brightness -2.`);
                        expect(false).assertTrue();
                        done();
                    }).catch(async (err: BusinessError) => {
                        console.error(`${caseName} Failed to set the brightness -2. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        await subWindowClass.destroyWindow();
                        done();
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowKeepScreenOnCallbackFalse
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4100
         * @tc.desc   set subwindow screen to be always on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowKeepScreenOnCallbackFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
            let caseName = 'TestSetSubWindowKeepScreenOnCallbackFalse';
            try {
                windowStage.createSubWindow('subWindow8').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowKeepScreenOn(false, async (err: BusinessError) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowKeepScreenOnCallbackTrue
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4200
         * @tc.desc   set subwindow screen to be always on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowKeepScreenOnCallbackTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
            let caseName = 'TestSetSubWindowKeepScreenOnCallbackTrue';
            try {
                windowStage.createSubWindow('subWindow9').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    data.setWindowKeepScreenOn(true, async (err: BusinessError) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowKeepScreenOnCallbackFalse
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4300
         * @tc.desc   set window screen to be always on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowKeepScreenOnCallbackFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowKeepScreenOnCallbackFalse';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowKeepScreenOn(false, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowKeepScreenOnCallbackTrue
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4400
         * @tc.desc   set window screen to be always on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowKeepScreenOnCallbackTrue',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowKeepScreenOnCallbackTrue';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowKeepScreenOn(true, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowKeepScreenOnPromiseTrue
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4500
         * @tc.desc   set window screen to be always on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowKeepScreenOnPromiseTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowKeepScreenOnPromiseTrue';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowKeepScreenOn(true).then(() => {
                    console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowKeepScreenOnPromiseFalse
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4600
         * @tc.desc   set window screen to be always on
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowKeepScreenOnPromiseFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowKeepScreenOnPromiseFalse';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowKeepScreenOn(false).then(() => {
                    console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowPrivacyModeTrue
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4700
         * @tc.desc   set subwindow screen to be privacy mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowPrivacyModeTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetSubWindowPrivacyModeTrue';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow10');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setWindowPrivacyMode(true, async (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                      console.error(`${caseName} Failed to set the subwindow to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
                        if (errCode === 201) {
                            console.info(`${caseName} The application does not have the permission required to call the API`);
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in setting the subwindow to privacy mode..`);
                        await subWindow.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowPrivacyModeFalse
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4800
         * @tc.desc   set subwindow screen to be privacy mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowPrivacyModeFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetSubWindowPrivacyModeFalse';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow11');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setWindowPrivacyMode(false, async (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                      console.error(`${caseName} Failed to set the subwindow to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
                        if (errCode === 201) {
                            console.info(`${caseName} The application does not have the permission required to call the API`);
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in setting the subwindow to privacy mode..`);
                        await subWindow.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowPrivacyModeTrue
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4900
         * @tc.desc   set window screen to be privacy mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowPrivacyModeTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowPrivacyModeTrue';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowPrivacyMode(true, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                      console.error(`${caseName} Failed to set the window to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
                        if (errCode === 201) {
                            console.info(`${caseName} The application does not have the permission required to call the API`);
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in setting the window to privacy mode..`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetWindowPrivacyModeFalse
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5000
         * @tc.desc   set window screen to be privacy mode
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetWindowPrivacyModeFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetWindowPrivacyModeFalse';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowPrivacyMode(false, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                      console.error(`${caseName} Failed to set the window to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
                        if (errCode === 201) {
                            console.info(`${caseName} The application does not have the permission required to call the API`);
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in setting the window to privacy mode..`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testWindowSnapshotCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5100
         * @tc.desc   snapshot window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowSnapshotCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestWindowSnapshotCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.snapshot((err: BusinessError, pixelMap) => {
                    const errCode: number = err.code;
                    if (errCode) {
                      console.error(`${caseName} Failed to snapshot window. Cause code: ${err.code}, message: ${err.message}`);
                        if (errCode === 1300002) {
                            console.info(`${caseName} This window state is abnormal`);
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in snapshotting window. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}`);
                        let widthBefore: number = windowClass.getWindowProperties().windowRect.width;
                        let heightBefore: number = windowClass.getWindowProperties().windowRect.height;
                        console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
                        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
                        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
                        pixelMap.release();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSubWindowSnapshotCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5200
         * @tc.desc   snapshot subwindow
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowSnapshotCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSubWindowSnapshotCallback';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow12');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.snapshot(async (err: BusinessError, pixelMap) => {
                    const errCode: number = err.code;
                    if (errCode) {
                      console.error(`${caseName} Failed to snapshot subwindow. Cause code: ${err.code}, message: ${err.message}`);
                        if (errCode === 1300002) {
                            console.info(`${caseName} This subwindow state is abnormal`);
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in snapshotting subwindow. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}`);
                        let widthBefore: number = subWindow.getWindowProperties().windowRect.width;
                        let heightBefore: number = subWindow.getWindowProperties().windowRect.height;
                        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
                        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                        expect(widthBefore).assertEqual(imageInfo.size.width);
                        expect(heightBefore).assertEqual(imageInfo.size.height);
                        pixelMap.release();
                        await subWindow.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testWindowSnapshotPromise
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5300
         * @tc.desc   snapshot window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowSnapshotPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestWindowSnapshotPromise';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.snapshot().then((pixelMap) => {
                    console.info(`${caseName} Succeeded in snapshotting window. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}`);
                    let widthBefore: number = windowClass.getWindowProperties().windowRect.width;
                    let heightBefore: number = windowClass.getWindowProperties().windowRect.height;
                    console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
                    let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                    console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                    expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
                    expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
                    pixelMap.release();
                    done();
                }).catch((err: BusinessError) => {
                  console.error(`${caseName} Failed to snapshot window. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 1300002) {
                        console.info(`${caseName} This window state is abnormal`);
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        
                        expect().assertFail();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSubWindowSnapshotPromise
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5400
         * @tc.desc   snapshot subwindow
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowSnapshotPromise',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSubWindowSnapshotPromise';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow13');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.snapshot().then(async (pixelMap) => {
                    console.info(`${caseName} Succeeded in snapshotting window. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}`);
                    let widthBefore: number = subWindow.getWindowProperties().windowRect.width;
                    let heightBefore: number = subWindow.getWindowProperties().windowRect.height;
                    console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
                    let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                    console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                    expect(widthBefore).assertEqual(imageInfo.size.width);
                    expect(heightBefore).assertEqual(imageInfo.size.height);
                    pixelMap.release();
                    await subWindow.destroyWindow();
                    done();
                }).catch((err: BusinessError) => {
                  console.error(`${caseName} Failed to snapshot window. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 1300002) {
                        console.info(`${caseName} This window state is abnormal`);
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        
                        expect().assertFail();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testWindowGetUIContext
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5500
         * @tc.desc   get window ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testWindowGetUIContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let caseName = 'TestWindowGetUIContext';
            try {
                let windowClass = windowStage.getMainWindowSync();
                let uiContext = windowClass.getUIContext();
                console.info(`${caseName} Succeeded in gettting the main window ui context. Data: ${JSON.stringify(uiContext)}`)
                expect(uiContext !== null).assertTrue();
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testSubWindowGetUIContext
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5600
         * @tc.desc   get subwindow ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowGetUIContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSubWindowGetUIContext';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow14');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                let uiContext = subWindow.getUIContext();
                console.info(`${caseName} Succeeded in gettting the subwindow ui context. Data: ${JSON.stringify(uiContext)}`)
                expect(uiContext !== null).assertTrue();
                await subWindow.destroyWindow();
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testWindowSetUIContextCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5700
         * @tc.desc   set window ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowSetUIContextCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestWindowSetUIContextCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setUIContent('testability/pages/First/index2', (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in loading the content.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testWindowSetUIContextErrorPathCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5800
         * @tc.desc   set window ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowSetUIContextErrorPathCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestWindowSetUIContextErrorPathCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setUIContent('testability/pages/First/Error', (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        expect(err.message!=null).assertTrue();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in loading the content.`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSubWindowSetUIContextCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5900
         * @tc.desc   set subwindow ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowSetUIContextCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSubWindowSetUIContextCallback';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow15');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setUIContent('testability/pages/First/index2', async (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in loading the content.`);
                        await subWindow.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSubWindowSetUIContextErrorPathCallback
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6000
         * @tc.desc   set subwindow ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowSetUIContextErrorPathCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSubWindowSetUIContextErrorPathCallback';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow16');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setUIContent('testability/pages/First/Error', async (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        expect(err.message!=null).assertTrue();
                        await subWindow.destroyWindow();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in loading the content.`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testWindowSetUIContextPromise
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6100
         * @tc.desc   set window ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowSetUIContextPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestWindowSetUIContextPromise';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setUIContent('testability/pages/First/index2').then(() => {
                    console.info(`${caseName} Succeeded in loading the content.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSubWindowSetUIContextErrorPathPromise
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6200
         * @tc.desc   set subwindow ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSubWindowSetUIContextErrorPathPromise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSubWindowSetUIContextErrorPathPromise';
            try {
                let subWindow = await windowStage.createSubWindow('subWindowError');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setUIContent('testability/pages/First/Error').then(() => {
                    console.info(`${caseName} Succeeded in loading the content.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testSetDefaultDensityEnabledTrue
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6300
         * @tc.desc   set window ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetDefaultDensityEnabledTrue',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetDefaultDensityEnabledTrue';
            try {
                windowStage.setDefaultDensityEnabled(true);
                console.info(`${caseName} Succeeded in setting default density enabled`)
                done();
            } catch (exception) {
              console.error(`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    console.info(`${caseName} The current device not support to setDefaultDensityEnabled`)
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testSetDefaultDensityEnabledFalse
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6400
         * @tc.desc   set window ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetDefaultDensityEnabledFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetDefaultDensityEnabledFalse';
            try {
                windowStage.setDefaultDensityEnabled(false);
                console.info(`${caseName} Succeeded in setting default density enabled`)
                done();
            } catch (exception) {
              console.error(`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    console.info(`${caseName} The current device not support to setDefaultDensityEnabled`)
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testSetMainWindowMask
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6500
         * @tc.desc   set window ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetMainWindowMask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetMainWindowMask';
            try {
                let windowClass = windowStage.getMainWindowSync();
                let windowMask: Array<Array<number>> = [
                    [0, 0, 0, 1, 0, 0, 0],
                    [0, 0, 1, 1, 1, 0, 0],
                    [0, 1, 1, 0, 1, 1, 0],
                    [1, 1, 0, 0, 0, 1, 1]
                ];
                await windowClass.setWindowMask(windowMask);
                console.info(`${caseName} Succeeded in setting the window mask.`);
                expect(true).assertFalse();
                done();
            } catch (exception) {
                console.error(`${caseName} Failed to set the window mask. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(1300004);
                expect(exception.message!=null).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   testSetSubWindowMask
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6600
         * @tc.desc   set window ui context
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testSetSubWindowMask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestSetSubWindowMask';
            let subWindow: window.Window | undefined;
            try {
                subWindow = await windowStage.createSubWindow('subWindowMask');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                await subWindow?.showWindow();
                let windowMask: Array<Array<number>> = [
                    [0, 0, 0, 1, 0, 0, 0],
                    [0, 0, 1, 1, 1, 0, 0],
                    [0, 1, 1, 0, 1, 1, 0],
                    [1, 1, 0, 0, 0, 1, 1]
                ];
                await subWindow?.setWindowMask(windowMask);
                console.info(`${caseName} Succeeded in setting the window mask.`);
                await subWindow?.destroyWindow();
                done();
            } catch (exception) {
                await subWindow?.destroyWindow();
                console.error(`Failed to set sub window mask. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    console.info(`${caseName} The current device not support to set sub window mask`)
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetWindowStatusInDefault
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6700
         * @tc.desc   get the window status of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetWindowStatusInDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetWindowStatusInDefault';
            try {
                let windowClass = windowStage.getMainWindowSync();
                await windowClass.setFullScreen(true);
                console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
                await sleep(1000);
                windowClass.recover().then(() => {
                    const windowStatus = windowClass.getWindowStatus();
                    console.info(`${caseName} windowStatus is: ${windowStatus}`);
                    expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
                    done();
                }).catch((err: BusinessError) => {
                    try {
                        const windowStatus = windowClass.getWindowStatus();
                        console.info(`${caseName} windowStatus is: ${windowStatus}`);
                        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                        done();
                    } catch (exception) {
                      console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                        if (exception.code == 801) {
                            console.info(`${caseName}: The current device type does not support to get window status`);
                            expect(exception.message!=null).assertTrue();
                            done();
                        } else {
                            expect().assertFail();
                            done();
                        }
                    }
                });
            } catch (exception) {
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetWindowStatusInFullScreen
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6800
         * @tc.desc   get the window status of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetWindowStatusInFullScreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetWindowStatusInFullScreen';
            try {
                let windowClass = windowStage.getMainWindowSync();
                await windowClass.setFullScreen(true);
                console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                if (isPCStatus != '' || isAutoWindow == 'true') {
                  expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
                  await windowClass.recover();
                  done();
                } else {
                  expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                  await windowClass.recover();
                  done();
                }
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetWindowStatusInMaximize
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6900
         * @tc.desc   get the window status of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetWindowStatusInMaximize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetWindowStatusInMaximize';
            try {
                let windowClass = windowStage.getMainWindowSync();
                await windowClass.maximize();
                console.info(`${caseName} Succeeded in maximizing the window.`);
                await sleep(1000);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                await windowClass.recover();
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetDialogWindowStatus
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7000
         * @tc.desc   get the window status of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDialogWindowStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetDialogWindowStatus';
            try {
                let config: window.Configuration = {
                    name: "dialog",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context
                };
                const windowClass = await window.createWindow(config);
                console.info(`${caseName} Succeeded in creating the dialog window.`);
                windowClass.setUIContent("testability/pages/First/index2");
                await windowClass.showWindow();
                await sleep(1000);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the window.`);
                await sleep(1000);
                expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetDestroyedDialogWindowStatus
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7100
         * @tc.desc   get the window status of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDestroyedDialogWindowStatus',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetDestroyedDialogWindowStatus';
            try {
                let config: window.Configuration = {
                    name: "destroyDialog",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context
                };
                const windowClass = await window.createWindow(config);
                console.info(`${caseName} Succeeded in creating the dialog window.`);
                windowClass.setUIContent("testability/pages/First/index2");
                windowClass.showWindow();
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the dialog window.`);
                await sleep(1000);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                expect(false).assertEqual(true);
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(exception.code).assertEqual(1300002);
                    expect(exception.message!=null).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetDestroyedSubWindowStatus
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7200
         * @tc.desc   get the sub window status of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDestroyedSubWindowStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetDestroyedSubWindowStatus';
            try {
                const windowClass = await windowStage.createSubWindow('subwindow');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                windowClass.setUIContent("testability/pages/First/index2");
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the sub window.`);
                await sleep(1000);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                expect(false).assertEqual(true);
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(exception.code).assertEqual(1300002);
                    expect(exception.message!=null).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetSubWindowFocused
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7300
         * @tc.desc   get the sub window focused of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetSubWindowFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetSubWindowFocused';
            try {
                const windowClass = await windowStage.createSubWindow('subwindow');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await windowClass.setUIContent("testability/pages/First/index3");
                await windowClass.showWindow();
                await sleep(1000);
                const isFocused = windowClass.isFocused();
                console.info(`${caseName} isFocused is: ${isFocused}`);
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the window.`);
                expect(isFocused).assertTrue();
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 1300002) {
                    console.error(`${caseName} This window state is abnormal.`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else if (exception.code === 801) {
                    console.error(`${caseName}: The current device type does not support: ${exception.message}.`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetDialogWindowFocused
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7400
         * @tc.desc   get the window focused of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDialogWindowFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetDialogWindowFocused';
            try {
                let config: window.Configuration = {
                    name: "dialogWindow",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context
                };
                const windowClass = await window.createWindow(config);
                console.info(`${caseName} Succeeded in creating the dialog window.`);
                windowClass.setUIContent("testability/pages/First/index3");
                await windowClass.showWindow();
                await sleep(1000);
                const isFocused = windowClass.isFocused();
                console.info(`${caseName} isFocused is: ${isFocused}`);
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the window.`);
                expect(isFocused).assertTrue();
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 1300002) {
                    console.error(`${caseName} This window state is abnormal.`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetTopSubWindowFocused
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7500
         * @tc.desc   get the top sub window focused of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetTopSubWindowFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetTopSubWindowFocused';
            let windowClass1: window.Window | undefined;
            let windowClass2: window.Window | undefined;
            try {
                windowClass1 = await windowStage.createSubWindow('subwindow1');
                console.info(`${caseName} Succeeded in creating the sub window 1.`);
                windowClass1?.setUIContent("testability/pages/First/index2");
                await windowClass1?.showWindow();
                await sleep(1000);
                windowClass2 = await windowStage.createSubWindow('subwindow2');
                console.info(`${caseName} Succeeded in creating the sub window 2.`);
                windowClass2?.setUIContent("testability/pages/First/index3");
                await windowClass2?.showWindow();
                await sleep(1000);
                const isFocused1 = windowClass1?.isFocused();
                const isFocused2 = windowClass2?.isFocused();
                console.info(`${caseName} windowClass1 isFocused is: ${isFocused1}`);
                console.info(`${caseName} windowClass2 isFocused is: ${isFocused2}`);
                expect(isFocused1).assertFalse();
                expect(isFocused2).assertTrue();
                await windowClass1?.destroyWindow();
                await windowClass2?.destroyWindow();
                done();
            } catch (exception) {
                await windowClass1?.destroyWindow();
                await windowClass2?.destroyWindow();
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.name   testGetShiftWindowFocused
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7600
         * @tc.desc   get the main window focused by shift from sub window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetShiftWindowFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetShiftWindowFocused';
            try {
                const windowClass = windowStage.getMainWindowSync();
                const subWindowClass = await windowStage.createSubWindow('subwindow');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                subWindowClass.setUIContent("testability/pages/First/index2");
                await subWindowClass.showWindow();
                await sleep(1000);
                const subWindowClassId = subWindowClass.getWindowProperties().id;
                const windowClassId = windowClass.getWindowProperties().id;
                await window.shiftAppWindowFocus(subWindowClassId, windowClassId);
                console.info('Succeeded in shifting sub window focus to main window');
                await sleep(1000);
                const windowStatus = windowClass.isFocused();
                const subWindowStatus = subWindowClass.isFocused();
                console.info(`${caseName} main window isFocused is: ${windowStatus}`);
                console.info(`${caseName} sub window isFocused is: ${subWindowStatus}`);
                await subWindowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the window.`);
                expect(windowStatus).assertTrue();
                expect(subWindowStatus).assertFalse();
                done();
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 1300002) {
                    console.error(`${caseName} This window state is abnormal.`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else if(exception.code === 801){
                    done();
                }else {
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.name   testGetDestroyedSubWindowFocused
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7700
         * @tc.desc   get the sub window focused of current window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testGetDestroyedSubWindowFocused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestGetDestroyedSubWindowFocused';
            try {
                const windowClass = await windowStage.createSubWindow('subwindow');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                windowClass.setUIContent("testability/pages/First/index2");
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the sub window.`);
                await sleep(1000);
                const isFocused = windowClass.isFocused();
                console.info(`${caseName} isFocused is: ${isFocused}`);
                expect(false).assertEqual(true);
                done();
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(1300002);
                expect(exception.message!=null).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   testmoveWindowToGlobal_401
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7800
         * @tc.desc   get the global rect.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testmoveWindowToGlobal_401',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestmoveWindowToGlobal_401';
            try {
                const windowClass = await windowStage.createSubWindow('testmoveWindowToGlobal_401');
                windowClass.moveWindowToGlobal(null, null).then(() => {
                    console.info(`${caseName} Succeeded in moving the window`);
                    let rect = windowClass.getWindowProperties().windowRect;
                    console.info(`${caseName} Get window rect: ${JSON.stringify(rect)}`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to move the window. Cause code: ${err.code}, message: ${err.message}`);
                    if(err.code == 801){
                      expect(err.message!=null).assertTrue();
                        done();
                    }else{
                        expect().assertFail();
                        done();
                    }
                    
                });
            } catch (exception) {
                console.error(`${caseName} Failed to move the window. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(401);
                expect(exception.message!=null).assertTrue();
                done();
            }
        })
    /**
     * @tc.name   testmoveWindowToGlobal_moveConfiguration
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7900
     * @tc.desc   testmoveWindowToGlobal_moveConfiguration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testmoveWindowToGlobal_moveConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testmoveWindowToGlobal_moveConfiguration';
      try {
        let moveConfiguration: window.MoveConfiguration = {
          displayId: 0
        };
        const windowClass = await windowStage.createSubWindow('testmoveWindowToGlobal_moveConfiguration');
        let promise = windowClass.moveWindowToGlobal(300, 300, moveConfiguration);
        promise.then(async () => {
          console.info(`${caseName} Succeeded in moving the window`);
          await windowClass.destroyWindow();
          expect(true).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(`Failed to move the window. Cause code: ${err.code}, message: ${err.message}`);
          await windowClass.destroyWindow();
          if(err.code == 801){
            expect(err.message!=null).assertTrue();
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${caseName} Failed to move the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })
        /**
         * @tc.name   testsetWindowLayoutFullScreen_callback_401
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_ERRORCODE_0100
         * @tc.desc   testsetWindowLayoutFullScreen_callback_401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testsetWindowLayoutFullScreen_callback_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'testsetWindowLayoutFullScreen_callback_401';
            try {
                let windowClass = windowStage.getMainWindowSync();
                 windowClass.setWindowLayoutFullScreen(null, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        expect(err.message!=null).assertTrue();
                        done();
                    }
                    console.info('Succeeded in setting the window layout to full-screen mode.');
                    expect(false).assertTrue();
                    done();
                })
    
            } catch (exception) {
                console.error(`${caseName} Failed to move the window. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(401);
                expect(exception.message!=null).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   testsetWindowLayoutFullScreen_promise_401
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_ERRORCODE_0200
         * @tc.desc   testsetWindowLayoutFullScreen_promise_401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testsetWindowLayoutFullScreen_promise_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'testsetWindowLayoutFullScreen_promise_401';
            try {
                let windowClass = windowStage.getMainWindowSync();
                 let promise = windowClass.setWindowLayoutFullScreen(null);
                promise.then(() => {
                console.info('Succeeded in setting the window layout to full-screen mode.');
                expect(false).assertTrue();
                done();
                }).catch((err: BusinessError) => {
                console.error(`Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
                })
    
            } catch (exception) {
                console.error(`${caseName} Failed to move the window. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(401);
                expect(exception.message!=null).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   testgetGlobalRect
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_DET_GLOBAL_RECT_0100
         * @tc.desc   get the global rect.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testgetGlobalRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'testgetGlobalRect';
            try {
                const windowClass = windowStage.getMainWindowSync();
                let rect = windowClass.getGlobalRect();
                console.info(`${caseName} Succeeded in getting global rect: ${JSON.stringify(rect)}`);
                expect(rect.width).assertLarger(0);
                expect(rect.height).assertLarger(0);
                done();
            } catch (exception) {
              console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    console.error(`${caseName} The current device type does not support to getting the global rect.`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect().assertFail();
                    done();
                }
            }
        })
      /**
       * @tc.name   testRestoreByMinimize
       * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_RSSTORE_0100
       * @tc.desc   After the app main window is minimized, if the Ability is not in the background state, you can restore app main window.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testRestoreByMinimize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName = 'TestRestoreByMinimize';
        try {
          let windowClass = windowStage.getMainWindowSync();
          const mainWindowstatus = windowClass.getWindowStatus();
          console.info(`${caseName} Succeeded in getting window status. Data: ${mainWindowstatus}`);
          if (isPCStatus != '') {
            windowClass.minimize().then(async () => {
              console.info(`${caseName} Succeeded in minimizing the window.`);
              await sleep(2000);
              windowClass.restore().then(async () => {
                console.info(`${caseName} Succeeded in restoring the window.`);
                await sleep(1000);
                let windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} Succeeded in getting the window status. Data: ${windowStatus}`);
                expect(windowStatus).assertEqual(mainWindowstatus);
                done();
              }).catch((err: BusinessError) => {
                console.error(`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
                if (err.code === 801) {
                  console.error(`${caseName} The current device type does not support to restore.`);
                  expect(err.message!=null).assertTrue();
                  done();
                } else {
                  expect(1300004).assertEqual(err.code);
                  expect(err.message!=null).assertTrue();
                  done();
                }
              });
            }).catch((err: BusinessError) => {
              console.error(`${caseName} Failed to minimize the window. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
          }else {
            done();
          }

        } catch (exception) {
          if (exception.code === 801) {
            console.error(`${caseName} The current device type does not support to getWindowStatus. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(exception.message!=null).assertTrue();
            done();
          } else {
            console.error(`Failed to obtain the window status of window. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
            done();
          }
        }
      })

        /**
         * @tc.name   testRestoreByMinimizeBtn
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_RSSTORE_0200
         * @tc.desc   After the app main window is minimized, if the Ability is not in the background state, you can restore app main window.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testRestoreByMinimizeBtn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
            let caseName = 'TestRestoreByMinimizeBtn';
            if(isPCStatus != ''){
                try {
                let windowClass = windowStage.getMainWindowSync();
                const mainWindowstatus = windowClass.getWindowStatus();
                console.info(`${caseName} Succeeded in getting window status. Data: ${mainWindowstatus}`);
                let driver: Driver = Driver.create();
                let minimizeBtn = await driver.findComponent(ON.id('EnhanceMinimizeBtn'));
                if (minimizeBtn) {
                    await minimizeBtn.click();
                    await sleep(1000);
                    windowClass.restore().then(async () => {
                        console.info(`${caseName} Succeeded in restoring the window.`);
                        await sleep(1000);
                        let windowStatus = windowClass.getWindowStatus();
                        console.info(`${caseName} Succeeded in getting the window status. Data: ${windowStatus}`);
                        expect(windowStatus).assertEqual(mainWindowstatus);
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
                        expect(1300004).assertEqual(err.code);
                        done();
                    });
                } else {
                    windowClass.restore().then(() => {
                        console.info(`${caseName} Succeeded in restoring the window.`);
                        expect().assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        if (err.code === 801) {
                            console.error(`${caseName} The current device type does not support to restore. Cause code: ${err.code}, message: ${err.message}`);
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            console.error(`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
                            expect(1300004).assertEqual(err.code);
                            expect(err.message!=null).assertTrue();
                            done();
                        }
                    });
                }
            } catch (exception) {
                if (exception.code === 801) {
                    console.error(`${caseName} The current device type does not support to getWindowStatus. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    console.error(`Failed to obtain the window status of window. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
            }else{
                done();
            }
            
        })


        /**
         * @tc.name   testOnDisplayIdChangeTest
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_DISPLAYIDCHANGE_JS_API_0100
         * @tc.desc   On DisplayChange
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testOnDisplayIdChangeTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            let caseName = 'testOnDisplayIdChangeTest';
            console.log(caseName + 'start run');
            let windowClass = windowStage.getMainWindowSync();
            const callback = (displayId: number) => {
                console.info(caseName + 'Window displayId changed, displayId=' + displayId);
            };
            try {
                windowClass.on('displayIdChange', callback);
            } catch (exception) {
                console.error(`${caseName} Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code != 801) {
                  expect(exception.message!=null).assertTrue();
                expect().assertFail();
                }
            }
            done();
        })


        /**
         * @tc.name   testOffDisplayIdChangeTest
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_DISPLAYIDCHANGE_JS_API_0200
         * @tc.desc   Off DisplayChange
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testOffDisplayIdChangeTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
            let caseName = 'testOffDisplayIdChangeTest';
            console.log(caseName + 'start run');
            let windowClass = windowStage.getMainWindowSync();
            const callback = (displayId: number) => {
                console.info(caseName + 'Window displayId changed, displayId=' + displayId);
            };
            try {
                windowClass.on('displayIdChange', callback);
                windowClass.off('displayIdChange', callback);
                windowClass.off('displayIdChange');
            } catch (exception) {
                console.error(caseName + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code != 801) {
                  expect(exception.message!=null).assertTrue();
                expect().assertFail();
                }
            }
            done();
        })

    /**
     * @tc.name   test_getAllWindowLayoutInfo_401
     * @tc.number SUB_BASIC_WMS_GET_ALL_WINDOW_LAYOUT_INFO_0100
     * @tc.desc   test_getAllWindowLayoutInfo_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getAllWindowLayoutInfo_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_getAllWindowLayoutInfo_401';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let promise = window.getAllWindowLayoutInfo(null)
        promise.then((data) => {
          console.info(`${caseName} :Succeeded in obtaining all window layout info. Data: ` + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to obtain all window layout info. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          expect(err.message!=null).assertTrue();
          done();
        }else {
          expect().assertFail();
          done();
        }
      }

    });

    

    /**
     * @tc.name   test_startMoving_mainWindow
     * @tc.number SUB_BASIC_WMS_START_MOVING_0100
     * @tc.desc   test_startMoving_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startMoving_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_startMoving_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        let promise = mainWindow.startMoving(100, 50)
        promise.then(() => {
          console.info(`${caseName} :Succeeded startMoving ` );
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to startMoving. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            expect(err.message!=null).assertTrue();
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();

      }

    });

    /**
     * @tc.name   test_stopMoving_mainWindow
     * @tc.number SUB_BASIC_WMS_STOP_MOVING_0100
     * @tc.desc   test_stopMoving_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_stopMoving_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_stopMoving_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        let promise = mainWindow.stopMoving()
        promise.then(() => {
          console.info(`${caseName} :Succeeded stopMoving ` );
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to stopMoving. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            expect(err.message!=null).assertTrue();
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();

      }

    });

    /**
     * @tc.name   test_SetWindowLimits_40vp
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_LIMITS_0100
     * @tc.desc   test_SetWindowLimits_40vp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowLimits_40vp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
      let msg = ' test_SetWindowLimits_40vp ';
      console.info(msg + ' begin ');
      try {
        let windowClass: window.Window = windowStage.getMainWindowSync()
        let windowLimits: window.WindowLimits = {
          maxWidth: 1000,
          maxHeight: 1000,
          minWidth: vp2px(40),
          minHeight: vp2px(40)
        };
        let promise: Promise<window.WindowLimits> = windowClass.setWindowLimits(windowLimits, true);
        promise.then(async (data: window.WindowLimits) => {
          console.info(msg + ' Succeeded in changing the window limits. Cause: ' + JSON.stringify(data));
          let windowLimits = await windowClass.getWindowLimits();
          console.info(msg + ' Succeeded in get the window limits. Cause: ' + JSON.stringify(windowLimits));
          expect(windowLimits.maxWidth).assertEqual(data.maxWidth);
          expect(windowLimits.maxHeight).assertEqual(data.maxHeight);
          if(windowLimits.minWidth != undefined && data.minWidth != undefined && windowLimits.minHeight != undefined && data.minHeight != undefined){
            expect(Math.abs(windowLimits.minWidth-data.minWidth)).assertLessOrEqual(1);
            expect(Math.abs(windowLimits.minHeight-data.minHeight)).assertLessOrEqual(1);
            done();
          }
        }).catch((err: BusinessError) => {
            console.error(msg + ' failed in windowClass.setWindowLimits ' + JSON.stringify(err));
            expect().assertFail()
            done();
        });
      } catch (error) {
        console.error(msg + ' failed in windowClass.setWindowLimits 2  ' + JSON.stringify(error)+ 'error.message: '+ error.message);
        if(error.code == 801){
            console.info(msg+' The current device type is not supported')
            expect(error.message!=null).assertTrue();
            done();
          }else{
            expect().assertFail()
            done();
          }
      }
    })
     
    
    /**
     * @tc.name   testSetDefaultDensityEnabled_true
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0010
     * @tc.desc   Test the function value of setDefaultDensityEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetDefaultDensityEnabled_true", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let msgStr = "testSetDefaultDensityEnabled_true";
      console.log(msgStr + "begin");
      try {
        windowStage.setDefaultDensityEnabled(true);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('Failed to set default density enabled. Cause:' + JSON.stringify(error));
        if(error.code == 801){
          done()
        }else{
          expect().assertFail();
          done();
        }
      }
    })


    /**
     * @tc.name   testSetDefaultDensityEnabled_false
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0020
     * @tc.desc   Test the function value of setDefaultDensityEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetDefaultDensityEnabled_false", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let msgStr = "testSetDefaultDensityEnabled_false";
      console.log(msgStr + "begin");
      try {
        windowStage.setDefaultDensityEnabled(false);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('Failed to set default density enabled. Cause:' + JSON.stringify(error));
        if(error.code == 801){
          done()
        }else{
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testRectChangeOptions_on
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0030
     * @tc.desc   Test the function value of testRectChangeOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testRectChangeOptions_on", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
        console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error.code)+'error.message: '+ error.message);
        if (error.code === 801) {
          console.info(`${msgStr} The current device type does not support to windowRectChange`);
           expect(error.message!=null).assertTrue();
          done();
        } else {
          console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   test_setWindowGrayScale_0
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0900
     * @tc.desc   test_setWindowGrayScale_0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setWindowGrayScale_0", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
            expect(err.message!=null).assertTrue();
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
     * @tc.name   test_setWindowGrayScale_0.5
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_1000
     * @tc.desc   test_setWindowGrayScale_0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setWindowGrayScale_0.5", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
            expect(err.message!=null).assertTrue();
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
     * @tc.name   test_setWindowGrayScale_1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_1100
     * @tc.desc   test_setWindowGrayScale_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setWindowGrayScale_1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
            expect(err.message!=null).assertTrue();
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
     * @tc.name   test_setWindowGrayScale_-1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_1200
     * @tc.desc   test_setWindowGrayScale_-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_setWindowGrayScale_-1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
            expect(err.message!=null).assertTrue();
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
     * @tc.name   test_setWindowGrayScale_2
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_1300
     * @tc.desc   test_setWindowGrayScale_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_setWindowGrayScale_2", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
            expect(err.message!=null).assertTrue();
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
     * @tc.name   test_subWindow_setWindowGrayScale_1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_1400
     * @tc.desc   test_subWindow_setWindowGrayScale_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_subWindow_setWindowGrayScale_1", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let msgStr = "test_subWindow_setWindowGrayScale_1";
      console.log(msgStr + "begin");
      let grayScale = 1;
      try {
        await windowStage.createSubWindow('test_subWindow_setWindowGrayScale_2').then(async (data) => {
          let subWindowClass = data;
          console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.setUIContent('testability/pages/First/index2').then(() => {
            console.info(msgStr + 'Succeeded in setUiContent.');
            subWindowClass.setWindowGrayScale(grayScale).then(async () => {
              console.info(msgStr + 'Succeeded in setting the grayScale 1.');
              await subWindowClass.destroyWindow();
              expect(true).assertTrue();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
              await subWindowClass.destroyWindow();
              if (err.code == 801) {
                console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
                expect(err.message!=null).assertTrue();
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
     * @tc.name   test_snapshotIgnorePrivacy_1300002
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_snapshotIgnorePrivacy_0100
     * @tc.desc   test_snapshotIgnorePrivacy_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_snapshotIgnorePrivacy_1300002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_snapshotIgnorePrivacy_1300002";
      console.log(msgStr + "begin");
      let subWindowClass: ohosWindow.Window;
      try {
        let promise = windowStage.createSubWindow('test_snapshotIgnorePrivacy_1300002');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.destroyWindow();
          let promise2 = subWindowClass.snapshotIgnorePrivacy();
          promise2.then(async (pixelMap:image.PixelMap) => {
            let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
            console.info(`${msgStr} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
            await subWindowClass.destroyWindow();
            expect(false).assertTrue();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.message!=null).assertTrue();
            if (err.code == 801) {
              console.log(msgStr + '此设备不支持');
              expect(err.message!=null).assertTrue();
              done();
            } else if(err.code == 1300002){
              expect(true).assertTrue();
              expect(err.message!=null).assertTrue();
              done();
            }else {
              console.log(msgStr + 'Failed to setWindowMask');
              expect(false).assertTrue();
              done();
            }

          });
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.message!=null).assertTrue();
          await subWindowClass.destroyWindow();
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持');
            done();
          } else {
            console.log(msgStr + 'Failed to setWindowMask');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        console.log(msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_snapshotIgnorePrivacy
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_snapshotIgnorePrivacy_0200
     * @tc.desc   test_snapshotIgnorePrivacy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_snapshotIgnorePrivacy", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let msgStr = "test_snapshotIgnorePrivacy";
      console.log(msgStr + "begin");
      let mainWoindow: ohosWindow.Window = windowStage.getMainWindowSync();
      try {
          let promise2 = mainWoindow.snapshotIgnorePrivacy();
          promise2.then(async (pixelMap:image.PixelMap) => {
            let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
            console.info(`${msgStr} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
            let widthBefore: number = mainWoindow.getWindowProperties().windowRect.width;
            let heightBefore: number = mainWoindow.getWindowProperties().windowRect.height;
            console.info(`${msgStr} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
            expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
            expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
            pixelMap.release();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.message!=null).assertTrue();
            if (err.code == 801) {
              console.log(msgStr + '此设备不支持');
              done();
            } else {
              console.log(msgStr + 'Failed to setWindowMask');
              expect(false).assertTrue();
              done();
            }

          });
      } catch (error) {
        console.log(msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_WINDOWRECT_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_WINDOWRECT_0100
       * @tc.desc   无标题栏子窗可绘制区域等于窗口区域
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_WINDOWRECT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_WINDOWRECT_0100 ';
        console.info(msgStr + ' begin ');
        let windowClass: window.Window = windowStage.getMainWindowSync()
        let subWindowClass: window.Window | undefined;
        try {
          let options: ohosWindow.SubWindowOptions = {
            title: 'title',
            decorEnabled: false
          };
          let promise = windowStage.createSubWindowWithOptions('test_GETWINDOWPROPERTIES_WINDOWRECT_0100', options);
          promise.then(async (data) => {
            subWindowClass = data;
            await subWindowClass.setUIContent('testability/pages/First/index2');
            await sleep(200);
            await subWindowClass.showWindow();
            await sleep(200);
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(subWindowClass));
            let windowLimits = await windowClass.getWindowLimits();
            console.info(msgStr + ' Succeeded in get the window limits. Cause: ' + JSON.stringify(windowLimits));
            await subWindowClass.resetSize(windowLimits.minWidth as number, windowLimits.minHeight as number);
            await sleep(200);
            await subWindowClass.moveWindowTo(100, 100);
            await sleep(200);
            let windowProperties = subWindowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            let windowRect = windowProperties.windowRect;
            console.info(`${msgStr} windowRect: ${JSON.stringify(windowRect)}`);
            expect(Math.abs(windowRect.width-(windowLimits.minWidth as number))).assertLessOrEqual(1);
            expect(Math.abs(windowRect.height-(windowLimits.minHeight as number))).assertLessOrEqual(1);
            expect(Math.abs(windowRect.left-100)).assertLessOrEqual(1);
            expect(Math.abs(windowRect.top-100)).assertLessOrEqual(1);
            let drawableRect  = windowProperties.drawableRect;
            console.info(`${msgStr} drawableRect: ${JSON.stringify(drawableRect)}`);
            expect(drawableRect.left).assertEqual(0);
            expect(drawableRect.top ).assertEqual(0);
            expect(Math.abs(drawableRect.width - windowRect.width)).assertLessOrEqual(1);
            expect(Math.abs(drawableRect.height - windowRect.height)).assertLessOrEqual(1);
            await subWindowClass.destroyWindow();
            done();
          }).catch(async (error: BusinessError) => {
            console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error.code)+'error.message:'+ error.message);
            if (subWindowClass !== undefined) {
              await subWindowClass.destroyWindow();
            }
            if (error.code == 1300002) {
              expect(error.message!=null).assertTrue();
              expect(true).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed2 to create the subwindow. Cause: ' + JSON.stringify(error.code)+'error.message:'+ error.message);
          if (subWindowClass !== undefined) {
            await subWindowClass.destroyWindow();
          }
          if (error.code == 1300002) {
            expect(error.message!=null).assertTrue();
            expect().assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_WINDOWRECT_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_WINDOWRECT_0200
       * @tc.desc   有装饰栏子窗可绘制区域等于窗口区域减去装饰栏区域
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_WINDOWRECT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_WINDOWRECT_0200 ';
        console.info(msgStr + ' begin ');
        let windowClass: window.Window = windowStage.getMainWindowSync()
        let subWindowClass: window.Window | undefined;
        try {
          let options: ohosWindow.SubWindowOptions = {
            title: 'title',
            decorEnabled: true
          };
          let promise = windowStage.createSubWindowWithOptions('test_GETWINDOWPROPERTIES_WINDOWRECT_0200', options);
          promise.then(async (data) => {
            subWindowClass = data;
            await subWindowClass.setUIContent('testability/pages/First/index2');
            await sleep(200);
            await subWindowClass.showWindow();
            await sleep(200);
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(subWindowClass));
            let windowLimits = await windowClass.getWindowLimits();
            console.info(msgStr + ' Succeeded in get the window limits. Cause: ' + JSON.stringify(windowLimits));
            await subWindowClass.resetSize(windowLimits.minWidth as number, windowLimits.minHeight as number);
            await sleep(200);
            await subWindowClass.moveWindowTo(100, 100);
            await sleep(200);
            let decorHeight = vp2px(subWindowClass.getWindowDecorHeight());
            console.info(`${msgStr} decorHeight: ${JSON.stringify(decorHeight)}`);
            let windowProperties = subWindowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            let windowRect = windowProperties.windowRect;
            console.info(`${msgStr} windowRect: ${JSON.stringify(windowRect)}`);
            let drawableRect  = windowProperties.drawableRect;
            console.info(`${msgStr} drawableRect: ${JSON.stringify(drawableRect)}`);
            if (isPCStatus != '' || isAutoWindow == 'true') {
              expect(drawableRect.left).assertEqual(0);
              expect(Math.abs(drawableRect.top - decorHeight)).assertLessOrEqual(1);
              expect(Math.abs(drawableRect.width - windowRect.width)).assertLessOrEqual(1);
              expect(Math.abs(drawableRect.height - (windowRect.height - decorHeight))).assertLessOrEqual(1);
            } else {
              expect(drawableRect.left).assertEqual(0);
              expect(drawableRect.top).assertEqual(0);
              expect(Math.abs(drawableRect.width - windowRect.width)).assertLessOrEqual(1);
              expect(Math.abs(drawableRect.height - windowRect.height)).assertLessOrEqual(1);
            }

            await subWindowClass.destroyWindow();
            done();
          }).catch(async (error: BusinessError) => {
            console.error(msgStr + 'Failed to create the subwindow. Cause: ' +JSON.stringify(error.code)+'error.message:'+ error.message);
            if (subWindowClass !== undefined) {
              await subWindowClass.destroyWindow();
            }
            if (error.code == 1300002) {
              expect(error.message!=null).assertTrue();
              expect(true).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed2 to create the subwindow. Cause: ' + JSON.stringify(error));
          if (subWindowClass !== undefined) {
            await subWindowClass.destroyWindow();
          }
          if (error.code == 1300002) {
            expect(error.message!=null).assertTrue();
            expect().assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_WINDOWTYPE_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_WINDOWTYPE_0100
       * @tc.desc   test_GETWINDOWPROPERTIES_WINDOWTYPE_0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_WINDOWTYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_WINDOWTYPE_0100 ';
        console.info(msgStr + ' begin ');
        let subWindowClass: window.Window | undefined;
        let config: window.Configuration = {
          name: "floatWindow",
          windowType: window.WindowType.TYPE_FLOAT,
          ctx: context
        };
        try {
          window.createWindow(config).then(async (data) => {
            console.info(`${msgStr} Succeeded in createWindow.`);
            subWindowClass = data;
            let windowProperties = subWindowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.type).assertEqual(window.WindowType.TYPE_FLOAT);
            await subWindowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to createWindow. Cause: ${JSON.stringify(err.code)}`+'error.message:'+ err.message);
            await subWindowClass?.destroyWindow();
            if (err.code === 1300002) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error('Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (subWindowClass !== undefined) {
            await subWindowClass.destroyWindow();
          }
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_WINDOWTYPE_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_WINDOWTYPE_0200
       * @tc.desc   查询模态窗窗口类型
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_WINDOWTYPE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_WINDOWTYPE_0200 ';
        console.info(msgStr + ' begin ');
        let subWindowClass: window.Window | undefined;
        let config: window.Configuration = {
          name: "modalWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        try {
          subWindowClass = await window.createWindow(config);
          let windowProperties = subWindowClass.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          expect(windowProperties.type).assertEqual(window.WindowType.TYPE_DIALOG);
          await subWindowClass.destroyWindow();
          done();
        } catch (error) {
          console.error(msgStr + ' Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (subWindowClass !== undefined) {
            await subWindowClass.destroyWindow();
          }
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FULLSCREEN_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FULLSCREEN_0100
       * @tc.desc   最大化主窗查询isFullScreen和isLayoutFullScreen属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_FULLSCREEN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FULLSCREEN_0100 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          if (isPCStatus != '' || isAutoWindow == 'true') {
            let promise = windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING);
            promise.then(async () => {
              console.info('Succeeded in maximizing the window.');
              let windowProperties = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
              expect(windowProperties.isFullScreen).assertEqual(false);
              expect(windowProperties.isLayoutFullScreen).assertEqual(false);
              await windowClass.recover();
              await sleep(200);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${msgStr} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          } else {
            done();
          }
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FULLSCREEN_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FULLSCREEN_0200
       * @tc.desc   最大化非沉浸式主窗查询isFullScreen和isLayoutFullScreen属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_FULLSCREEN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FULLSCREEN_0200 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          if (isPCStatus != '' || isAutoWindow == 'true') {
            let promise = windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE);
            promise.then(async () => {
              console.info('Succeeded in maximizing the window.');
              let windowProperties = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
              expect(windowProperties.isFullScreen).assertEqual(false);
              expect(windowProperties.isLayoutFullScreen).assertEqual(false);
              await windowClass.recover();
              await sleep(200);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${msgStr} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          } else {
            done();
          }
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FULLSCREEN_0300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FULLSCREEN_0300
       * @tc.desc   最大化且沉浸式主窗查询isFullScreen和isLayoutFullScreen属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_FULLSCREEN_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FULLSCREEN_0300 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          if (isPCStatus != '' || isAutoWindow == 'true') {
            let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
            promise.then(async () => {
              console.info('Succeeded in maximizing the window.');
              let windowProperties = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
              expect(windowProperties.isFullScreen).assertEqual(true);
              expect(windowProperties.isLayoutFullScreen).assertEqual(true);
              await windowClass.recover();
              await sleep(200);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${msgStr} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          } else {
            done();
          }
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FULLSCREEN_0400
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FULLSCREEN_0400
       * @tc.desc   最大化且沉浸式不可hover回显标题栏和dock栏主窗查询isFullScreen和isLayoutFullScreen属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_FULLSCREEN_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FULLSCREEN_0400 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          if (isPCStatus != '' || isAutoWindow == 'true') {
            let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
            promise.then(async () => {
              console.info('Succeeded in maximizing the window.');
              let windowProperties = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
              expect(windowProperties.isFullScreen).assertEqual(true);
              expect(windowProperties.isLayoutFullScreen).assertEqual(true);
              await windowClass.recover();
              await sleep(200);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${msgStr} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          } else {
            done();
          }
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FULLSCREEN_0500
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FULLSCREEN_0500
       * @tc.desc   开启/关闭沉浸式布局后，主窗查询isLayoutFullScreen属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_FULLSCREEN_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FULLSCREEN_0500 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          if (isPCStatus != '' || isAutoWindow == 'true') {
            done();
          } else {
            windowClass.setImmersiveModeEnabledState(true);
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.isLayoutFullScreen).assertEqual(true);
            windowClass.setImmersiveModeEnabledState(false);
            let windowProperties2 = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
            expect(windowProperties2.isLayoutFullScreen).assertEqual(false);
            done();
          }
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FOCUSABLE_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FOCUSABLE_0100
       * @tc.desc   开启/关闭窗口获焦能力后，主窗查询focusable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_FOCUSABLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FOCUSABLE_0100 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          let promise = windowClass.setWindowFocusable(false);
          promise.then(async () => {
            console.info('Succeeded in setWindowFocusable.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.focusable).assertEqual(false);
            let promise2 = windowClass.setWindowFocusable(true);
            promise2.then(async () => {
              console.info('Succeeded in setWindowFocusable.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.focusable).assertEqual(true);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FOCUSABLE_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FOCUSABLE_0200
       * @tc.desc   开启/关闭窗口获焦能力后，子窗查询focusable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_FOCUSABLE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FOCUSABLE_0200 ';
        console.info(msgStr + ' begin ');
        const windowClass = await windowStage.createSubWindow('test_GETWINDOWPROPERTIES_FOCUSABLE_0200');
        try {
          let promise = windowClass.setWindowFocusable(false);
          promise.then(async () => {
            console.info('Succeeded in setWindowFocusable.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.focusable).assertEqual(false);
            let promise2 = windowClass.setWindowFocusable(true);
            promise2.then(async () => {
              console.info('Succeeded in setWindowFocusable.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.focusable).assertEqual(true);
              await windowClass.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_FOCUSABLE_0300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_FOCUSABLE_0300
       * @tc.desc   开启/关闭窗口获焦能力后，dialog窗查询focusable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_FOCUSABLE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_FOCUSABLE_0300 ';
        console.info(msgStr + ' begin ');
        let config: window.Configuration = {
          name: "modalWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass = await window.createWindow(config);
        try {
          let promise = windowClass.setWindowFocusable(false);
          promise.then(async () => {
            console.info('Succeeded in setWindowFocusable.');
            let windowProperties = windowClass!.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.focusable).assertEqual(false);
            let promise2 = windowClass!.setWindowFocusable(true);
            promise2.then(async () => {
              console.info('Succeeded in setWindowFocusable.');
              let windowProperties2 = windowClass!.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.focusable).assertEqual(true);
              await windowClass.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowFocusable. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_TOUCHABLE_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_TOUCHABLE_0100
       * @tc.desc   设置主窗可触/不可触后，主窗查询touchable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_TOUCHABLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_TOUCHABLE_0100 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          let promise = windowClass.setWindowTouchable(false);
          promise.then(async () => {
            console.info('Succeeded in setWindowTouchable.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.touchable).assertEqual(false);
            let promise2 = windowClass.setWindowTouchable(true);
            promise2.then(async () => {
              console.info('Succeeded2 in setWindowTouchable.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.touchable).assertEqual(true);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowTouchable. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowTouchable. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_TOUCHABLE_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_TOUCHABLE_0200
       * @tc.desc   设置子窗可触/不可触后，子窗查询touchable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_TOUCHABLE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_TOUCHABLE_0200 ';
        console.info(msgStr + ' begin ');
        const windowClass = await windowStage.createSubWindow('test_GETWINDOWPROPERTIES_TOUCHABLE_0200');
        try {
          let promise = windowClass.setWindowTouchable(false);
          promise.then(async () => {
            console.info('Succeeded in setWindowTouchable.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.touchable).assertEqual(false);
            let promise2 = windowClass.setWindowTouchable(true);
            promise2.then(async () => {
              console.info('Succeeded2 in setWindowTouchable.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.touchable).assertEqual(true);
              await windowClass.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowTouchable. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowTouchable. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_TOUCHABLE_0300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_TOUCHABLE_0300
       * @tc.desc   设置dialog窗可触/不可触后，dialog窗查询touchable属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_TOUCHABLE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_TOUCHABLE_0300 ';
        console.info(msgStr + ' begin ');
        let config: window.Configuration = {
          name: "modalWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass = await window.createWindow(config);
        try {
          let promise = windowClass.setWindowTouchable(false);
          promise.then(async () => {
            console.info('Succeeded in setWindowTouchable.');
            let windowProperties = windowClass!.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.touchable).assertEqual(false);
            let promise2 = windowClass!.setWindowTouchable(true);
            promise2.then(async () => {
              console.info('Succeeded2 in setWindowTouchable.');
              let windowProperties2 = windowClass!.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.touchable).assertEqual(true);
              await windowClass.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowTouchable. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowTouchable. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })


      /**
       * @tc.name   test_GETWINDOWPROPERTIES_BRIGHTNESS_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_BRIGHTNESS_0100
       * @tc.desc   主窗设置亮度后，主子窗dialog窗查询brightness属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_BRIGHTNESS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_BRIGHTNESS_0100 ';
        console.info(msgStr + ' begin ');
        let subWindowClass1: window.Window | undefined;
        let subWindowClass2: window.Window | undefined;
        try {
          let mainWindow = windowStage.getMainWindowSync();
          await mainWindow.setWindowBrightness(0.5);
          let mainWindowProperties = mainWindow.getWindowProperties();
          console.info(`${msgStr} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
          let brightness1 = mainWindowProperties.brightness;
          console.info(`${msgStr} brightness1: ${JSON.stringify(brightness1)}`);
          expect(brightness1).assertEqual(0.5);
          subWindowClass1 = await windowStage.createSubWindow('test_GETWINDOWPROPERTIES_BRIGHTNESS_0100');
          let config: window.Configuration = {
            name: "dialogWindow",
            windowType: window.WindowType.TYPE_DIALOG,
            ctx: context
          };
          subWindowClass2 = await window.createWindow(config);
          let subWindowProperties = subWindowClass1.getWindowProperties();
          console.info(`${msgStr} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
          let brightness2 = subWindowProperties.brightness;
          console.info(`${msgStr} brightness2: ${JSON.stringify(brightness2)}`);
          expect(brightness2).assertEqual(-1.0);
          let dialogWindowProperties = subWindowClass2.getWindowProperties();
          console.info(`${msgStr} dialogWindowProperties: ${JSON.stringify(dialogWindowProperties)}`);
          let brightness3 = dialogWindowProperties.brightness;
          console.info(`${msgStr} brightness3: ${JSON.stringify(brightness3)}`);
          expect(brightness3).assertEqual(-1.0);

          await mainWindow.setWindowBrightness(-1.0);
          let mainWindowProperties2 = mainWindow.getWindowProperties();
          console.info(`${msgStr} mainWindowProperties2: ${JSON.stringify(mainWindowProperties2)}`);
          let brightness4 = mainWindowProperties2.brightness;
          console.info(`${msgStr} brightness4: ${JSON.stringify(brightness4)}`);
          expect(brightness4).assertEqual(-1.0);
          let subWindowProperties2 = subWindowClass1.getWindowProperties();
          console.info(`${msgStr} subWindowProperties2: ${JSON.stringify(subWindowProperties2)}`);
          let brightness5 = subWindowProperties2.brightness;
          console.info(`${msgStr} brightness5: ${JSON.stringify(brightness5)}`);
          expect(brightness5).assertEqual(-1.0);
          let dialogWindowProperties2 = subWindowClass2.getWindowProperties();
          console.info(`${msgStr} dialogWindowProperties2: ${JSON.stringify(dialogWindowProperties2)}`);
          let brightness6 = dialogWindowProperties2.brightness;
          console.info(`${msgStr} brightness6: ${JSON.stringify(brightness6)}`);
          expect(brightness6).assertEqual(-1.0);
          expect(brightness4).assertEqual(brightness5);
          expect(brightness4).assertEqual(brightness6);
          await subWindowClass1.destroyWindow()
          await subWindowClass2.destroyWindow()
          done();
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          if (subWindowClass1 !== undefined) {
            await subWindowClass1.destroyWindow()
          }
          if (subWindowClass2 !== undefined) {
            await subWindowClass2.destroyWindow()
          }
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_BRIGHTNESS_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_BRIGHTNESS_0200
       * @tc.desc   未设置过亮度的主窗，主窗查询brightness属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_BRIGHTNESS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = 'test_GETWINDOWPROPERTIES_BRIGHTNESS_0200';
        console.info(msgStr + ' begin ');
        let windowStageStart = await startAbility3(msgStr, context);
        try {
          let windowClass = windowStageStart.getMainWindowSync();
          let mainWindowProperties = windowClass.getWindowProperties();
          console.info(`${msgStr} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
          let brightness = mainWindowProperties.brightness;
          console.info(`${msgStr} brightness: ${JSON.stringify(brightness)}`);
          expect(brightness).assertEqual(-1);
          await terminateAbility3(msgStr);
          done();
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await terminateAbility3(msgStr);
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_KEEPSCREENON_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_KEEPSCREENON_0100
       * @tc.desc   主窗设置常亮/非常亮后，主窗查询isKeepScreenOn属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_KEEPSCREENON_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_KEEPSCREENON_0100 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          let promise = windowClass.setWindowKeepScreenOn(true);
          promise.then(async () => {
            console.info('Succeeded in setWindowKeepScreenOn.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.isKeepScreenOn).assertEqual(true);
            let promise2 = windowClass.setWindowKeepScreenOn(false);
            promise2.then(async () => {
              console.info('Succeeded2 in setWindowKeepScreenOn.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.isKeepScreenOn).assertEqual(false);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowKeepScreenOn. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowKeepScreenOn. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_KEEPSCREENON_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_KEEPSCREENON_0200
       * @tc.desc   子窗设置常亮/非常亮后，主窗查询isKeepScreenOn属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_KEEPSCREENON_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_KEEPSCREENON_0200 ';
        console.info(msgStr + ' begin ');
        const windowClass = await windowStage.createSubWindow('test_GETWINDOWPROPERTIES_KEEPSCREENON_0200');
        try {
          let promise = windowClass.setWindowKeepScreenOn(true);
          promise.then(async () => {
            console.info('Succeeded in setWindowKeepScreenOn.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} setWindowKeepScreenOn: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.isKeepScreenOn).assertEqual(true);
            let promise2 = windowClass.setWindowKeepScreenOn(false);
            promise2.then(async () => {
              console.info('Succeeded2 in setWindowKeepScreenOn.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.isKeepScreenOn).assertEqual(false);
              await windowClass.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowKeepScreenOn. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowKeepScreenOn. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_KEEPSCREENON_0300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_KEEPSCREENON_0300
       * @tc.desc   dialog窗设置常亮/非常亮后，主窗查询isKeepScreenOn属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_KEEPSCREENON_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_KEEPSCREENON_0300 ';
        console.info(msgStr + ' begin ');
        let config: window.Configuration = {
          name: "modalWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass = await window.createWindow(config);
        try {
          let promise = windowClass.setWindowKeepScreenOn(true);
          promise.then(async () => {
            console.info('Succeeded in setWindowKeepScreenOn.');
            let windowProperties = windowClass!.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.isKeepScreenOn).assertEqual(true);
            let promise2 = windowClass!.setWindowKeepScreenOn(false);
            promise2.then(async () => {
              console.info('Succeeded2 in setWindowKeepScreenOn.');
              let windowProperties2 = windowClass!.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.isKeepScreenOn).assertEqual(false);
              await windowClass.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setWindowKeepScreenOn. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setWindowKeepScreenOn. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_PRIVACYMODE_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_PRIVACYMODE_0100
       * @tc.desc   主窗设置隐私模式/非隐私模式，主窗查询isPrivacyMode属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_PRIVACYMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_PRIVACYMODE_0100 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          let promise = windowClass.setPrivacyMode(true);
          promise.then(async () => {
            console.info('Succeeded in setPrivacyMode.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.isPrivacyMode).assertEqual(true);
            let promise2 = windowClass.setPrivacyMode(false);
            promise2.then(async () => {
              console.info('Succeeded2 in setPrivacyMode.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.isPrivacyMode).assertEqual(false);
              done();
            }).catch((err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setPrivacyMode. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setPrivacyMode. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_PRIVACYMODE_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_PRIVACYMODE_0200
       * @tc.desc   子窗设置隐私模式/非隐私模式，主窗查询isPrivacyMode属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_PRIVACYMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_PRIVACYMODE_0200 ';
        console.info(msgStr + ' begin ');
        const windowClass = await windowStage.createSubWindow('test_GETWINDOWPROPERTIES_PRIVACYMODE_0200');
        try {
          let promise = windowClass.setPrivacyMode(true);
          promise.then(async () => {
            console.info('Succeeded in setPrivacyMode.');
            let windowProperties = windowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.isPrivacyMode).assertEqual(true);
            let promise2 = windowClass.setPrivacyMode(false);
            promise2.then(async () => {
              console.info('Succeeded2 in setPrivacyMode.');
              let windowProperties2 = windowClass.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.isPrivacyMode).assertEqual(false);
              await windowClass.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setPrivacyMode. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setPrivacyMode. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_PRIVACYMODE_0300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_PRIVACYMODE_0300
       * @tc.desc   dialog窗设置隐私模式/非隐私模式，主窗查询isPrivacyMode属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_PRIVACYMODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_PRIVACYMODE_0300 ';
        console.info(msgStr + ' begin ');
        let config: window.Configuration = {
          name: "modalWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass = await window.createWindow(config);
        try {
          let promise = windowClass.setPrivacyMode(true);
          promise.then(async () => {
            console.info('Succeeded in setPrivacyMode.');
            let windowProperties = windowClass!.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            expect(windowProperties.isPrivacyMode).assertEqual(true);
            let promise2 = windowClass!.setPrivacyMode(false);
            promise2.then(async () => {
              console.info('Succeeded2 in setPrivacyMode.');
              let windowProperties2 = windowClass!.getWindowProperties()
              console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
              expect(windowProperties2.isPrivacyMode).assertEqual(false);
              await windowClass.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${msgStr} Failed2 to setPrivacyMode. Cause code: ${err.code}, message: ${err.message}`);
              await windowClass.destroyWindow();
              if (err.code == 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed1 to setPrivacyMode. Cause code: ${err.code}, message: ${err.message}`);
            await windowClass.destroyWindow();
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_TRANSPARENT_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_TRANSPARENT_0100
       * @tc.desc   主窗设置透明/非透明背景色后查询isTransparent属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_TRANSPARENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_TRANSPARENT_0100 ';
        console.info(msgStr + ' begin ');
        try {
          let windowClass = windowStage.getMainWindowSync();
          windowClass.setWindowBackgroundColor('#0000FF00');
          console.info('Succeeded in setWindowBackgroundColor.');
          let windowProperties = windowClass!.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          expect(windowProperties.isTransparent).assertEqual(true);
          windowClass!.setWindowBackgroundColor('#FFFFFF');
          console.info('Succeeded2 in setWindowBackgroundColor.');
          let windowProperties2 = windowClass!.getWindowProperties()
          console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
          expect(windowProperties2.isTransparent).assertEqual(false);
          done();
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_TRANSPARENT_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_TRANSPARENT_0200
       * @tc.desc   子窗设置透明/非透明背景色后查询isTransparent属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_TRANSPARENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_TRANSPARENT_0200 ';
        console.info(msgStr + ' begin ');

        try {
          const windowClass = await windowStage.createSubWindow('test_GETWINDOWPROPERTIES_TRANSPARENT_0200');
          await sleep(200);
          await windowClass.setUIContent('testability/pages/First/index2');
          await sleep(200);
          await windowClass.showWindow();
          await sleep(200);
          windowClass.setWindowBackgroundColor('#0000FF00');
          console.error('Succeeded in setWindowBackgroundColor.');
          let windowProperties = windowClass!.getWindowProperties()
          console.error(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          expect(windowProperties.isTransparent).assertEqual(true);
          windowClass!.setWindowBackgroundColor('#FFFFFF');
          console.error('Succeeded2 in setWindowBackgroundColor.');
          let windowProperties2 = windowClass!.getWindowProperties()
          console.error(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
          expect(windowProperties2.isTransparent).assertEqual(false);
          await windowClass.destroyWindow();
          done();
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_TRANSPARENT_0300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_TRANSPARENT_0300
       * @tc.desc   系统窗设置透明/非透明背景色后查询isTransparent属性
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_TRANSPARENT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_TRANSPARENT_0300 ';
        console.info(msgStr + ' begin ');
        let config: window.Configuration = {
          name: "dialogWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass = await window.createWindow(config);
        await sleep(200);
        await windowClass.setUIContent('testability/pages/First/index2');
        await sleep(200);
        await windowClass.showWindow();
        await sleep(200);
        try {
          windowClass.setWindowBackgroundColor('#0000FF00');
          console.info('Succeeded in setWindowBackgroundColor.');
          let windowProperties = windowClass!.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          expect(windowProperties.isTransparent).assertEqual(true);
          windowClass!.setWindowBackgroundColor('#FFFFFF');
          console.info('Succeeded2 in setWindowBackgroundColor.');
          let windowProperties2 = windowClass!.getWindowProperties()
          console.info(`${msgStr} windowProperties2: ${JSON.stringify(windowProperties2)}`);
          expect(windowProperties2.isTransparent).assertEqual(false);
          await windowClass.destroyWindow();
          done();
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_WINDOWID_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_WINDOWID_0100
       * @tc.desc   主窗查询windowid
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_WINDOWID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_WINDOWID_0100 ';
        console.info(msgStr + ' begin ');
        let windowClass = await windowStage.getMainWindowSync();
        let subWindowClass: window.Window | undefined
        try {
          let windowProperties = windowClass.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          let windowId = windowProperties.id;
          console.info(`${msgStr} windowId: ${JSON.stringify(windowId)}`);
          expect(windowId).assertLarger(0)
          let config: window.Configuration = {
            name: "modalWindow",
            windowType: window.WindowType.TYPE_DIALOG,
            ctx: context,
            parentId: windowId
          };
          subWindowClass = await window.createWindow(config);
          subWindowClass.destroyWindow();
          done()
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          if (subWindowClass !== undefined) {
            subWindowClass.destroyWindow();
          }
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_DISPLAYID_1900
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_DISPLAYID_1900
       * @tc.desc   主窗查询所在displayid
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_DISPLAYID_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_DISPLAYID_1900 ';
        console.info(msgStr + ' begin ');
        let windowClass = await windowStage.getMainWindowSync();
        try {
          let windowProperties = windowClass.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          let displayId = windowProperties.displayId;
          console.info(`${msgStr} displayId: ${JSON.stringify(displayId)}`);
          expect(displayId).assertLargerOrEqual(0)
          done()
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_NAME_0100
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_NAME_0100
       * @tc.desc   主窗查询name
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_NAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_NAME_0100 ';
        console.info(msgStr + ' begin ');
        let windowClass = await windowStage.getMainWindowSync();
        try {
          let windowProperties = windowClass.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          let name = windowProperties.name;
          console.info(`${msgStr} name: ${JSON.stringify(name)}`);
          expect(name).assertEqual('myapplication0');
          done()
        } catch (error) {
          console.error(msgStr + ' Failed. Cause: ' + JSON.stringify(error));
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_NAME_0200
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_NAME_0200
       * @tc.desc   子窗查询name
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_NAME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_NAME_0200 ';
        console.info(msgStr + ' begin ');
        let subWindowClass: window.Window | undefined;
        try {
          let options: ohosWindow.SubWindowOptions = {
            title: 'title',
            decorEnabled: false
          };
          let promise = windowStage.createSubWindowWithOptions('testWindowPropertiesSubWindow', options);
          promise.then(async (data) => {
            subWindowClass = data;
            let windowProperties = subWindowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            let name = windowProperties.name;
            console.info(`${msgStr} name: ${JSON.stringify(name)}`);
            expect(name).assertEqual('testWindowPropertiesSubWindow');
            await subWindowClass.destroyWindow();
            done();
          }).catch(async (error: BusinessError) => {
            console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error.code)+'message: ' + error.message);
            if (subWindowClass !== undefined) {
              await subWindowClass.destroyWindow();
            }
            if (error.code == 1300002) {
              expect(error.message!=null).assertTrue();
              expect(true).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(msgStr + ' Failed2 to create the subwindow. Cause: ' + JSON.stringify(error.code)+'message: ' + error.message);
          if (subWindowClass !== undefined) {
            await subWindowClass.destroyWindow();
          }
          if (error.code == 1300002) {
            expect(error.message!=null).assertTrue();
            expect().assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_NAME_0300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_NAME_0300
       * @tc.desc   test_GETWINDOWPROPERTIES_NAME_0300
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_NAME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_NAME_0300 ';
        console.info(msgStr + ' begin ');
        let subWindowClass: window.Window | undefined;
        let config: window.Configuration = {
          name: "testWindowPropertiesFloatWindow",
          windowType: window.WindowType.TYPE_FLOAT,
          ctx: context
        };
        try {
          window.createWindow(config).then(async (data) => {
            console.info(`${msgStr} Succeeded in createWindow.`);
            subWindowClass = data;
            let windowProperties = subWindowClass.getWindowProperties()
            console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
            let name = windowProperties.name;
            console.info(`${msgStr} name: ${JSON.stringify(name)}`);
            expect(name).assertEqual('testWindowPropertiesFloatWindow');
            await subWindowClass.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to createWindow. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
            await subWindowClass?.destroyWindow();
            if (err.code === 1300002) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error('Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (subWindowClass !== undefined) {
            await subWindowClass.destroyWindow();
          }
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_NAME_0400
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_NAME_0400
       * @tc.desc   dialog窗查询name
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('test_GETWINDOWPROPERTIES_NAME_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_NAME_0400 ';
        console.info(msgStr + ' begin ');
        let subWindowClass: window.Window | undefined;
        let config: window.Configuration = {
          name: "testWindowPropertiesDialogWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        try {
          subWindowClass = await window.createWindow(config);
          let windowProperties = subWindowClass.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          let name = windowProperties.name;
          console.info(`${msgStr} name: ${JSON.stringify(name)}`);
          expect(name).assertEqual('testWindowPropertiesDialogWindow');
          await subWindowClass.destroyWindow();
          done();
        } catch (error) {
          console.error(msgStr + ' Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (subWindowClass !== undefined) {
            await subWindowClass.destroyWindow();
          }
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_WINDOWRECT_2300
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_WINDOWRECT_2300
       * @tc.desc   子窗在loadcontent之前getWindowProperties
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_WINDOWRECT_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = ' test_GETWINDOWPROPERTIES_WINDOWRECT_2300 ';
        const subWindowClass = await windowStage.createSubWindow('test_GETWINDOWPROPERTIES_PRIVACYMODE_0200');
        try {
          await subWindowClass.resize(150, 150);
          await sleep(200);
          await subWindowClass.moveWindowTo(50, 50);
          await sleep(200);
          let windowProperties = subWindowClass.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          let windowRect = windowProperties.windowRect;
          console.info(`${msgStr} windowRect: ${JSON.stringify(windowRect)}`);
          expect(Math.abs(windowRect.left)).assertEqual(0);
          expect(Math.abs(windowRect.top)).assertEqual(0);
          expect(Math.abs(windowRect.width)).assertEqual(0);
          expect(Math.abs(windowRect.height)).assertEqual(0);
          expect(windowProperties.isFullScreen).assertEqual(false);
          expect(windowProperties.isLayoutFullScreen).assertEqual(false);
          expect(windowProperties.isTransparent).assertEqual(false);
          expect(windowProperties.isPrivacyMode).assertEqual(false);
          expect(windowProperties.focusable).assertEqual(true);
          expect(windowProperties.touchable).assertEqual(true);
          expect(windowProperties.isKeepScreenOn).assertEqual(false);
          expect(windowProperties.brightness).assertEqual(-1);
          expect(windowProperties.id).assertLarger(0);
          expect(windowProperties.displayId).assertLargerOrEqual(0);
          expect(windowProperties.name).assertEqual('test_GETWINDOWPROPERTIES_PRIVACYMODE_0200');
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await sleep(200);
          await subWindowClass.showWindow();
          await sleep(200);
          await subWindowClass.destroyWindow();
          done();
        } catch (error) {
          console.error(msgStr + ' Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (subWindowClass !== undefined) {
            await subWindowClass.destroyWindow();
          }
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   test_GETWINDOWPROPERTIES_WINDOWRECT_2400
       * @tc.number SUB_BASIC_WMS_GETWINDOWPROPERTIES_WINDOWRECT_2400
       * @tc.desc   主窗在loadcontent之前getWindowProperties
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('test_GETWINDOWPROPERTIES_WINDOWRECT_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let msgStr = 'test_GETWINDOWPROPERTIES_WINDOWRECT_2400';      
        let windowStageStart = await startAbility4(msgStr, context);
        try {
          let windowClass = windowStageStart.getMainWindowSync();
          let windowProperties = windowClass.getWindowProperties()
          console.info(`${msgStr} windowProperties: ${JSON.stringify(windowProperties)}`);
          let drawableRect = windowProperties.drawableRect;
          console.info(`${msgStr} drawableRect: ${JSON.stringify(drawableRect)}`);
          expect(drawableRect.left).assertEqual(0);
          expect(drawableRect.top).assertEqual(0);
          expect(drawableRect.width).assertEqual(0);
          expect(drawableRect.height).assertEqual(0);
          expect(windowProperties.type).assertEqual(1);
          let windowRect = windowProperties.windowRect;
          console.info(`${msgStr} windowRect: ${JSON.stringify(windowRect)}`);
          if (isPCStatus != '' || isAutoWindow == 'true') {
            expect(windowProperties.isFullScreen).assertEqual(false);
            // expect(windowRect.left).assertLarger(0);
            // expect(windowRect.top).assertLarger(0);
            // expect(windowRect.width).assertLarger(0);
            // expect(windowRect.height).assertLarger(0);
          } else {
            expect(windowProperties.isFullScreen).assertEqual(false);
            // expect(windowRect.left).assertEqual(0);
            // expect(windowRect.top).assertEqual(0);
            // expect(windowRect.width).assertLarger(0);
            // expect(windowRect.height).assertLarger(0);
          }
          expect(windowProperties.isLayoutFullScreen).assertEqual(false);
          expect(windowProperties.isTransparent).assertEqual(false);
          expect(windowProperties.isPrivacyMode).assertEqual(false);
          expect(windowProperties.focusable).assertEqual(true);
          expect(windowProperties.touchable).assertEqual(true);
          expect(windowProperties.brightness).assertEqual(-1);
          expect(windowProperties.isKeepScreenOn).assertEqual(false);
          expect(windowProperties.id).assertLarger(0);
          expect(windowProperties.displayId).assertLargerOrEqual(0);
          await windowClass.setUIContent('testability/pages/First/index2');
          await sleep(200);
          await terminateAbility4(msgStr);
          done();
        } catch (error) {
          console.error(msgStr + ' Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          await terminateAbility4(msgStr);
          expect().assertFail();
          done();
        }
      })


      /**
       * @tc.name   testGetGlobalWindowMode_Null_1300016
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_0100
       * @tc.desc   testGetGlobalWindowMode_Null_1300016
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testGetGlobalWindowMode_Null_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_Null_1300016';
        try {
          window.getGlobalWindowMode(null).then(async () => {
            console.error(`${caseName} Succeeded in calling getGlobalWindowMode.`);
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
            if (err.code == 801) {
              expect(err.message!=null).assertTrue();
              done()
            } else {
              expect().assertFail();
              done()
            }
          });
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error.code)},message: ${JSON.stringify(error.message)}`);
          expect(error.code).assertEqual(1300016)
          expect(error.message!=null).assertTrue();
          done();
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_NegativeId_1300016
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_0200
       * @tc.desc   testGetGlobalWindowMode_NegativeId_1300016
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testGetGlobalWindowMode_NegativeId_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_NegativeId_1300016';
        try {
          window.getGlobalWindowMode(-1).then(async () => {
            console.error(`${caseName} Succeeded in calling getGlobalWindowMode.`);
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err)}`);
            expect().assertFail();
            done()
          });
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)},message: ${JSON.stringify(error.message)}`);
          expect(error.code).assertEqual(1300016)
          expect(error.message!=null).assertTrue();
          done();
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_UnexistedId
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_0300
       * @tc.desc   testGetGlobalWindowMode_UnexistedId
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('testGetGlobalWindowMode_UnexistedId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_UnexistedId';
        try {
          window.getGlobalWindowMode(2).then(async (data: number) => {
            console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
            expect(data).assertEqual(0);
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
            if (err.code === 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_Fullscreen_And_Subwindow
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_0400
       * @tc.desc   testGetGlobalWindowMode_Fullscreen_And_Subwindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testGetGlobalWindowMode_Fullscreen_And_Subwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_Fullscreen_And_Subwindow';
        let subWindowClass: window.Window | undefined;
        let mainWindow = windowStage.getMainWindowSync();
        try {
          if (isFreeWindowMode == true) {
            await mainWindow.maximize();
            await sleep(200);
          } else {
            console.info(`${caseName}: this device is not pc or autowindow is false.`)
          }
          subWindowClass = await windowStage.createSubWindow('testGetGlobalWindowMode_Fullscreen_And_Subwindow');
          await sleep(200);
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await sleep(200);
          await subWindowClass.showWindow();
          await sleep(200);
          window.getGlobalWindowMode(0).then(async (data: number) => {
            console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
            expect(data).assertEqual(5);
            await mainWindow.recover();
            await subWindowClass?.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
            if (isFreeWindowMode == true) {
              await mainWindow.recover();
            }
            await subWindowClass?.destroyWindow();
            if (err.code === 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
          if (isFreeWindowMode == true) {
            await mainWindow.recover();
          }
          await subWindowClass?.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_Fullscreen_And_Float
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_0500
       * @tc.desc   testGetGlobalWindowMode_Fullscreen_And_Float
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetGlobalWindowMode_Fullscreen_And_Float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_Fullscreen_And_Float';
        let subWindowClass: window.Window | undefined;
        let mainWindow = windowStage.getMainWindowSync();
        try {
          if (isFreeWindowMode == false) {
            console.info(`${caseName}: this device is not pc or autowindow is false.`)
          } else {
            await mainWindow.maximize();
            await sleep(200);
          }
          let config: window.Configuration = {
            name: "floatWindow",
            windowType: window.WindowType.TYPE_FLOAT,
            ctx: context
          };
          window.createWindow(config).then(async (data) => {
            console.info(`${caseName} Succeeded in createWindow.`);
            subWindowClass = data;
            await sleep(200);
            await subWindowClass.setUIContent('testability/pages/First/index2');
            await sleep(200);
            await subWindowClass.showWindow();
            await sleep(200);
            window.getGlobalWindowMode(0).then(async (data: number) => {
              console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
              expect(data).assertEqual(5);
              await mainWindow.recover();
              await subWindowClass?.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
              if (isFreeWindowMode == true) {
                await mainWindow.recover();
              }
              await subWindowClass?.destroyWindow();
              if (err.code === 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed to createWindow. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
            await subWindowClass?.destroyWindow();
            if (err.code === 1300002) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
          if (isFreeWindowMode == true) {
            await mainWindow.recover();
          }
          await subWindowClass?.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_Fullscreen_And_Hide_Subwindow
       * @tc.number testGetGlobalWindowMode_Fullscreen_And_Hide_Subwindow
       * @tc.desc   testGetGlobalWindowMode_Fullscreen_And_Hide_Subwindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      // it('testGetGlobalWindowMode_Fullscreen_And_Hide_Subwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
      //   let caseName = 'testGetGlobalWindowMode_Fullscreen_And_Hide_Subwindow';
      //   let subWindowClass: window.Window | undefined;
      //   let mainWindow = windowStage.getMainWindowSync();
      //   try {
      //     if (isPCStatus == '' || isAutoWindow == 'false') {
      //       console.info(`${caseName}: this device is not pc or autowindow is false.`)
      //     } else {
      //       await mainWindow.maximize();
      //       await sleep(200);
      //     }
      //     subWindowClass = await windowStage.createSubWindow('testGetGlobalWindowMode_Fullscreen_And_Hide_Subwindow');
      //     await sleep(200)
      //     await subWindowClass.hide();
      //     await sleep(200);
      //     window.getGlobalWindowMode(0).then(async (data: number) => {
      //       console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
      //       expect(data).assertEqual(1);
      //       if (isPCStatus != '' || isAutoWindow == 'true') {
      //         await mainWindow.recover();
      //       }
      //       await subWindowClass?.destroyWindow();
      //       done();
      //     }).catch(async (err: BusinessError) => {
      //       console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err)}`);
      //       if (isPCStatus != '' || isAutoWindow == 'true') {
      //         await mainWindow.recover();
      //       }
      //       await subWindowClass?.destroyWindow();
      //       if (err.code === 801) {
      //         done();
      //       } else {
      //         expect().assertFail();
      //         done();
      //       }
      //     });
      //   } catch (error) {
      //     console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
      //     if (isPCStatus != '' || isAutoWindow == 'true') {
      //       await mainWindow.recover();
      //     }
      //     await subWindowClass?.destroyWindow();
      //     expect().assertFail();
      //     done();
      //   }
      // })

      /**
       * @tc.name   testGetGlobalWindowMode_Fullscreen_And_Pip
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_0700
       * @tc.desc   testGetGlobalWindowMode_Fullscreen_And_Pip
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testGetGlobalWindowMode_Fullscreen_And_Pip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_Fullscreen_And_Pip';
        let mainWindow = windowStage.getMainWindowSync();
        let isMaximize = false;
        try {
          let pipController: pipWindow.PiPController | undefined = undefined;
          let mXComponentController: XComponentController = new XComponentController();
          let config: pipWindow.PiPConfiguration = {
            context: context,
            componentController: mXComponentController,
            contentWidth: 500,
            contentHeight: 500
          };
          pipController =  await pipWindow.create(config);
          console.info(`${caseName} Succeeded in creating pip controller.`);
          let enabled = pipController.isPiPSupported();
          console.info(`${caseName} isPiPSupported: ${enabled}`);
          if (!enabled) {
            done();
          } else {
            let windowStatusType = mainWindow.getWindowStatus();
            console.info(`${caseName} windowStatusType: ${JSON.stringify(windowStatusType)}`);
            if (windowStatusType !== window.WindowStatusType.FULL_SCREEN) {
              await mainWindow.maximize();
              await sleep(200);
              isMaximize = true;
            }
            await pipController.startPiP();
            await sleep(200);
            window.getGlobalWindowMode(0).then(async (data: number) => {
              console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
              expect(data).assertEqual(9);
              if (isMaximize) {
                await mainWindow.recover();
              }
              await pipController?.stopPiP();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
              if (isMaximize) {
                await mainWindow.recover();
              }
              if (err.code === 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error.code)},message: ${JSON.stringify(error.message)}`);
          if (isMaximize) {
            await mainWindow.recover();
          }
          if (error.code === 801) {
            expect(error.message!=null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_Fullscreen_And_Dialog
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_0800
       * @tc.desc   testGetGlobalWindowMode_Fullscreen_And_Dialog
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testGetGlobalWindowMode_Fullscreen_And_Dialog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_Fullscreen_And_Dialog';
        let subWindowClass: window.Window | undefined;
        let mainWindow = windowStage.getMainWindowSync();
        try {
          if (isFreeWindowMode == true) {
            await mainWindow.maximize();
            await sleep(200);
          } else {
            console.info(`${caseName}: this device is not pc or autowindow is false.`)
          }
          let config: window.Configuration = {
            name: 'testGetGlobalWindowMode_Fullscreen_And_Dialog',
            windowType: window.WindowType.TYPE_DIALOG,
            ctx: context
          };
          subWindowClass = await window.createWindow(config);

          sleep(200);
          await subWindowClass.setUIContent('testability/pages/First/index2');
          await sleep(200);
          await subWindowClass.showWindow();
          await sleep(200);
          console.info(`${caseName} Succeeded in showWindow`);
          window.getGlobalWindowMode(0).then(async (data: number) => {
            console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
            expect(data).assertEqual(5);
            await subWindowClass?.destroyWindow();
            try{
              await mainWindow.recover();
              done()
            }catch (err) {
              console.error(`${caseName} recover failed. data: ${err.code},message: ${JSON.stringify(err.message)}`);
              if(err.code == 801){
                expect(err.message!=null).assertTrue();
                done()
              }
            }
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
            if (isFreeWindowMode == true) {
              await mainWindow.recover();
            }
            await subWindowClass?.destroyWindow();
            if (err.code === 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
          if (isFreeWindowMode == true) {
            await mainWindow.recover();
          }
          await subWindowClass?.destroyWindow();
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_Fullscreen_And_Unvisible_Float
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_0900
       * @tc.desc   testGetGlobalWindowMode_Fullscreen_And_Unvisible_Float
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testGetGlobalWindowMode_Fullscreen_And_Unvisible_Float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_Fullscreen_And_Unvisible_Float';
        let windowStageStart = await startAbility3(caseName, context);
        try {
          if (isFreeWindowMode == true) {
            await sleep(200);
            let subWindow = windowStageStart.getMainWindowSync();
            await subWindow.maximize();
            await sleep(200);
            window.getGlobalWindowMode(0).then(async (data: number) => {
              console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
              expect(data).assertEqual(5);
              await terminateAbility3(caseName);
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
              await terminateAbility3(caseName);
              if (err.code === 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          } else {
            console.info(`${caseName}: this device is not pc or autowindow is false.`)
            await terminateAbility3(caseName);
            done();
          }
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
          await terminateAbility3(caseName);
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_Empty
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_1000
       * @tc.desc   testGetGlobalWindowMode_Empty
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testGetGlobalWindowMode_Empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_Empty';
        try {
          window.getGlobalWindowMode().then(async (data: number) => {
            console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
            if (isPCStatus != '' || isAutoWindow == 'true') {
              expect(data).assertEqual(4);
            } else {
              expect(data).assertEqual(1);
            }
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
            if (err.code === 801) {
              expect(err.message!=null).assertTrue();
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_Pip_And_Float
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_1100
       * @tc.desc   testGetGlobalWindowMode_Pip_And_Float
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testGetGlobalWindowMode_Pip_And_Float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_Pip_And_Float';
        let pipController:pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let config:pipWindow.PiPConfiguration = {
          context: context,
          componentController: mXComponentController,
          contentWidth: 500,
          contentHeight: 500
        };
        try {
          pipController = await pipWindow.create(config);
          await sleep(200);
          let enabled = pipController.isPiPSupported();
          console.info(`${caseName} isPiPSupported: ${enabled}`);
          if (!enabled) {
            done();
          } else {
            await pipController.startPiP();
            await sleep(200);
            window.getGlobalWindowMode(0).then(async (data: number) => {
              console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
              if (isFreeWindowMode == true) {
                expect(data).assertEqual(12);
              }
              await pipController?.stopPiP();

              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
              await pipController?.stopPiP();
              if (err.code === 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
          if (error.code === 801) {
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })

      /**
       * @tc.name   testGetGlobalWindowMode_FullScreeen_Pip_And_Float
       * @tc.number SUB_BASIC_WMS_GETGLOBALWINDOWMODE_1200
       * @tc.desc   testGetGlobalWindowMode_FullScreeen_Pip_And_Float
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testGetGlobalWindowMode_FullScreeen_Pip_And_Float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async(done: Function) => {
        let caseName = 'testGetGlobalWindowMode_FullScreeen_Pip_And_Float';
        let pipController: pipWindow.PiPController | undefined = undefined;
        let mXComponentController = new XComponentController();
        let config:pipWindow.PiPConfiguration = {
          context: context,
          componentController: mXComponentController,
          contentWidth: 500,
          contentHeight: 500
        };
        let isMaximized = false;
        let subWindowClass: window.Window | undefined;
        let mainWindow = windowStage.getMainWindowSync();
        try {
          let properties = mainWindow.getWindowProperties();
          console.log(`${caseName} properties: ${JSON.stringify(properties)}`);
          
          pipController = await pipWindow.create(config);
          await sleep(200);
          if(!pipController.isPiPSupported()){
            console.info(`${caseName} pipController.isPiPSupported(). data: ${pipController.isPiPSupported()}`);
            done();
          } else {
            if (!properties.isFullScreen) {
            await mainWindow.maximize();
            isMaximized = true;
            await sleep(200);
          }
            await pipController.startPiP();
            await sleep(200);
            subWindowClass = await windowStage.createSubWindow('testGetGlobalWindowMode_FullScreeen_Pip_And_Float');
            await subWindowClass.setUIContent('testability/pages/First/index2');
            await sleep(200);
            await subWindowClass.showWindow();
            await sleep(200);
            window.getGlobalWindowMode(0).then(async (data: number) => {
              console.info(`${caseName} Succeeded in calling getGlobalWindowMode. data: ${data}`);
              expect(data).assertEqual(13);
              await pipController?.stopPiP();
              await subWindowClass?.destroyWindow();
              console.error(`${caseName} isMaximized: ${isMaximized}`);
              if (isMaximized) {
                await mainWindow.recover();
              }
              done();
            }).catch(async (err: BusinessError) => {
              console.error(`${caseName} Failed to call getGlobalWindowMode. Cause: ${JSON.stringify(err.code)},message: ${JSON.stringify(err.message)}`);
              if (err.code === 801) {
                expect(err.message!=null).assertTrue();
                done();
              } else {
                if (isMaximized) {
                  await mainWindow.recover();
                }
                expect().assertFail();
                done();
              }
            });
          }
        } catch (error) {
          console.error(`${caseName} Failed2 to call getGlobalWindowMode. Cause: ${JSON.stringify(error)}`);
          await subWindowClass?.destroyWindow();
          if (isMaximized) {
            await mainWindow.recover();
          }
          if (error.code === 801) {
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })

      /**
       * @tc.name   testGlobalWindowModeEnum
       * @tc.number SUB_BASIC_WMS_GLOBALWINDOWMODE_ENUM_0100
       * @tc.desc   testGlobalWindowModeEnum
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGlobalWindowModeEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async(done: Function) => {
        let caseName = 'testGlobalWindowModeEnum';
        try {
          console.error(`${caseName} Failed. Cause: ${window.GlobalWindowMode.FULLSCREEN}`);
          expect(window.GlobalWindowMode.FULLSCREEN).assertEqual(1);
          expect(window.GlobalWindowMode.SPLIT).assertEqual(2);
          expect(window.GlobalWindowMode.FLOAT).assertEqual(4);
          expect(window.GlobalWindowMode.PIP).assertEqual(8);
          done()
        } catch (error) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(error)}`);
          if (error.code === 801) {
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      })
    /**
     * @tc.name   testSnapShotSync_subWindow_Destroy_1300002
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0100
     * @tc.desc   snapshot 1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapShotSync_subWindow_Destroy_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSnapShotSync_subWindow_Destroy_1300002';
      try {
        let subWindow = await windowStage.createSubWindow('testSnapShotSync_subWindow_Destroy_1300002');
        console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
        await subWindow.setUIContent('testability/pages/First/index');
        await  subWindow.showWindow();
        await  sleep(300);
        await  subWindow.destroyWindow();
        let pixelMap =  subWindow.snapshotSync();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testSnapShotSync_subWindow_not_loadContent_1300002
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0200
     * @tc.desc   snapshot 1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapShotSync_subWindow_not_loadContent_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSnapShotSync_subWindow_not_loadContent_1300002';
      let subWindow = await windowStage.createSubWindow('testSnapShotSync_subWindow_not_loadContent_1300002');
      console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
      try {
        await  sleep(300);
        let pixelMap =  subWindow.snapshotSync();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        await subWindow.destroyWindow();
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else {
          expect(exception.code).assertEqual(1300002);
          expect(exception.message!=null).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_subWindow_not_showWindow_1300002
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0300
     * @tc.desc   snapshot 1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapShotSync_subWindow_not_showWindow_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSnapShotSync_subWindow_not_showWindow_1300002';
      let subWindow = await windowStage.createSubWindow('testSnapShotSync_subWindow_not_showWindow_1300002');
      console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
      await subWindow.setUIContent('testability/pages/First/index');
      await  sleep(300);
      try {
        let pixelMap =  subWindow.snapshotSync();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        await subWindow.destroyWindow();
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else {
          expect(exception.code).assertEqual(1300002);
          expect(exception.message!=null).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_mainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0400
     * @tc.desc   snapshot mainWIndow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSnapShotSync_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testSnapShotSync_mainWindow';
      let mainWindow = await windowStage.getMainWindow();
      console.info(`${caseName} Succeeded in creating the mainWindow. Data: ` + JSON.stringify(mainWindow));
      await  sleep(300);
      try {
        let pixelMap =  mainWindow.snapshotSync();
        let widthBefore: number = mainWindow.getWindowProperties().windowRect.width;
        let heightBefore: number = mainWindow.getWindowProperties().windowRect.height;
        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
        pixelMap.release();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_mainWindow_Privacy
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0500
     * @tc.desc   snapshot mainWIndow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSnapShotSync_mainWindow_Privacy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testSnapShotSync_mainWindow_Privacy';
      let mainWindow = await windowStage.getMainWindow();
      console.info(`${caseName} Succeeded in creating the mainWindow. Data: ` + JSON.stringify(mainWindow));
      await  sleep(300);
      try {
        await mainWindow.setWindowPrivacyMode(true);
        let pixelMap =  mainWindow.snapshotSync();
        let widthBefore: number = mainWindow.getWindowProperties().windowRect.width;
        let heightBefore: number = mainWindow.getWindowProperties().windowRect.height;
        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
        pixelMap.release();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_subWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0600
     * @tc.desc   snapshot subWIndow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSnapShotSync_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSnapShotSync_subWindow';
      let subWindow = await windowStage.createSubWindow('testSnapShotSync_subWindow');
      console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
      await subWindow.setUIContent('testability/pages/First/index');
      await subWindow.showWindow();
      await  sleep(300);
      try {
        let pixelMap =  subWindow.snapshotSync();
        let widthBefore: number = subWindow.getWindowProperties().windowRect.width;
        let heightBefore: number = subWindow.getWindowProperties().windowRect.height;
        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
        pixelMap.release();
        await subWindow.destroyWindow();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        await subWindow.destroyWindow();
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_subWindow_Privacy
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0700
     * @tc.desc   snapshot testSnapShotSync_subWindow_Privacy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSnapShotSync_subWindow_Privacy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testSnapShotSync_subWindow_Privacy';
      let subWindow = await windowStage.createSubWindow('testSnapShotSync_subWindow_Privacy');
      console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
      await subWindow.setUIContent('testability/pages/First/index');
      await subWindow.showWindow();
      await  sleep(300);
      try {
        await subWindow.setWindowPrivacyMode(true);
        let pixelMap =  subWindow.snapshotSync();
        let widthBefore: number = subWindow.getWindowProperties().windowRect.width;
        let heightBefore: number = subWindow.getWindowProperties().windowRect.height;
        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
        pixelMap.release();
        await subWindow.destroyWindow();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        await subWindow.destroyWindow();
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_dialogWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0800
     * @tc.desc   snapshot testSnapShotSync_dialogWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSnapShotSync_dialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = 'testSnapShotSync_dialogWindow';
      let config : window.Configuration = {
        name: "testSnapShotSync_dialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let dialogWindow = await window.createWindow(config);
      console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(dialogWindow));
      await dialogWindow.setUIContent('testability/pages/First/index');
      await dialogWindow.showWindow();
      await  sleep(300);
      try {
        let pixelMap =  dialogWindow.snapshotSync();
        let widthBefore: number = dialogWindow.getWindowProperties().windowRect.width;
        let heightBefore: number = dialogWindow.getWindowProperties().windowRect.height;
        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
        pixelMap.release();
        await dialogWindow.destroyWindow();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        await dialogWindow.destroyWindow();
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_dialogWindow_Privacy
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0900
     * @tc.desc   snapshot testSnapShotSync_dialogWindow_Privacy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSnapShotSync_dialogWindow_Privacy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSnapShotSync_dialogWindow_Privacy';
      let config : window.Configuration = {
        name: "testSnapShotSync_dialogWindow_Privacy",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let dialogWindow = await window.createWindow(config);
      console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(dialogWindow));
      await dialogWindow.setUIContent('testability/pages/First/index');
      await dialogWindow.showWindow();
      await  sleep(300);
      try {
        await dialogWindow.setWindowPrivacyMode(true);
        let pixelMap =  dialogWindow.snapshotSync();
        let widthBefore: number = dialogWindow.getWindowProperties().windowRect.width;
        let heightBefore: number = dialogWindow.getWindowProperties().windowRect.height;
        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
        pixelMap.release();
        await dialogWindow.destroyWindow();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        await dialogWindow.destroyWindow();
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_floatWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_1000
     * @tc.desc   snapshot testSnapShotSync_floatWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapShotSync_floatWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSnapShotSync_floatWindow';
      let config : window.Configuration = {
        name: "testSnapShotSync_floatWindow",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      try {
      let floatWindow = await window.createWindow(config);
      console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(floatWindow));
      await floatWindow.setUIContent('testability/pages/First/index');
      await floatWindow.showWindow();
      await  sleep(300);

        let pixelMap =  floatWindow.snapshotSync();
        let widthBefore: number = floatWindow.getWindowProperties().windowRect.width;
        let heightBefore: number = floatWindow.getWindowProperties().windowRect.height;
        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
        pixelMap.release();
        await floatWindow.destroyWindow();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else if(exception.code == 1300002){
          expect(exception.message!=null).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.name   testSnapShotSync_floatWindow_Privacy
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_1100
     * @tc.desc   snapshot testSnapShotSync_floatWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapShotSync_floatWindow_Privacy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSnapShotSync_floatWindow_Privacy';
      let config : window.Configuration = {
        name: "testSnapShotSync_floatWindow_Privacy",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context
      };
      try {
        let floatWindow = await window.createWindow(config);
        console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(floatWindow));
        await floatWindow.setUIContent('testability/pages/First/index');
        await floatWindow.showWindow();
        await  sleep(300);
        await floatWindow.setWindowPrivacyMode(true);
        let pixelMap =  floatWindow.snapshotSync();
        let widthBefore: number = floatWindow.getWindowProperties().windowRect.width;
        let heightBefore: number = floatWindow.getWindowProperties().windowRect.height;
        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
        expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
        expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
        pixelMap.release();
        await floatWindow.destroyWindow();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done()
        }else if(exception.code == 1300002){
          expect(exception.message!=null).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    })

      /**
       * @tc.name   testOnFrameMetricsMeasuredCallbackwithUECSubWindow
       * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRIC_MEASURED_0500
       * @tc.desc   testOnFrameMetricsMeasuredCallbackwithUECSubWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testOnFrameMetricsMeasuredCallbackwithUECSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testOnFrameMetricsMeasuredCallbackwithUECSubWindow';
        let driver = Driver.create();
        await sleep(2000)
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        let windowClass: window.Window | undefined;
        try {
          windowClass = await windowStage.createSubWindow('testOnFrameMetricsMeasuredCallbackwithUECSubWindow');
          await windowClass.setUIContent('testability/pages/WindowTest/EmbeddedComponentPage');
          await sleep(2000);

          let btn = await driver.findComponent(ON.id('Button'));
          console.log(caseName + ' btn1 : ' + btn);
          if (btn == undefined) {
            console.log(caseName + 'device not support')
            done()
          } else {
            await btn.click();
            await sleep(1000);
            let btn2 = await driver.findComponent(ON.id('HelloWorld'));
            let txt = await btn2.getText();
            console.log(caseName + ' btn2 : ' + txt);
            expect(txt == 'true').assertTrue();
            const callback1 = async (res: window.FrameMetrics) => {
              console.log(`${caseName} callback1 res: ${JSON.stringify(res)}`);
              expect(res.firstDrawFrame).assertEqual(false);
              expect(res.vsyncTimestamp).assertLarger(0);
              expect(res.inputHandlingDuration).assertLarger(0);
              windowClass?.off('frameMetricsMeasured');
              await windowClass?.destroyWindow()
              done();
            }
            windowClass.on('frameMetricsMeasured', callback1);
            let windowProperties = windowClass.getWindowProperties();
            console.log(`${caseName} windowProperties: ${JSON.stringify(windowProperties)}`);
            let dragFromX = Math.round(windowProperties.windowRect.width/4 +windowProperties.windowRect.left);
            console.log(`${caseName} dragFromX: ${JSON.stringify(dragFromX)}`);
            let dragToX = Math.round(windowProperties.windowRect.width/2 +windowProperties.windowRect.left);
            console.log(`${caseName} dragToX: ${JSON.stringify(dragToX)}`);
            let dragFromY = Math.round(windowProperties.windowRect.height/4 +windowProperties.windowRect.top);
            console.log(`${caseName} dragFromY: ${JSON.stringify(dragFromY)}`);
            let dragToY = Math.round(windowProperties.windowRect.height/2 +windowProperties.windowRect.top);
            console.log(`${caseName} dragToY: ${JSON.stringify(dragToY)}`);
            await driver.drag(dragFromX, dragFromY, dragToX, dragToY);
            await sleep(3000)
          }
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          await windowClass?.destroyWindow()
          if(!canIUseRes){
            expect(exception.code).assertEqual(801)
          }else {
            expect().assertFail();
          }
          done();
        }

      })

      /**
       * @tc.name   testOnFrameMetricsMeasuredErrorcode
       * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRIC_MEASURED_0100
       * @tc.desc   testOnFrameMetricsMeasuredErrorcode
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('testOnFrameMetricsMeasuredErrorcode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'testOnFrameMetricsMeasuredErrorcode';
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        let subWindowClass = await windowStage.createSubWindow('testOnFrameMetricsMeasuredErrorcode');
        await subWindowClass.destroyWindow();
        const callback = (res: window.FrameMetrics) => {
          console.log(`${caseName} callback res: ${JSON.stringify(res)}`);
        }
        try {
          subWindowClass.on('frameMetricsMeasured', callback)
          done();
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300002);
        }
        try {
          subWindowClass.off('frameMetricsMeasured', callback)
          done();
        } catch (exception) {
          console.error(`${caseName} Error2. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300002);
          done();
        }
      })

      /**
       * @tc.name   testOnFrameMetricsMeasuredCallbackwithMainWindow
       * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRIC_MEASURED_0200
       * @tc.desc   testOnFrameMetricsMeasuredCallbackwithMainWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testOnFrameMetricsMeasuredCallbackwithMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testOnFrameMetricsMeasuredCallbackwithMainWindow';
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        let windowClass = windowStage.getMainWindowSync()
        try {
          let callbackIndex1 = 0;
          let callbackIndex2 = 0;
          const callback1 = (res: window.FrameMetrics) => {
            console.log(`${caseName} callback1 res: ${JSON.stringify(res)}`);
            callbackIndex1++;
          }
          const callback2 = (res: window.FrameMetrics) => {
            console.log(`${caseName} callback2 res: ${JSON.stringify(res)}`);
            callbackIndex2++;
          }
          windowClass.on('frameMetricsMeasured', callback1);
          let windowProperties = windowClass.getWindowProperties();
          console.log(`${caseName} windowProperties: ${JSON.stringify(windowProperties)}`);
          let driver: Driver = Driver.create();
          let dragFromX = Math.round(windowProperties.windowRect.width/4 +windowProperties.windowRect.left);
          console.log(`${caseName} dragFromX: ${JSON.stringify(dragFromX)}`);
          let dragToX = Math.round(windowProperties.windowRect.width/2 +windowProperties.windowRect.left);
          console.log(`${caseName} dragToX: ${JSON.stringify(dragToX)}`);
          let dragFromY = Math.round(windowProperties.windowRect.height/4 +windowProperties.windowRect.top);
          console.log(`${caseName} dragFromY: ${JSON.stringify(dragFromY)}`);
          let dragToY = Math.round(windowProperties.windowRect.height/2 +windowProperties.windowRect.top);
          console.log(`${caseName} dragToY: ${JSON.stringify(dragToY)}`);
          await driver.drag(dragFromX, dragFromY, dragToX, dragToY);
          await sleep(3000);
          expect(callbackIndex1).assertLarger(0)
          callbackIndex1 = 0;
          windowClass.on('frameMetricsMeasured', callback2);
          await driver.drag(dragFromX, dragFromY, dragToX, dragToY);
          await sleep(3000);
          expect(callbackIndex1).assertLarger(0);
          expect(callbackIndex2).assertLarger(0);
          windowClass.off('frameMetricsMeasured', callback1);
          callbackIndex1 = 0;
          callbackIndex2 = 0;
          await driver.drag(dragFromX, dragFromY, dragToX, dragToY);
          await sleep(3000);
          expect(callbackIndex1).assertEqual(0);
          expect(callbackIndex2).assertLarger(0);
          callbackIndex1 = 0;
          callbackIndex2 = 0;
          windowClass.off('frameMetricsMeasured');
          await driver.drag(dragFromX, dragFromY, dragToX, dragToY);
          await sleep(3000);
          expect(callbackIndex1).assertEqual(0);
          expect(callbackIndex2).assertEqual(0);
          done();
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          if(!canIUseRes){
            expect(exception.code).assertEqual(801)
          }else {
            expect().assertFail();
          }
          done();
        }

      })

      /**
       * @tc.name   testOnFrameMetricsMeasuredCallbackwithSubWindow
       * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRIC_MEASURED_0300
       * @tc.desc   testOnFrameMetricsMeasuredCallbackwithSubWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testOnFrameMetricsMeasuredCallbackwithSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testOnFrameMetricsMeasuredCallbackwithSubWindow';
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        let windowClass: window.Window | undefined;
        try {
          windowClass = await windowStage.createSubWindow('testOnFrameMetricsMeasuredCallbackwithSubWindow');
          await windowClass.setUIContent('testability/pages/First/index2');
          await windowClass.showWindow();
          await sleep(1000)
          const callback1 = async (res: window.FrameMetrics) => {
            console.log(`${caseName} callback1 res: ${JSON.stringify(res)}`);
            expect(res.firstDrawFrame).assertEqual(false);
            expect(res.vsyncTimestamp).assertLarger(0);
            expect(res.inputHandlingDuration).assertLarger(0);
            expect(res.layoutMeasureDuration).assertLarger(0);
            windowClass?.off('frameMetricsMeasured');
            await windowClass?.destroyWindow()
            done();
          }
          windowClass.on('frameMetricsMeasured', callback1);
          let windowProperties = windowClass.getWindowProperties();
          console.log(`${caseName} windowProperties: ${JSON.stringify(windowProperties)}`);
          let driver: Driver = Driver.create();
          let dragFromX = Math.round(windowProperties.windowRect.width/4 +windowProperties.windowRect.left);
          console.log(`${caseName} dragFromX: ${JSON.stringify(dragFromX)}`);
          let dragToX = Math.round(windowProperties.windowRect.width/2 +windowProperties.windowRect.left);
          console.log(`${caseName} dragToX: ${JSON.stringify(dragToX)}`);
          let dragFromY = Math.round(windowProperties.windowRect.height/4 +windowProperties.windowRect.top);
          console.log(`${caseName} dragFromY: ${JSON.stringify(dragFromY)}`);
          let dragToY = Math.round(windowProperties.windowRect.height/2 +windowProperties.windowRect.top);
          console.log(`${caseName} dragToY: ${JSON.stringify(dragToY)}`);
          await driver.drag(dragFromX, dragFromY, dragToX, dragToY);
          await sleep(3000)
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          await windowClass?.destroyWindow()
          if(!canIUseRes){
            expect(exception.code).assertEqual(801)
          }else {
            expect().assertFail();
          }
          done();
        }

      })

      /**
       * @tc.name   testOnFrameMetricsMeasuredwithSetBackgroundColor
       * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRIC_MEASURED_0600
       * @tc.desc   testOnFrameMetricsMeasuredwithSetBackgroundColor
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testOnFrameMetricsMeasuredwithSetBackgroundColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testOnFrameMetricsMeasuredwithSetBackgroundColor';
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        let windowClass = windowStage.getMainWindowSync()
        try {
          let callbackIndex = 0;
          const callback1 = async (res: window.FrameMetrics) => {
            console.log(`${caseName} callback1 res: ${JSON.stringify(res)}`);
            callbackIndex = callbackIndex + 1;
            console.log(`${caseName} callback1 callbackIndex: ${JSON.stringify(callbackIndex)}`);
            expect(res.firstDrawFrame).assertEqual(false);
            expect(res.vsyncTimestamp).assertLarger(0);
            expect(res.inputHandlingDuration).assertLarger(0);
          }
          windowClass.on('frameMetricsMeasured', callback1);
          windowClass.setBackgroundColor("#008000");
          await sleep(3000);
          console.log(`${caseName}  callbackIndex 1: ${JSON.stringify(callbackIndex)}`);
          expect(callbackIndex).assertLarger(0)
          callbackIndex = 0;
          windowStage.setCustomDensity(2.0);
          await sleep(3000);
          console.log(`${caseName}  callbackIndex 2: ${JSON.stringify(callbackIndex)}`);
          expect(callbackIndex).assertLarger(0)
          callbackIndex = 0;
          windowClass?.off('frameMetricsMeasured');
          windowClass.setBackgroundColor("#FEFEFE");
          await sleep(1000);
          console.log(`${caseName}  callbackIndex 3: ${JSON.stringify(callbackIndex)}`);
          expect(callbackIndex).assertEqual(0)
          windowStage.setCustomDensity(-1.0);
          await sleep(1000);
          console.log(`${caseName}  callbackIndex 4: ${JSON.stringify(callbackIndex)}`);
          expect(callbackIndex).assertEqual(0)
          await windowClass?.destroyWindow()
          done();
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          await windowClass?.destroyWindow()
          if(!canIUseRes){
            expect(exception.code).assertEqual(801)
          }else {
            expect().assertFail();
          }
          done();
        }

      })
      /**
       * @tc.name   testOnFrameMetricsMeasuredCallbackwithDialogWindow
       * @tc.number SUB_BASIC_WMS_FUNCTION_FRAMEMETRIC_MEASURED_0400
       * @tc.desc   testOnFrameMetricsMeasuredCallbackwithDialogWindow
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('testOnFrameMetricsMeasuredCallbackwithDialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = 'testOnFrameMetricsMeasuredCallbackwithDialogWindow';
        let driver: Driver = Driver.create();
        await sleep(2000)
        let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
        console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
        let windowClass: window.Window | undefined;
        let config: window.Configuration = {
          name: "testOnFrameMetricsMeasuredCallbackwithDialogWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        try {
          windowClass = await window.createWindow(config);
          await windowClass.setUIContent('testability/pages/First/index2');
          await windowClass.showWindow();
          await sleep(1000)
          const callback1 = async (res: window.FrameMetrics) => {
            console.log(`${caseName} callback1 res: ${JSON.stringify(res)}`);
            expect(res.firstDrawFrame).assertEqual(false);
            expect(res.vsyncTimestamp).assertLarger(0);
            expect(res.inputHandlingDuration).assertLarger(0);
            windowClass?.off('frameMetricsMeasured');
            await windowClass?.destroyWindow()
            done();
          }
          windowClass.on('frameMetricsMeasured', callback1);
          let windowProperties = windowClass.getWindowProperties();
          console.log(`${caseName} windowProperties: ${JSON.stringify(windowProperties)}`);
          let dragFromX = Math.round(windowProperties.windowRect.width/4 +windowProperties.windowRect.left);
          console.log(`${caseName} dragFromX: ${JSON.stringify(dragFromX)}`);
          let dragToX = Math.round(windowProperties.windowRect.width/2 +windowProperties.windowRect.left);
          console.log(`${caseName} dragToX: ${JSON.stringify(dragToX)}`);
          let dragFromY = Math.round(windowProperties.windowRect.height/4 +windowProperties.windowRect.top);
          console.log(`${caseName} dragFromY: ${JSON.stringify(dragFromY)}`);
          let dragToY = Math.round(windowProperties.windowRect.height/2 +windowProperties.windowRect.top);
          console.log(`${caseName} dragToY: ${JSON.stringify(dragToY)}`);
          await driver.drag(dragFromX, dragFromY, dragToX, dragToY);
          await sleep(3000)
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          await windowClass?.destroyWindow()
          if(!canIUseRes){
            expect(exception.code).assertEqual(801)
          }else {
            expect().assertFail();
          }
          done();
        }
      })



    })
}

