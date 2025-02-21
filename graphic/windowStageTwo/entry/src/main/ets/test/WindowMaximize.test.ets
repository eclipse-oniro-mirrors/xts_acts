import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import pipWindow from '@ohos.PiPWindow';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';

export default function windowMaximizeTest(windowStage: ohosWindow.WindowStage) {
  describe('windowMaximize_test', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // pipController = AppStorage.get('pipController') as PiPWindow.PiPController;
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          expect(immersiveModeEnabledState).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          expect(immersiveModeEnabledState).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${message} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else{
            console.error(`${message}} Failed to maximize the window. Cause code: ${err.code}, message: ${err.message}`);
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

