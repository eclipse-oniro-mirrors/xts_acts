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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';

export default function windowZindexTest() {
  describe('windowZindexTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_RAISETOAPPTOP_0100
     * @tc.name      : test_raiseToAppTop_mainWindow
     * @tc.desc      : test_raiseToAppTop_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_raiseToAppTop_mainWindow', 0, async (done: Function) => {
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
              expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_RAISETOAPPTOP_0200
     * @tc.name      : test_raiseToAppTop_subWindowDestroy
     * @tc.desc      : test_raiseToAppTop_subWindowDestroy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_raiseToAppTop_subWindowDestroy', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_RAISETOAPPTOP_0300
     * @tc.name      : test_raiseToAppTop_Two_subWindow_normal
     * @tc.desc      : test_raiseToAppTop_Two_subWindow_normal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_raiseToAppTop_Two_subWindow_normal', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0100
     * @tc.name      : test_setRaiseByClickEnabled_mainWindow
     * @tc.desc      : test_setRaiseByClickEnabled_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setRaiseByClickEnabled_mainWindow', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0200
     * @tc.name      : test_setRaiseByClickEnabled_subWindowDestroy
     * @tc.desc      : test_setRaiseByClickEnabled_subWindowDestroy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setRaiseByClickEnabled_subWindowDestroy', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0300
     * @tc.name      : test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick
     * @tc.desc      : test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick', 0, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let minWidth = 0;
      let minHeight = 0;
      let driver: Driver = Driver.create();
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
     * @tc.number    : SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0400
     * @tc.name      : test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick
     * @tc.desc      : test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick', 0, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let minWidth = 0;
      let minHeight = 0;
      let driver: Driver = Driver.create();
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
     * @tc.number    : SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0500
     * @tc.name      : test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop
     * @tc.desc      : test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop', 0, async (done: Function) => {
      let caseName: string = 'test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let driver: Driver = Driver.create();
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
     * @tc.number    : SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0600
     * @tc.name      : test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop_false
     * @tc.desc      : test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_NoRaiseBy_raiseToAppTop', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0100
     * @tc.name      : test_shiftAppWindowPointerEvent_null
     * @tc.desc      : test_shiftAppWindowPointerEvent_null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_shiftAppWindowPointerEvent_null', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0200
     * @tc.name      : test_shiftAppWindowPointerEvent_undifined
     * @tc.desc      : test_shiftAppWindowPointerEvent_undifined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_shiftAppWindowPointerEvent_undifined', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0300
     * @tc.name      : test_shiftAppWindowPointerEvent_window_destroyed
     * @tc.desc      : test_shiftAppWindowPointerEvent_window_destroyed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_shiftAppWindowPointerEvent_window_destroyed', 0, async (done: Function) => {
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
              expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0400
     * @tc.name      : test_shiftAppWindowPointerEvent_Dialog_window
     * @tc.desc      : test_shiftAppWindowPointerEvent_Dialog_window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_shiftAppWindowPointerEvent_Dialog_window', 0, async (done: Function) => {
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
              expect(true).assertTrue();
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



  })
}