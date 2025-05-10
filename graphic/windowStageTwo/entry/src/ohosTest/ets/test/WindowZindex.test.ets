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
import { StartOptions } from '@kit.AbilityKit';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

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

async function terminateAbility2(caseName: string) {
  let pageContext = AppStorage.get('contextTest2') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
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

export default function windowZindexTest() {
  describe('windowZindexTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    beforeAll(() => {
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
     * @tc.level     : Level 3
     */
    it('test_raiseToAppTop_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_raiseToAppTop_subWindowDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.level     : Level TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3
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
     * @tc.number    : SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0100
     * @tc.name      : test_setRaiseByClickEnabled_mainWindow
     * @tc.desc      : test_setRaiseByClickEnabled_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_setRaiseByClickEnabled_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SET_RAISEBY_CLICK_ENABLED_0300
     * @tc.name      : test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick
     * @tc.desc      : test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_RaiseByClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_NoRaiseByClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.level     : Level 3
     */
    it('test_setRaiseByClickEnabled_Two_subWindow_RaiseBy_raiseToAppTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
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
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0100
     * @tc.name      : test_shiftAppWindowPointerEvent_null
     * @tc.desc      : test_shiftAppWindowPointerEvent_null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0200
     * @tc.name      : test_shiftAppWindowPointerEvent_undifined
     * @tc.desc      : test_shiftAppWindowPointerEvent_undifined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0300
     * @tc.name      : test_shiftAppWindowPointerEvent_window_destroyed
     * @tc.desc      : test_shiftAppWindowPointerEvent_window_destroyed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
     * @tc.level     : Level 3
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

    /**
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0500
     * @tc.name      : test_shiftAppWindowPointerEvent_Subwindow_1300004
     * @tc.desc      : test_shiftAppWindowPointerEvent_Subwindow_1300004
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0600
     * @tc.name      : test_shiftAppWindowPointerEvent_subWindow_to_mainwindow
     * @tc.desc      : test_shiftAppWindowPointerEvent_subWindow_to_mainwindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_shiftAppWindowPointerEvent_subWindow_to_mainwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_subWindow_to_mainwindow';
      console.log(caseName + 'begin');
      if(isPCStatus != '' || isAutoWindow == 'true'){
        let mainWindow = windowStage.getMainWindowSync();
      let driver = Driver.create();
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
     * @tc.number    : SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_0700
     * @tc.name      : test_shiftAppWindowPointerEvent_mainwindow_to_subWindow
     * @tc.desc      : test_shiftAppWindowPointerEvent_mainwindow_to_subWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_shiftAppWindowPointerEvent_mainwindow_to_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_mainwindow_to_subWindow';
      console.log(caseName + 'begin');
      if(isPCStatus != '' || isAutoWindow == 'true'){
        let mainWindow = windowStage.getMainWindowSync();
      let driver = Driver.create();
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0100
     * @tc.name      : test_SubWindowZLevel_0100
     * @tc.desc      : test_SubWindowZLevel_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_SubWindowZLevel_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SubWindowZLevel_0100';
      console.log(caseName + 'begin');
      let minWidth = 0;
      let minHeight = 0;
      let driver: Driver = Driver.create();
      try{
        let windowClass1 = await windowStage.createSubWindow('test_SubWindowZLevel_0100_1');
        await windowClass1.setSubWindowZLevel(10);
        minWidth = Number(windowClass1.getWindowLimits().minWidth);
        minHeight = Number(windowClass1.getWindowLimits().minHeight);
        await windowClass1.setUIContent('testability/pages/First/index3');
        console.info(`${caseName} Succeeded in loading the system sub window content.`);
        await windowClass1.showWindow();
        console.info(`${caseName} Succeeded in showing the system sub window.`);
        await windowClass1.resizeAsync(minWidth+20, minHeight+20);
        await windowClass1.moveWindowTo(50, 50);

        let windowClass2 = await windowStage.createSubWindow('test_SubWindowZLevel_0100_2');
        await windowClass2.setSubWindowZLevel(10);
        minWidth = Number(windowClass2.getWindowLimits().minWidth);
        minHeight = Number(windowClass2.getWindowLimits().minHeight);
        await windowClass2.setUIContent('testability/pages/First/index2');
        console.info(`${caseName} Succeeded in loading the system sub window content.`);
        await windowClass2.showWindow();
        console.info(`${caseName} Succeeded in showing the system sub window.`);
        await windowClass2.resizeAsync(minWidth+20, minHeight+20);
        await windowClass2.moveWindowTo(150, 150);

        let windowClass3 = await windowStage.createSubWindow('test_SubWindowZLevel_0100_3');
        await windowClass3.setSubWindowZLevel(11);
        minWidth = Number(windowClass3.getWindowLimits().minWidth);
        minHeight = Number(windowClass3.getWindowLimits().minHeight);
        await windowClass3.setUIContent('testability/pages/First/index2');
        console.info(`${caseName} Succeeded in loading the system sub window content.`);
        await windowClass3.showWindow();
        console.info(`${caseName} Succeeded in showing the system sub window.`);
        await windowClass3.resizeAsync(minWidth+20, minHeight+20);
        await windowClass3.moveWindowTo(250, 250);

        let window1 = await window.getLastWindow(context);
        let windowZLevel = window1.getSubWindowZLevel()
        expect(windowZLevel).assertEqual(11);
        await windowClass1.setRaiseByClickEnabled(true);
        let subWinId = await driver.findComponent(ON.id('SubWinTestId'));
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0200
     * @tc.name      : test_SubWindowZLevel_0200
     * @tc.desc      : test_SubWindowZLevel_0200
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_SubWindowZLevel_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0300
     * @tc.name      : test_SubWindowZLevel_0300
     * @tc.desc      : test_SubWindowZLevel_0300
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0700
     * @tc.name      : test_SubWindowZLevel_0700
     * @tc.desc      : test_SubWindowZLevel_0700
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0400
     * @tc.name      : test_SubWindowZLevel_0400
     * @tc.desc      : test_SubWindowZLevel_0400
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_SubWindowZLevel_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0500
     * @tc.name      : test_SubWindowZLevel_0500
     * @tc.desc      : test_SubWindowZLevel_0500
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_SubWindowZLevel_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0600
     * @tc.name      : test_SubWindowZLevel_0600
     * @tc.desc      : test_SubWindowZLevel_0600
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_SubWindowZLevel_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0800
     * @tc.name      : test_getSubWindowZLevel_1300004
     * @tc.desc      : 验证getSubWindowZLevel的1300004错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_SubWindowZLevel_0900
     * @tc.name      : test_subWindowWithOptions_zlevel
     * @tc.desc      : test_subWindowWithOptions_zlevel
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_createWindow_typeMain_0100
     * @tc.name      : test_create_window_typeMain
     * @tc.desc      : test_create_window_typeMain
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_GET_VISIBLEWINDOWINFO_0100
     * @tc.name      : test_GET_VISIBLEWINDOWINFO_0100
     * @tc.desc      : test_GET_VISIBLEWINDOWINFO_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_GET_VISIBLEWINDOWINFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_GET_VISIBLEWINDOWINFO_0100 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility3(caseName, context);
      try {
        let windowClass2 = windowStageStart.getMainWindowSync();
        let res = windowClass2.getWindowProperties()
        console.info(caseName + 'res: ' + JSON.stringify(res));
        window.getVisibleWindowInfo().then(async (infos: Array<window.WindowInfo>) => {
          console.info(caseName + 'Succeeded in calling getVisibleWindowInfo.');
          console.info(caseName + `infos.length: ${infos.length}`);
          expect(infos.length).assertLargerOrEqual(1);
          let isExit = false;
          for (let i = 0; i < infos.length; i++) {
            if (infos[i].windowId === res.id) {
              isExit = true;
              let info = infos[i];
              console.info(caseName + 'info: ' + JSON.stringify(info));
              expect(info.rect.left).assertEqual(res.windowRect.left);
              expect(info.rect.top).assertEqual(res.windowRect.top);
              expect(info.rect.width).assertEqual(res.windowRect.width);
              expect(info.rect.height).assertEqual(res.windowRect.height);
              expect(info.isFocused).assertEqual(true);
              console.info(caseName + `info.windowStatusType: ${info.windowStatusType}`);
              console.info(caseName + `info.bundleName: ${info.bundleName}`);
              console.info(caseName + `info.abilityName: ${info.abilityName}`);
              break;
            }
          }
          if (!isExit) {
            console.error(`${caseName} failed, there is no match windowId.`);
            await terminateAbility3(caseName);
            expect().assertFail();
            done()
          }
          await terminateAbility3(caseName);
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call getVisibleWindowInfo. Cause: ' + JSON.stringify(err));
          await terminateAbility3(caseName);
          expect().assertFail();
          done();
          
        });
      } catch (err) {
        await terminateAbility3(caseName);
        console.log(`${caseName} : failed, code: ${err.code}, msg: ${err.message}`);
        if (err.code === 801) {
            console.log(`${caseName} deviceType does not supported this Capability`);
            done()
          } else {
            expect().assertFail();
            done();
          }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0100
     * @tc.name      : test_ISWINDOWHIGHLIGHTED_0100
     * @tc.desc      : test_ISWINDOWHIGHLIGHTED_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('test_ISWINDOWHIGHLIGHTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0100';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0100');
      try{
        windowClass.isWindowHighlighted();
        await windowClass.destroyWindow();
        expect(true).assertTrue()
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0200
     * @tc.name      : test_ISWINDOWHIGHLIGHTED_0200
     * @tc.desc      : test_ISWINDOWHIGHLIGHTED_0200
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_ISWINDOWHIGHLIGHTED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0200';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0200');
      await windowClass.destroyWindow();
      try{
        windowClass.isWindowHighlighted();
        expect().assertFail()
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        expect(err.code).assertEqual(1300002);
        done()
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0300
     * @tc.name      : test_ISWINDOWHIGHLIGHTED_0300
     * @tc.desc      : test_ISWINDOWHIGHLIGHTED_0300
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_ISWINDOWHIGHLIGHTED_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0300';
      console.log(caseName + 'begin');
      let windowClass = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0300');
      try{
        await windowClass.setUIContent('testability/pages/First/index1');
        console.info(`${caseName} Succeeded in loading the system sub window content.`);
        await windowClass.showWindow();
        await sleep(300);
        let res = windowClass.isWindowHighlighted();
        await windowClass.destroyWindow();
        expect(res).assertEqual(true)
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        await windowClass.destroyWindow();
        if (err.code === 801) {
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_ISWINDOWHIGHLIGHTED_0400
     * @tc.name      : test_ISWINDOWHIGHLIGHTED_0400
     * @tc.desc      : test_ISWINDOWHIGHLIGHTED_0400
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_ISWINDOWHIGHLIGHTED_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_ISWINDOWHIGHLIGHTED_0400';
      console.log(caseName + 'begin');
      let windowClass1 = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0400_1');
      let windowClass2 = await windowStage.createSubWindow('test_ISWINDOWHIGHLIGHTED_0400_2');
      try{
        await windowClass1.setUIContent('testability/pages/First/index1');
        await windowClass1.showWindow();
        await sleep(300);
        let res = windowClass1.isWindowHighlighted();
        expect(res).assertEqual(true)
        windowClass2.setExclusivelyHighlighted(false);
        await windowClass2.setUIContent('testability/pages/First/index1');
        await windowClass2.showWindow();
        await sleep(300);
        res = windowClass2.isWindowHighlighted();
        expect(res).assertEqual(true)
        await windowClass1.destroyWindow();
        await windowClass2.destroyWindow();
        done();
      } catch(err) {
        console.log(`${caseName} :sub window setSubWindowZLevel fail1:`+err.code);
        await windowClass1.destroyWindow();
        await windowClass2.destroyWindow();
        if (err.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0100
     * @tc.name      : test_setWindowRectAutoSave_401
     * @tc.desc      : test_setWindowRectAutoSave_401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0200
     * @tc.name      : test_setWindowRectAutoSave_801
     * @tc.desc      : test_setWindowRectAutoSave_801
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('test_setWindowRectAutoSave_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_ErrorCode_0300
     * @tc.name      : test_setWindowRectAutoSave_1300002
     * @tc.desc      : test_setWindowRectAutoSave_1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_SetWindowRectAutoSave_0100
     * @tc.name      : test_SetWindowRectAutoSave_0100
     * @tc.desc      : test_SetWindowRectAutoSave_0100
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_SetWindowRectAutoSave_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_SetWindowRectAutoSave_0100 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility2(caseName, context);
      try {
        windowStageStart.setWindowRectAutoSave(true,true).then(async () => {
          console.info(caseName + 'Succeeded in calling setWindowRectAutoSave.');
          let mainWindow = windowStageStart.getMainWindowSync();
          mainWindow.moveWindowToAsync(300, 400)
          mainWindow.resizeAsync(1000, 1200);
          await sleep(300);
          let windowRect1 = mainWindow.getWindowProperties().windowRect;
          console.info(caseName + 'windowRect1: ' + JSON.stringify(windowRect1));
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

    

  })
}