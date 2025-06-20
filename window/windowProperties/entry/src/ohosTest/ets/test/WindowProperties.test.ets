/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType,Size, Level } from '@ohos/hypium';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import display from '@ohos.display';


export default function windowPropertiesTest() {
  describe('windowPropertiesTest', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      let windowClass = windowStage.getMainWindowSync();
      await sleep(300);

    });

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0100
     * @tc.name      : testSnapShotSync_subWindow_Destroy_1300002
     * @tc.desc      : snapshot 1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0200
     * @tc.name      : testSnapShotSync_subWindow_not_loadContent_1300002
     * @tc.desc      : snapshot 1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
          done()
        }else {
          expect(exception.code).assertEqual(1300002);
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0300
     * @tc.name      : testSnapShotSync_subWindow_not_showWindow_1300002
     * @tc.desc      : snapshot 1300002
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
          done()
        }else {
          expect(exception.code).assertEqual(1300002);
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0400
     * @tc.name      : testSnapShotSync_mainWindow
     * @tc.desc      : snapshot mainWIndow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0500
     * @tc.name      : testSnapShotSync_mainWindow_Privacy
     * @tc.desc      : snapshot mainWIndow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
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
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0600
     * @tc.name      : testSnapShotSync_subWindow
     * @tc.desc      : snapshot subWIndow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0700
     * @tc.name      : testSnapShotSync_subWindow_Privacy
     * @tc.desc      : snapshot testSnapShotSync_subWindow_Privacy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSnapShotSync_subWindow_Privacy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0800
     * @tc.name      : testSnapShotSync_dialogWindow
     * @tc.desc      : snapshot testSnapShotSync_dialogWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSnapShotSync_dialogWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_0900
     * @tc.name      : testSnapShotSync_dialogWindow_Privacy
     * @tc.desc      : snapshot testSnapShotSync_dialogWindow_Privacy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
          done()
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_1000
     * @tc.name      : testSnapShotSync_floatWindow
     * @tc.desc      : snapshot testSnapShotSync_floatWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
          done()
        }else if(exception.code == 1300002){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SNAPSHOTSYNC_1100
     * @tc.name      : testSnapShotSync_floatWindow_Privacy
     * @tc.desc      : snapshot testSnapShotSync_floatWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
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
          done()
        }else if(exception.code == 1300002){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }

      }
    })


  })
}
