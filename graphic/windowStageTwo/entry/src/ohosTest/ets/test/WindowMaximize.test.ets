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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import pipWindow from '@ohos.PiPWindow';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import settings from '@ohos.settings';

export default function windowMaximizeTest() {
  describe('windowMaximize_test', () => {
    let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));
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
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.DEVICE_SHARED);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name      : testPresentationDefaultArgs
     * @tc.desc      : test the function of testPresentationDefaultArgs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationDefaultArgs', 0, (done: Function) => {
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.name      : testPresentationEnterImmersive
     * @tc.desc      : test the function of testPresentationEnterImmersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationEnterImmersive', 0, (done: Function) => {
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.name      : testPresentationExitImmersive
     * @tc.desc      : test the function of testPresentationExitImmersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationExitImmersive', 0, async (done: Function) => {
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.name      : testPresentationFollowAppImmersiveInWindowLayoutFullScreenTrue
     * @tc.desc      : test the function of testPresentationFollowAppImmersiveInWindowLayoutFullScreenTrue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationFollowAppImmersiveInWindowLayoutFullScreenTrue', 0, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInWindowLayoutFullScreenTrue';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setWindowLayoutFullScreen(true);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          if(deviceType != '2in1'|| isAutoWindow =='false'){
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.name      : testPresentationFollowAppImmersiveInWindowLayoutFullScreenFalse
     * @tc.desc      : test the function of testPresentationFollowAppImmersiveInWindowLayoutFullScreenFalse
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationFollowAppImmersiveInWindowLayoutFullScreenFalse', 0, async (done: Function) => {
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.name      : testPresentationFollowAppImmersiveInLayoutFullScreenTrue
     * @tc.desc      : test the function of testPresentationFollowAppImmersiveInLayoutFullScreenTrue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationFollowAppImmersiveInLayoutFullScreenTrue', 0, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInLayoutFullScreenTrue';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setLayoutFullScreen(true);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertTrue();
          windowClass.recover();
          done();
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.name      : testPresentationFollowAppImmersiveInLayoutFullScreenFalse
     * @tc.desc      : test the function of testPresentationFollowAppImmersiveInLayoutFullScreenFalse
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationFollowAppImmersiveInLayoutFullScreenFalse', 0, async (done: Function) => {
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.name      : testPresentationFollowAppImmersiveInSetImmersiveModeTrue
     * @tc.desc      : test the function of testPresentationFollowAppImmersiveInSetImmersiveModeTrue
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationFollowAppImmersiveInSetImmersiveModeTrue', 0, async (done: Function) => {
      const message = 'TestPresentationFollowAppImmersiveInSetImmersiveModeTrue';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setImmersiveModeEnabledState(true);
        await sleep(1000);
        windowClass.maximize(window.MaximizePresentation.FOLLOW_APP_IMMERSIVE_SETTING).then(() => {
          const immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${message} Succeeded in maximizing the window, immersiveModeEnabledState is：${immersiveModeEnabledState}`);
          if(deviceType != '2in1'|| isAutoWindow =='false'){
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.name      : testPresentationFollowAppImmersiveInSetImmersiveModeFalse
     * @tc.desc      : test the function of testPresentationFollowAppImmersiveInSetImmersiveModeFalse
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationFollowAppImmersiveInSetImmersiveModeFalse', 0, async (done: Function) => {
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
            expect(true).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.name      : testPresentationFollowAppImmersiveInMaximize
     * @tc.desc      : test the function of testPresentationFollowAppImmersiveInMaximize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testPresentationFollowAppImmersiveInMaximize', 0, async (done: Function) => {
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
            expect(true).assertTrue();
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
    * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0100
    * @tc.name      : testSetTitleAndDockHoverShow_subWindow_1300004
    * @tc.desc      : testSetTitleAndDockHoverShow_subWindow_1300004
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level 2
    */
    it('testSetTitleAndDockHoverShow_subWindow_1300004', 2, async (done: Function) => {
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
                expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0200
        * @tc.name      : testSetTitleAndDockHoverShow_Title_show_dock_hide_1
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_show_dock_hide_1
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
    it('testSetTitleAndDockHoverShow_Title_show_dock_hide_1', 2, async (done: Function) => {
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
              expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0300
        * @tc.name      : testSetTitleAndDockHoverShow_Title_show_dock_hide_2
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_show_dock_hide_2
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
    it('testSetTitleAndDockHoverShow_Title_show_dock_hide_2', 2, async (done: Function) => {
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
              expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0400
        * @tc.name      : testSetTitleAndDockHoverShow_Title_show_dock_hide_3
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_show_dock_hide_3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
    it('testSetTitleAndDockHoverShow_Title_show_dock_hide_3', 2, async (done: Function) => {
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
              expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0500
        * @tc.name      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_1
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_1
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_1', 2, async (done: Function) => {
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
          expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0600
        * @tc.name      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_2
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_2
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_2', 2, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_hide_2';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
    promise.then(async () => {
      console.info('Succeeded in maximizing the window.');
      await windowClass.recover();
      expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0700
        * @tc.name      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_3
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_3
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_3', 2, async (done: Function) => {
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
        expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0800
        * @tc.name      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_4
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_4
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_4', 2, async (done: Function) => {
  const message = 'testSetTitleAndDockHoverShow_Title_hide_dock_hide_4';
  try {
    let windowClass = windowStage.getMainWindowSync();
    let promise = windowClass.setTitleAndDockHoverShown(true, false);
    promise.then(async () => {
      console.info('Succeeded in setTitleAndDockHoverShown the window.');
      let promise = windowClass.maximize(window.MaximizePresentation.ENTER_IMMERSIVE_DISABLE_TITLE_AND_DOCK_HOVER);
      promise.then(async () => {
        console.info('Succeeded in maximizing the window.');
        expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_0900
        * @tc.name      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_5
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_hide_dock_hide_5
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_hide_dock_hide_5', 2, async (done: Function) => {
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
        expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1000
        * @tc.name      : testSetTitleAndDockHoverShow_Title_show_dock_show_1
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_show_dock_show_1
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_show_dock_show_1', 2, async (done: Function) => {
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
          expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1100
        * @tc.name      : testSetTitleAndDockHoverShow_Title_show_dock_show_2
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_show_dock_show_2
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_show_dock_show_1', 2, async (done: Function) => {
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
          expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1200
        * @tc.name      : testSetTitleAndDockHoverShow_Title_show_dock_show_2
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_show_dock_show_2
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_show_dock_show_2', 2, async (done: Function) => {
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
          expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1300
        * @tc.name      : testSetTitleAndDockHoverShow_Title_hide_dock_show
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_hide_dock_show
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_hide_dock_show', 2, async (done: Function) => {
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
          expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1400
        * @tc.name      : testSetTitleAndDockHoverShow_Title_hide_dock_show_1
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_hide_dock_show_1
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_hide_dock_show_1', 2, async (done: Function) => {
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
          expect(true).assertTrue();
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
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_TITLE_AND_DOCK_HOVER_SHOW_1500
        * @tc.name      : testSetTitleAndDockHoverShow_Title_hide_dock_show_2
        * @tc.desc      : testSetTitleAndDockHoverShow_Title_hide_dock_show_2
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 2
    */
it('testSetTitleAndDockHoverShow_Title_hide_dock_show_2', 2, async (done: Function) => {
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
          expect(true).assertTrue();
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








  })
}

