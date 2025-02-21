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
      console.info(msgStr + `case come in buttonClick fun`)
      return new Promise(async (resolve, reject) => {
        let driver = await UiDriver.create()
        console.info(msgStr + `case come in buttonClick fun 222`)
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
    /**
     * @tc.number SUB_WINDOW_WINDOWSTAGELOADCONTENT_JSAPI_001
     * @tc.name Test windowStage_loadContent_Test_001
     * @tc.desc Verify The optional parameter is undefined
     */
    it('windowStage_loadContent_Test_001', 0, async function (done) {
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
     * @tc.number SUB_WINDOW_WINDOWOFFSIZECHANGE_JSAPI_001
     * @tc.name Test window_off_windowSizeChange_Test_001
     * @tc.desc Turn off listening for window size changes.
     */
    it('window_off_windowSizeChange_Test_001', 0, async function (done) {
      let caseName = 'window_off_windowSizeChange_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let baseWndType = 1;
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
        firstListenFlag = true
      });
      tempWnd.on('windowSizeChange', (data) => {
        console.info(msgStr + "second listener trigger");
        secondListenFlag = true
      });
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
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
      await sleep(500);
      if (firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_WINDOWOFFSIZECHANGE_JSAPI_002
     * @tc.name Test window_off_windowSizeChange_Test_002
     * @tc.desc Turn off listening for window size changes.
     */
    it('window_off_windowSizeChange_Test_002', 0, async function (done) {
      let caseName = 'window_off_windowSizeChange_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let baseWndType = 1;
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
     * @tc.number SUB_WINDOW_WINDOWOFFAVOIDAREACHANGE_JSAPI_001
     * @tc.name Test window_off_avoidAreaChange_Test_001
     * @tc.desc Disable listening for system avoidance zone changes.
     */
    it('window_off_avoidAreaChange_Test_001', 0, async function (done) {
      let caseName = 'window_off_avoidAreaChange_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
        firstListenFlag = true
      });
      tempWnd.on('avoidAreaChange', (data) => {
        console.info(msgStr + 'second listener trigger');
        secondListenFlag = true
      });
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
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
      if (firstListenFlag === false && secondListenFlag === false) {
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_WINDOWOFFAVOIDAREACHANGE_JSAPI_002
     * @tc.name Test window_off_avoidAreaChange_Test_002
     * @tc.desc Disable listening for system avoidance zone changes.
     */
    it('window_off_avoidAreaChange_Test_002', 0, async function (done) {
      let caseName = 'window_off_avoidAreaChange_Test_002';
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
     * @tc.number SUB_WINDOW_WINDOWOFFKEYBOARDHEIGHTCHANGE_JSAPI_001
     * @tc.name Test window_off_keyboardHeightChange_Test_001
     * @tc.desc Turn off listening for keyboard height changes
     */
    it('window_off_keyboardHeightChange_Test_001', 0, async function (done) {
      let caseName = 'window_off_keyboardHeightChange_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let windowId = 'window_off_keyboardHeightChange_Test_001';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DESKTOP, ctx: context
      };
      let tempWnd = null;
      tempWnd = await windowStage.createSubWindow('window_off_keyboardHeightChange_Test_001').catch((err) => {
        unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/pageTwo').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.loadContent', done);
      });
      await tempWnd.setWindowLayoutFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setWindowMode', done);
      });
      await tempWnd.showWindow().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.showWindow', done);
      });
      tempWnd.on('keyboardHeightChange', (data) => {
        console.info(msgStr + "first listener trigger");
        firstListenFlag = true
      });
      tempWnd.on('keyboardHeightChange', (data) => {
        console.info(msgStr + "second listener trigger");
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
      await inputClick('pageTwoinputSecond', msgStr).catch(async err => {
        console.info(msgStr + err);
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      })
      await sleep(2000);
      if (firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_WINDOWOFFKEYBOARDHEIGHTCHANGE_JSAPI_002
     * @tc.name Test window_off_keyboardHeightChange_Test_002
     * @tc.desc Turn off listening for keyboard height changes
     */
    it('window_off_keyboardHeightChange_Test_002', 0, async function (done) {
      let caseName = 'window_off_keyboardHeightChange_Test_002';
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
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DESKTOP, ctx: context
      };
      let tempWnd = null;
      tempWnd = await windowStage.createSubWindow('window_off_keyboardHeightChange_Test_002').catch((err) => {
        unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/pageTwo').catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.loadContent', done);
      });
      await tempWnd.setWindowLayoutFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setWindowMode', done);
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
     * @tc.number SUB_WINDOW_WINDOWOFFSCREENSHOT_JSAPI_001
     * @tc.name Test window_off_screenshot_Test_001
     * @tc.desc Disable the monitoring of screenshots.
     */
    it('window_off_screenshot_Test_001', 0, async function (done) {
      let caseName = 'window_off_screenshot_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let firstListenFlag = false
      let secondListenFlag = false
      let windowId = 'window_off_screenshot_Test_001';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_SYSTEM_ALERT, ctx: context
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
        firstListenFlag = true
      });
      tempWnd.on('screenshot', (data) => {
        console.info(msgStr + "second listener trigger");
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
      if (firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        done();
      } else {
        await tempWnd.destroyWindow();
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_WINDOWOFFSCREENSHOT_JSAPI_002
     * @tc.name Test window_off_screenshot_Test_002
     * @tc.desc Disable the monitoring of screenshots.
     */
    it('window_off_screenshot_Test_002', 0, async function (done) {
      let caseName = 'window_off_screenshot_Test_002';
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
        name: windowId, windowType: ohosWindow.WindowType.TYPE_SYSTEM_ALERT, ctx: context
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
     * @tc.number SUB_WINDOW_WINDOWOFFDIALOGTARGETTOUCH_JSAPI_001
     * @tc.name Test window_off_dialogTargetTouch_Test_001
     * @tc.desc Turns on modal window listener for click events on target Windows.
     */
    it('window_off_dialogTargetTouch_Test_001', 0, async function (done) {
      let caseName = 'window_off_dialogTargetTouch_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
        firstListenFlag = true
      });
      tempWnd.on('dialogTargetTouch', (data) => {
        console.info(msgStr + "second listener trigger");
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
      if (firstListenFlag === false && secondListenFlag === false) {
        await tempWnd.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_WINDOWOFFDIALOGTARGETTOUCH_JSAPI_002
     * @tc.name Test window_off_dialogTargetTouch_Test_002
     * @tc.desc Turns on modal window listener for click events on target Windows.
     */
    it('window_off_dialogTargetTouch_Test_002', 0, async function (done) {
      let caseName = 'window_off_dialogTargetTouch_Test_002';
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
     * @tc.number SUB_WINDOW_WINDOWSTAGEOFFWINDOWSTAGEVENT_JSAPI_001
     * @tc.name Test windowStage_off_windowStageEvent_Test_001
     * @tc.desc Turn off listening for Windows Stage life cycle changes.
     */
    it('windowStage_off_windowStageEvent_Test_001', 0, async function (done) {
      let caseName = 'windowStage_off_windowStageEvent_Test_001';
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
      windowStage.off("windowStageEvent");
      firstListenFlag = false
      secondListenFlag = false
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      await sleep(1000);
      if (firstListenFlag === false && secondListenFlag === false) {
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_WINDOWSTAGEOFFWINDOWSTAGEVENT_JSAPI_002
     * @tc.name Test windowStage_off_windowStageEvent_Test_002
     * @tc.desc Turn off listening for Windows Stage life cycle changes.
     */
    it('windowStage_off_windowStageEvent_Test_002', 0, async function (done) {
      let caseName = 'windowStage_off_windowStageEvent_Test_002';
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
      }else{
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_WINDOW_DISPALYOFFADD_JSAPI_001
     * @tc.name Test display_off_add_Test_001
     * @tc.desc Enable the monitor that shows device changes.
     */
    it('display_off_add_Test_001', 0, async function (done) {
      let caseName = 'display_off_add_Test_001';
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
      if (firstListenFlag === false && secondListenFlag === false) {
        await screen.destroyVirtualScreen(screenClass_two.id)
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_DISPALYOFFADD_JSAPI_002
     * @tc.name Test display_off_add_Test_002
     * @tc.desc Enable the monitor that shows device changes.
     */
    it('display_off_add_Test_002', 0, async function (done) {
      let caseName = 'display_off_add_Test_002';
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
      }else{
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SCREENOFFREMOVE_JSAPI_001
     * @tc.name Test display_off_remove_Test_001
     * @tc.desc Enable the monitor that shows device changes.
     */
    it('display_off_remove_Test_001', 0, async function (done) {
      let caseName = 'display_off_remove_Test_001';
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
      if (firstListenFlag === false && secondListenFlag === false) {
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_DISPLAYOFFREMOVE_JSAPI_002
     * @tc.name Test display_off_remove_Test_002
     * @tc.desc Enable the monitor that shows device changes.
     */
    it('display_off_remove_Test_002', 0, async function (done) {
      let caseName = 'display_off_remove_Test_002';
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
      }else{
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_DISPLAYOFFCHANGE_JSAPI_001
     * @tc.name Test display_off_change_Test_001
     * @tc.desc Enable monitoring of screen status changes.
     */
    it('display_off_change_Test_001', 0, async function (done) {
      let caseName = 'display_off_change_Test_001';
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
      screenClass = await screen.createVirtualScreen({
        name: 'change01',
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
      await screenClass.setOrientation(screen.Orientation.HORIZONTAL).catch((err) => {
        unexpectedError(err, caseName, 'screenClass.setOrientation', done);
      });
      await sleep(1000);
      display.off('change')
      firstListenFlag = false
      secondListenFlag = false
      await screenClass.setOrientation(screen.Orientation.UNSPECIFIED).catch((err) => {
        unexpectedError(err, caseName, 'screenClass.setOrientation', done);
      });
      await sleep(1000);
      if (firstListenFlag === false && secondListenFlag === false) {
        await screen.destroyVirtualScreen(screenClass.id)
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SCREENOFFCHANGE_JSAPI_002
     * @tc.name Test screen_off_change_Test_002
     * @tc.desc Enable monitoring of screen status changes.
     */
    it('display_off_change_Test_002', 0, async function (done) {
      let caseName = 'display_off_change_Test_002';
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
      screenClass = await screen.createVirtualScreen({
        name: 'change02',
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
      await screenClass.setOrientation(screen.Orientation.HORIZONTAL).catch((err) => {
        unexpectedError(err, caseName, 'screenClass.setOrientation', done);
      });
      await sleep(1000);
      display.off('change', firstCall)
      firstListenFlag = false
      secondListenFlag = false
      await screenClass.setOrientation(screen.Orientation.UNSPECIFIED).catch((err) => {
        unexpectedError(err, caseName, 'screenClass.setOrientation', done);
      });
      await sleep(1000);
      await screen.destroyVirtualScreen(screenClass.id)
      display.off('change')
      if (!firstListenFlag && secondListenFlag) {
        done();
      }else{
        expect(TRUE_FLAG).assertFail();
        done();
      }
    })

  })
}
