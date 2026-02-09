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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import settings from '@ohos.settings';


export default function windowZindexTest() {
  describe('windowZindexTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    let isFreeWindowMode = false;
    let driver: Driver;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
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
      driver = Driver.create();
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
     * @tc.name   test_raiseToAppTop_mainWindow
     * @tc.number SUB_BASIC_WMS_RAISETOAPPTOP_0100
     * @tc.desc   test_raiseToAppTop_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_raiseToAppTop_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_raiseToAppTop_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = await windowStage.getMainWindow();
      try {
        mainWindow.raiseToAppTop((err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr+` Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
            if(errCode == 1300009){
              
              done();
            }else if(errCode == 801){
              done();
            }
            else {
              expect(false).assertTrue();
              done();
            }
          }else {
            console.info(msgStr+'Succeeded in raising the window to app top.');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (exception) {
        console.error(msgStr+ 'Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_raiseToAppTop_subWindowDestroy
     * @tc.number SUB_BASIC_WMS_RAISETOAPPTOP_0200
     * @tc.desc   test_raiseToAppTop_subWindowDestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_raiseToAppTop_subWindowDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_raiseToAppTop_subWindowDestroy';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let promise = windowStage.createSubWindow("test_raiseToAppTop_subWindowDestroy");
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow = data;
          await subWindow.destroyWindow();
          let promise1 = subWindow.raiseToAppTop();
          promise1.then(async () => {
            console.info(msgStr + 'Succeeded in raising the window to app top.');
            await subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
            if(err.code = 801){
              done();
            }else {
              expect(err.code).assertEqual(1300002);
              done();
            }

          });
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
            done();

        });
      } catch (exception) {
        console.error(msgStr + ' Failed   Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_raiseToAppTop_Two_subWindow_normal
     * @tc.number SUB_BASIC_WMS_RAISETOAPPTOP_0300
     * @tc.desc   test_raiseToAppTop_Two_subWindow_normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_raiseToAppTop_Two_subWindow_normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_raiseToAppTop_Two_subWindow_normal';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = windowStage.getMainWindowSync();
      let storage: LocalStorage = new LocalStorage();
      try {
        let promise = windowStage.createSubWindow("test1_raiseToAppTop_Two_subWindow_normal");
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow1. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow1 = data;
          subWindow1.resize(800, 1000);
          subWindow1.loadContent('testability/pages/First/index2', storage);
          await subWindow1.showWindow();
          console.log(msgStr + 'windowStage.show SubWindow1 success');
          let options : window.SubWindowOptions = {
            title: 'title',
            decorEnabled: true,
            isModal: false
          };
          let promise2 = windowStage.createSubWindow("test2_raiseToAppTop_Two_subWindow_normal");
          promise2.then(async (data) => {
            if (data == null) {
              console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
              expect(false).assertTrue();
              done();
            }
            let subWindow2 = data;
            subWindow2.resize(1000, 1000);
            subWindow2.loadContent('testability/pages/First/index3', storage);
            await subWindow2.showWindow();
            console.log(msgStr + 'windowStage.show SubWindow2 success');
            await sleep(100);
            let promise4 = subWindow1.raiseToAppTop();
            promise4.then(async () => {
              console.info(msgStr + 'Succeeded in raising the window to app top.');
              let lastWindowClass = await window.getLastWindow(context);
              let properties = lastWindowClass.getWindowProperties();
              console.log(msgStr + 'properties:'+JSON.stringify(properties));
              expect(properties.windowRect.height).assertEqual(1000);
              expect(properties.windowRect.width).assertEqual(800);
              await subWindow1.destroyWindow();
              await subWindow2.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
              await subWindow1.destroyWindow();
              await subWindow2.destroyWindow();
              if(err.code == 801){
                done()
              }else {
                expect(false).assertTrue();
                done();
              }

            });
          }).catch((err: BusinessError) => {
            console.error(msgStr +` Failed to create the subwindow2. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch((err: BusinessError) => {
          console.error(msgStr +` Failed to create the subwindow1. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });;
      } catch (exception) {
        console.error(msgStr + ' Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   test_setRaiseByClickEnabled_mainWindow
     * @tc.number SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0100
     * @tc.desc   test_setRaiseByClickEnabled_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setRaiseByClickEnabled_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = await windowStage.getMainWindow();
      try {
        mainWindow.setRaiseByClickEnabled(true,(err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr+` Failed to setRaiseByClickEnabled the window to app top. Cause code: ${err.code}, message: ${err.message}`);
            if(errCode == 801){
              done();
            }else if(errCode == 1300009){
              done();
            }
            else {
              expect(false).assertTrue();
              done();
            }
          }else {
            console.info(msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_setRaiseByClickEnabled_subWindowDestroy
     * @tc.number SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0200
     * @tc.desc   test_setRaiseByClickEnabled_subWindowDestroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setRaiseByClickEnabled_subWindowDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_subWindowDestroy';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let promise = windowStage.createSubWindow("test_setRaiseByClickEnabled_subWindowDestroy");
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow = data;
          await subWindow.destroyWindow();
          let promise = subWindow.setRaiseByClickEnabled(false);
          promise.then(async () => {
            console.info(msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
            await subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to setRaiseByClickEnabled the window to app top. Cause code: ${err.code}, message: ${err.message}`);
            if(err.code = 801){
              done();
            }else if(err.code = 1300002){
              done();
            }else {
              expect(false).assertTrue();
              done();
            }

          });
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed . Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick
     * @tc.number SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0300
     * @tc.desc   test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let minWidth = 0;
      let minHeight = 0;
      let windowClass = windowStage.getMainWindowSync();
      let storage: LocalStorage = new LocalStorage();
      try {
        let promise = windowStage.createSubWindow("test1_setRaiseByClickEnabled_Two_subWindow_RaiseByClick");
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow1. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow1 = data;
          minWidth = Number(subWindow1.getWindowLimits().minWidth);
          minHeight = Number(subWindow1.getWindowLimits().minHeight);
          console.log('subWindow WindowLimits:' + minWidth +' '+ minHeight);
          subWindow1.resizeAsync(minWidth+200, minHeight+200);
          subWindow1.loadContent('testability/pages/First/index2', storage);
          await subWindow1.showWindow();
          console.log(msgStr + 'windowStage.show SubWindow1 success');
          let promise2 = windowStage.createSubWindow("test2_setRaiseByClickEnabled_Two_subWindow_RaiseByClick");
          promise2.then(async (data) => {
            if (data == null) {
              console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
              expect(false).assertTrue();
              done();
            }
            let subWindow2 = data;
            subWindow2.resizeAsync(minWidth+100, minHeight+100);
            subWindow2.loadContent('testability/pages/First/index3', storage);
            await subWindow2.showWindow();
            console.log(msgStr + 'windowStage.show SubWindow2 success');
            await sleep(100);
            let promise4 = subWindow1.setRaiseByClickEnabled(true);
            promise4.then(async () => {
              console.info(msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
              await driver.click(minWidth+150, minHeight+150);
              let lastWindowClass = await window.getLastWindow(context);
              let properties = lastWindowClass.getWindowProperties();
              console.log(msgStr + 'properties:'+JSON.stringify(properties));
              expect(properties.windowRect.width).assertEqual(minWidth+200);
              expect(properties.windowRect.height).assertEqual(minHeight+200);
              await subWindow1.destroyWindow();
              await subWindow2.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
              if(err.code = 801){
                done();
                await subWindow1.destroyWindow();
                await subWindow2.destroyWindow();
              }else {
                expect(false).assertTrue();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow2: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch(async (err: BusinessError) => {
          if(err.code == 801){
            console.log(msgStr + `getWindowLimits 当前设备类型不支持系统能力SystemCapability.Window.SessionManager, message: ${err.message}`);
            done();
          }else{
            console.error(msgStr + `Failed to create the subwindow1: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
          
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick
     * @tc.number SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0400
     * @tc.desc   test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let minWidth = 0;
      let minHeight = 0;
      let windowClass = windowStage.getMainWindowSync();
      let storage: LocalStorage = new LocalStorage();
      try {
        let promise = windowStage.createSubWindow("test1_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick");
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow1. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow1 = data;
          minWidth = Number(subWindow1.getWindowLimits().minWidth);
          minHeight = Number(subWindow1.getWindowLimits().minHeight);
          console.log('subWindow WindowLimits:' + minWidth +' '+ minHeight);
          subWindow1.resizeAsync(minWidth+200, minHeight+200);
          subWindow1.loadContent('testability/pages/First/index2', storage);
          await subWindow1.showWindow();
          console.log(msgStr + 'windowStage.show SubWindow1 success');
          let promise2 = windowStage.createSubWindow("test2_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick");
          promise2.then(async (data) => {
            if (data == null) {
              console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
              expect(false).assertTrue();
              done();
            }
            let subWindow2 = data;
            subWindow2.resizeAsync(minWidth+100, minHeight+100);
            subWindow2.loadContent('testability/pages/First/index3', storage);
            await subWindow2.showWindow();
            console.log(msgStr + 'windowStage.show SubWindow2 success');
            await sleep(100);
            let promise4 = subWindow1.setRaiseByClickEnabled(false);
            promise4.then(async () => {
              console.info(msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
              await driver.click(minWidth+150, minHeight+150);
              let lastWindowClass = await window.getLastWindow(context);
              let properties = lastWindowClass.getWindowProperties();
              console.log(msgStr + 'properties:'+JSON.stringify(properties));
              expect(properties.windowRect.width).assertEqual(minWidth+100);
              expect(properties.windowRect.height).assertEqual(minHeight+100);
              await subWindow1.destroyWindow();
              await subWindow2.destroyWindow();
              done();
            }).catch(async (err: BusinessError) => {
              console.error(msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
              if(err.code = 801){
                done();
                await subWindow1.destroyWindow();
                await subWindow2.destroyWindow();
              }else {
                expect(false).assertTrue();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow2: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch(async (err: BusinessError) => {
          
          if(err.code == 801){
            console.log(msgStr + `getWindowLimits 当前设备类型不支持系统能力SystemCapability.Window.SessionManager, message: ${err.message}`);
            done();
          }else{
            console.error(msgStr + `Failed to create the subwindow1: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
          }
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
          
      }
    });

    /**
     * @tc.name   test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop
     * @tc.number SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0500
     * @tc.desc   test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = windowStage.getMainWindowSync();
      let storage: LocalStorage = new LocalStorage();
      try {
        let promise = windowStage.createSubWindow("test1_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop");
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow1. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow1 = data;
          subWindow1.resize(1500, 1500);
          subWindow1.loadContent('testability/pages/First/index2', storage);
          await subWindow1.showWindow();
          console.log(msgStr + 'windowStage.show SubWindow1 success');
          let promise2 = windowStage.createSubWindow("test2_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop");
          promise2.then(async (data) => {
            if (data == null) {
              console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
              expect(false).assertTrue();
              done();
            }
            let subWindow2 = data;
            subWindow2.resize(500, 500);
            subWindow2.loadContent('testability/pages/First/index3', storage);
            await subWindow2.showWindow();
            console.log(msgStr + 'windowStage.show SubWindow2 success');
            await sleep(100);
            let promise3 = subWindow1.setRaiseByClickEnabled(true);
            promise3.then(async () => {
              console.info(msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
              let promise4 = subWindow1.raiseToAppTop();
              promise4.then(async () => {
                console.info(msgStr + 'Succeeded in raising the window to app top.');
                let lastWindowClass = await window.getLastWindow(context);
                let properties = lastWindowClass.getWindowProperties();
                console.log(msgStr + 'properties:'+JSON.stringify(properties));
                expect(properties.windowRect.width).assertEqual(1500);
                expect(properties.windowRect.height).assertEqual(1500);
                await subWindow1.destroyWindow();
                await subWindow2.destroyWindow();
                done();
              }).catch((err: BusinessError) => {
                console.error(msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
                if(err.code == 801){
                  done()
                }else {
                  expect(false).assertTrue();
                  done();
                }
              });
            }).catch(async (err: BusinessError) => {
              console.error(msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
              if(err.code = 801){
                done();
                await subWindow1.destroyWindow();
                await subWindow2.destroyWindow();
              }else {
                expect(false).assertTrue();
                done();
              }
            });

          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow2: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow1: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(msgStr +' Failed to   Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_setRaiseByClickEnabled_Two_subWindow_NoRaiseBy_raiseToAppTop
     * @tc.number SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0600
     * @tc.desc   test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_NoRaiseBy_raiseToAppTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_Two_subWindow_NoRaiseBy_raiseToAppTop';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let storage: LocalStorage = new LocalStorage();
      try {
        let promise = windowStage.createSubWindow("test1_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop_false");
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow1. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow1 = data;
          subWindow1.resize(1500, 1500);
          subWindow1.loadContent('testability/pages/First/index2', storage);
          await subWindow1.showWindow();
          console.log(msgStr + 'windowStage.show SubWindow1 success');
          let promise2 = windowStage.createSubWindow("test2_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop_false");
          promise2.then(async (data) => {
            if (data == null) {
              console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
              expect(false).assertTrue();
              done();
            }
            let subWindow2 = data;
            subWindow2.resize(500, 500);
            subWindow2.loadContent('testability/pages/First/index3', storage);
            await subWindow2.showWindow();
            console.log(msgStr + 'windowStage.show SubWindow2 success');
            await sleep(100);
            let promise3 = subWindow1.setRaiseByClickEnabled(false);
            promise3.then(async () => {
              console.info(msgStr + 'Succeeded in setRaiseByClickEnabled the window to app top.');
              let promise4 = subWindow1.raiseToAppTop();
              promise4.then(async () => {
                console.info(msgStr + 'Succeeded in raising the window to app top.');
                let lastWindowClass = await window.getLastWindow(context);
                let properties = lastWindowClass.getWindowProperties();
                console.log(msgStr + 'properties:'+JSON.stringify(properties));
                expect(properties.windowRect.width).assertEqual(1500);
                expect(properties.windowRect.height).assertEqual(1500);
                await subWindow1.destroyWindow();
                await subWindow2.destroyWindow();
                done();
              }).catch((err: BusinessError) => {
                console.error(msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
                if(err.code == 801){
                  done()
                }else {
                  expect(false).assertTrue();
                  done();
                }
              });
            }).catch(async (err: BusinessError) => {
              console.error(msgStr + `Failed to raise the window to app top. Cause code: ${err.code}, message: ${err.message}`);
              if(err.code = 801){
                done();
                await subWindow1.destroyWindow();
                await subWindow2.destroyWindow();
              }else {
                expect(false).assertTrue();
                done();
              }
            });
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow2: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          });
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow1: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(msgStr + ' Failed  Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_shiftAppWindowPointerEvent_null
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0100
     * @tc.desc   test_shiftAppWindowPointerEvent_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_shiftAppWindowPointerEvent_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_null';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try{
        let promise = window.shiftAppWindowPointerEvent(null,null);
        promise.then(() => {
          console.info(caseName+ ' Succeeded in shifting app window pointer event');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          done();
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_shiftAppWindowPointerEvent_undifined
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0200
     * @tc.desc   test_shiftAppWindowPointerEvent_undifined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_shiftAppWindowPointerEvent_undifined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_undifined';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try{
        let promise = window.shiftAppWindowPointerEvent(undefined,undefined);
        promise.then(() => {
          console.info(caseName+ ' Succeeded in shifting app window pointer event');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else{
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          done();
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_shiftAppWindowPointerEvent_window_destroyed
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0300
     * @tc.desc   test_shiftAppWindowPointerEvent_window_destroyed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_shiftAppWindowPointerEvent_window_destroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_window_destroyed';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        let promise1 = windowStage.createSubWindow('test_shiftAppWindowPointerEvent_window_destroyed');
        promise1.then(async (data) => {
          let subWindowClass = data;
          console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          let subWindowId = subWindowClass.getWindowProperties().id;
          let mainWindowId = mainWindow.getWindowProperties().id;
          console.info(caseName+ ' subWindowId: ' + JSON.stringify(subWindowId) +','+' mainWindowId: ' + JSON.stringify(mainWindowId) );
          await subWindowClass.destroyWindow();
          let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,subWindowId);
          promise2.then(() => {
            console.info(caseName+ ' Succeeded in shifting app window pointer event');
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
            if(err.code == 801){
              done();
            }else if(err.code == 1300002){
              
              done();
            } else{
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          done();
        }else{
          expect().assertFail();
          done();
        }
      }
    });
    /**
     * @tc.name   test_shiftAppWindowPointerEvent_Dialog_window
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0400
     * @tc.desc   test_shiftAppWindowPointerEvent_Dialog_window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_shiftAppWindowPointerEvent_Dialog_window', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_Dialog_window';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        let config: window.Configuration = {
          name: "test",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context,
          decorEnabled:true,
          title:'dialog Window'
        };
        let promise1 = window.createWindow(config);
        promise1.then(async (data) => {
          let dialogWindowClass = data;
          console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await dialogWindowClass.setUIContent('testability/pages/First/index2');
          await dialogWindowClass.showWindow();
          await sleep(1000)
          let dialogWindowId = dialogWindowClass.getWindowProperties().id;
          let mainWindowId = mainWindow.getWindowProperties().id;
          console.info(caseName+ ' dialogWindowId: ' + JSON.stringify(dialogWindowId) +','+' mainWIndowId: ' + JSON.stringify(mainWindowId) );
          let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,dialogWindowId);
          promise2.then(() => {
            console.info(caseName+ ' Succeeded in shifting app window pointer event');
            expect().assertFail();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
            await dialogWindowClass.destroyWindow();
            if(err.code == 801){
              done();
            }else if(err.code == 1300004){
              
              done();
            } else{
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the dialogwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          done();
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_shiftAppWindowPointerEvent_Subwindow_1300004
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0500
     * @tc.desc   test_shiftAppWindowPointerEvent_Subwindow_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_shiftAppWindowPointerEvent_Subwindow_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_Subwindow_1300004';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        let options : window.SubWindowOptions = {
          title: 'test_shiftAppWindowPointerEvent_Subwindow_1300004',
          decorEnabled: true,
          isModal: false
        };
        let promise1 = windowStage.createSubWindowWithOptions('test_shiftAppWindowPointerEvent_Subwindow_1300004', options);
        promise1.then(async (data) => {
          let subWindowClass = data;
          console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.setUIContent('testability/pages/shiftAppWindow/subWindow');
          await subWindowClass.showWindow();
          let subWindowId = subWindowClass.getWindowProperties().id;
          let mainWindowId = mainWindow.getWindowProperties().id;
          console.info(caseName+ ' subWindowId: ' + JSON.stringify(subWindowId) +','+' mainWIndowId: ' + JSON.stringify(mainWindowId) );
          let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,subWindowId);
          promise2.then(async () => {
            console.info(caseName+ ' Succeeded in shifting app window pointer event');
            await subWindowClass.destroyWindow();
            
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
            await subWindowClass.destroyWindow();
            if(err.code == 801 || 1300004){
              done();
            }else{
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 1300002){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_shiftAppWindowPointerEvent_subWindow_to_mainwindow
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0600
     * @tc.desc   test_shiftAppWindowPointerEvent_subWindow_to_mainwindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_shiftAppWindowPointerEvent_subWindow_to_mainwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_subWindow_to_mainwindow';
      console.log(caseName + 'begin');
      if(isFreeWindowMode == true){
        let mainWindow = windowStage.getMainWindowSync();
      try{
        let options : window.SubWindowOptions = {
          title: 'test_shiftAppWindowPointerEvent_subWindow_to_mainwindow',
          decorEnabled: true,
          isModal: false
        };
        let promise1 = windowStage.createSubWindowWithOptions('test_shiftAppWindowPointerEvent_subWindow_to_mainwindow', options);
        promise1.then(async (data) => {
          let subWindowClass = data;
          console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate('subWindowClass',subWindowClass);
          await subWindowClass.setUIContent('testability/pages/shiftAppWindow/subWindow');
          await mainWindow.setUIContent('testability/pages/shiftAppWindow/mainWindow');
          await sleep(300);
          let windowLimits = subWindowClass.getWindowLimits();
          console.log(caseName+' '+JSON.stringify(windowLimits));
          if(windowLimits.minWidth!=undefined && windowLimits.minHeight !=undefined){
            await subWindowClass.resize(windowLimits.minWidth+200,windowLimits.minHeight+200);
            await subWindowClass.showWindow();
            let button = await driver.findComponent(ON.id('subWindow'));
            await sleep(100);
            let point = await button.getBoundsCenter();
            console.log(caseName+' point:'+JSON.stringify(point));
            await driver.mouseMoveTo({x:point.x, y:point.y});
            await sleep(500);
            await driver.mouseDrag({x:point.x, y:point.y},{x:point.x+50, y:point.y+50},200);
            console.log(caseName+' mouseDrag success');
            await sleep(2000);
            let isFoucus = mainWindow.isFocused();
            console.log(caseName+' mainWindow isFocused: '+ isFoucus);
            await mainWindow.setUIContent('testability/pages/Index');
            await subWindowClass.destroyWindow();
            expect(isFoucus).assertTrue();
            done();
          }else{
            await subWindowClass.destroyWindow();
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 1300002 || err.code == 801){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
      }else{
        done();
      }
      
    });
    /**
     * @tc.name   test_shiftAppWindowPointerEvent_mainwindow_to_subWindow
     * @tc.number SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0700
     * @tc.desc   test_shiftAppWindowPointerEvent_mainwindow_to_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_shiftAppWindowPointerEvent_mainwindow_to_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_mainwindow_to_subWindow';
      console.log(caseName + 'begin');
      if(isFreeWindowMode == true){
        let mainWindow = windowStage.getMainWindowSync();
      try{
        let options : window.SubWindowOptions = {
          title: 'test_shiftAppWindowPointerEvent_mainwindow_to_subWindow',
          decorEnabled: true,
          isModal: false
        };
        let promise1 = windowStage.createSubWindowWithOptions('test_shiftAppWindowPointerEvent_mainwindow_to_subWindow', options);
        promise1.then(async (data) => {
          let subWindowClass = data;
          console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          AppStorage.setOrCreate('subWindowClass',subWindowClass);
          await subWindowClass.setUIContent('testability/pages/shiftAppWindow/subWindow');
          await mainWindow.setUIContent('testability/pages/shiftAppWindow/mainWindow');
          await sleep(300);
          let windowLimits = subWindowClass.getWindowLimits();
          console.log(caseName+' '+JSON.stringify(windowLimits));
          if(windowLimits.minWidth!=undefined && windowLimits.minHeight !=undefined){
            await subWindowClass.resize(windowLimits.minWidth+200,windowLimits.minHeight+200);
            await subWindowClass.showWindow();
            await mainWindow.showWindow();
            let button = await driver.findComponent(ON.id('mainWindow'));
            await sleep(300);
            let point = await button.getBoundsCenter();
            console.log(caseName+' point:'+JSON.stringify(point));
            await driver.mouseMoveTo({x:point.x, y:point.y});
            await sleep(500);
            await driver.mouseDrag({x:point.x, y:point.y},{x:point.x+50, y:point.y+50},200);
            console.log(caseName+' mouseDrag success');
            await sleep(2000);
            let isFoucus = subWindowClass.isFocused();
            console.log(caseName+' subWindowClass isFocused: '+ isFoucus);
            await subWindowClass.destroyWindow();
            await mainWindow.setUIContent('testability/pages/Index');
            expect(isFoucus).assertTrue();
            done();
          }else{
            await subWindowClass.destroyWindow();
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 1300002 || err.code == 801){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
      }else{
        done();
      }
      
    });
    /**
     * @tc.name   test_SetWindowDelayRaiseOnDrag_401
     * @tc.number SUB_BASIC_WMS_SetWindowDelayRaiseOnDrag_0100
     * @tc.desc   test_SetWindowDelayRaiseOnDrag_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowDelayRaiseOnDrag_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_SetWindowDelayRaiseOnDrag_401';
      console.log(caseName + 'begin');
      let windowClass = windowStage.getMainWindowSync();
      try{
        windowClass.setWindowDelayRaiseOnDrag(null);
        console.log(`${caseName} :setWindowDelayRaiseOnDrag success`);
        expect().assertFail();
        done();
      }catch(err){
        console.log(`${caseName} :setWindowDelayRaiseOnDrag fail:`+err.code);
        if(err.code == 801){
          done();
        }else{
          expect(err.code).assertEqual(401);
          done();
        }
      }
    });
    /**
     * @tc.name   test_SetWindowDelayRaiseOnDrag_1300002
     * @tc.number SUB_BASIC_WMS_SetWindowDelayRaiseOnDrag_0200
     * @tc.desc   test_SetWindowDelayRaiseOnDrag_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowDelayRaiseOnDrag_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_SetWindowDelayRaiseOnDrag_1300002';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_SetWindowDelayRaiseOnDrag_1300002');
      try{
        await windowClass.destroyWindow();
        windowClass.setWindowDelayRaiseOnDrag(true);
        console.log(`${caseName} :setWindowDelayRaiseOnDrag success`);
        expect().assertFail();
        done();
      }catch(err){
        console.log(`${caseName} :setWindowDelayRaiseOnDrag fail:`+err.code);
        if(err.code == 801){
          done();
        }else{
          expect(err.code).assertEqual(1300002);
          done();
        }
        
      }
    });

    /**
     * @tc.name   test_SetWindowDelayRaiseOnDrag_dialog
     * @tc.number SUB_BASIC_WMS_SetWindowDelayRaiseOnDrag_0300
     * @tc.desc   test_SetWindowDelayRaiseOnDrag_dialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SetWindowDelayRaiseOnDrag_dialog', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_SetWindowDelayRaiseOnDrag_dialog';
      console.log(caseName + 'begin');
      let config: window.Configuration = {
        name: "test_SetWindowDelayRaiseOnDrag_dialog",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
    };
      let windowClass = await window.createWindow(config);
      try{
        windowClass.setWindowDelayRaiseOnDrag(true);
        console.log(`${caseName} :setWindowDelayRaiseOnDrag success`);
        await windowClass.destroyWindow();
        expect().assertFail();
        done();
      }catch(err){
        console.log(`${caseName} :setWindowDelayRaiseOnDrag fail:`+err.code);
        await windowClass.destroyWindow();
        if(err.code == 801){
          done();
        }else{
          expect(err.code).assertEqual(1300002);
          done();
        }
        
      }
    });
    /**
     * @tc.name   test_SetWindowDelayRaiseOnDrag_true
     * @tc.number SUB_BASIC_WMS_SetWindowDelayRaiseOnDrag_0400
     * @tc.desc   test_SetWindowDelayRaiseOnDrag_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SetWindowDelayRaiseOnDrag_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowDelayRaiseOnDrag_true';
      console.log(caseName + 'begin');
      let windowClass = windowStage.getMainWindowSync();
      try{
        windowClass.setWindowDelayRaiseOnDrag(true);
        console.log(`${caseName} :setWindowDelayRaiseOnDrag success`);
        
        done();
      }catch(err){
        console.log(`${caseName} :setWindowDelayRaiseOnDrag fail:`+err.code);
        if(err.code == 801){
          done();
        }else{
          expect().assertFail();
          done();
        }
      }
    });
    /**
     * @tc.name   test_SetWindowDelayRaiseOnDrag_false
     * @tc.number SUB_BASIC_WMS_SetWindowDelayRaiseOnDrag_0500
     * @tc.desc   test_SetWindowDelayRaiseOnDrag_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SetWindowDelayRaiseOnDrag_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SetWindowDelayRaiseOnDrag_false';
      console.log(caseName + 'begin');
      let windowClass = windowStage.getMainWindowSync();
      try{
        windowClass.setWindowDelayRaiseOnDrag(false);
        console.log(`${caseName} :setWindowDelayRaiseOnDrag success`);
        
        done();
      }catch(err){
        console.log(`${caseName} :setWindowDelayRaiseOnDrag fail:`+err.code);
        if(err.code == 801){
          done();
        }else{
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_SubWindowZLevel_0100
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0100
     * @tc.desc   test_SubWindowZLevel_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SubWindowZLevel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SubWindowZLevel_0100';
      console.log(caseName + 'begin');
      let minWidth = 0;
      let minHeight = 0;
      try{
        let windowClass1 = await windowStage.createSubWindow('test_SubWindowZLevel_0100_1');
        await windowClass1.setSubWindowZLevel(10);
        minWidth = Number(windowClass1.getWindowLimits().minWidth);
        minHeight = Number(windowClass1.getWindowLimits().minHeight);
        console.info(`${caseName} minWidth:`+ minWidth+',minHeight:'+minHeight);
        await windowClass1.setUIContent('testability/pages/First/index3');
        console.info(`${caseName} Succeeded in loading the system sub window content.`);
        await windowClass1.showWindow();
        console.info(`${caseName} Succeeded in showing the system sub window.`);
        await windowClass1.resizeAsync(minWidth+40, minHeight+40);
        await windowClass1.moveWindowTo(50, 100);

        let windowClass2 = await windowStage.createSubWindow('test_SubWindowZLevel_0100_2');
        await windowClass2.setSubWindowZLevel(10);
        minWidth = Number(windowClass2.getWindowLimits().minWidth);
        minHeight = Number(windowClass2.getWindowLimits().minHeight);
        await windowClass2.setUIContent('testability/pages/First/index2');
        console.info(`${caseName} Succeeded in loading the system sub window content.`);
        await windowClass2.showWindow();
        console.info(`${caseName} Succeeded in showing the system sub window.`);
        await windowClass2.resizeAsync(minWidth+40, minHeight+40);
        await windowClass2.moveWindowTo(150, 180);

        let windowClass3 = await windowStage.createSubWindow('test_SubWindowZLevel_0100_3');
        await windowClass3.setSubWindowZLevel(11);
        minWidth = Number(windowClass3.getWindowLimits().minWidth);
        minHeight = Number(windowClass3.getWindowLimits().minHeight);
        await windowClass3.setUIContent('testability/pages/First/index2');
        console.info(`${caseName} Succeeded in loading the system sub window content.`);
        await windowClass3.showWindow();
        console.info(`${caseName} Succeeded in showing the system sub window.`);
        await windowClass3.resizeAsync(minWidth+40, minHeight+40);
        await windowClass3.moveWindowTo(250, 260);

        let window1 = await window.getLastWindow(context);
        let windowZLevel = window1.getSubWindowZLevel()
        console.info(`${caseName} window1 windowZLevel :`+ windowZLevel);
        expect(windowZLevel).assertEqual(11);
        await windowClass1.setRaiseByClickEnabled(true);
        let subWinId = await driver.findComponent(ON.id('SubWinTestId'));
        console.info(`${caseName} window1 subWinId :`+ JSON.stringify(subWinId));
        await subWinId.click();
        let window2 = await window.getLastWindow(context);
        let windowZLevel2 = window2.getSubWindowZLevel()
        expect(windowZLevel2).assertEqual(11);
        let windowZLevel3 = windowClass1.getSubWindowZLevel()
        expect(windowZLevel3).assertEqual(10);

        console.log(`${caseName} :test_SubWindowZLevel_0100 success`);
        await windowClass1.destroyWindow();
        await windowClass2.destroyWindow();
        await windowClass3.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :test_SubWindowZLevel_0100 fail:`+err.code);
        if(err.code == 801){
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_SubWindowZLevel_0200
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0200
     * @tc.desc   test_SubWindowZLevel_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SubWindowZLevel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SubWindowZLevel_0200';
      console.log(caseName + 'begin');
      try{
        let mainWindow = windowStage.getMainWindowSync();
        await mainWindow.setSubWindowZLevel(1);
        console.log(`${caseName} :main window setSubWindowZLevel success`);
        expect().assertFail();
        done();
      } catch(err) {
        console.log(`${caseName} :test_SubWindowZLevel_0200 fail1:`+err.code);
        expect(err.code).assertEqual(1300004);
      }

      let config: window.Configuration = {
        name: "test_SubWindowZLevel_0200",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let dialogWindow = await window.createWindow(config);
      try{
        await dialogWindow.setSubWindowZLevel(1);
        console.log(`${caseName} :dialog window setSubWindowZLevel success`);
        expect().assertFail();
        await dialogWindow.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :test_SubWindowZLevel_0200 fail2:`+err.code);
        expect(err.code).assertEqual(1300004);
        await dialogWindow.destroyWindow();
        done();
      }
    });

    /**
     * @tc.name   test_SubWindowZLevel_0300
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0300
     * @tc.desc   test_SubWindowZLevel_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SubWindowZLevel_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SubWindowZLevel_0300 ';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_SubWindowZLevel_0300');
      await windowClass.destroyWindow();
      try {
        windowClass.setSubWindowZLevel(1).then(async () => {
          console.info(caseName + 'Succeeded in calling setSubWindowZLevel.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call setSubWindowZLevel. Cause: ' + JSON.stringify(err));
          expect().assertFail()
          done()
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
        done()
      }
    });

    /**
     * @tc.name   test_SubWindowZLevel_0400
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0400
     * @tc.desc   test_SubWindowZLevel_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_SubWindowZLevel_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_SubWindowZLevel_0400';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_SubWindowZLevel_0400');
      try{
        await windowClass.setSubWindowZLevel(10001);
        console.log(`${caseName} :sub window setSubWindowZLevel test1 success`);
        expect().assertFail();
        await windowClass.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        if (err.code === 801) {
          done();
        } else {
          expect(err.code).assertEqual(401);
          done();
        }
      }

      try{
        await windowClass.setSubWindowZLevel(-10001);
        console.log(`${caseName} :sub window setSubWindowZLevel test2 success`);
        expect().assertFail();
        await windowClass.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail2:`+err.code);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect(err.code).assertEqual(401);
          done();
        }
      }
    });

    /**
     * @tc.name   test_SubWindowZLevel_0500
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0500
     * @tc.desc   test_SubWindowZLevel_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SubWindowZLevel_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SubWindowZLevel_0500';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_SubWindowZLevel_0500');
      try{
        await windowClass.setSubWindowZLevel(10);
        console.log(`${caseName} :sub window setSubWindowZLevel test1 success`);
        let res = windowClass.getSubWindowZLevel();
        expect(res).assertEqual(10);
        await windowClass.destroyWindow();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }

      let windowClass2 = await windowStage.createSubWindow('test_SubWindowZLevel_0500');
      try{
        await windowClass2.setSubWindowZLevel(-10);
        console.log(`${caseName} :sub window setSubWindowZLevel test2 success`);
        let res = windowClass2.getSubWindowZLevel();
        expect(res).assertEqual(-10);
        await windowClass2.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail2:`+err.code);
        await windowClass2.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_SubWindowZLevel_0600
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0600
     * @tc.desc   test_SubWindowZLevel_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_SubWindowZLevel_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_SubWindowZLevel_0600';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_SubWindowZLevel_0600');
      try{
        await windowClass.setSubWindowZLevel(10);
        console.log(`${caseName} :sub window setSubWindowZLevel test1 success`);
        let res = windowClass.getSubWindowZLevel();
        expect(res).assertEqual(10);
        await windowClass.setSubWindowZLevel(-10);
        console.log(`${caseName} :sub window setSubWindowZLevel test2 success`);
        res = windowClass.getSubWindowZLevel();
        expect(res).assertEqual(-10);
        await windowClass.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_SubWindowZLevel_0700
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0700
     * @tc.desc   test_SubWindowZLevel_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_SubWindowZLevel_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SubWindowZLevel_0700 ';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_SubWindowZLevel_0700');
      await windowClass.destroyWindow();
      try {
        windowClass.getSubWindowZLevel();
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
        done()
      }
    });

    /**
     * @tc.name   test_getSubWindowZLevel_1300004
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0800
     * @tc.desc   验证getSubWindowZLevel的1300004错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_getSubWindowZLevel_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_getSubWindowZLevel_1300004!';
      console.log(caseName + 'begin');
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getSubWindowZLevel()
        console.error(`${caseName} : mainwindow succeed getSubWindowZLevel`);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(`${caseName} : failed, code: ${err.code}, msg: ${err.message}`);
        expect(err.code == 1300004 || err.code == 801).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   test_subWindowWithOptions_zlevel
     * @tc.number SUB_BASIC_WMS_SubWindowZLevel_0900
     * @tc.desc   test_subWindowWithOptions_zlevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_subWindowWithOptions_zlevel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_subWindowWithOptions_zlevel';
      console.log(caseName + 'begin');
      try {
        let options : window.SubWindowOptions = {
          title: caseName,
          decorEnabled: true,
          zLevel:10
        };
        let promise = windowStage.createSubWindowWithOptions(caseName, options);
        promise.then(async (data) => {
          let subWindowClass = data;
          console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
          let get_zLevel = subWindowClass.getSubWindowZLevel();
          await subWindowClass.destroyWindow();
          await sleep(1000);
          console.info(`${caseName }  get_zLevel:${get_zLevel}`);
          expect(get_zLevel == 10).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          try{
            let windowFindClass = window.findWindow(caseName);
            await windowFindClass?.destroyWindow();
            await sleep(1000);
          }catch (e) {
            console.error(`${caseName} Failed to destroyWindow. Cause code: ${e.code}, message: ${e.message}`);
          }
          expect(err.code == 1300002 || err.code == 801).assertTrue();
          done();
        });
      } catch (err) {
        console.log(`${caseName} : failed, code: ${err.code}, msg: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_create_window_typeMain
     * @tc.number SUB_BASIC_WMS_createWindow_typeMain_0100
     * @tc.desc   test_create_window_typeMain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_create_window_typeMain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_create_window_typeMain ';
      let config: window.Configuration = {
        name: "test",
        windowType: window.WindowType.TYPE_MAIN,
        ctx: context
      };
      try {
        window.createWindow(config).then((value:window.Window) => {
          console.info(caseName+' Succeeded in creating the window. Data: ' + JSON.stringify(value));
          expect(false).assertTrue();
          done();
        }).catch((err:BusinessError)=> {
          console.error(caseName+` Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(caseName+` Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   testSetResizeByDragEnabledTrue_0200
     * @tc.number testSetResizeByDragEnabledTrue_0200
     * @tc.desc   testSetResizeByDragEnabledTrue_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
              await driver.mouseMoveTo({x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 5})
              await sleep(1000)
              await driver.mouseDrag({x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 5}, {x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 100},2000)
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
     * @tc.name   testSetResizeByDragEnabledFalse_0100
     * @tc.number testSetResizeByDragEnabledFalse_0100
     * @tc.desc   testSetResizeByDragEnabledFalse_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetResizeByDragEnabledFalse_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
            await driver.mouseMoveTo({x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 5})
            await sleep(1000)
            await driver.mouseDrag({x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 5}, {x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top - 100})
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
     * @tc.name   testSetResizeByDragEnabledFalse_0200
     * @tc.number testSetResizeByDragEnabledFalse_0200
     * @tc.desc   testSetResizeByDragEnabledFalse_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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
              await driver.mouseMoveTo({x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 5})
              await sleep(1000)
              await driver.mouseDrag({x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 5}, {x: windowPoint.left + Math.ceil(windowPoint.width / 2), y: windowPoint.top + 100})
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
     * @tc.name   testsetParentWindow401
     * @tc.number SUB_BASIC_WMS_setParentWindow_401_0200
     * @tc.desc   testsetParentWindow401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetParentWindow401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testsetParentWindow401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = await windowStage.getMainWindowSync();
        windowClass.setParentWindow(null).then(() => {
          console.info(msgStr +'Succeeded in  setParentWindow window.')
          expect(false).assertFail();
          done();
        }).catch(async(e: BusinessError) => {
          console.error(msgStr +`Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);
          expect(false).assertFail();
          done();
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        if(e.code == 801){
          done();
        }else{
          expect(e.code).assertEqual(401);
          done()
        }
      }

    })
    /**
     * @tc.name   testsetParentWindow1300002
     * @tc.number SUB_BASIC_WMS_setParentWindow_1300002_0200
     * @tc.desc   testsetParentWindow1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetParentWindow1300002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testsetParentWindow1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowId = mainWindow.getWindowProperties().id;
      console.info(msgStr +'windowId :'+windowId)
      try {
        let windowClass = await windowStage.createSubWindow('testsetParentWindow1300002');
        await windowClass.destroyWindow();
        windowClass.setParentWindow(windowId).then(() => {
          console.info(msgStr +'Succeeded in  setParentWindow window.')
          expect(false).assertFail();
          done();
        }).catch(async(e: BusinessError) => {
          console.error(msgStr +`Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);

          if(e.code == 801){
            done();
          }else{
            expect(e.code).assertEqual(1300002);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(false).assertFail();
        done();
      }

    })
    /**
     * @tc.name   testsetParentWindow1300004
     * @tc.number SUB_BASIC_WMS_setParentWindow_1300004_0300
     * @tc.desc   testsetParentWindow1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetParentWindow1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testsetParentWindow1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowId = mainWindow.getWindowProperties().id;
      console.info(msgStr +'windowId :'+windowId)
      try {
        let config: window.Configuration = {
          name: "testsetParentWindow1300004",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass = await window.createWindow(config);
        windowClass.setParentWindow(windowId).then(() => {
          console.info(msgStr +'Succeeded in setParentWindow .')
          expect(false).assertFail();
          done();
        }).catch(async(e: BusinessError) => {
          console.error(msgStr +`Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);
          await windowClass.destroyWindow();
          if(e.code == 801){
            done();
          }else{
            expect(e.code).assertEqual(1300004);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        if(e.code == 801){
          done();
        }else{
          expect(e.code).assertEqual(1300004);
          done()
        }
      }

    })

    /**
     * @tc.name   testsetParentWindow1300009
     * @tc.number SUB_BASIC_WMS_setParentWindow_1300009_0400
     * @tc.desc   testsetParentWindow1300009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testsetParentWindow1300009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testsetParentWindow1300009";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowId = mainWindow.getWindowProperties().id;
      console.info(msgStr +'windowId :'+windowId)
      try {
        let windowClass = await windowStage.createSubWindow('testsetParentWindow1300009');
        windowClass.setParentWindow(100000).then(() => {
          console.info(msgStr +'Succeeded in setParentWindow .')
          expect(false).assertFail();
          done();
        }).catch(async(e: BusinessError) => {
          console.error(msgStr +`Failed to setParentWindow. Cause code: ${e.code}, message: ${e.message}`);
          await windowClass.destroyWindow();
          if(e.code == 801){
            done();
          }else{
            expect(e.code).assertEqual(1300009);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        if(e.code == 801){
          done();
        }else{
          expect(e.code).assertEqual(1300009);
          done()
        }
      }

    })
    /**
     * @tc.name   testgetParentWindow1300002
     * @tc.number SUB_BASIC_WMS_getParentWindow_1300002_0100
     * @tc.desc   testgetParentWindow1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testgetParentWindow1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testgetParentWindow1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowId = mainWindow.getWindowProperties().id;
      console.info(msgStr +'windowId :'+windowId)
      try {
        let windowClass = await windowStage.createSubWindow('testgetParentWindow1300002');
        await windowClass.destroyWindow();
        windowClass.getParentWindow();
          console.info(msgStr +'Succeeded in  getParentWindow window.')
          expect(false).assertFail();
          done();
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        if(e.code == 801){
          done();
        }else{
          expect(e.code).assertEqual(1300002);
          done()
        }
      }

    })
    /**
     * @tc.name   testgetParentWindow1300004
     * @tc.number SUB_BASIC_WMS_getParentWindow_1300004_0200
     * @tc.desc   testgetParentWindow1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testgetParentWindow1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testgetParentWindow1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      let windowId = mainWindow.getWindowProperties().id;
      console.info(msgStr +'windowId :'+windowId)
      let config: window.Configuration = {
        name: "testgetParentWindow1300004",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass = await window.createWindow(config);
      try {
        windowClass.getParentWindow()
          console.info(msgStr +'Succeeded in setParentWindow .')
          expect(false).assertFail();
          done();
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await windowClass.destroyWindow();
        if(e.code == 801){
          done();
        }else{
          expect(e.code).assertEqual(1300004);
          done()
        }
      }

    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_SUBWINDOW_ZLEVEL_0100
     * @tc.name    testSetSubWindowZLevel__10001
     * @tc.desc    setSetSubWindowZLevel入参-10001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetSubWindowZLevel__10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetSubWindowZLevel__10001';
      let subWindow = await windowStage.createSubWindow('testSetSubWindowZLevel__10001')
      try {
        let promise = subWindow.setSubWindowZLevel(-10001);
        promise.then(() => {
          console.info(caseName+ ' Succeeded in setting sub window zLevel');
          expect(false).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(`caseName+ Failed to set sub window zLevel. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code ==801){
            expect(err.code).assertEqual(801);
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setSubWindowZLevel]msg: Set sub window zLevel failed');
            done()
          }else {
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual('Parameter error.[window][setSubWindowZLevel]msg: Set sub window zLevel failed');
            done();

          }
        });
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        await subWindow.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_SUBWINDOW_ZLEVEL_0200
     * @tc.name    testSetSubWindowZLevel__10000
     * @tc.desc    setSetSubWindowZLevel入参-10000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetSubWindowZLevel__10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetSubWindowZLevel__10000';
      let subWindow = await windowStage.createSubWindow('testSetSubWindowZLevel__10000')
      try {
        let promise = subWindow.setSubWindowZLevel(-10000);
        promise.then(async () => {
          console.info(caseName+ ' Succeeded in setting sub window zLevel');
          await subWindow.destroyWindow();
          
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName+` Failed to set sub window zLevel. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            expect(err.code).assertEqual(801);
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setSubWindowZLevel]msg: Set sub window zLevel failed');
            done()
          }else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        await subWindow.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_SUBWINDOW_ZLEVEL_0300
     * @tc.name    testSetSubWindowZLevel_10000
     * @tc.desc    setSetSubWindowZLevel入参10000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetSubWindowZLevel_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetSubWindowZLevel_10000';
      let subWindow = await windowStage.createSubWindow('testSetSubWindowZLevel_10000')
      try {
        let promise = subWindow.setSubWindowZLevel(10000);
        promise.then(async () => {
          console.info(caseName+ ' Succeeded in setting sub window zLevel');
          await subWindow.destroyWindow();
          
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName+` Failed to set sub window zLevel. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            expect(err.code).assertEqual(801);
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setSubWindowZLevel]msg: Set sub window zLevel failed');
            done()
          }else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        await subWindow.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_SUBWINDOW_ZLEVEL_0400
     * @tc.name    testSetSubWindowZLevel_10001
     * @tc.desc    setSetSubWindowZLevel入参10001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetSubWindowZLevel_10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetSubWindowZLevel_10001';
      let subWindow = await windowStage.createSubWindow('testSetSubWindowZLevel_10001')
      try {
        let promise = subWindow.setSubWindowZLevel(10001);
        promise.then(() => {
          console.info(caseName+ ' Succeeded in setting sub window zLevel');
          expect(false).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(`caseName+ Failed to set sub window zLevel. Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            expect(err.code).assertEqual(801);
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setSubWindowZLevel]msg: Set sub window zLevel failed');
            done()
          }else {
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual('Parameter error.[window][setSubWindowZLevel]msg: Set sub window zLevel failed');
            done();

          }
        });
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        await subWindow.destroyWindow();
        expect(false).assertTrue();
        done();
      }
    })


  })
}