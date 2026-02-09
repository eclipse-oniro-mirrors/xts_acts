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
import pipWindow from '@ohos.PiPWindow';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import { display } from '@kit.ArkUI';
import { StartOptions } from '@kit.AbilityKit';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility7(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility7'
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
  let windowStageStart = AppStorage.get('windowStageStartTest7') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility7(caseName: string) {
  let pageContext = AppStorage.get('contextTest7') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

async function startAbility3(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility3'
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

export default function windowMaximizeTest() {
  describe('windowMaximize_test', () => {
    let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let isAutoWindow:string = '';
    let isPCStatus: string = '';
    let isFreeWindowMode = false;
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
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
     * @tc.name   testPresentationDefaultArgs
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.desc   test the function of testPresentationDefaultArgs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPresentationDefaultArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const message = 'TestPresentationDefaultArgs';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.maximize().then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} Failed to obtain the main window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationEnterImmersive
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.desc   test the function of testPresentationEnterImmersive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPresentationEnterImmersive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const message = 'TestPresentationEnterImmersive';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} Failed to obtain the main window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationExitImmersive
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.desc   test the function of testPresentationExitImmersive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPresentationExitImmersive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'TestPresentationExitImmersive';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setImmersiveModeEnabledState(true);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationFollowAppImmersiveInWindowLayoutFullScreenTrue
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.desc   test the function of testPresentationFollowAppImmersiveInWindowLayoutFullScreenTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPresentationFollowAppImmersiveInWindowLayoutFullScreenTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInWindowLayoutFullScreenTrue';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setWindowLayoutFullScreen(true);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          if(isFreeWindowMode == false){
            expect(immersiveModeEnabledState).assertTrue();
            done();
          }else{
            expect(immersiveModeEnabledState).assertFalse();
            windowClass.recover();
            done();
          }
          
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} Error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationFollowAppImmersiveInWindowLayoutFullScreenFalse
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.desc   test the function of testPresentationFollowAppImmersiveInWindowLayoutFullScreenFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPresentationFollowAppImmersiveInWindowLayoutFullScreenFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInWindowLayoutFullScreenFalse';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setWindowLayoutFullScreen(false);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertFalse();
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationFollowAppImmersiveInLayoutFullScreenTrue
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.desc   test the function of testPresentationFollowAppImmersiveInLayoutFullScreenTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPresentationFollowAppImmersiveInLayoutFullScreenTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInLayoutFullScreenTrue';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setLayoutFullScreen(true);
        await sleep(2000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertTrue();
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationFollowAppImmersiveInLayoutFullScreenFalse
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.desc   test the function of testPresentationFollowAppImmersiveInLayoutFullScreenFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPresentationFollowAppImmersiveInLayoutFullScreenFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInLayoutFullScreenFalse';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setLayoutFullScreen(false);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertFalse();
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationFollowAppImmersiveInSetImmersiveModeTrue
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.desc   test the function of testPresentationFollowAppImmersiveInSetImmersiveModeTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPresentationFollowAppImmersiveInSetImmersiveModeTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInSetImmersiveModeTrue';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setImmersiveModeEnabledState(true);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          if(isFreeWindowMode == false){
            expect(immersiveModeEnabledState).assertTrue();
            done();
          }else{
            expect(immersiveModeEnabledState).assertFalse();
            windowClass.recover();
            done();
          }
          
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationFollowAppImmersiveInSetImmersiveModeFalse
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.desc   test the function of testPresentationFollowAppImmersiveInSetImmersiveModeFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPresentationFollowAppImmersiveInSetImmersiveModeFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInSetImmersiveModeFalse';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setImmersiveModeEnabledState(false);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertFalse();
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testPresentationFollowAppImmersiveInMaximize
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.desc   test the function of testPresentationFollowAppImmersiveInMaximize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPresentationFollowAppImmersiveInMaximize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInMaximize';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setWindowLayoutFullScreen(true);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.EXIT_IMMERSIVE).then(async () => {
          console.info(`${message} Succeeded to set immersiveModeEnabledState false by EXIT_IMMERSIVE`);
          await windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING);
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            
            done();
          } else {
            console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetTitleAndDockHoverShow_subWindow_1300004
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0100
     * @tc.desc   testSetTitleAndDockHoverShow_subWindow_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTitleAndDockHoverShow_subWindow_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetTitleAndDockHoverShow_subWindow_1300004';
      try {
        let subWindow = windowStage.createSubWindow("testSetTitleAndDockHoverShow_subWindow_1300004");
        subWindow.then((data) => {
          if (data == null) {
            console.error("Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let windowClass = data;
          try {
            let promise = windowClass.setTitleAndDockHoverShown(true, false);
            promise.then(async () => {
              console.info('Succeeded in setTitleAndDockHoverShown the window.');
              windowClass.destroyWindow();
              expect(false).assertTrue();
              done();
            }).catch((err: BusinessError) => {
              console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.info(`${message} The device type is not support`);
                done();
              }else if(err.code == 1300004) {
                console.info(`${message} The subWindow is not support`);
                
                done();
              }else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (err) {
            if (err.code == 801) {
              console.info(`${message} The device type is not support`);
              done();
            } else {
              console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            }
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetTitleAndDockHoverShow_Title_show_dock_hide_1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0200
     * @tc.desc   testSetTitleAndDockHoverShow_Title_show_dock_hide_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTitleAndDockHoverShow_Title_show_dock_hide_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testSetTitleAndDockHoverShow_Title_show_dock_hide_1';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
        promise.then(async () => {
          console.info('Succeeded in maximizing the window.');
          try {
            let promise = windowClass.setTitleAndDockHoverShown(true, false);
            promise.then(async () => {
              console.info('Succeeded in setTitleAndDockHoverShown the window.');
              windowClass.recover();
              
              done();
            }).catch((err: BusinessError) => {
              console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.info(`${message} The device type is not support`);
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (err) {
            console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetTitleAndDockHoverShow_Title_show_dock_hide_2
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0300
     * @tc.desc   testSetTitleAndDockHoverShow_Title_show_dock_hide_2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTitleAndDockHoverShow_Title_show_dock_hide_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const message = 'testSetTitleAndDockHoverShow_Title_show_dock_hide_2';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
        promise.then(async () => {
          console.info('Succeeded in maximizing the window.');
          try {
            let promise = windowClass.setTitleAndDockHoverShown(undefined, false);
            promise.then(async () => {
              console.info('Succeeded in setTitleAndDockHoverShown the window.');
              windowClass.recover();
              
              done();
            }).catch((err: BusinessError) => {
              console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.info(`${message} The device type is not support`);
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (err) {
            console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetTitleAndDockHoverShow_Title_show_dock_hide_3
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0400
     * @tc.desc   testSetTitleAndDockHoverShow_Title_show_dock_hide_3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetTitleAndDockHoverShow_Title_show_dock_hide_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'testSetTitleAndDockHoverShow_Title_show_dock_hide_3';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
        promise.then(async () => {
          console.info('Succeeded in maximizing the window.');
          try {
            let promise = windowClass.setTitleAndDockHoverShown(true, false);
            promise.then(async () => {
              console.info('Succeeded in setTitleAndDockHoverShown the window.');
              windowClass.recover();
              
              done();
            }).catch((err: BusinessError) => {
              console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code == 801) {
                console.info(`${message} The device type is not support`);
                done();
              } else {
                expect(false).assertTrue();
                done();
              }
            });
          } catch (err) {
            console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_dock_hide_1
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0500
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_dock_hide_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_hide_1';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      try {
        let promise = windowClass.setTitleAndDockHoverShown(false, false);
        promise.then(async () => {
          console.info('Succeeded in setTitleAndDockHoverShown the window.');
          windowClass.recover();
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(`${message} The device type is not support`);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})

/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_dock_hide_2
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0600
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_dock_hide_2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_hide_2';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      await windowClass.recover();
      
      done();
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_dock_hide_3
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0700
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_dock_hide_3
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_hide_3';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.setTitleAndDockHoverShown(true, true);
    promise.then(async () => {
      console.info('Succeeded in setTitleAndDockHoverShown the window.');
      let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
      promise.then(async () => {
        console.info('Succeeded in maximizing the window.');
        await windowClass.recover();
        
        done();
      }).catch((err: BusinessError) => {
        console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
        if (err.code == 801) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        console.info(`${message} The device type is not support`);
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_dock_hide_4
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0800
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_dock_hide_4
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_hide_4';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.setTitleAndDockHoverShown(true, false);
    promise.then(async () => {
      console.info('Succeeded in setTitleAndDockHoverShown the window.');
      let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
      promise.then(async () => {
        console.info('Succeeded in maximizing the window.');
        
        done();
      }).catch((err: BusinessError) => {
        console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
        if (err.code == 801) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        console.info(`${message} The device type is not support`);
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_dock_hide_5
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0900
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_dock_hide_5
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_hide_5';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.setTitleAndDockHoverShown(false, true);
    promise.then(async () => {
      console.info('Succeeded in setTitleAndDockHoverShown the window.');
      let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
      promise.then(async () => {
        console.info('Succeeded in maximizing the window.');
        await windowClass.recover();
        
        done();
      }).catch((err: BusinessError) => {
        console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
        if (err.code == 801) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        console.info(`${message} The device type is not support`);
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_show_dock_show_1
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1000
 * @tc.desc   testSetTitleAndDockHoverShow_Title_show_dock_show_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_show_dock_show_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_show_dock_show_1';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      try {
        let promise = windowClass.setTitleAndDockHoverShown(true, true);
        promise.then(async () => {
          console.info('Succeeded in setTitleAndDockHoverShown the window.');
          windowClass.recover();
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(`${message} The device type is not support`);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_show_dock_show_1
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1100
 * @tc.desc   testSetTitleAndDockHoverShow_Title_show_dock_show_2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_show_dock_show_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_show_dock_show_1';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      try {
        let promise = windowClass.setTitleAndDockHoverShown(true, true);
        promise.then(async () => {
          console.info('Succeeded in setTitleAndDockHoverShown the window.');
          windowClass.recover();
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(`${message} The device type is not support`);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_show_dock_show_2
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1200
 * @tc.desc   testSetTitleAndDockHoverShow_Title_show_dock_show_2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_show_dock_show_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_show_dock_show_2';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      try {
        let promise = windowClass.setTitleAndDockHoverShown();
        promise.then(async () => {
          console.info('Succeeded in setTitleAndDockHoverShown the window.');
          windowClass.recover();
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(`${message} The device type is not support`);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_dock_show
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1300
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_dock_show
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_hide_dock_show', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_show';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      try {
        let promise = windowClass.setTitleAndDockHoverShown(false,true);
        promise.then(async () => {
          console.info('Succeeded in setTitleAndDockHoverShown the window.');
          windowClass.recover();
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(`${message} The device type is not support`);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})

/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_dock_show_1
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1400
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_dock_show_1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_hide_dock_show_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_show_1';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      try {
        let promise = windowClass.setTitleAndDockHoverShown(false,true);
        promise.then(async () => {
          console.info('Succeeded in setTitleAndDockHoverShown the window.');
          windowClass.recover();
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(`${message} The device type is not support`);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})
/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_dock_show_2
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1500
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_dock_show_2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_hide_dock_show_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_show_2';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      try {
        let promise = windowClass.setTitleAndDockHoverShown(false,true);
        promise.then(async () => {
          console.info('Succeeded in setTitleAndDockHoverShown the window.');
          windowClass.recover();
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(`${message} The device type is not support`);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})

/**
 * @tc.name   testSetTitleAndDockHoverShow_Title_hide_status
 * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1600
 * @tc.desc   testSetTitleAndDockHoverShow_Title_hide_status
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('testSetTitleAndDockHoverShow_Title_hide_status', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_status';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      try {
        let promise = windowClass.setTitleAndDockHoverShown(false);
        promise.then(async () => {
          console.info('Succeeded in setTitleAndDockHoverShown the window.');
          windowClass.recover();
          
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} Failed to setTitleAndDockHoverShown the window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(`${message} The device type is not support`);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (err) {
        console.error(`${message} error, Cause code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    }).catch((err: BusinessError) => {
      console.error(`${message} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
      if (err.code == 801) {
        done();
      } else {
        expect(false).assertTrue();
        done();
      }
    });
  } catch (exception) {
    console.error(`${message} error, Cause code: ${exception.code}, message: ${exception.message}`);
    expect().assertFail();
    done();
  }
})

    /**
     * @tc.name   test_MaximizeSupported_0100
     * @tc.number SUB_BASIC_WMS_MaximizeSupported_0100
     * @tc.desc   test_MaximizeSupported_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_MaximizeSupported_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_MaximizeSupported_0100';
      console.log(caseName + 'begin');
      let options : window.SubWindowOptions = {
        title: 'test_MaximizeSupported_0100',
        decorEnabled: true,
        isModal: false,
        maximizeSupported: true
      };
      let promise1 = windowStage.createSubWindowWithOptions('test_MaximizeSupported_0100', options);
      let subWindowClass: window.Window | undefined = undefined;
      promise1.then(async (data) => {
        subWindowClass = data;
        console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.showWindow();
        await subWindowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING);
        let windowStatusType = subWindowClass.getWindowStatus();
        console.info(caseName+ ' subWindowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));
        if(isFreeWindowMode == false){
          expect(windowStatusType).assertEqual(window.WindowStatusType.FLOATING)
          await subWindowClass.destroyWindow()
          done()
        } else {
          expect(windowStatusType).assertEqual(window.WindowStatusType.MAXIMIZE)
          await subWindowClass.destroyWindow()
          done()
        }
      }).catch(async (err: BusinessError) => {
        console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (subWindowClass != undefined) {
          await subWindowClass.destroyWindow()
        }
        if (err.code === 1300002) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   test_MaximizeSupported_0200
     * @tc.number SUB_BASIC_WMS_MaximizeSupported_0200
     * @tc.desc   test_MaximizeSupported_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_MaximizeSupported_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_MaximizeSupported_0200';
      console.log(caseName + 'begin');
      let options : window.SubWindowOptions = {
        title: 'test_MaximizeSupported_0200',
        decorEnabled: true,
        isModal: false,
        maximizeSupported: true
      };
      let promise1 = windowStage.createSubWindowWithOptions('test_MaximizeSupported_0200', options);
      let subWindowClass: window.Window | undefined = undefined;
      promise1.then(async (data) => {
        subWindowClass = data;
        console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.showWindow();
        await subWindowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE);
        let windowStatusType = subWindowClass.getWindowStatus();
        console.info(caseName+ ' subWindowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));
        if(isFreeWindowMode == false){
          expect(windowStatusType).assertEqual(window.WindowStatusType.FLOATING)
          await subWindowClass.destroyWindow()
          done()
        }else {
          expect(windowStatusType).assertEqual(window.WindowStatusType.FULL_SCREEN)
          await subWindowClass.destroyWindow()
          done()
        }
      }).catch(async (err: BusinessError) => {
        console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (subWindowClass != undefined) {
          await subWindowClass.destroyWindow()
        }
        if (err.code === 1300002) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   test_MaximizeSupported_0300
     * @tc.number SUB_BASIC_WMS_MaximizeSupported_0300
     * @tc.desc   test_MaximizeSupported_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_MaximizeSupported_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_MaximizeSupported_0300';
      console.log(caseName + 'begin');
      let options : window.SubWindowOptions = {
        title: 'test_MaximizeSupported_0300',
        decorEnabled: true,
        isModal: false,
        maximizeSupported: false
      };
      let promise1 = windowStage.createSubWindowWithOptions('test_MaximizeSupported_0300', options);
      let subWindowClass: window.Window | undefined = undefined;
      promise1.then(async (data) => {
        subWindowClass = data;
        console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.showWindow();
        await subWindowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING);
        let windowStatusType = subWindowClass.getWindowStatus();
        console.info(caseName+ ' subWindowClass.getWindowStatus(). windowStatusType: ' + JSON.stringify(windowStatusType));
        if(isFreeWindowMode == false){
          expect(windowStatusType).assertEqual(window.WindowStatusType.FULL_SCREEN)
          await subWindowClass.destroyWindow()
          done()
        }else {
          expect(windowStatusType).assertEqual(window.WindowStatusType.FLOATING)
          await subWindowClass.destroyWindow()
          done()
        }
      }).catch(async (err: BusinessError) => {
        console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        if (subWindowClass != undefined) {
          await subWindowClass.destroyWindow()
        }
        if (err.code === 1300002 || err.code === 1300004) {
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number     SUB_BASIC_WMS_TEST_MAXMIZE_ACROSS_DISPLAY_0100
     * @tc.name       testMaximizeAcrossDisplaywithDestoryedSubwindow
     * @tc.desc       testMaximizeAcrossDisplaywithDestoryedSubwindow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testMaximizeAcrossDisplaywithDestoryedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testMaximizeAcrossDisplaywithDestoryedSubwindow';
      console.log(caseName + 'begin');
      let subWindowClass: window.Window | undefined;
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      try {
        subWindowClass = await windowStage.createSubWindow(caseName);
        await subWindowClass.destroyWindow();
        await subWindowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, true);
        done();
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002)
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_TEST_MAXMIZE_ACROSS_DISPLAY_0200
     * @tc.name       testMaximizeAcrossDisplaywithSubwindow
     * @tc.desc       testMaximizeAcrossDisplaywithSubwindow
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testMaximizeAcrossDisplaywithSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testMaximizeAcrossDisplaywithSubwindow';
      console.log(caseName + 'begin');
      let subWindowClass: window.Window | undefined;
      let canIUseRes = canIUse('SystemCapability.Window.SessionManager');
      console.log(`${caseName} canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
      try {
        subWindowClass = await windowStage.createSubWindow(caseName);
        let mode = subWindowClass.isInFreeWindowMode();
        console.log(`${caseName} isInFreeWindowMode: ${mode}`);
        if (mode) {
          await subWindowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, true);
        } else {
          await subWindowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass?.destroyWindow();
        if (canIUseRes) {
          expect(err.code).assertEqual(1300004)
          done();
        } else {
          expect(err.code).assertEqual(801)
          done();
        }
      }
    });

     /**
     * @tc.name   testMaximizeAcrossDisplaywithTrue
     * @tc.number SUB_BASIC_WMS_TEST_MAXMIZE_ACROSS_DISPLAY_0300
     * @tc.desc   testMaximizeAcrossDisplaywithTrue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaximizeAcrossDisplaywithTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMaximizeAcrossDisplaywithTrue';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility3(caseName, context);
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      let display999:display.Display;
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let isInFreeWindowMode = mainWindow.isInFreeWindowMode();
        console.log(caseName + ' isInFreeWindowMode: ' + isInFreeWindowMode);
        if (isInFreeWindowMode && display.getFoldStatus() == display.FoldStatus.FOLD_STATUS_HALF_FOLDED) {
          await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, undefined);
          await sleep(1000);
          let windowRect1 = mainWindow.getWindowProperties().windowRect;
          console.log(caseName + ' windowRect1: ' + JSON.stringify(windowRect1));
          let CurrentFoldCreaseRegion: display.FoldCreaseRegion = display.getCurrentFoldCreaseRegion();
          console.info(caseName + `Succeeded in obtaining current fold crease region. Data: ${JSON.stringify(CurrentFoldCreaseRegion)}`);
          display999 = display.getDisplayByIdSync(999);
          let displayRectArr = await display.getAllDisplayPhysicalResolution();
          console.log(caseName + ' displayRectArr: ' + JSON.stringify(displayRectArr));
          let displays = await display.getAllDisplays();
          console.log(caseName + ' displays: ' + JSON.stringify(displays))
          for(let i = 0; i < displays.length; i++){
            console.log(caseName + ' displays.id: ' + JSON.stringify(displays[i].id))
            if(displays[i].id ==0){
              let displayRes1 = displays[i];
              console.log(caseName + ' displayRes1: ' + JSON.stringify(displayRes1));
              expect(windowRect1.width).assertEqual(displayRes1.width)
              let height = displayRectArr[i].physicalHeight-display999.height-CurrentFoldCreaseRegion.creaseRects[0].height;
              console.log(caseName + ' height: ' + JSON.stringify(height));
              expect(windowRect1.height).assertEqual(height)

              await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, true);
              let windowRect2 = mainWindow.getWindowProperties().windowRect;
              console.log(caseName + ' windowRect2: ' + JSON.stringify(windowRect2));
              let displayRes2 = display.getDefaultDisplaySync();
              console.log(caseName + ' displayRes2: ' + JSON.stringify(displayRes2));
              expect(windowRect2.width).assertEqual(displayRes2.width)
              expect(windowRect2.height).assertEqual(height)
              await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, false);
              let windowRect3 = mainWindow.getWindowProperties().windowRect;
              console.log(caseName + ' windowRect3: ' + JSON.stringify(windowRect3));
              let displayRes3 = display.getDefaultDisplaySync();
              console.log(caseName + ' displayRes3: ' + JSON.stringify(displayRes3));
              expect(windowRect3.width).assertEqual(displayRes3.width)
              expect(windowRect3.height).assertEqual(displayRes3.height)

              await terminateAbility3(caseName);
              done();
            }
          }

        } else {
          await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, undefined);
          console.log(caseName + ' maximize success  ');
          await terminateAbility3(caseName);
          done();
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err));
        await terminateAbility3(caseName);
        if (!isSupport) {
          expect(err.code).assertEqual(801)
        } else {
          expect().assertFail();
        }
        done();
      }
    });

    /**
     * @tc.name   testMaximizeAcrossDisplaywithFalse
     * @tc.number SUB_BASIC_WMS_TEST_MAXMIZE_ACROSS_DISPLAY_0400
     * @tc.desc   testMaximizeAcrossDisplaywithFalse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMaximizeAcrossDisplaywithFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMaximizeAcrossDisplaywithFalse';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility3(caseName, context);
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.log(caseName + ' isSupport: ' + isSupport);
      let display999:display.Display;
      try {
        let mainWindow = windowStageStart.getMainWindowSync();
        let isInFreeWindowMode = mainWindow.isInFreeWindowMode();
        console.log(caseName + ' isInFreeWindowMode: ' + isInFreeWindowMode);
        if (isInFreeWindowMode && display.getFoldStatus() == display.FoldStatus.FOLD_STATUS_HALF_FOLDED) {
          await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, undefined);
          await sleep(1000);
          let CurrentFoldCreaseRegion: display.FoldCreaseRegion = display.getCurrentFoldCreaseRegion();
          console.info(caseName + `Succeeded in obtaining current fold crease region. Data: ${JSON.stringify(CurrentFoldCreaseRegion)}`);
          let windowRect1 = mainWindow.getWindowProperties().windowRect;
          console.log(caseName + ' windowRect1: ' + JSON.stringify(windowRect1));
          display999 = display.getDisplayByIdSync(999);
          let displays = await display.getAllDisplays();
          console.log(caseName + ' displays: ' + JSON.stringify(displays))
          for(let i = 0; i < displays.length; i++){
            console.log(caseName + ' displays.id: ' + JSON.stringify(displays[i].id))
            if(displays[i].id ==0){
              let displayRes1 = displays[i];
              console.log(caseName + ' displayRes1: ' + JSON.stringify(displayRes1));
              let displayRectArr = await display.getAllDisplayPhysicalResolution();
              console.log(caseName + ' displayRectArr: ' + JSON.stringify(displayRectArr));
              for (let i = 0; i < displayRectArr.length; i++) {
                console.log(caseName + ' displayRectArr i: ' + JSON.stringify(displayRectArr[i]));
                expect(windowRect1.width).assertEqual(displayRectArr[i].physicalWidth)
                let height = displayRectArr[i].physicalHeight-display999.height-CurrentFoldCreaseRegion.creaseRects[0].height;
                console.log(caseName + ' height: ' + JSON.stringify(height));
                expect(windowRect1.height).assertEqual(height)
                break;
              }
              expect(windowRect1.width).assertEqual(displayRes1.width)
              expect(windowRect1.height).assertEqual(displayRes1.height)

              await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, false);
              let windowRect2 = mainWindow.getWindowProperties().windowRect;
              console.log(caseName + ' windowRect2: ' + JSON.stringify(windowRect2));
              let displayRes2 = display.getDefaultDisplaySync();
              console.log(caseName + ' displayRes2: ' + JSON.stringify(displayRes2));
              expect(windowRect2.width).assertEqual(displayRes2.width)
              expect(windowRect2.height).assertEqual(displayRes2.height)

              await terminateAbility3(caseName);
              done();
            }
          }

        } else {
          await mainWindow.maximize(window.MaximizePresentation.ENTER_IMMERSIVE, undefined);
          console.log(caseName + ' maximize success  ');
          await terminateAbility3(caseName);
          done();
        }
      } catch (err) {
        console.error(caseName + ' failed, err: ' + JSON.stringify(err))
        await terminateAbility3(caseName);
        if (!isSupport) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

  })
}

