import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';

export default function windowImmersiveTest(windowStage: ohosWindow.WindowStage) {
  describe('windowImmersive_test', () => {
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
     * @tc.name      : testGetWindowAvoidAreaTypeSystem
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeSystem', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystem';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.name      : testGetWindowAvoidAreaTypeCutout
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeCutOut', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeCutOut';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(!avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.name      : testGetWindowAvoidAreaTypeSystemGesture
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeSystemGesture', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystemGesture';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.name      : testGetWindowAvoidAreaTypeKeyBoard
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeKeyBoard', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeKeyBoard';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
     * @tc.name      : testGetWindowAvoidAreaTypeNavigationIndicator
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeNavigationIndicator', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeNavigationIndicator';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
        console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
        expect(avoidArea.visible).assertTrue();
        expect(avoidArea.topRect !== null).assertTrue();
        expect(avoidArea.rightRect !== null).assertTrue();
        expect(avoidArea.bottomRect !== null).assertTrue();
        expect(avoidArea.leftRect !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.name      : testGetWindowAvoidAreaTypeSystemInLandScape
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeSystemInLandScape', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystemInLandScape';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.name      : testGetWindowAvoidAreaTypeSystemInPortraitInverted
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeSystemInPortraitInverted', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystemInPortraitInverted';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0800
     * @tc.name      : testGetWindowAvoidAreaTypeCutOutInPortraitInverted
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeCutOutInPortraitInverted', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeCutOutInPortraitInverted';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.PORTRAIT_INVERTED, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertFalse();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0900
     * @tc.name      : testGetWindowAvoidAreaTypeSystemInLandScapeInverted
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeSystemInLandScapeInverted', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeSystemInLandScapeInverted';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.name      : testGetWindowAvoidAreaTypeCutOutInLandScapeInverted
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidAreaTypeCutOutInLandScapeInverted', 0, (done: Function) => {
      let caseName = 'TestGetWindowAvoidAreaTypeCutOutInLandScapeInverted';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setPreferredOrientation(window.Orientation.LANDSCAPE_INVERTED, () => {
          console.info(`${caseName} Succeeded in setting window orientation`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_CUTOUT);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.visible).assertFalse();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
     * @tc.name      : testGetAvoidAreaTypeSystem
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeSystem', 0, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeSystem';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          let avoidArea = data;
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
     * @tc.name      : testGetAvoidAreaTypeCutOut
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeCutOut', 0, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeCutOut';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_CUTOUT).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          let avoidArea = data;
          expect(!avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
     * @tc.name      : testGetAvoidAreaTypeSystemGesture
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeSystemGesture', 0, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeSystemGesture';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM_GESTURE).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          let avoidArea = data;
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
     * @tc.name      : testGetAvoidAreaTypeKeyBoard
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeKeyBoard', 0, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeKeyBoard';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          let avoidArea = data;
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
     * @tc.name      : testGetAvoidAreaTypeNavigationIndicator
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetAvoidAreaTypeNavigationIndicator', 0, (done: Function) => {
      let caseName = 'TestGetAvoidAreaTypeNavigationIndicator';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.getAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).then((data) => {
          console.info(`${caseName} Succeeded in obtaining the area. Data: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to obtain the area. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1003);
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1600
     * @tc.name      : testOnSystemAvoidAreaChange
     * @tc.desc      : listen system avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnSystemAvoidAreaChange', 0, async (done: Function) => {
      let caseName = 'TestOnSystemAvoidAreaChange';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.on('systemAvoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for system avoid area changes. Data: ${JSON.stringify(data)}`);
          windowClass.off('systemAvoidAreaChange');
          done();
        });
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await windowClass.setWindowLayoutFullScreen(false);
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1700
     * @tc.name      : testOnRepeatSystemAvoidAreaChange
     * @tc.desc      : listen system avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnRepeatSystemAvoidAreaChange', 0, async (done: Function) => {
      let caseName = 'TestOnRepeatSystemAvoidAreaChange';
      try {
        let windowClass = windowStage.getMainWindowSync();
        const callback1 = () => {
          console.info(`${caseName} callback1 Succeeded in enabling the listener for system avoid area changes.`);
          expect(false).assertTrue();
          done();
        };
        const callback2 = () => {
          console.info(`${caseName} callback2 Succeeded in enabling the listener for system avoid area changes.`);
          expect(true).assertTrue();
          windowClass.off('systemAvoidAreaChange', callback2);
          done();
        };
        windowClass.on('systemAvoidAreaChange', callback1);
        windowClass.on('systemAvoidAreaChange', callback2);
        windowClass.off('systemAvoidAreaChange', callback1);
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await windowClass.setWindowLayoutFullScreen(false);
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1800
     * @tc.name      : testOffRepeatSystemAvoidAreaChange
     * @tc.desc      : listen system avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOffRepeatSystemAvoidAreaChange', 0, async (done: Function) => {
      let caseName = 'TestOffRepeatSystemAvoidAreaChange';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let num = 0;
        const callback1 = () => {
          console.info(`${caseName} callback1 Succeeded in enabling the listener for system avoid area changes.`);
          num++;
        };
        const callback2 = () => {
          console.info(`${caseName} callback2 Succeeded in enabling the listener for system avoid area changes.`);
          num++;
        };
        windowClass.on('systemAvoidAreaChange', callback1);
        windowClass.on('systemAvoidAreaChange', callback2);
        windowClass.off("systemAvoidAreaChange");
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        console.info(`${caseName} listener for system avoid area changes num is: ${num}`);
        expect(num).assertEqual(0);
        await windowClass.setWindowLayoutFullScreen(false);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1900
     * @tc.name      : testOnAvoidAreaChange
     * @tc.desc      : listen avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnAvoidAreaChange', 0, async (done: Function) => {
      let caseName = 'TestOnAvoidAreaChange';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. Data: ${JSON.stringify(data)}`);
          expect(data !== null).assertTrue();
          windowClass.off('avoidAreaChange');
          done();
        });
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await windowClass.setWindowLayoutFullScreen(false);
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2100
     * @tc.name      : testOffRepeatAvoidAreaChange
     * @tc.desc      : listen system avoid area change
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOffRepeatAvoidAreaChange', 0, async (done: Function) => {
      let caseName = 'TestOffRepeatAvoidAreaChange';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let num = 0;
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} 1 Succeeded in enabling the listener for avoid area changes. Data: ${JSON.stringify(data)}`);
          num++;
        });
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} 2 Succeeded in enabling the listener for avoid area changes. Data: ${JSON.stringify(data)}`);
          num++;
        });
        windowClass.off("avoidAreaChange");
        await windowClass.setWindowLayoutFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        console.info(`${caseName} listener for avoid area changes num is: ${num}`);
        expect(num).assertEqual(0);
        await windowClass.setWindowLayoutFullScreen(false);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2200
     * @tc.name      : testSetWindowSystemBarEnableStatusInvisiblePromise
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableStatusInvisiblePromise', 0, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableStatusInvisiblePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        await windowClass.setWindowSystemBarEnable(['status', 'navigation']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable(['navigation']);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2300
     * @tc.name      : testSetWindowSystemBarEnableStatusVisiblePromise
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableStatusVisiblePromise', 0, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableStatusVisiblePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['navigation']);
        console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable(['status','navigation']);
        console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2400
     * @tc.name      : testSetWindowSystemBarEnableInVisiblePromise
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableInVisiblePromise', 0, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableInVisiblePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        await windowClass.setWindowSystemBarEnable(['status', 'navigation']);
        console.info(`${caseName} Succeeded in setting the system bar to be visible.`);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for system avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        await sleep(1000);
        await windowClass.setWindowSystemBarEnable([]);
        console.info(`${caseName} Succeeded in setting the system bar to be invisible.`);
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2500
     * @tc.name      : testSetWindowSystemBarEnableStatusVisibleCallback
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableStatusVisibleCallback', 0, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableStatusVisibleCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.setWindowSystemBarEnable(['navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        });
        await sleep(1000);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        windowClass.setWindowSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        });
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2600
     * @tc.name      : testSetWindowSystemBarEnableStatusInVisibleCallback
     * @tc.desc      : set window system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnableStatusInVisibleCallback', 0, async (done: Function) => {
      let caseName = 'TestSetWindowSystemBarEnableStatusInVisibleCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.setWindowSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        });
        await sleep(1000);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        windowClass.setWindowSystemBarEnable(['navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        });
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2700
     * @tc.name      : testSetSystemBarEnableStatusPromise
     * @tc.desc      : set system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnableStatusPromise', 0, async (done: Function) => {
      let caseName = 'TestSetSystemBarEnableStatusPromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.setWindowSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        });
        await sleep(1000);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        windowClass.setWindowSystemBarEnable(['navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        });
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2800
     * @tc.name      : testSetSystemBarEnablePromise
     * @tc.desc      : set system bar isVisible
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnablePromise', 0, async (done: Function) => {
      let caseName = 'TestSetSystemBarEnablePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
        windowClass.setWindowSystemBarEnable([], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be invisible.`);
        });
        await sleep(1000);
        windowClass.on('avoidAreaChange', (data) => {
          console.info(`${caseName} Succeeded in enabling the listener for avoid area changes. type: ${JSON.stringify(data.type)} area: ${JSON.stringify(data.area)}`);
          windowClass.off('avoidAreaChange');
          done();
        });
        windowClass.setWindowSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          console.info(`${caseName} Succeeded in setting the status bar to be visible.`);
        });
        await sleep(1000);
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2900
     * @tc.name      : testGetWindowSystemBarProperties
     * @tc.desc      : get window system bar properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowSystemBarProperties', 0, (done: Function) => {
      let caseName = 'TestGetWindowSystemBarProperties';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let systemBarProperty = windowClass.getWindowSystemBarProperties();
        console.info(`${caseName} Success in obtaining system bar properties. Property: ` + JSON.stringify(systemBarProperty));
        expect(systemBarProperty !== null).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3000
     * @tc.name      : testSetSystemBarPropertiesPromise
     * @tc.desc      : set window system bar properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarPropertiesPromise', 0, (done: Function) => {
      let caseName = 'TestSetSystemBarPropertiesPromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          statusBarColor: '#ff00ff',
          navigationBarColor: '#00ff00',
          statusBarContentColor: '#ffffff',
          navigationBarContentColor: '#00ffff'
        };
        windowClass.setSystemBarProperties(SystemBarProperties).then(() => {
          let systemBarProperty = windowClass.getWindowSystemBarProperties();
          console.info(`${caseName} Succeeded in setting the system bar properties. data: ${JSON.stringify(systemBarProperty)}`);
          expect(systemBarProperty.statusBarColor).assertEqual('#FFFF00FF');
          expect(systemBarProperty.navigationBarColor).assertEqual('#FF00FF00');
          expect(systemBarProperty.statusBarContentColor).assertEqual('#FFFFFFFF');
          expect(systemBarProperty.navigationBarContentColor).assertEqual('#FF00FFFF');
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3100
     * @tc.name      : testSetWindowSystemBarPropertiesCallback
     * @tc.desc      : set window system bar properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarPropertiesCallback', 0, (done: Function) => {
      let caseName = 'TestSetWindowSystemBarPropertiesCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          statusBarColor: '#ff00ff',
          navigationBarColor: '#00ff00',
          statusBarContentColor: '#ffffff',
          navigationBarContentColor: '#00ffff'
        };
        windowClass.setWindowSystemBarProperties(SystemBarProperties, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName}  Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in setting the system bar properties.`);
            let systemBarProperty = windowClass.getWindowSystemBarProperties();
            expect(systemBarProperty.statusBarColor).assertEqual('#FFFF00FF');
            expect(systemBarProperty.navigationBarColor).assertEqual('#FF00FF00');
            expect(systemBarProperty.statusBarContentColor).assertEqual('#FFFFFFFF');
            expect(systemBarProperty.navigationBarContentColor).assertEqual('#FF00FFFF');
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3200
     * @tc.name      : testSetWindowSystemBarPropertiesPromise
     * @tc.desc      : set window system bar properties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarPropertiesPromise', 0, (done: Function) => {
      let caseName = 'TestSetWindowSystemBarPropertiesPromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        let SystemBarProperties: window.SystemBarProperties = {
          statusBarColor: '#ff00ff',
          navigationBarColor: '#00ff00',
          statusBarContentColor: '#ffffff',
          navigationBarContentColor: '#00ffff'
        }
        windowClass.setWindowSystemBarProperties(SystemBarProperties).then(() => {
          console.info(`${caseName} Succeeded in setting the system bar properties.`);
          let systemBarProperty = windowClass.getWindowSystemBarProperties();
          expect(systemBarProperty.statusBarColor).assertEqual('#FFFF00FF');
          expect(systemBarProperty.navigationBarColor).assertEqual('#FF00FF00');
          expect(systemBarProperty.statusBarContentColor).assertEqual('#FFFFFFFF');
          expect(systemBarProperty.navigationBarContentColor).assertEqual('#FF00FFFF');
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName}  Failed to set the system bar properties. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3300
     * @tc.name      : testSetImmersive
     * @tc.desc      : set immersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetImmersive', 0, async (done: Function) => {
      let caseName = 'TestSetImmersive';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setImmersiveModeEnabledState(false);
        let immersiveModeStateTrue: boolean = windowClass.getImmersiveModeEnabledState();
        console.info(`${caseName} Succeeded in setting the immersiveMode enabled false. Data: ${immersiveModeStateTrue}`);
        expect(immersiveModeStateTrue).assertFalse();
        await sleep(1000);
        windowClass.setImmersiveModeEnabledState(true);
        let immersiveModeStateFalse: boolean = windowClass.getImmersiveModeEnabledState();
        console.info(`${caseName} Succeeded in setting the immersiveMode enabled true. Data: ${immersiveModeStateFalse}`);
        expect(immersiveModeStateFalse).assertTrue();
        done();
      } catch (exception) {
        console.error(`${caseName} Failed to obtain the main window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3400
     * @tc.name      : testSetFullScreenInImmersiveMode
     * @tc.desc      : set immersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenInImmersiveMode', 0, async (done: Function) => {
      let caseName = 'TestSetFullScreenInImmersiveMode';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setWindowLayoutFullScreen(true).then(async () => {
          windowClass.setImmersiveModeEnabledState(true);
          let beforeImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} Succeeded in setting the immersiveMode enabled true. Data: ${beforeImmersiveModeState}`);
          expect(beforeImmersiveModeState).assertTrue();
          await sleep(1000);
          windowClass.setImmersiveModeEnabledState(false);
          let afterImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} Succeeded in setting the immersiveMode enabled false. Data: ${afterImmersiveModeState}`);
          expect(afterImmersiveModeState).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3500
     * @tc.name      : testSetMaximizeInImmersiveMode
     * @tc.desc      : set immersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetMaximizeInImmersiveMode', 0, async (done: Function) => {
      let caseName = 'TestSetMaximizeInImmersiveMode';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.maximize().then(async () => {
          windowClass.setImmersiveModeEnabledState(true);
          let beforeImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} Succeeded in setting the immersiveMode enabled true. Data: ${beforeImmersiveModeState}`);
          expect(beforeImmersiveModeState).assertTrue();
          await sleep(1000);
          windowClass.setImmersiveModeEnabledState(false);
          let afterImmersiveModeState: boolean = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} Succeeded in setting the immersiveMode enabled false. Data: ${afterImmersiveModeState}`);
          expect(afterImmersiveModeState).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          if(err.code == 801){
            console.info(`${caseName} The current device type does not support to maximize`);
            expect(true).assertTrue();
            done();
          } else {
            console.error(`${caseName} Failed to set the window layout to maximize mode. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3600
     * @tc.name      : testSetLayoutFullScreenFalseCallback
     * @tc.desc      : set layout full screen false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetLayoutFullScreenFalseCallback', 0, async (done: Function) => {
      let caseName = 'TestSetLayoutFullScreenFalseCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setLayoutFullScreen(false, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
            let immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
            console.info(`${caseName} layout full-screen mode is: ${immersiveModeEnabledState}`);
            expect(immersiveModeEnabledState).assertFalse();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3700
     * @tc.name      : testSetLayoutFullScreenTrueCallback
     * @tc.desc      : set layout full screen true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetLayoutFullScreenTrueCallback', 0, async (done: Function) => {
      let caseName = 'TestSetLayoutFullScreenTrueCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setLayoutFullScreen(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
            let immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
            console.info(`${caseName} layout full-screen mode is: ${immersiveModeEnabledState}`);
            expect(immersiveModeEnabledState).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3800
     * @tc.name      : testSetLayoutFullScreenFalsePromise
     * @tc.desc      : set layout full screen false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetLayoutFullScreenFalsePromise', 0, async (done: Function) => {
      let caseName = 'TestSetLayoutFullScreenFalsePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setLayoutFullScreen(false).then(() => {
          console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
          let immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} layout full-screen mode is: ${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3900
     * @tc.name      : testSetLayoutFullScreenTruePromise
     * @tc.desc      : set layout full screen true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetLayoutFullScreenTruePromise', 0, async (done: Function) => {
      let caseName = 'TestSetLayoutFullScreenTruePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setLayoutFullScreen(true).then(() => {
          console.info(`${caseName} Succeeded in setting the window layout to full-screen mode.`);
          let immersiveModeEnabledState = windowClass.getImmersiveModeEnabledState();
          console.info(`${caseName} layout full-screen mode is: ${immersiveModeEnabledState}`);
          expect(immersiveModeEnabledState).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to set the window layout to full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4000
     * @tc.name      : testSetFullScreenFalseCallback
     * @tc.desc      : set full screen false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenFalseCallback', 0, async (done: Function) => {
      let caseName = 'TestSetFullScreenFalseCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setFullScreen(false, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName} Failed to enable the full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
            let properties = windowClass.getWindowProperties();
            console.info(`${caseName} current window isFullScreen: ${properties.isFullScreen}`);
            expect(properties.isFullScreen).assertFalse();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4100
     * @tc.name      : testSetFullScreenTrueCallback
     * @tc.desc      : set full screen true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenTrueCallback', 0, async (done: Function) => {
      let caseName = 'TestSetFullScreenTrueCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setFullScreen(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(`${caseName} Failed to enable the full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
            let properties = windowClass.getWindowProperties();
            console.info(`${caseName} current window isFullScreen: ${properties.isFullScreen}`);
            expect(properties.isFullScreen).assertTrue();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4200
     * @tc.name      : testSetFullScreenFalsePromise
     * @tc.desc      : set full screen false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenFalsePromise', 0, async (done: Function) => {
      let caseName = 'TestSetFullScreenFalseCallback';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setFullScreen(false).then(() => {
          console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
          let properties = windowClass.getWindowProperties();
          console.info(`${caseName} current window isFullScreen: ${properties.isFullScreen}`);
          expect(properties.isFullScreen).assertFalse();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to enable the full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4300
     * @tc.name      : testSetFullScreenTruePromise
     * @tc.desc      : set full screen true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetFullScreenTruePromise', 0, async (done: Function) => {
      let caseName = 'TestSetFullScreenTruePromise';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setFullScreen(true).then(() => {
          console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
          let properties = windowClass.getWindowProperties();
          console.info(`${caseName} current window isFullScreen: ${properties.isFullScreen}`);
          expect(properties.isFullScreen).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed to enable the full-screen mode. Cause code: ${err.code}, message: ${err.message}`);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4400
     * @tc.name      : testSetSpecificSystemBarStatus
     * @tc.desc      : Test the function of setSpecificSystemBarEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSpecificSystemBarStatus', 0, async (done: Function) => {
      let caseName = 'TestSetSpecificSystemBarStatus';
      try {
        let windowClass = windowStage.getMainWindowSync();
        await windowClass.setFullScreen(true);
        console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
        windowClass.setSpecificSystemBarEnabled('status', false).then(async () => {
          console.log(`${caseName} Succeeded in setting the status bar to be invisible.`);
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
          console.info(`${caseName} Get Window Avoid Area: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea.bottomRect.height).assertEqual(0);
          done();
        }).catch((error: BusinessError) => {
          console.log(`${caseName} Failed to set the status bar to be invisible. Cause: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(`${caseName} Failed to set the system bar to be invisible. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}

