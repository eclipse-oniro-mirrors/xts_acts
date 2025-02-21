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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'

export default function windowPromiseTest(context, windowStage, abilityStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('windowInterface_optionalParameter_test', function () {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;

    function unexpectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      expect(TRUE_FLAG).assertFail();
      done();
    }

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    function buttonClick(buttonText, msgStr) {
      console.info(msgStr + `case come in buttonClick fun`)
      return new Promise(async (resolve, reject) => {
        let driver = await UiDriver.create()
        console.info(msgStr + `case come in buttonClick fun 222`)
        console.info(msgStr + `driver is ${JSON.stringify(driver)}`)
        await sleep(1000)
        console.info(msgStr + `UiDriver start`)
        let button = null
        button = await driver.findComponent(BY.text(buttonText))
        console.info(msgStr + `button is ${JSON.stringify(button)}`)
        await sleep(1000)
        if (button) {
          console.info(msgStr + `button click begin`)
          await button.click()
          console.info(msgStr + `button click end`)
          resolve(msgStr + 'get button successed')
        } else {
          console.info(msgStr + `inter else: button is null`)
          reject(msgStr + 'get button failed')
        }
      })
    }

    function inputClick(buttonText, msgStr) {
      console.info(msgStr + `case come in inputClick fun`)
      return new Promise(async (resolve, reject) => {
        let driver = await UiDriver.create()
        console.info(msgStr + `case come in inputClick fun 222`)
        console.info(msgStr + `driver is ${JSON.stringify(driver)}`)
        await sleep(1000)
        console.info(msgStr + `UiDriver start`)
        let input = null
        input = await driver.findComponent(BY.key(buttonText))
        console.info(msgStr + `input is ${JSON.stringify(input)}`)
        await sleep(1000)
        if (input) {
          console.info(msgStr + `input click begin`)
          await input.click()
          console.info(msgStr + `input click end`)
          resolve(msgStr + 'get input successed')
        } else {
          console.info(msgStr + `inter else: input is null`)
          reject(msgStr + 'get input failed')
        }
      })
    }
    beforeAll(async function () {
      // 点击掉USB用于的弹窗
      let msgstr ='USB用于的弹窗'
      await buttonClick('取消', msgstr).catch(async err => {
        console.info(msgstr + err);
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2360
     * @tc.name      : testTouchOutsideBaseTest
     * @tc.desc      : Enable listening for click events outside the area of this window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testTouchOutsideBaseTest', 0, async function (done) {
      let caseName = 'testTouchOutsideBaseTest';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let mainWin = null;
      mainWin = await windowStage.getMainWindow().catch((err) => {
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'getMainWindow success');
      let callback = function (params) {
        console.log('windowTest on/off touchOutside callback success');
      }
      try {
        mainWin.on('touchOutside', callback);
      } catch (err) {
        console.log(msgStr + 'window on touchOutside failed');
        expect().assertFail();
        done();
      }
      await sleep(1000);
      try {
        mainWin.off('touchOutside', callback);
        done();
      } catch (err) {
        console.log(msgStr + 'window off touchOutside failed');
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2370
     * @tc.name      : testWindowOffTouchOutsideCancelAll
     * @tc.desc      : Turns off listening for click events outside this window area.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindowOffTouchOutsideCancelAll', 0, async function (done) {
      let caseName = 'testWindowOffTouchOutsideCancelAll';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'touchOutside01';
      let windowId_two = 'touchOutside001';
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowConfig_two = {
        name: windowId_two, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let tempWnd = null;
      let tempWnd_two = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'createWindow tempWnd failed');
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
        done();
      });
      await tempWnd.resize(400, 400).catch((err) => {
        console.log(msgStr + 'tempWnd.resize failed');
        expect().assertFail();
        done();
      });
      await tempWnd.moveWindowTo(0, 0).catch((err) => {
        console.log(msgStr + 'tempWnd.moveWindowTo failed');
        expect().assertFail();
        done();
      });
      await tempWnd.showWindow().catch((err) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
        done();
      });
      tempWnd_two = await ohosWindow.createWindow(windowConfig_two).catch((err) => {
        console.log(msgStr + 'createWindow tempWnd_two failed');
        expect().assertFail();
        done();
      });
      expect(!!tempWnd_two).assertTrue();
      await tempWnd_two.loadContent('MainAbility/pages/second/pageOne').catch((err) => {
        console.log(msgStr + 'tempWnd_two.loadContent failed');
        expect().assertFail();
        done();
      });
      await tempWnd_two.resize(500, 500).catch((err) => {
        console.log(msgStr + 'tempWnd_two.resize failed');
        expect().assertFail();
        done();
      });
      await tempWnd_two.moveWindowTo(0, 500).catch((err) => {
        console.log(msgStr + 'tempWnd_two.moveWindowTo failed');
        expect().assertFail();
        done();
      });
      await tempWnd_two.showWindow().catch((err) => {
        console.log(msgStr + 'tempWnd_two.showWindow failed');
        expect().assertFail();
        done();
      });
      tempWnd.on('touchOutside', (data) => {
        console.info(msgStr + "first listener trigger");
        num++
        firstListenFlag = true
      });
      tempWnd.on('touchOutside', (data) => {
        console.info(msgStr + "second listener trigger");
        num++
        secondListenFlag = true
      });
      await sleep(3000);
      await buttonClick('点击pageOne', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        await tempWnd_two.destroyWindow();
        expect().assertFail();
        done();
      })
      tempWnd.off('touchOutside');
      firstListenFlag = false
      secondListenFlag = false
      await buttonClick('点击pageOne', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        await tempWnd_two.destroyWindow();
        expect().assertFail();
        done();
      })
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        await tempWnd_two.destroyWindow();
        done();
      } else {
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2380
     * @tc.name      : Test testWindowOffTouchOutsideCancelSingle
     * @tc.desc      : Turns off listening for click events outside this window area.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindowOffTouchOutsideCancelSingle', 0, async function (done) {
      let caseName = 'testWindowOffTouchOutsideCancelSingle';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      let windowId = 'touchOutside02';
      let windowId_two = 'touchOutside002';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowConfig_two = {
        name: windowId_two, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let tempWnd = null;
      let tempWnd_two = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.resize(400, 400).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.moveWindowTo(0, 0).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.moveWindowTo ', done);
      });
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      tempWnd_two = await ohosWindow.createWindow(windowConfig_two).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd_two).assertTrue();
      await tempWnd_two.loadContent('MainAbility/pages/second/pageOne').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd_two.resize(500, 500).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd_two.moveWindowTo(0, 500).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.moveWindowTo ', done);
      });
      await tempWnd_two.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      tempWnd.on('touchOutside', firstCall);
      tempWnd.on('touchOutside', secondCall);
      await sleep(1000);
      await buttonClick('点击pageOne', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        await tempWnd_two.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      tempWnd.off('touchOutside', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await buttonClick('点击pageOne', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        await tempWnd_two.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(1000)
      await tempWnd.destroyWindow();
      await tempWnd_two.destroyWindow();
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2170
     * @tc.name      : testWindowStage_loadContent_Test_001
     * @tc.desc      : Verify The optional parameter is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindowStage_loadContent_Test_001', 0, async function (done) {
      let caseName = 'windowStage_loadContent_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load = await windowStage.loadContent('MainAbility/pages/second/second', undefined).catch((err) => {
        console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!load).assertTrue();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2280
     * @tc.name      : testWindow_off_WindowSizeChange_No_Callback
     * @tc.desc      : Turn off listening for window size changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_WindowSizeChange_No_Callback', 0, async function (done) {
      let caseName = 'testWindow_off_WindowSizeChange_No_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'window_off_windowSizeChange_Test_001';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      tempWnd.on('windowSizeChange', () => {
        console.info(msgStr + "first listener trigger");
        num++
        firstListenFlag = true
      });
      tempWnd.on('windowSizeChange', (data) => {
        console.info(msgStr + "second listener trigger");
        num++
        secondListenFlag = true
      });
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setWindowMode(102).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setWindowMode 102', done);
      });
      await tempWnd.resize(200, 600).catch(async (err) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        await tempWnd.destroyWindow();
        done();
      })
      await sleep(1000);
      tempWnd.off('windowSizeChange');
      firstListenFlag = false
      secondListenFlag = false
      await tempWnd.resize(500, 500).catch(async (err) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        await tempWnd.destroyWindow();
        done();
      })
      console.error(msgStr + 'num : ' + num);
      await sleep(500);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2290
     * @tc.name      : testWindow_off_WindowSizeChange_SecondCall_Callback
     * @tc.desc      : Turn off listening for window size changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_WindowSizeChange_SecondCall_Callback', 0, async function (done) {
      let caseName = 'testWindow_off_WindowSizeChange_SecondCall_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'window_off_windowSizeChange_Test_002';
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      tempWnd.on('windowSizeChange', firstCall);
      tempWnd.on('windowSizeChange', secondCall);
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setWindowMode(102).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setWindowMode 102', done);
      });
      await tempWnd.resize(200, 600).catch(async (err) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        await tempWnd.destroyWindow();
        done();
      })
      await sleep(1000);
      tempWnd.off('windowSizeChange', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await tempWnd.resize(500, 500).catch(async (err) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        await tempWnd.destroyWindow();
        done();
      })
      await sleep(500);
      if (!firstListenFlag && secondListenFlag) {
        tempWnd.off('windowSizeChange');
        await tempWnd.destroyWindow();
        done();
      } else {
        tempWnd.off('windowSizeChange');
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2200
     * @tc.name      : testWindow_off_AvoidAreaChange_AllListening_LogOut
     * @tc.desc      : Disable listening for system avoidance zone changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_AvoidAreaChange_AllListening_LogOut', 0, async function (done) {
      let caseName = 'testWindow_off_AvoidAreaChange_AllListening_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      let tempWnd = null
      tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      tempWnd.on('avoidAreaChange', () => {
        console.info(msgStr + "first listener trigger");
        num++
        firstListenFlag = true
      });
      tempWnd.on('avoidAreaChange', (data) => {
        console.info(msgStr + 'second listener trigger');
        num++
        secondListenFlag = true
      });
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      await tempWnd.setSystemBarEnable(['status']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      await sleep(1000);
      tempWnd.off('avoidAreaChange');
      firstListenFlag = false
      secondListenFlag = false
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      await sleep(500);
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2210
     * @tc.name      : testWindow_off_AvoidAreaChange_FirstCall_LogOut
     * @tc.desc      : Disable listening for system avoidance zone changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_AvoidAreaChange_FirstCall_LogOut', 0, async function (done) {
      let caseName = 'testWindow_off_AvoidAreaChange_FirstCall_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      tempWnd.on('avoidAreaChange', firstCall);
      tempWnd.on('avoidAreaChange', secondCall);
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      await sleep(1000);
      tempWnd.off('avoidAreaChange', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      await sleep(1000);
      if (!firstListenFlag && secondListenFlag) {
        tempWnd.off('avoidAreaChange');
        done();
      } else {
        tempWnd.off('avoidAreaChange');
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2260
     * @tc.name      : testWindow_off_screenshot_AllListening_LogOut
     * @tc.desc      : Disable the monitoring of screenshots.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_screenshot_AllListening_LogOut', 0, async function (done) {
      let caseName = 'testWindow_off_screenshot_AllListening_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      let windowId = 'window_off_screenshot_Test_001';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/pageOne').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.resize(500, 500).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      tempWnd.on('screenshot', (data) => {
        console.info(msgStr + "first listener trigger");
        num++
        firstListenFlag = true
      });
      tempWnd.on('screenshot', (data) => {
        console.info(msgStr + "second listener trigger");
        num++
        secondListenFlag = true
      });
      // 截屏代码
      await screenshot.save().then((pixelMap) => {
        console.log('Succeeded in saving sreenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
        pixelMap.release(); // PixelMap使用完后及时释放内存
      }).catch((err) => {
        console.log('Failed to save screenshot. Code: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      tempWnd.off('screenshot');
      firstListenFlag = false
      secondListenFlag = false
      // 截屏代码
      await screenshot.save().then((pixelMap) => {
        console.log('Succeeded in saving sreenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
        pixelMap.release(); // PixelMap使用完后及时释放内存
      }).catch((err) => {
        console.log('Failed to save screenshot. Code: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        done();
      } else {
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2270
     * @tc.name      : testWindow_off_screenshot_FirstCall_LogOut
     * @tc.desc      : Disable the monitoring of screenshots.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_screenshot_FirstCall_LogOut', 0, async function (done) {
      let caseName = 'testWindow_off_screenshot_FirstCall_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      let windowId = 'window_off_screenshot_Test_002';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/pageOne').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.resize(500, 500).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      tempWnd.on('screenshot', firstCall);
      tempWnd.on('screenshot', secondCall);

      // 截屏代码
      await screenshot.save().then((pixelMap) => {
        console.log('Succeeded in saving sreenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
        pixelMap.release(); // PixelMap使用完后及时释放内存
      }).catch((err) => {
        console.log('Failed to save screenshot. Code: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      tempWnd.off('screenshot', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      // 截屏代码
      await screenshot.save().then((pixelMap) => {
        console.log('Succeeded in saving sreenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
        pixelMap.release(); // PixelMap使用完后及时释放内存
      }).catch((err) => {
        console.log('Failed to save screenshot. Code: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      tempWnd.off('screenshot');
      await tempWnd.destroyWindow();
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2220
     * @tc.name      : testWindow_off_dialogTargetTouch_AllListening_LogOut
     * @tc.desc      : Turns on modal window listener for click events on target Windows.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_dialogTargetTouch_AllListening_LogOut', 0, async function (done) {
      let caseName = 'testWindow_off_dialogTargetTouch_AllListening_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      let windowId = 'window_off_dialogTargetTouch_Test_001';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/pageOne').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.resize(500, 500).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      tempWnd.on('dialogTargetTouch', (data) => {
        console.info(msgStr + "first listener trigger");
        num++
        firstListenFlag = true
      });
      tempWnd.on('dialogTargetTouch', (data) => {
        console.info(msgStr + "second listener trigger");
        num++
        secondListenFlag = true
      });
      // 点击模态窗口
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(1000);
      tempWnd.off('dialogTargetTouch');
      firstListenFlag = false
      secondListenFlag = false
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2230
     * @tc.name      : testWindow_off_dialogTargetTouch_FirstCall_LogOut
     * @tc.desc      : Turns on modal window listener for click events on target Windows.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_dialogTargetTouch_FirstCall_LogOut', 0, async function (done) {
      let caseName = 'testWindow_off_dialogTargetTouch_FirstCall_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      let windowId = 'window_off_dialogTargetTouch_Test_002';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/pageOne').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.resize(500, 500).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      tempWnd.on('dialogTargetTouch', firstCall);
      tempWnd.on('dialogTargetTouch', secondCall);
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(1000);
      tempWnd.off('dialogTargetTouch', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(1000);
      tempWnd.off('dialogTargetTouch');
      await tempWnd.destroyWindow();
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2240
     * @tc.name      : testWindow_off_keyboardHeightChange_AllListening_LogOut
     * @tc.desc      : Turn off listening for keyboard height changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_keyboardHeightChange_AllListening_LogOut', 0, async function (done) {
      let caseName = 'testWindow_off_keyboardHeightChange_AllListening_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      let windowId = 'window_off_keyboardHeightChange_Test_001';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/pageTwo').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.loadContent', done);
      });
      let current_display_Class = display.getDefaultDisplaySync();
      await tempWnd.resize(800, current_display_Class.height).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.moveWindowTo(0, 0).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.moveWindowTo ', done);
      });
      await tempWnd.showWindow().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.showWindow', done);
      });
      tempWnd.on('keyboardHeightChange', (data) => {
        console.info(msgStr + "first listener trigger");
        num++
        firstListenFlag = true
      });
      tempWnd.on('keyboardHeightChange', (data) => {
        console.info(msgStr + "second listener trigger");
        num++
        secondListenFlag = true
      });
      await inputClick('pageTwoinput', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(1000);
      tempWnd.off('keyboardHeightChange');
      firstListenFlag = false
      secondListenFlag = false
      await sleep(1000);
      await buttonClick('点击按钮获取焦点', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(1000);
      await inputClick('pageTwoinputSecond', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(2000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2250
     * @tc.name      : testWindow_off_keyboardHeightChange_FirstCall_LogOut
     * @tc.desc      : Turn off listening for keyboard height changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindow_off_keyboardHeightChange_FirstCall_LogOut', 0, async function (done) {
      let caseName = 'testWindow_off_keyboardHeightChange_FirstCall_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      let windowId = 'window_off_keyboardHeightChange_Test_002';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/pageTwo').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.loadContent', done);
      });
      let current_display_Class = display.getDefaultDisplaySync();
      await tempWnd.resize(800, current_display_Class.height).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.resetSize', done);
      });
      await tempWnd.moveWindowTo(0, 0).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.moveWindowTo ', done);
      });
      await tempWnd.showWindow().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.showWindow', done);
      });
      tempWnd.on('keyboardHeightChange', firstCall);
      tempWnd.on('keyboardHeightChange', secondCall);
      await inputClick('pageTwoinput', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(1000);
      tempWnd.off('keyboardHeightChange', firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await sleep(1000);
      await buttonClick('点击按钮获取焦点', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(1000);
      await inputClick('pageTwoinputSecond', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(2000);
      if (!firstListenFlag && secondListenFlag) {
        tempWnd.off('keyboardHeightChange');
        await tempWnd.destroyWindow();
        done();
      } else {
        tempWnd.off('keyboardHeightChange');
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2180
     * @tc.name      : testWindowStage_off_windowStageEvent_AllListening_LogOut
     * @tc.desc      : Turn off listening for Windows Stage life cycle changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindowStage_off_windowStageEvent_AllListening_LogOut', 0, async function (done) {
      let caseName = 'testWindowStage_off_windowStageEvent_AllListening_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      function firstCall() {
        console.log(msgStr + "first listener trigger")
        num++
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        num++
        secondListenFlag = true
      }

      let tempWnd = null;
      tempWnd = windowStage.getMainWindowSync();
      expect(!!tempWnd).assertTrue();
      windowStage.on("windowStageEvent", firstCall);
      windowStage.on("windowStageEvent", secondCall);
      await tempWnd.hide().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.hide', done);
      });
      await sleep(1000);
      windowStage.off("windowStageEvent");
      firstListenFlag = false
      secondListenFlag = false
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2190
     * @tc.name      : testWindowStage_off_windowStageEvent_FirstCall_LogOut
     * @tc.desc      : Turn off listening for Windows Stage life cycle changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testWindowStage_off_windowStageEvent_FirstCall_LogOut', 0, async function (done) {
      let caseName = 'testWindowStage_off_windowStageEvent_FirstCall_LogOut';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      let tempWnd = null;
      tempWnd = windowStage.getMainWindowSync();
      expect(!!tempWnd).assertTrue();
      windowStage.on("windowStageEvent", firstCall);
      windowStage.on("windowStageEvent", secondCall);
      await tempWnd.hide().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.hide', done);
      });
      await sleep(1000);
      windowStage.off("windowStageEvent", firstCall);
      firstListenFlag = false
      secondListenFlag = false
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      await sleep(1000);
      windowStage.off("windowStageEvent");
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0340
     * @tc.name      : testDisplay_off_add_Deregister_All_Listeners
     * @tc.desc      : Enable the monitor that shows device changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_add_Deregister_All_Listeners', 0, async function (done) {
      let caseName = 'testDisplay_off_add_Deregister_All_Listeners';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      let screenClass = null;
      let screenClass_two = null;

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        num++
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        num++
        secondListenFlag = true
      }

      display.on("add", firstCall);
      display.on("add", secondCall);
      screenClass = await screen.createVirtualScreen({
        name: 'add01',
        width: 1080,
        height: 2340,
        density: 2,
        surfaceId: ''
      }).catch((err) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', done);
      });
      expect(!!screenClass).assertTrue();
      await screen.makeExpand([{
                                 screenId: 0, startX: 0, startY: 0
                               }, {
                                 screenId: screenClass.id, startX: 1080, startY: 0
                               }]).catch((err) => {
        unexpectedError(err, caseName, 'screen.makeExpand', done);
      });
      await sleep(1000);
      display.off('add')
      firstListenFlag = false
      secondListenFlag = false
      await screen.destroyVirtualScreen(screenClass.id)
      screenClass_two = await screen.createVirtualScreen({
        name: 'add001',
        width: 900,
        height: 2000,
        density: 3,
        surfaceId: ''
      }).catch((err) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', done);
      });
      expect(!!screenClass_two).assertTrue();
      await screen.makeExpand([{
                                 screenId: 0, startX: 0, startY: 0
                               }, {
                                 screenId: screenClass_two.id, startX: 1080, startY: 0
                               }]).catch((err) => {
        unexpectedError(err, caseName, 'screen.makeExpand', done);
      });
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        await screen.destroyVirtualScreen(screenClass_two.id)
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0350
     * @tc.name      : testDisplay_off_add_Deregister_FirstCall_Listeners
     * @tc.desc      : Enable the monitor that shows device changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_add_Deregister_FirstCall_Listeners', 0, async function (done) {
      let caseName = 'testDisplay_off_add_Deregister_FirstCall_Listeners';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let screenClass = null;
      let screenClass_two = null;

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      display.on("add", firstCall);
      display.on("add", secondCall);
      screenClass = await screen.createVirtualScreen({
        name: 'add02',
        width: 1080,
        height: 2340,
        density: 2,
        surfaceId: ''
      }).catch((err) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', done);
      });
      expect(!!screenClass).assertTrue();
      await screen.makeExpand([{
                                 screenId: 0, startX: 0, startY: 0
                               }, {
                                 screenId: screenClass.id, startX: 1080, startY: 0
                               }]).catch((err) => {
        unexpectedError(err, caseName, 'screen.makeExpand', done);
      });
      await sleep(1000);
      display.off("add", firstCall)
      firstListenFlag = false
      secondListenFlag = false
      await screen.destroyVirtualScreen(screenClass.id)
      screenClass_two = await screen.createVirtualScreen({
        name: 'add002',
        width: 900,
        height: 2000,
        density: 3,
        surfaceId: ''
      }).catch((err) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', done);
      });
      expect(!!screenClass_two).assertTrue();
      await screen.makeExpand([{
                                 screenId: 0, startX: 0, startY: 0
                               }, {
                                 screenId: screenClass_two.id, startX: 1080, startY: 0
                               }]).catch((err) => {
        unexpectedError(err, caseName, 'screen.makeExpand', done);
      });
      await sleep(1000);
      await screen.destroyVirtualScreen(screenClass_two.id)
      display.off("add")
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0380
     * @tc.name      : testDisplay_off_remove_Deregister_All_Listeners
     * @tc.desc      : Enable the monitor that shows device changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_remove_Deregister_All_Listeners', 0, async function (done) {
      let caseName = 'testDisplay_off_remove_Deregister_All_Listeners';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      let screenClass = null;
      let screenClass_two = null;

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        num++
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        num++
        secondListenFlag = true
      }

      display.on('remove', firstCall);
      display.on('remove', secondCall);
      screenClass = await screen.createVirtualScreen({
        name: 'remove01',
        width: 1080,
        height: 2340,
        density: 2,
        surfaceId: ''
      }).catch((err) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', done);
      });
      expect(!!screenClass).assertTrue();
      await screen.makeExpand([{
                                 screenId: 0, startX: 0, startY: 0
                               }, {
                                 screenId: screenClass.id, startX: 1080, startY: 0
                               }]).catch((err) => {
        unexpectedError(err, caseName, 'screen.makeExpand', done);
      });
      await screen.destroyVirtualScreen(screenClass.id)
      await sleep(1000);
      display.off('remove')
      firstListenFlag = false
      secondListenFlag = false
      screenClass_two = await screen.createVirtualScreen({
        name: 'remove001',
        width: 900,
        height: 2000,
        density: 3,
        surfaceId: ''
      }).catch((err) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', done);
      });
      expect(!!screenClass_two).assertTrue();
      await screen.makeExpand([{
                                 screenId: 0, startX: 0, startY: 0
                               }, {
                                 screenId: screenClass_two.id, startX: 1080, startY: 0
                               }]).catch((err) => {
        unexpectedError(err, caseName, 'screen.makeExpand', done);
      });
      await screen.destroyVirtualScreen(screenClass_two.id)
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0390
     * @tc.name      : testDisplay_off_remove_Deregister_FirstCall_Listeners
     * @tc.desc      : Enable the monitor that shows device changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_remove_Deregister_FirstCall_Listeners', 0, async function (done) {
      let caseName = 'testDisplay_off_remove_Deregister_FirstCall_Listeners';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let screenClass = null;
      let screenClass_two = null;

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      display.on('remove', firstCall);
      display.on('remove', secondCall);
      screenClass = await screen.createVirtualScreen({
        name: 'remove02',
        width: 1080,
        height: 2340,
        density: 2,
        surfaceId: ''
      }).catch((err) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', done);
      });
      expect(!!screenClass).assertTrue();
      await screen.makeExpand([{
                                 screenId: 0, startX: 0, startY: 0
                               }, {
                                 screenId: screenClass.id, startX: 1080, startY: 0
                               }]).catch((err) => {
        unexpectedError(err, caseName, 'screen.makeExpand', done);
      });
      await screen.destroyVirtualScreen(screenClass.id)
      await sleep(1000);
      display.off('remove', firstCall)
      firstListenFlag = false
      secondListenFlag = false
      screenClass_two = await screen.createVirtualScreen({
        name: 'remove002',
        width: 900,
        height: 2000,
        density: 3,
        surfaceId: ''
      }).catch((err) => {
        unexpectedError(err, caseName, 'screen.createVirtualScreen', done);
      });
      expect(!!screenClass_two).assertTrue();
      await screen.makeExpand([{
                                 screenId: 0, startX: 0, startY: 0
                               }, {
                                 screenId: screenClass_two.id, startX: 1080, startY: 0
                               }]).catch((err) => {
        unexpectedError(err, caseName, 'screen.makeExpand', done);
      });
      await screen.destroyVirtualScreen(screenClass_two.id)
      await sleep(1000);
      display.off('remove')
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0360
     * @tc.name      : testDisplay_off_change_Deregister_All_Listeners
     * @tc.desc      : Enable monitoring of screen status changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_change_Deregister_All_Listeners', 0, async function (done) {
      let caseName = 'testDisplay_off_change_Deregister_All_Listeners';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let num = 0
      let firstListenFlag = false
      let secondListenFlag = false
      function firstCall() {
        console.log(msgStr + "first listener trigger")
        num++
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        num++
        secondListenFlag = true
      }

      display.on('change', firstCall);
      display.on('change', secondCall);
      let mainWindow = null
      mainWindow = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      expect(!!mainWindow).assertTrue();
      await mainWindow.setPreferredOrientation(ohosWindow.Orientation.PORTRAIT_INVERTED).catch((err)=>{
        console.error(msgStr+'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      display.off('change')
      firstListenFlag = false
      secondListenFlag = false
      await mainWindow.setPreferredOrientation(ohosWindow.Orientation.UNSPECIFIED).catch((err)=>{
        console.error(msgStr+'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
        expect(TRUE_FLAG).assertFail();
        done();
      });
      await sleep(1000);
      if (num >= 2 && firstListenFlag === false && secondListenFlag === false) {
        done();
      }else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0370
     * @tc.name      : testDisplay_off_change_Deregister_FirstCall_Listeners
     * @tc.desc      : Enable monitoring of screen status changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDisplay_off_change_Deregister_FirstCall_Listeners', 0, async function (done) {
      let caseName = 'testDisplay_off_change_Deregister_FirstCall_Listeners';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let screenClass = null;

      function firstCall() {
        console.log(msgStr + "first listener trigger")
        firstListenFlag = true
      }

      function secondCall() {
        console.log(msgStr + "second listener trigger")
        secondListenFlag = true
      }

      display.on('change', firstCall);
      display.on('change', secondCall);
      let mainWindow = null
      mainWindow = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      expect(!!mainWindow).assertTrue();
      await mainWindow.setPreferredOrientation(ohosWindow.Orientation.PORTRAIT_INVERTED).catch((err)=>{
        console.error(msgStr+'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      display.off('change', firstCall)
      firstListenFlag = false
      secondListenFlag = false
      await mainWindow.setPreferredOrientation(ohosWindow.Orientation.UNSPECIFIED).catch((err)=>{
        console.error(msgStr+'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      display.off('change')
      if (!firstListenFlag && secondListenFlag) {
        done();
      } else {
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0610
     * @tc.name      : testGetUIContext_Instances
     * @tc.desc      : Get the UIContext instance.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetUIContext_Instances', 0, async function (done) {
      let caseName = 'testGetUIContext_Instances';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let uiContext = null;
      console.log(msgStr + 'begin');
      let mainWindow = null
      mainWindow = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      expect(!!mainWindow).assertTrue();
      // 获取UIContext实例。
      uiContext = mainWindow.getUIContext();
      expect(!!uiContext).assertTrue();
      console.log(msgStr + 'after uiContext: ' + JSON.stringify(uiContext));
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2500
     * @tc.name      : testGetLastWindow_CreateSubWindow
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_CreateSubWindow', 0, async function () {
      let caseName = 'testGetLastWindow_CreateSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow = null;
      subWindow = await windowStage.createSubWindow('testGetLastWindow_CreateSubWindow').catch((err) => {
        expect().assertFail();
      });
      expect(!!subWindow).assertTrue();
      await subWindow.resize(400, 400).catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await subWindow.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await subWindow.moveWindowTo(100, 100).catch((err) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await subWindow.showWindow().catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let lastWindow = null;
      lastWindow = await ohosWindow.getLastWindow(context).catch((err) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let properties = lastWindow.getWindowProperties();
      expect(properties.windowRect.width).assertEqual(400);
      expect(properties.windowRect.height).assertEqual(400);
      await subWindow.destroyWindow();
    })
  })
}
