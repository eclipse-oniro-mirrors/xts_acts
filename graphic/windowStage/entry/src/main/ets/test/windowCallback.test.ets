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
import display from '@ohos.display';
import screenManager from '@ohos.screen';
import { BusinessError } from '@ohos.base';

export default function windowCallbackTest(context, windowStage, abilityStorage) {
  console.log('testets context: ' + JSON.stringify(context))
  console.log('testets context windowStage: ' + JSON.stringify(windowStage));
  console.log('testets context abilityStorage: ' + JSON.stringify(abilityStorage));

  describe('windowCallback_test', function () {
    console.log('describe testets start!!')
    const TRUE_FLAG = true;
    console.log('describe window_api_test start!!!');
    var commonRGBColorArr = ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(255,255,255)', 'rgb(0,0,0)', 'rgb(249,0,230)', 'rgb(102,102,102)', 'rgb(255,247,0)'];
    var commonNUMBERColorArr = ['#00FF0000', '#0000FF00', '#000000FF', '#00FFFFFF', '#00000000', '#00F900E6', '#00666666', '#00FFF700'];
    var commonKEYColorArr = ['red', 'green', 'blue', 'white', 'black', 'pink', 'grey', 'yellow'];
    var appWindowTypeArr = [];
    var windowTypeArr = [];
    var appWindowTypeDic = {
      'TYPE_BASE': 0,
      'TYPE_APP': 0,
      'TYPE_APP_SUB_WINDOW': 1,
    };
    var systemWindowTypeArr = [];
    var systemWindowTypeDic = {
      'TYPE_FLOAT': 8,
    }
    var windowLayoutModeArr = [];
    var windowLayoutModeDic = {
      'WINDOW_LAYOUT_MODE_TILE': 1,
      'WINDOW_LAYOUT_MODE_CASCADE': 0
    };
    var windowCount = 2022;
    var listenerStatus = {
      ready: 'ready',
      pending: 'pending',
      finished: 'finished'
    };
    var listenerData = {
      on: false,
      typeStr: '',
    };
    beforeAll(function () {
      appWindowTypeArr = Object.keys(appWindowTypeDic);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      for (var i in ohosWindow.WindowType) {
        windowTypeArr.push(ohosWindow.WindowType[i]);
      }
      console.log('jsunittest beforeall');
      console.log('beforeall ohosWindow.windowType' + JSON.stringify(ohosWindow.WindowType))
    })
    function expectedError(error, caseName, apiName, done, code) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      try {
        expect(TRUE_FLAG).assertTrue();
        expect(error.code === code).assertTrue();
      } catch (error) {
        console.info(`ohosWindow.on ${JSON.stringify(error)}`)
      }
      done();
    }

    function unexpectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      try {
        expect(TRUE_FLAG).assertFail();
      } catch (error) {
        console.info(`ohosWindow.on ${JSON.stringify(error)}`)
      }
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
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1300
     * @tc.name      : testSetSystemBarEnable_ShowStatusBar_HideNavBar_Callback
     * @tc.desc      : Test ohosWindow.setSystemBarEnable API function test1.
     * @tc.size      : MediumTestTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_ShowStatusBar_HideNavBar_Callback', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_ShowStatusBar_HideNavBar_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            console.log(msgStr + 'getMainWindow data' + JSON.stringify(data));
            if (err && err.code) {
              console.log(msgStr + 'windowStage  getMainWindow failed');
              reject(null)
            } else {
              resolve(data);
              console.log(msgStr + 'windowStage getMainWindow successed');
            }
          })
        })
      }

      function show(win) {
        return new Promise(function (resolve, reject) {
          win.show((err) => {
            if (err && err.code) {
              console.log(msgStr + 'mainWnd.show failed');
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.show success');
              resolve(true)
            }
          })
        })
      }

      function setFullScreen(win) {
        return new Promise(function (resolve, reject) {
          win.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen data:' + JSON.stringify(data));
            if (err && err.code) {
              console.log(msgStr + 'mainWnd.setFullScreen failed');
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.setFullScreen success');
              resolve(true)
            }
          })
        })
      }

      function setSystemBarEnableNavigation(win) {
        return new Promise(function (resolve, reject) {
          win.setSystemBarEnable(['navigation'], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable navigation JSON.stringify(data)==' + JSON.stringify(data));
            if (err && err.code) {
              console.log(msgStr + 'mainWnd.setSystemBarEnable failed');
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.setSystemBarEnable success');
              resolve(true)
            }
          })
        })
      }

      function setSystemBarEnableStatus(win) {
        return new Promise(function (resolve, reject) {
          win.setSystemBarEnable(['status'], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(data)===' + JSON.stringify(data));
            if (err && err.code) {
              console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(err)===' + JSON.stringify(err));
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.setSystemBarEnable status successed');
              resolve(true)
            }
          })
        })
      }

      let mainWnd = null;
      mainWnd = await getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!mainWnd).assertTrue();
      await show(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await setFullScreen(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await setSystemBarEnableNavigation(mainWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await setSystemBarEnableStatus(mainWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'finished!!');
      done();
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1230
     * @tc.name      : testSetSystemBarEnable_HideStatusBar_ShowNavBar_Callback
     * @tc.desc      : Verify that the scene hides the status bar and displays the navigation bar.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_HideStatusBar_ShowNavBar_Callback', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_HideStatusBar_ShowNavBar_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            console.log(msgStr + 'getMainWindow data:' + JSON.stringify(data));
            if (err && err.code) {
              console.log(msgStr + 'mainWnd getMainWindow success');
              reject(null)
            } else {
              resolve(data);
              console.log(msgStr + 'windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
            }
          })
        })
      }

      function show(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err) => {
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.show success');
              resolve(true)
            }
          })
        })
      }

      function setFullScreen(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen' + JSON.stringify(data));
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.setFullScreen successed');
              resolve(true)
            }
          })
        })
      }

      function setSystemBarEnableStatus(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['status'], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(data)==' + JSON.stringify(data));
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      function setSystemBarEnableNavigation(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['navigation'], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(data)==' + JSON.stringify(data));
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      let mainWnd = null;
      mainWnd = await getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!mainWnd).assertTrue();
      await show(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await setFullScreen(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await setSystemBarEnableStatus(mainWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await setSystemBarEnableNavigation(mainWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      done();
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1320
     * @tc.name      : testSetSystemBarEnable_Show_StatusBarAndNavBar_Callback
     * @tc.desc      : Verify that the scene displays both the status bar and the navigation bar.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Show_StatusBarAndNavBar_Callback', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_Show_StatusBarAndNavBar_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(data));
              resolve(data)
            }
          })
        })
      }

      function show(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err) => {
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.show success');
              resolve(true)
            }
          })
        })
      }

      function setFullScreen(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen' + JSON.stringify(data));
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.setFullScreen successed');
              resolve(true)
            }
          })
        })
      }

      function setSystemBarEnableT(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
              console.log(msgStr + 'mainWnd.setSystemBarEnable [status, navigation] data==' + JSON.stringify(data));
            }
          })
        })
      }

      let mainWnd = null;
      mainWnd = await getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!mainWnd).assertTrue();
      await show(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await setFullScreen(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await sleep(2000)
      await setSystemBarEnableT(mainWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      done();
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1250
     * @tc.name      : testSetSystemBarEnable_Hide_StatusBarAndNavBar_Callback
     * @tc.desc      : Verify that the scene hides both the status bar and the navigation bar.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Hide_StatusBarAndNavBar_Callback', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_Hide_StatusBarAndNavBar_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(data));
              resolve(data)
            }
          })
        })
      }

      function show(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err) => {
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.show success');
              resolve(true)
            }
          })
        })
      }

      function setFullScreen(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen' + JSON.stringify(data));
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.setFullScreen successed');
              resolve(true)
            }
          })
        })
      }

      function setSystemBarEnable(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable([], (err) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable [] JSON.stringify(data)==' + JSON.stringify(err));
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      function setSystemBarEnableT(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      let mainWnd = null;
      mainWnd = await getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!mainWnd).assertTrue();
      await show(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await setFullScreen(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });

      await setSystemBarEnableT(mainWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await setSystemBarEnable(mainWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      done();
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1270
     * @tc.name      :  testSetSystemBarEnable_Invalid_Parameter_Callback
     * @tc.desc      : Verify the scene where illegal values are entered when the navigation bar and status bar are displayed or hidden
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Invalid_Parameter_Callback', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_Invalid_Parameter_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            console.log(msgStr + 'getMainWindow data:' + JSON.stringify(data));
            if (err && err.code) {
              reject(null)
            } else {
              resolve(data);
              console.log(msgStr + 'windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
            }
          })
        })
      }

      function show(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err) => {
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.show success');
              resolve(true)
            }
          })
        })
      }

      function setFullScreen(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen' + JSON.stringify(data));
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'mainWnd.setFullScreen successed');
              resolve(true)
            }
          })
        })
      }


      function setSystemBarEnable(mainWnd) {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable([], (err) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable [] JSON.stringify(data)==' + JSON.stringify(err));
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      let mainWnd = null;
      mainWnd = await getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!mainWnd).assertTrue();
      await show(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await setFullScreen(mainWnd).catch((err) => {
        console.error(msgStr + 'Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await setSystemBarEnable(mainWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      mainWnd.setSystemBarEnable([null, '123'], (err, data) => {
        console.log(msgStr + 'mainWnd.setSystemBarEnable [null,123] JSON.stringify(data)==' + JSON.stringify(data));
        console.log(msgStr + 'mainWnd.setSystemBarEnable [null,123] JSON.stringify(err)==' + JSON.stringify(err));
        if (err && err.code) {
          try {
            console.log(msgStr + 'mainWnd.setSystemBarEnable  JSON.stringify(err.code)===' + JSON.stringify(err.code));
            expect(err.code === 1003).assertTrue();
          } catch (error) {
            console.info(`mainWnd.setSystemBarEnable catch error: ${JSON.stringify(error)}`)
          }
          done();
        } else {
          unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [null,123]', done);
        }
      })
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1380
     * @tc.name      :  testSetSystemBarEnable_RGB_Callback
     * @tc.desc      : TVerify the scene where the colors of the status bar and navigation bar are set in RGB
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_RGB_Callback', 0, async done => {
      let caseName = 'testSetSystemBarEnable_RGB_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonRGBColorArr));
      let compareCount = 0;
      console.log(msgStr + 'begin');

      function setSystemBarPropertiesFun(tempWnd, systemBarProperties) {
        return new Promise((resolve, reject) => {
          tempWnd.setSystemBarProperties(systemBarProperties, (err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'tempWnd.setSystemBarProperties ' + JSON.stringify(systemBarProperties) + ' success');
              resolve(true)
            }

          })
        })
      }

      let tempWnd;
      tempWnd = await windowStage.getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!tempWnd).assertTrue();
      let loopCount = commonRGBColorArr.length
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonRGBColorArr[i];
        let systemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationBarContentColor: tempColor,
        };
        await setSystemBarPropertiesFun(tempWnd, systemBarProperties).catch((err) => {
          console.info(msgStr + 'setSystemBarProperties error : ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1340
     * @tc.name      : testSetSystemBarEnable_Hexadecimal_Callback
     * @tc.desc      : Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_Hexadecimal_Callback', 0, async done => {
      let caseName = 'testSetSystemBarEnable_Hexadecimal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = {
        SBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        SCC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NCC: JSON.parse(JSON.stringify(commonNUMBERColorArr))
      };
      let compareCount = 0;
      let endNum = 0;
      let listenerFlag = false;
      console.log(msgStr + 'begin');
      let tempWnd;
      tempWnd = await windowStage.getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await tempWnd.setFullScreen(true).catch((err) => {
        console.error(msgStr + 'Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      let loopCount = commonNUMBERColorArr.length
      for (let i = 0; i < loopCount; i++) {
        console.log(msgStr + 'tempWnd.setSystemBarEnable i:' + i);
        let tempColor = commonNUMBERColorArr[i];
        let systemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: true,
          navigationBarContentColor: tempColor,
        };
        tempWnd.setSystemBarProperties(systemBarProperties, (err, data) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties err' + JSON.stringify(err));
          if (err && err.code) {
            try {
              expect(TRUE_FLAG).assertFail();
            } catch (error) {
              console.info(`tempWnd.setSystemBarProperties catch error: ${JSON.stringify(error)}`)
            }
            done();
            return;
          }
          if (i == commonNUMBERColorArr.length - 1) {
            console.info(msgStr + 'setSystemBarPropertiesTest5 finished step:' + i);
            done();
          }
        })
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1360
     * @tc.name      : testSetSystemBarEnable_KeywordForm_Callback
     * @tc.desc      : TVerify the scene where the status bar and navigation bar colors are set as keywords
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetSystemBarEnable_KeywordForm_Callback', 0, async done => {
      let caseName = 'testSetSystemBarEnable_KeywordForm_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonKEYColorArr));
      let compareCount = 0;
      console.log(msgStr + 'begin');
      let tempWnd;
      tempWnd = await windowStage.getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await tempWnd.setFullScreen(true).catch((err) => {
        console.error(msgStr + 'Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(1000);
      let loopCount = commonRGBColorArr.length
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonKEYColorArr[i];
        let systemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationBarContentColor: tempColor,
        };
        tempWnd.setSystemBarProperties(systemBarProperties, (err, data) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties data' + JSON.stringify(data));
          if (err && err.code) {
            try {
              expect(TRUE_FLAG).assertFail();
            } catch (error) {
              console.info(`tempWnd.setSystemBarProperties catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
          if (i == commonRGBColorArr.length - 1) {
            console.info(msgStr + 'setSystemBarPropertiesTest5 finished step:' + i);
            done();
          }
        })
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0170
     * @tc.name      : testCreate_App_Type_Win_Callback
     * @tc.desc      : Scheme of Failed to Create Application Type Window in Stage Mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_App_Type_Win_Callback', 0, async done => {
      let caseName = 'testCreate_App_Type_Win_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let loopCount = appWindowTypeArr.length;
      console.log(msgStr + 'loopCount: ' + loopCount);

      function createWin(id, type) {
        return new Promise((resolve, reject) => {
          ohosWindow.create(context, id, type, (err, data) => {
            console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
            if (err && err.code) {
              resolve(err)
            } else {
              reject(null)
            }
          })
        })
      }

      for (let i = 0; i < loopCount; i++) {
        let tempType = ohosWindow.WindowType.TYPE_APP;
        let windId = 'createTest5' + i;
        console.log(msgStr + 'ohosWindow.create ' + tempType + ' step: ' + i);
        let errCode;
        errCode = await createWin(windId, tempType)
        expect(errCode.code === 1003).assertTrue();
        if (i === loopCount - 1) {
          done();
          console.log(msgStr + 'ohosWindow.create i==' + i)
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0250
     * @tc.name      : testCreate_Sys_Type_Win_Callback
     * @tc.desc      : Verify the scenario of creating the system type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Sys_Type_Win_Callback', 0, async done => {
      let caseName = 'testCreate_Sys_Type_Win_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log(msgStr + 'loopCount: ' + loopCount);
      let tempWnd = null
      let tempType = ohosWindow.WindowType.TYPE_FLOAT;

      function createWin(windId) {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windId, tempType, (err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'ohosWindow.create ' + tempType + ' wnd: ' + tempWnd);
              resolve(data)
            }
          })
        })
      }

      function getProperties(win) {
        return new Promise(function (resolve, reject) {
          win.getProperties((err, data) => {
            console.log(msgStr + 'tempWnd.getProperties err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.getProperties data' + JSON.stringify(data));
            if (err && err.code) {
              console.log(msgStr + 'tempWnd.getProperties err&&err.code' + JSON.stringify(err));
              reject(null)
            } else {
              console.log(msgStr + 'tempWnd.getProperties success, !!data : ' + !!data);
              resolve(data)
            }
          })
        })
      }

      for (let i = 0; i < loopCount; i++) {
        let windId = 'createTest6' + i;
        let tempWnd;
        tempWnd = await createWin(windId).catch(err => {
          console.info(msgStr + `ohosWindow.create catch error: ${JSON.stringify(err)}`)
          expect().assertFail();
          done();
        })
        expect(!!tempWnd).assertTrue();
        let winProperties;
        winProperties = await getProperties(tempWnd).catch(err => {
          console.info(msgStr + `tempWnd.getProperties catch error: ${JSON.stringify(err)}`)
        })
        expect(!!winProperties).assertTrue();
        console.info(msgStr + `windowType: ` + winProperties.type + "step: " + i)
        expect(winProperties.type == tempType).assertTrue();
        await tempWnd.destroyWindow();
        if (i == loopCount - 1) {
          done()
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0210
     * @tc.name      : testCreate_Not_Exist_Win_Type_Callback
     * @tc.desc      : Verify the scenario of creating a window of a type that does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Not_Exist_Win_Type_Callback', 0, async done => {
      let caseName = 'testCreate_Not_Exist_Win_Type_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType = 5000;
      let windId = 'createTest7';
      console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
      ohosWindow.create(context, windId, tempType, (err, data) => {
        console.log(msgStr + 'ohosWindow.create  data' + JSON.stringify(data));
        if (err && err.code) {
          try {
            expect(err.code === 1003).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
          }
          done();
          return;
        }
        unexpectedError(err, caseName, 'ohosWindow.create', done);
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0230
     * @tc.name      : testCreate_Repeate_Id_Win_Callback
     * @tc.desc      : Verify the scenario of creating a window with duplicate IDs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreate_Repeate_Id_Win_Callback', 0, async done => {
      let caseName = 'testCreate_Repeate_Id_Win_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'sameid'
      let tempWnd = null;

      function createFirstWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, ohosWindow.WindowType.TYPE_FLOAT, (err, data) => {
            console.log(msgStr + 'ohosWindow.create 1 once err: ' + JSON.stringify(err));
            if (err && err.code) {
              reject(null)
            } else {
              resolve(data)
            }
          })
        })
      }

      let dataOne;
      dataOne = await createFirstWin().catch((err) => {
        console.error(msgStr + 'Failed to create window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      });
      expect(!!dataOne).assertTrue();
      ohosWindow.create(context, windowId, ohosWindow.WindowType.TYPE_FLOAT, async (err, data) => {
        console.log(msgStr + 'ohosWindow.create 1 twice err: ' + JSON.stringify(err));
        if (err && err.code) {
          console.log(msgStr + 'ohosWindow.create 1 twice data: ' + JSON.stringify(data));
          try {
            expect(err.code).assertEqual(1300001)
          } catch (error) {
            console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
          }
          await dataOne.destroyWindow();
          done();
        } else {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
          console.log(msgStr + 'ohosWindow.create 1 twice data: ' + JSON.stringify(data));
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0750
     * @tc.name      : testListener_Sys_AvoidAreaChange_Callback
     * @tc.desc      : Verify whether the change of avoidance area and change monitoring can be turned on normally
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testListener_Sys_AvoidAreaChange_Callback', 0, async function (done) {
      await sleep(1000)
      let caseName = 'testListener_Sys_AvoidAreaChange_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let listenerOnFlag = false;
      console.log(msgStr + 'begin');
      function setSystemBarEnable(tempWnd) {
        return new Promise(function (resolve, reject) {
          tempWnd.setSystemBarEnable([], (err, data) => {
            if (err && err.code) {
              reject(false)
            } else {
              console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
              resolve(true)
            }
          })
        })
      }

      function setSystemBarEnableT(tempWnd) {
        return new Promise(function (resolve, reject) {
          tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            if (err && err.code) {
              reject(false)
            } else {
              console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
              resolve(true)
            }
          })
        })
      }

      let tempWnd;
      tempWnd = await windowStage.getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail()
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.setWindowLayoutFullScreen(true).catch((err) => {
        console.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      tempWnd.on('systemAvoidAreaChange', avoidAreaData => {
        if (listenerOnFlag === true) {
          console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, listenerOnFlag : ' + listenerOnFlag);
          try {
            expect(!!avoidAreaData).assertTrue();
          } catch (error) {
            console.info(msgStr + `tempWnd.on catch error: ${JSON.stringify(error)}`)
          }
          tempWnd.off('systemAvoidAreaChange')
          done();
        }
      })
      listenerOnFlag=true;
      await setSystemBarEnable(tempWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
      });
      await sleep(1000)
      await setSystemBarEnableT(tempWnd).catch((err) => {
        console.info(msgStr + 'setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.name      : testDestroy_Callbcak
     * @tc.desc      : Verification window destruction scenario
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDestroy_Callbcak', 0, async function (done) {
      let caseName = 'testDestroy_Callbcak';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'destroy_Callbcak';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function createWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            if (!!data) {
              resolve(data)
            } else {
              reject(null)
            }
          })
        })
      }

      tempWnd = await createWin().catch(err => {
        console.info(`ohosWindow.create failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      expect(!!tempWnd).assertTrue();
      tempWnd.destroy(async (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'ohosWindow.destroy', done);
        } else {
          try {
            expect(!data).assertTrue();
          } catch (error) {
            console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
          }
          await ohosWindow.find(windowId).then((data) => {
            console.info('Succeeded in finding the window. Data: ' + JSON.stringify(data));
          }).catch((err) => {
            console.error('Failed to find the Window. Cause: ' + JSON.stringify(err));
            expect(err.code == 1001).assertTrue();
            done();
          });
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0790
     * @tc.name      : testLoadContent_Exist_Create_SysWin_Callback
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Create_SysWin_Callback', 0, async function (done) {
      let caseName = 'testLoadContent_Exist_Create_SysWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'loadContent_Exist_Create_SysWin_Callback';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function createWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            if (!!data) {
              resolve(data)
            } else {
              reject(null)
            }
          })
        })
      }

      tempWnd = await createWin().catch(err => {
        console.info(`ohosWindow.create failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      expect(!!tempWnd).assertTrue();

      tempWnd.loadContent('pages/index', async (err, data) => {
        if (err && err.code) {
          await tempWnd.destroy();
          expect(err.code).assertEqual(401);
          done();
        } else {
          await tempWnd.destroy();
          expect().assertFail();
          done()
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0870
     * @tc.name      : testLoadContent_Para_Is_Null_Create_SysWin_Callback
     * @tc.desc      : Verify the scenario of loading a page that does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Para_Is_Null_Create_SysWin_Callback', 0, async function (done) {
      let caseName = 'testLoadContent_Para_Is_Null_Create_SysWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'loadContent_Para_Is_Null_Create_SysWin_Callback';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function createWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            if (!!data) {
              resolve(data)
            } else {
              reject(null)
            }
          })
        })
      }

      tempWnd = await createWin().catch(err => {
        console.info(`ohosWindow.create failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      expect(!!tempWnd).assertTrue();
      tempWnd.loadContent(null, async (err, data) => {
        if (err && err.code) {
          try {
            expect(err.code === 1003).assertTrue();
          } catch (error) {
            console.info(`tempWnd.loadContent catch error: ${JSON.stringify(error)}`)
          }
          await tempWnd.destroy();
          done()
        } else {
          await tempWnd.destroy();
          unexpectedError(err, caseName, 'tempWnd.loadContent', done);
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0830
     * @tc.name      : testLoadContent_Exist_Input_Para_Path_Callback
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Input_Para_Path_Callback', 0, async function (done) {
      let caseName = 'testLoadContent_Exist_Input_Para_Path_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      windowStage.loadContent('MainAbility/pages/second/second', (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.loadContent', done);
          console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
        } else {
          try {
            expect(!data).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
          console.log(msgStr + 'windowStage.loadContent end data=' + JSON.stringify(data));
          done();
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0850
     * @tc.name      : testLoadContent_Input_Para_Is_Null_Callback
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Input_Para_Is_Null_Callback', 0, async function (done) {
      let caseName = 'testLoadContent_Input_Para_Is_Null_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      try {
        windowStage.loadContent(null, (err, data) => {
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
          done();
        });
      } catch (err) {
        console.log(msgStr + 'windowStage loadContent null catch err' + JSON.stringify(err));
        try {
          expect(err.code == 401).assertTrue();
        } catch (error) {
          console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
        }
        done();
      }
      console.log(msgStr + 'end');
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0810
     * @tc.name      : testLoadContent_Exist_Input_Para_PathAndStorage_Callback
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Exist_Input_Para_PathAndStorage_Callback', 0, async function (done) {
      let caseName = 'testLoadContent_Exist_Input_Para_PathAndStorage_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      windowStage.loadContent('MainAbility/pages/second/second', abilityStorage, (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.loadContent', done);
          console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
        } else {
          try {
            expect(!data).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
          done();
          console.log(msgStr + 'windowStage.loadContent end data=' + JSON.stringify(data));
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0890
     * @tc.name      : testLoadContent_Para_PathAndStorage_Is_Null_Callback
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testLoadContent_Para_PathAndStorage_Is_Null_Callback', 0, async function (done) {
      let caseName = 'testLoadContent_Para_PathAndStorage_Is_Null_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      try {
        windowStage.loadContent(null, abilityStorage, (err, data) => {
          console.log(msgStr + 'windowStage loadContent null ' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
          done();
        });
      } catch (err) {
        console.log(msgStr + 'windowStage loadContent null catch err ' + JSON.stringify(err));
        try {
          expect(err.code === 401).assertTrue();
        } catch (error) {
          console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
        }
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0040
     * @tc.name      : testCreateSubWindow_WinName_IsNot_Empty_Callback
     * @tc.desc      : Verify the scenario of creating an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindow_WinName_IsNot_Empty_Callback', 0, async function (done) {
      let caseName = 'testCreateSubWindow_WinName_IsNot_Empty_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWnd = null

      function createSubWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.createSubWindow('createSubWindowTest3', (err, data) => {
            if (err && err.code) {
              reject(null)
              console.log(msgStr + 'windowStage.createSubWindow(createSubWindowTest3) err=' + JSON.stringify(err));
            } else {
              resolve(data)
            }

          })
        })
      }

      function findWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find('createSubWindowTest3', (err, data) => {
            if (err && err.code) {
              reject(false)
            } else {
              resolve(data)
            }
          })
        })
      }

      function destroyWin(win) {
        return new Promise(function (resolve, reject) {
          win.destroy((err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      subWnd = await createSubWindow().catch(err => {
        console.info(`ohosWindow.create failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      expect(!!subWnd).assertTrue();

      let subWindow;
      subWindow = await findWin().catch(err => {
        console.info(`ohosWindow.find failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })

      await destroyWin(subWindow).catch(err => {
        console.info(`ohosWindow.destroy failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      let subWindowLast;
      subWindowLast = await findWin().catch(err => {
        console.info(`ohosWindow.find failed  error: ${JSON.stringify(err)}`)
        expect(!err).assertTrue();
        done()
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0060
     * @tc.name      : testCreateSubWindow_WinName_Is_Null_Callback
     * @tc.desc      : Verify the scene of entering illegal values to create an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateSubWindow_WinName_Is_Null_Callback', 0, async function (done) {
      let caseName = 'testCreateSubWindow_WinName_Is_Null_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.createSubWindow(null, (err, data) => {
          console.log(msgStr + 'windowStage.createSubWindow(null) err=' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.createSubWindow catch error: ${JSON.stringify(error)}`)
          }
          done();
        });
      } catch (err) {
        try {
          expect(err.code === 401).assertTrue();
        } catch (error) {
          console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
        }
        done();
        console.log(msgStr + 'windowStage.createSubWindow(null) catch err=' + JSON.stringify(err));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0570
     * @tc.name      : testGetSubWindow_Callback
     * @tc.desc      : Verify the scene of obtaining all auxiliary sub windows
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetSubWindow_Callback', 0, async function (done) {
      let caseName = 'testGetSubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      windowStage.getSubWindow((err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.getSubWindow', done);
          console.log(msgStr + 'windowStage.getSubWindow(null) err=' + JSON.stringify(err));
        } else {
          try {
            expect(!!data).assertTrue();
          } catch (error) {
            console.info(`windowStage.getSubWindow catch error: ${JSON.stringify(error)}`)
          }
          done();
          console.log(msgStr + 'windowStage.getSubWindow end data=' + JSON.stringify(data));
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1190
     * @tc.name      : testSetPrivacyMode_AppSubWin_Callback
     * @tc.desc      : Verify the scene where the application sub window is set as a security layer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPrivacyMode_AppSubWin_Callback', 0, async function (done) {
      let caseName = 'testSetPrivacyMode_AppSubWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin ohosWindow =' + JSON.stringify(ohosWindow));
      let tempWnd = null;

      function createWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, 'setPrivacyModeTest2', ohosWindow.WindowType.TYPE_FLOAT, (err, data) => {
            if (err && err.code) {
              console.log(msgStr + 'ohosWindow.create fail err:' + JSON.stringify(err));
              reject(null)
            } else {
              resolve(data)
            }
          })
        })
      }

      function getWinProperties(win) {
        return new Promise(function (resolve, reject) {
          win.getProperties((err, data) => {
            if (err.code != 0) {
              reject(null)
            } else {
              resolve(data)
            }
          })
        })
      }

      function setPrivacyModeWin(win, boolean) {
        return new Promise(function (resolve, reject) {
          win.setPrivacyMode(boolean, (err) => {
            if (err && err.code) {
              console.log(msgStr + 'mainWnd.setPrivacyMode(true) err=' + JSON.stringify(err));
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      tempWnd = await createWin().catch(err => {
        console.info(msgStr + `ohosWindow.create failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      expect(!!tempWnd).assertTrue();
      await setPrivacyModeWin(tempWnd, true).catch(err => {
        console.info(msgStr + `ohosWindow.setPrivacyMode failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      let windowProperties_true;
      windowProperties_true = await getWinProperties(tempWnd).catch(err => {
        console.info(msgStr + `ohosWindow.getProperties failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      console.info(msgStr + `ohosWindow.windowProperties_true : ${JSON.stringify(windowProperties_true)}`)
      expect(windowProperties_true.isPrivacyMode).assertTrue();

      await setPrivacyModeWin(tempWnd, false).catch(err => {
        console.info(msgStr + `ohosWindow.setPrivacyMode failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      let windowProperties_false;
      windowProperties_false = await getWinProperties(tempWnd).catch(err => {
        console.info(msgStr + `ohosWindow.getProperties failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      console.info(msgStr + `ohosWindow.windowProperties_false : ${JSON.stringify(windowProperties_false)}`)
      expect(!windowProperties_false.isPrivacyMode).assertTrue();
      await tempWnd.destroy();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1210
     * @tc.name      : testSetPrivacyMode_createSubWindow_Callback
     * @tc.desc      : Verify that the auxiliary window is set as the security layer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPrivacyMode_createSubWindow_Callback', 0, async function (done) {
      let caseName = 'testSetPrivacyMode_createSubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin ohosWindow =' + JSON.stringify(ohosWindow));
      let tempWnd = null;

      function createSubWindowFun() {
        return new Promise(function (resolve, reject) {
          windowStage.createSubWindow('setPrivacyModeTest3', (err, data) => {
            if (err && err.code) {
              console.log(msgStr + 'windowStage.createSubWindow fail err:' + JSON.stringify(err));
              reject(null)
            } else {
              resolve(data)
            }
          })
        })
      }

      function getPropertiesFun(win) {
        return new Promise(function (resolve, reject) {
          win.getProperties((err, data) => {
            if (err.code != 0) {
              reject(null)
            } else {
              resolve(data)
            }
          })
        })
      }

      function setPrivacyModeFun(win, boolean) {
        return new Promise(function (resolve, reject) {
          win.setPrivacyMode(boolean, (err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      tempWnd = await createSubWindowFun().catch(err => {
        console.info(msgStr + `ohosWindow.create failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      expect(!!tempWnd).assertTrue();
      await setPrivacyModeFun(tempWnd, true).catch(err => {
        console.info(msgStr + `ohosWindow.setPrivacyMode failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      let windowProperties_true;
      windowProperties_true = await getPropertiesFun(tempWnd).catch(err => {
        console.info(msgStr + `ohosWindow.getProperties failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      console.info(msgStr + `ohosWindow.windowProperties_true : ${JSON.stringify(windowProperties_true)}`)
      expect(windowProperties_true.isPrivacyMode).assertTrue();

      await setPrivacyModeFun(tempWnd, false).catch(err => {
        console.info(msgStr + `ohosWindow.setPrivacyMode failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      let windowProperties_false;
      windowProperties_false = await getPropertiesFun(tempWnd).catch(err => {
        console.info(msgStr + `ohosWindow.getProperties failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      console.info(msgStr + `ohosWindow.windowProperties_false : ${JSON.stringify(windowProperties_false)}`)
      expect(!windowProperties_false.isPrivacyMode).assertTrue();
      await tempWnd.destroy();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1170
     * @tc.name      : testSetPreferredOrientation_Callback
     * @tc.desc      : Sets the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_Callback', 0, async function (done) {
      let caseName = 'testSetPreferredOrientation_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = null;
      let num = 0
      let orientationItem = ['UNSPECIFIED', 'PORTRAIT', 'LANDSCAPE', 'PORTRAIT_INVERTED',
      'LANDSCAPE_INVERTED', 'AUTO_ROTATION', 'AUTO_ROTATION_PORTRAIT', 'AUTO_ROTATION_LANDSCAPE',
      'AUTO_ROTATION_RESTRICTED', 'AUTO_ROTATION_PORTRAIT_RESTRICTED', 'AUTO_ROTATION_LANDSCAPE_RESTRICTED', 'LOCKED', 'UNSPECIFIED'];

      function setPreferredOrientationFun(win, orientation) {
        return new Promise((resolve, reject) => {
          try {
            win.setPreferredOrientation(orientation, (err) => {
              if (err.code) {
                console.error(msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(err));
                reject(null)
              } else {
                console.info(msgStr + 'Succeeded in setting window orientation.');
                resolve(true)
              }
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
            reject(null)
          }
        })
      }

      mainWin = await  windowStage.getMainWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!mainWin).assertTrue();
      for (let i = 0;i < orientationItem.length; i++) {
        let orientation = ohosWindow.Orientation[orientationItem[i]]
        await setPreferredOrientationFun(mainWin, orientation).catch((err) => {
          console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        await sleep(3000)
        console.info(msgStr + 'Succeeded in setting window orientation. orientation: ' + orientation + "step: " + i);
      }
      done()
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1110
     * @tc.name      : testSetForbidSplitMove_Callback
     * @tc.desc      : Sets whether Windows are forbidden to move in split screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetForbidSplitMove_Callback', 0, async function (done) {
      let caseName = 'testSetForbidSplitMove_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function setForbidSplitMoveFun(win, boolean) {
        return new Promise((resolve, reject) => {
          win.setForbidSplitMove(boolean, (err, data) => {
            if (err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'success set window.setForbidSplitMove drag is prohibited' + JSON.stringify(data));
              resolve(true)
            }
          })
        })
      }

      let mainWin;
      mainWin = await windowStage.getMainWindow().catch(err => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();

      await setForbidSplitMoveFun(mainWin, true).catch(err => {
        console.log(msgStr + 'failed set window.setForbidSplitMove drag is prohibited, error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      await setForbidSplitMoveFun(mainWin, false).catch(err => {
        console.log(msgStr + 'failed set window.setForbidSplitMove drag is prohibited, error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      console.log(msgStr + 'done ');
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2150
     * @tc.name      : testSnapshotTest_Callback_Form
     * @tc.desc      : Scenario of screenshot of verification window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSnapshotTest_Callback_Form', 0, async function (done) {
      let caseName = 'testSnapshotTest_Callback_Form';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = null
      mainWin = await windowStage.getMainWindow().catch(err => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));

      expect(!!mainWin).assertTrue();
      await sleep(2000)
      mainWin.snapshot((err, data) => {
        if (err && err.code) {
          console.log(msgStr + 'snapshot err.code:' + JSON.stringify(err.code));
          try{
            expect().assertFail();
          } catch (error) {
            console.info(`expected catch error: ${JSON.stringify(error)}`)
          }
          done();
          return;
        }
        done();
        console.log(msgStr + 'snapshot success data:' + JSON.stringify(data));
      })

    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0320
     * @tc.name      : testDialogTargetTouch_Callback
     * @tc.desc      : Verify the scenario of opening modal window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDialogTargetTouch_Callback', 0, async done => {
      let caseName = 'testDialogTargetTouch_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let tempType = ohosWindow.WindowType.TYPE_DIALOG
      let dialogTargetTouchTest2Win = null

      ohosWindow.create(context, 'dialogTargetTouchTest2', tempType, async (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        } else {
          dialogTargetTouchTest2Win = data
          try {
            expect(!!dialogTargetTouchTest2Win).assertTrue();
          } catch (error) {
            console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
          }
          await dialogTargetTouchTest2Win.destroy()
          done();
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0010
     * @tc.name      : testAnimationForShown_Callback
     * @tc.desc      : Verify window custom animation configuration of the scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testAnimationForShown_Callback', 0, async function (done) {
      let caseName = 'testAnimationForShown_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      console.log(msgStr + 'begin ohosWindow==' + JSON.stringify(ohosWindow));
      let wndId = 'animationForShownTest2';
      let baseType = ohosWindow.WindowType.TYPE_FLOAT;
      let tempWnd = null;
      ohosWindow.create(context, wndId, baseType, async (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'ohosWindow.create ' + baseType, done);
        } else {
          tempWnd = data
          try {
            expect(!!tempWnd).assertTrue();
          } catch (error) {
            console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
          }
          console.log(msgStr + 'ohosWindow.create ' + baseType + ', tempWnd: ' + tempWnd);
          let controller = tempWnd.getTransitionController();
          controller.animationForShown = (context: ohosWindow.TransitionContext) => {
            let toWindow = context.toWindow
            animateTo({
              duration: 1000,
              tempo: 0.5,
              curve: Curve.EaseInOut,
              delay: 0,
              iterations: 1,
              playMode: PlayMode.Normal,
            }, () => {
              var obj: ohosWindow.TranslateOptions;
              obj.x = 100.0;
              obj.y = 0.0;
              obj.z = 0.0;
              toWindow.translate(obj);
              console.info(msgStr + 'toWindow translate end');
            }
            )
            context.completeTransition(true)
            console.info(msgStr + 'complete transition end');
          }
          await tempWnd.destroy();
          done();
        }
      });

    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0490
     * @tc.name      : testGetCutoutInfo_Callbcak
     * @tc.desc      : Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetCutoutInfo_Callbcak', 0, async function (done) {
      let caseName = 'testGetCutoutInfo_Callbcak';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let dpClass = display.getDefaultDisplaySync();
      expect(!!dpClass).assertTrue();
      dpClass.getCutoutInfo((err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'displayClass.getCutoutInfo', done);
        } else {
          console.info(msgStr + 'Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
          done();
        }
      })
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1070
     * @tc.name      : testSetAspectRatio_Cancel_Upon_Success_Callback
     * @tc.desc      : Validate the scenario cancelled after setting the proportion of the content layout of the main window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_Cancel_Upon_Success_Callback', 0, async function (done) {
      let caseName = 'testSetAspectRatio_Cancel_Upon_Success_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWnd = null;
      await windowStage.getMainWindow().then((data) => {
        mainWnd = data;
        console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
      });

      function setAspectRatio() {
        return new Promise(function (resolve, reject) {
          try {
            let ratio = 1.0;
            mainWnd.setAspectRatio(ratio, (err) => {
              if (err.code) {
                console.error(msgStr + 'Failed to set the aspect ratio of window. err.code:' + JSON.stringify(err.code));
              }
              try{
                expect(err.code == 0).assertTrue();
              } catch (error) {
                console.info(`expected catch error: ${JSON.stringify(error)}`)
              }
              resolve(true)
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to set the aspect ratio of window. Cause : ' + JSON.stringify(exception));
          }
        })
      }

      function resetAspectRatio() {
        return new Promise(function (resolve, reject) {
          console.info(msgStr + 'Succeeded start');
          try {
            mainWnd.resetAspectRatio((err) => {
              if (err.code) {
                console.error(msgStr + 'Failed to reset the aspect ratio of window. err:' + JSON.stringify(err));
                try{
                  expect().assertFail();
                } catch (error) {
                  console.info(`expected catch error: ${JSON.stringify(error)}`)
                }
                done();
                return;
              }
              console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to reset the aspect ratio of window. Cause: ' + JSON.stringify(exception));
          }
        })
      }

      await setAspectRatio()
      await resetAspectRatio()
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2330
     * @tc.name      : testSetAspectRatio_Invalid_Params_Callback
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_Invalid_Params_Callback', 0, async function (done) {
      let caseName = 'testSetAspectRatio_Invalid_Params_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWnd = null;
      await windowStage.getMainWindow().then((data) => {
        mainWnd = data;
        console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
      });

      function setAspectRatio() {
        return new Promise(function (resolve, reject) {
          try {
            let ratio = 0;
            mainWnd.setAspectRatio(ratio, (err) => {
              if (err.code) {
                console.error(msgStr + 'Failed to set the aspect ratio of window. err.code:' + JSON.stringify(err.code));
                try{
                  expect().assertFail();
                } catch (error) {
                  console.info(`expected catch error: ${JSON.stringify(error)}`)
                }
                done();
                return;
              }
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to set the aspect ratio of window. Cause : ' + JSON.stringify(exception));
            expectedError(exception, caseName, 'mainWnd.setAspectRatio', done, 401);
          }
        })
      }

      await setAspectRatio()
    })

    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_LOADCONTENTBYNAME_JS_API_2340
     * @tc.name test_loadContentByName_callback_withstorage
     * @tc.desc Test the function of loadContentByName withstorage callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
        it('test_loadContentByName_callback_withstorage', 0, async function (done) {

          let msg = "test_loadContentByName_callback_withstorage"

          try {
            windowStage.loadContentByName("Index1", abilityStorage, (err) => {
              const errCode = err.code;
              if (errCode) {
                console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(err));
                expect().assertFail()
                done()
              } else {
                console.info(msg + 'Succeeded in loading the content.');
                expect(true).assertTrue()
                done()
              }
              
            });
          } catch (exception) {
            console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(exception));
            expect().assertFail()
            done()
          }
          
          
        });

    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_LOADCONTENTBYNAME_JS_API_2350
     * @tc.name test_loadContentByName_callback_withoutstorage
     * @tc.desc Test the function of loadContentByName withoutstorage callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
     it('test_loadContentByName_callback_withoutstorage', 0, async function (done) {

      let msg = "test_loadContentByName_callback_withoutstorage"

      try {
        windowStage.loadContentByName("Index1", (err) => {
          const errCode = err.code;
          if (errCode) {
            console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(err));
            expect().assertFail()
            done()
          }else{
              console.info(msg + 'Succeeded in loading the content.');
              expect(true).assertTrue()
              done()
          }
        });
      } catch (exception) {
        console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
      
      
    });


    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_LOADCONTENTBYNAME_JS_API_2360
     * @tc.name test_loadContentByName_Promise
     * @tc.desc Test the function of loadContentByName Promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
     it('test_loadContentByName_Promise', 0, async function (done) {

      let msg = "test_loadContentByName_Promise"

      try {
        let promise = windowStage.loadContentByName("Index1", abilityStorage);
        promise.then(() => {
          console.info(msg + 'Succeeded in loading the content.');
          expect(true).assertTrue()
          done()
        }).catch((err) => {
          console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(err));
          expect().assertFail()
          done()
        });
      } catch (exception) {
        console.error(msg + 'Failed to load the content. Cause:' + JSON.stringify(exception));
        expect().assertFail()
        done()
      }
      
      
    });


    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name      : testGetTitleButtonRect
     * @tc.desc      : Test the function of getTitleButtonRect
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
     it('testGetTitleButtonRect', 0, async function(done){
      let msgStr = 'testGetTitleButtonRect';
      console.log(msgStr + 'begin');
      let windowClass = await ohosWindow.getLastWindow(context);
      try {
        let TitleButtonRect = windowClass.getTitleButtonRect();
        console.log(msgStr + 'Succeeded in obtaining the area of title buttons. Data: ' + JSON.stringify(TitleButtonRect));
        expect(TitleButtonRect.right !== null).assertTrue();
        expect(TitleButtonRect.top !== null).assertTrue();
        expect(TitleButtonRect.height !== null).assertTrue();
        expect(TitleButtonRect.width !== null).assertTrue();
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to get the area of title buttons. Cause: ' + JSON.stringify(error));
        if (error.code == 1300002) {
            expect(true).assertTrue()
            done()
        } else {
            expect().assertFail();
            done();
        }          
      }
    });


    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.name      : testWindowTitleButtonRectChange_on_Function_Callback
     * @tc.desc      : Test the function of windowTitleButtonRectChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWindowTitleButtonRectChange_on_Function_Callback', 0, async function(done){
      let  msgStr = 'testWindowTitleButtonRectChange_on';
      console.log(msgStr + "begin on")
      try {
        let windowClass = await ohosWindow.getLastWindow(context);
        windowClass.on('windowTitleButtonRectChange', (titleButtonRect) => {
          console.log(msgStr + 'Succeeded in enabling the listener for window title buttons area changes. Data: ' + JSON.stringify(titleButtonRect));
          expect(true).assertTrue();
          done();
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log(msgStr + 'Failed to enable the listener for window title buttons area changes. Cause: ' + JSON.stringify(err));
        if (err.code == 801) {
            expect(true).assertTrue()
            done()
        } else {
            expect().assertFail();
            done();
        }
      }
   });


    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0300
     * @tc.name      : testWindowTitleButtonRectChange_off_Function_Callback
     * @tc.desc      : Test the function of windowTitleButtonRectChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testWindowTitleButtonRectChange_off_Function_Callback', 0, async function(done){
      let msgStr = 'testWindowTitleButtonRectChange_off';
      console.log(msgStr + 'begin off');
      try {
        let windowClass = await ohosWindow.getLastWindow(context);
        windowClass.off('windowTitleButtonRectChange');
        console.log(msgStr + 'Succeeded in enabling the listener for window title buttons area changes');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to disable the listener for window title buttons area changes. Cause: ' + JSON.stringify(error));
        if (error.code == 1300002) {
            expect(true).assertTrue()
            done()
        } else {
            expect().assertFail();
            done();
        }  
      }
   });


    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2630
     * @tc.name      : testEnumWindow_windowType
     * @tc.desc      : window type enumeration
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testEnumWindow_windowType', 0, async function(){
      console.info('testEnumWindow_windowType test the enum value of windowType begin');
      console.info('testEnumWindow_windowType' + JSON.stringify(ohosWindow.WindowType));
      try {
        expect(0).assertEqual(ohosWindow.WindowType.TYPE_APP);
        expect(1).assertEqual(ohosWindow.WindowType.TYPE_SYSTEM_ALERT);
        expect(2).assertEqual(ohosWindow.WindowType.TYPE_INPUT_METHOD);
        expect(3).assertEqual(ohosWindow.WindowType.TYPE_STATUS_BAR);
        expect(4).assertEqual(ohosWindow.WindowType.TYPE_PANEL);
        expect(5).assertEqual(ohosWindow.WindowType.TYPE_KEYGUARD);
        expect(6).assertEqual(ohosWindow.WindowType.TYPE_VOLUME_OVERLAY);
        expect(7).assertEqual(ohosWindow.WindowType.TYPE_NAVIGATION_BAR);
        expect(8).assertEqual(ohosWindow.WindowType.TYPE_FLOAT);
        expect(9).assertEqual(ohosWindow.WindowType.TYPE_WALLPAPER);
        expect(10).assertEqual(ohosWindow.WindowType.TYPE_DESKTOP);
        expect(11).assertEqual(ohosWindow.WindowType.TYPE_LAUNCHER_RECENT);
        expect(12).assertEqual(ohosWindow.WindowType.TYPE_LAUNCHER_DOCK);
        expect(13).assertEqual(ohosWindow.WindowType.TYPE_VOICE_INTERACTION);
        expect(14).assertEqual(ohosWindow.WindowType.TYPE_POINTER);
        expect(15).assertEqual(ohosWindow.WindowType.TYPE_FLOAT_CAMERA);
        expect(16).assertEqual(ohosWindow.WindowType.TYPE_DIALOG);
        expect(17).assertEqual(ohosWindow.WindowType.TYPE_SCREENSHOT);
      } catch (error) {
        console.info('test Enum value of windowType error ' + JSON.stringify(error));
        expect().assertFail();
      }
   });

  })
}
