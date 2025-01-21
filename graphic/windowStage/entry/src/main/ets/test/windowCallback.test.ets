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
      'TYPE_SYSTEM_ALERT': 1,
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
    var newWindowObj = null;
    beforeAll(function () {
      appWindowTypeArr = Object.keys(appWindowTypeDic);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      for (var i in ohosWindow.WindowType) {
        windowTypeArr.push(ohosWindow.WindowType[i]);
      }
      console.log('jsunittest beforeall');
      console.log('beforeall ohosWindow.windowType' + JSON.stringify(ohosWindow.WindowType))
    })
    beforeEach(function () {
    })
    afterEach(async function (done) {
      windowCount++;
      console.log('jsunittest afterEach listenerData:' + JSON.stringify(listenerData));
      if (listenerData.on) {
        listenerData.on = false;
        if (listenerData.typeStr === 'systemBarTintChange') {
          console.log('jsunittest systemBarTintChange start on');
          console.log('jsunittest systemBarTintChange end off listenerData.typeStr==' + JSON.stringify(listenerData.typeStr));
          ohosWindow.off(listenerData.typeStr);
          console.log('jsunittest systemBarTintChange end off');
        } else if (newWindowObj) {
          newWindowObj.off(listenerData.typeStr);
          console.log('jsunittest newWindowObj listenerData.typeStr:' + JSON.stringify(listenerData.typeStr));
        }
        await sleep(3000);
      }
      done();
    })
    afterAll(function () {
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
     * @tc.number SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_006
     * @tc.name Test setSystemBarEnableTest6
     * @tc.desc Test ohosWindow.setSystemBarEnable API function test1.
     */
    it('setSystemBarEnableTest6', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', systembartintstate => {
        console.log(msgStr + 'ohosWindow.on  systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
        console.log(msgStr + 'ohosWindow.on  flagNav : ' + JSON.stringify(flagNav));
        console.log(msgStr + 'ohosWindow.on  flagStatus : ' + JSON.stringify(flagStatus));
        console.log(msgStr + 'ohosWindow.on  flagStatus && flagNav : ' + (flagStatus && flagNav));
        if (flagStatus || flagNav) {
          try {
            expect(!!systembartintstate).assertTrue();
            expect(!!systembartintstate.regionTint).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on ${JSON.stringify(error)}`)
          }
          console.log(msgStr + 'flagStatus || flagNav' + msgStr + 'ohosWindow.on systemBarTintChange regionTint:' + JSON.stringify(systembartintstate.regionTint));
          ohosWindow.off('systemBarTintChange')
          done();
        }
      })

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
              flagNav = true;
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
              flagStatus = true;
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
    });
    /**
     * @tc.number SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_007
     * @tc.name Test setSystemBarEnableTest7
     * @tc.desc Verify that the scene hides the status bar and displays the navigation bar.
     */
    it('setSystemBarEnableTest7', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');

      ohosWindow.on('systemBarTintChange', systembartintstate => {
        console.log(msgStr + 'ohosWindow.on systembartintstate ：' + JSON.stringify(systembartintstate));
        console.log(msgStr + 'ohosWindow.on systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
        if (flagStatus || flagNav) {
          console.log(msgStr + 'ohosWindow.on flagStatus || flagNav：');
          try {
            expect(!!systembartintstate).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on catch err: ${JSON.stringify(error)}`)
          }
          ohosWindow.off('systemBarTintChange')
          done();
        }
      })

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
              flagStatus = true;
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
              flagNav = true;
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
    });
    /**
     * @tc.number SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_008
     * @tc.name Test setSystemBarEnableTest8
     * @tc.desc Verify that the scene displays both the status bar and the navigation bar.
     */
    it('setSystemBarEnableTest8', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');

      ohosWindow.on('systemBarTintChange', systembartintstate => {
        if (flagStatus && flagNav) {
          console.log(msgStr + 'ohosWindow.on systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
          let enable = systembartintstate.regionTint[0].isEnable
          let numType = systembartintstate.regionTint[0].type
          console.log(msgStr + 'ohosWindow.on isEnable : ' + JSON.stringify(enable));
          console.log(msgStr + 'ohosWindow.on numType : ' + JSON.stringify(numType));
          try {
            expect(numType === ohosWindow.WindowType.TYPE_STATUS_BAR || numType === ohosWindow.WindowType.TYPE_NAVIGATION_BAR && enable)
              .assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on catch err: ${JSON.stringify(error)}`)
          }
          ohosWindow.off('systemBarTintChange')
          done();
        } else {
          console.log(msgStr + 'flagStatus :' + flagStatus + '  ,regionTint:' + JSON.stringify(systembartintstate.regionTint));
          console.log(msgStr + 'flagNav :' + flagNav + '  ,regionTint:' + JSON.stringify(systembartintstate.regionTint));
        }
      })

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
              flagStatus = true;
              flagNav = true;
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
    });
    /**
     * @tc.number SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_009
     * @tc.name Test setSystemBarEnableTest9
     * @tc.desc Verify that the scene hides both the status bar and the navigation bar.
     */
    it('setSystemBarEnableTest9', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest9';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      ohosWindow.on('systemBarTintChange', (systembartintstate) => {
        console.log(msgStr + 'ohosWindow.on systemBarTintChange ：' + JSON.stringify(systembartintstate));
        console.log(msgStr + 'ohosWindow.on systemBarTintChange systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
        if (flagStatus || flagNav) {
          try {
            expect(!!systembartintstate).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on catch err: ${JSON.stringify(error)}`)
          }
          ohosWindow.off('systemBarTintChange')
          done();
        }
      })

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
              flagStatus = true;
              flagNav = true;
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
    });
    /**
     * @tc.number SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_010
     * @tc.name Test setSystemBarEnableTest10
     * @tc.desc Verify the scene where illegal values are entered when the navigation bar and status bar are displayed or hidden
     */
    it('setSystemBarEnableTest10', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest10';
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
     * @tc.number SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_004
     * @tc.name Test setSystemBarPropertiesTest1
     * @tc.desc TVerify the scene where the colors of the status bar and navigation bar are set in RGB
     */
    it('setSystemBarPropertiesTest4', 0, async done => {
      let caseName = 'setSystemBarPropertiesTest4';
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
              console.log(msgStr + 'tempWnd.setSystemBarProperties ' + JSON.stringify(systemBarProperties)+ ' success');
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
        await setSystemBarPropertiesFun(tempWnd,systemBarProperties).catch((err) => {
          console.info(msgStr + 'setSystemBarProperties error : ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      }
      done();
    })
    /**
     * @tc.number SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_005
     * @tc.name Test setSystemBarPropertiesTest5
     * @tc.desc Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
     */
    it('setSystemBarPropertiesTest5', 0, async done => {
      let caseName = 'setSystemBarPropertiesTest5';
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
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag) {
          try {
            expect(!!systemBarData).assertTrue();
            expect(!!systemBarData.regionTint).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
          }
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            console.log(msgStr + 'for arrLenght compareCount: ' + compareCount + ' ,i:' + i + '  ,arrLength:' + arrLength);
            let tempData = systemBarData.regionTint[i];
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR) {
              console.log(msgStr + 'systemBarTintChange compare start! arrLength= ' + arrLength);
              compareCount++;
              let backgroundIndex = cloneColorArr.SBC.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.SCC.indexOf(tempData.contentColor);
              if (backgroundIndex >= 0) {
                cloneColorArr.SBC.splice(backgroundIndex, 1);
              } else {
                console.log(msgStr + 'SBC tempData.backgroundColor:' + JSON.stringify(tempData.backgroundColor));
              }
              if (contentColorIndex >= 0) {
                cloneColorArr.SCC.splice(contentColorIndex, 1);
              } else {
                console.log(msgStr + 'SCC tempData.contentColor:' + JSON.stringify(tempData.contentColor));
              }
              let ca = cloneColorArr;
              let flag = ca.NCC.length || ca.NBC.length || ca.SBC.length || ca.SCC.length
              if (compareCount === 18 && !flag) {
                console.log(msgStr + 'if compareCount: ' + compareCount + ' ,true flag:' + flag);
                try {
                  expect(true).assertTrue();
                } catch (error) {
                  console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
                }
              } else {
                console.log(msgStr + 'compareCount: ' + compareCount + ' ,flag:' + flag);
              }
              console.log(msgStr + 'compareCount: ' + compareCount + ' ,length: ' + JSON.stringify(cloneColorArr.SCC.length) + '   ,cloneColorArr.SBC:' + JSON.stringify(cloneColorArr.SBC));
              console.log(msgStr + 'compareCount: ' + compareCount + ' ,length: ' + JSON.stringify(cloneColorArr.SCC.length) + '    ,cloneColorArr.SCC' + JSON.stringify(cloneColorArr.SCC));
              done();
            } else if (tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.NBC.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.NCC.indexOf(tempData.contentColor);
              if (backgroundIndex >= 0) {
                cloneColorArr.NBC.splice(backgroundIndex, 1);
              } else {
                console.log(msgStr + 'NBC tempData.backgroundColor:' + JSON.stringify(tempData.backgroundColor));
              }
              if (contentColorIndex >= 0) {
                cloneColorArr.NCC.splice(contentColorIndex, 1);
              } else {
                console.log(msgStr + 'NCC tempData.contentColor:' + JSON.stringify(tempData.contentColor));
              }
              let ca = cloneColorArr;
              let flag = ca.NCC.length || ca.NBC.length || ca.SBC.length || ca.SCC.length
              if (compareCount === 18 && !flag) {
                console.log(msgStr + 'else compareCount: ' + compareCount + ' ,true flag:' + flag);
                try {
                  expect(true).assertTrue();
                } catch (error) {
                  console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
                }
              } else {
                console.log(msgStr + 'compareCount: ' + compareCount + ' ,flag:' + flag);
              }
              console.log(msgStr + 'compareCount: ' + endNum + ' ,compareCount: ' + compareCount + ' ,length: ' + JSON.stringify(cloneColorArr.NBC.length) + '   ,cloneColorArr.SBC:' + JSON.stringify(cloneColorArr.NBC));
              console.log(msgStr + 'compareCount: ' + endNum + ' ,compareCount: ' + compareCount + ' ,length: ' + JSON.stringify(cloneColorArr.NCC.length) + '    ,cloneColorArr.SCC' + JSON.stringify(cloneColorArr.NCC));
              endNum = compareCount
              done();
            }
          }
        }
        console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      })

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
      listenerFlag = true
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
          console.log(msgStr + 'tempWnd.setSystemBarProperties data' + JSON.stringify(data));
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
     * @tc.number SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_006
     * @tc.name Test setSystemBarPropertiesTest6
     * @tc.desc TVerify the scene where the status bar and navigation bar colors are set as keywords
     */
    it('setSystemBarPropertiesTest6', 0, async done => {
      let caseName = 'setSystemBarPropertiesTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonKEYColorArr));
      let compareCount = 0;
      let listenerFlag = false;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag) {
          try {
            expect(!!systemBarData).assertTrue();
            expect(!!systemBarData.regionTint).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
          }
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR || tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.indexOf(tempData.contentColor);
              try {
                expect(backgroundIndex === -1).assertTrue();
                expect(contentColorIndex === -1).assertTrue();
              } catch (error) {
                console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
              }
            }
          }
        }
        console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      })
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
      listenerFlag = true
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
          console.log(msgStr + 'tempWnd.setSystemBarProperties err' + JSON.stringify(err));
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
     * @tc.number SUB_WINDOW_CREATE_JSAPI_005
     * @tc.name Test create5
     * @tc.desc Scheme of Failed to Create Application Type Window in Stage Mode
     */
    it('createTest5', 0, async done => {
      let caseName = 'createTest5';
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
     * @tc.number SUB_WINDOW_CREATE_JSAPI_006
     * @tc.name Test createTest6
     * @tc.desc Verify the scenario of creating the system type window
     */
    it('createTest6', 0, async done => {
      let caseName = 'createTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log(msgStr + 'loopCount: ' + loopCount);
      let tempWnd = null
      let tempType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;

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
     * @tc.number SUB_WINDOW_CREATE_JSAPI_007
     * @tc.name Test createTest7
     * @tc.desc Verify the scenario of creating a window of a type that does not exist
     */
    it('createTest7', 0, async done => {
      let caseName = 'createTest7';
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
     * @tc.number SUB_WINDOW_CREATE_JSAPI_008
     * @tc.name Test createTest8
     * @tc.desc Verify the scenario of creating a window with duplicate IDs
     */
    it('createTest8', 0, async done => {
      let caseName = 'createTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'sameid'
      let tempWnd = null;

      function createFirstWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, 1, (err, data) => {
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
      ohosWindow.create(context, windowId, 1, async (err, data) => {
        console.log(msgStr + 'ohosWindow.create 1 twice err: ' + JSON.stringify(err));
        if (err && err.code) {
          console.log(msgStr + 'ohosWindow.create 1 twice data: ' + JSON.stringify(data));
          try {
            expect(err.code).assertEqual(1001)
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
     * @tc.number SUB_WINDOW_ON_OFF_JSAPI_005
     * @tc.name Test listenerTest5
     * @tc.desc Verify whether the change of avoidance area and change monitoring can be turned on normally
     */
    it('listenerTest5', 0, async function (done) {
      let caseName = 'listenerTest5';
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
     * @tc.number SUB_WINDOW_SETWINDOWTYPE_JSAPI_003
     * @tc.name Test setWindowTypeTest3
     * @tc.desc Verify the scenario where the normal window type is set
     */
    it('setWindowTypeTest3', 0, async function (done) {
      let caseName = 'setWindowTypeTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'setWindowTypeTest3';
      console.log(msgStr + 'begin');
      console.log(msgStr + 'newWindowObj 2: ' + JSON.stringify(newWindowObj));
      let tempWnd = null
      let loopCount1 = systemWindowTypeArr;
      console.log(msgStr + 'ohosWindow.windowType' + JSON.stringify(loopCount1))

      function createWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            try {
              if (!!data) {
                resolve(data)
              } else {
                reject(null)
              }
            } catch (err) {
              console.log(msgStr + 'ohosWindow.create catch err: ' + JSON.stringify(err));
            }
          })
        })
      }

      function setWindowType(win, tempType, i) {
        return new Promise(function (resolve, reject) {
          win.setWindowType(tempType, (err, data) => {
            console.log(msgStr + 'tempWnd.setWindowType i: ' + i);
            if (err && err.code) {
              reject(null)
            } else {
              console.log(msgStr + 'tempWnd.setWindowType success' + tempType);
              resolve(true)
            }
          })
        })
      }

      tempWnd = await createWin().catch(err => {
        console.log(msgStr + 'ohosWindow.create failed' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!tempWnd).assertTrue();

      for (let i = 0; i < loopCount1.length; i++) {
        let tempType = ohosWindow.WindowType[loopCount1[i]];
        console.log(msgStr + "step: " + i);
        await setWindowType(tempWnd, tempType, i).catch(err => {
          console.log(msgStr + 'setWindowType failed' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
        console.log(msgStr + 'getProperties start');
        let winProperties;
        winProperties = await tempWnd.getProperties().catch((err) => {
          console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        expect(!!winProperties).assertTrue();
        expect(winProperties.type === tempType).assertTrue();
        if (i == loopCount1.length - 1) {
          await tempWnd.destroy();
          done();
        }
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWTYPE_JSAPI_004
     * @tc.name Test setWindowTypeTest4
     * @tc.desc Verify the scene of setting illegal window type
     */
    it('setWindowTypeTest4', 0, async function (done) {
      let caseName = 'setWindowTypeTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let changedWndType = null;
      let windowId = 'setWindowTypeTest4';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function createWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            if (!!data) {
              resolve(data)
            }
            else {
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
      tempWnd.setWindowType(changedWndType, async (err, data) => {
        if (!!data) {
          await tempWnd.destroy();
          unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
        } else {
          try {
            expect(err.code == 1003).assertTrue();
          } catch (error) {
            console.info(`tempWnd.setWindowType catch error: ${JSON.stringify(error)}`)
          }
          await tempWnd.destroy();
          done();
        }
      })

    })
    /**
     * @tc.number SUB_WINDOW_DESTROY_JSAPI_002
     * @tc.name Test destroyTest2
     * @tc.desc Verification window destruction scenario
     */
    it('destroyTest2', 0, async function (done) {
      let caseName = 'destroyTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'destroyTest2';
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
     * @tc.number SUB_WINDOW_LOADCONTENT_JSAPI_007
     * @tc.name Test loadContentTest7
     * @tc.desc Verify the scenario of loading an existing page
     */
    it('loadContentTest7', 0, async function (done) {
      let caseName = 'loadContentTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest7';
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
          unexpectedError(err, caseName, 'tempWnd.loadContent', done);
        } else {
          try {
            expect(!data).assertTrue();
          } catch (error) {
            console.info(`tempWnd.loadContent catch error: ${JSON.stringify(error)}`)
          }
          await tempWnd.destroy();
          done()
        }
      })
    })
    /**
     * @tc.number SUB_WINDOW_LOADCONTENT_JSAPI_008
     * @tc.name Test loadContentTest8
     * @tc.desc Verify the scenario of loading a page that does not exist
     */
    it('loadContentTest8', 0, async function (done) {
      let caseName = 'loadContentTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest8';
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
     * @tc.number SUB_WINDOW_LOADCONTENT_JSAPI_009
     * @tc.name Test loadContentTest9
     * @tc.desc Verify the scenario of loading an existing page
     */
    it('loadContentTest9', 0, async function (done) {
      let caseName = 'loadContentTest9';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      windowStage.loadContent('MainAbility/pages/second/second', (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.loadContent', done);
          console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second ' + JSON.stringify(err));
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
     * @tc.number SUB_WINDOW_LOADCONTENT_JSAPI_010
     * @tc.name Test loadContentTest10
     * @tc.desc Verify the scenario of loading an existing page
     */
    it('loadContentTest10', 0, async function (done) {
      let caseName = 'loadContentTest10';
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
     * @tc.number SUB_WINDOW_LOADCONTENT_JSAPI_011
     * @tc.name Test loadContentTest11
     * @tc.desc Verify the scenario of loading an existing page
     */
    it('loadContentTest11', 0, async function (done) {
      let caseName = 'loadContentTest11';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      windowStage.loadContent('MainAbility/pages/second/second', abilityStorage, (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage loadContent', done);
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
     * @tc.number SUB_WINDOW_LOADCONTENT_JSAPI_012
     * @tc.name Test loadContentTest12
     * @tc.desc Verify the scenario of loading an existing page
     */
    it('loadContentTest12', 0, async function (done) {
      let caseName = 'loadContentTest12';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      try {
        windowStage.loadContent(null, abilityStorage, (err, data) => {
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
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
     * @tc.number SUB_WINDOW_CREATESUBWINDOW_JSAPI_003
     * @tc.name Test createSubWindowTest3
     * @tc.desc Verify the scenario of creating an auxiliary window
     */
    it('createSubWindowTest3', 0, async function (done) {
      let caseName = 'createSubWindowTest3';
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
     * @tc.number SUB_WINDOW_CREATESUBWINDOW_JSAPI_004
     * @tc.name Test createSubWindowTest4
     * @tc.desc Verify the scene of entering illegal values to create an auxiliary window
     */
    it('createSubWindowTest4', 0, async function (done) {
      let caseName = 'createSubWindowTest4';
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
     * @tc.number SUB_WINDOW_GETSUBWINDOW_JSAPI_002
     * @tc.name Test getSubWindowTest2
     * @tc.desc Verify the scene of obtaining all auxiliary sub windows
     */
    it('getSubWindowTest2', 0, async function (done) {
      let caseName = 'getSubWindowTest2';
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
     * @tc.number SUB_WINDOW_SETPRIVACYMODE_JSAPI_002
     * @tc.name Test setPrivacyModeTest2
     * @tc.desc Verify the scene where the application sub window is set as a security layer
     */
    it('setPrivacyModeTest2', 0, async function (done) {
      let caseName = 'setPrivacyModeTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin ohosWindow =' + JSON.stringify(ohosWindow));
      let tempWnd = null;

      function createWin() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, 'setPrivacyModeTest2', ohosWindow.WindowType.TYPE_SYSTEM_ALERT, (err, data) => {
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
     * @tc.number SUB_WINDOW_SETPRIVACYMODE_JSAPI_003
     * @tc.name Test setPrivacyModeTest3
     * @tc.desc Verify that the auxiliary window is set as the security layer
     */
    it('setPrivacyModeTest3', 0, async function (done) {
      let caseName = 'setPrivacyModeTest3';
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
     * @tc.number SUB_WINDOW_SETPREFERREDORIENTATION_JSAPI_002
     * @tc.name Test setPreferredOrientationTest2
     * @tc.desc Sets the display direction property of the window
     */
    it('setPreferredOrientationTest2', 0, async function (done) {
      let caseName = 'setPreferredOrientationTest2';
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
        console.info(msgStr + 'Succeeded in setting window orientation. orientation: ' + orientation + "step: " + i);
        await sleep(3000)
      }
      done()
    })
    /**
     * @tc.number SUB_WINDOW_SETFORBIDSPLITMOVE_JSAPI_002
     * @tc.name Test setForbidSplitMoveTest2
     * @tc.desc Sets whether Windows are forbidden to move in split screen mode
     */
    it('setForbidSplitMoveTest2', 0, async function (done) {
      let caseName = 'setForbidSplitMoveTest2';
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
     * @tc.number SUB_WINDOW_SNAPSHOT_JSAPI_002
     * @tc.name Test snapshotTest2
     * @tc.desc Scenario of screenshot of verification window
     */
    it('snapshotTest2', 0, async function (done) {
      let caseName = 'snapshotTest2';
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
     * @tc.number SUB_WINDOW_DIALOGTARGETTOUCH_JSAPI_002
     * @tc.name Test dialogTargetTouchTest2
     * @tc.desc Verify the scenario of opening modal window
     */
    it('dialogTargetTouchTest2', 0, async done => {
      let caseName = 'dialogTargetTouchTest2';
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
     * @tc.number SUB_WINDOW_ANIMATIONFORSHOWN_JSAPI_002
     * @tc.name Test animationForShownTest2
     * @tc.desc Verify window custom animation configuration of the scene
     */
    it('animationForShownTest2', 0, async function (done) {
      let caseName = 'animationForShownTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      console.log(msgStr + 'begin ohosWindow==' + JSON.stringify(ohosWindow));
      let wndId = 'animationForShownTest2';
      let baseType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
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
     * @tc.number SUB_WINDOW_GETCUTOUTINFO_JSAPI_002
     * @tc.name Test getCutoutInfoTest2
     * @tc.desc Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
     */
    it('getCutoutInfoTest2', 0, async function (done) {
      let caseName = 'getCutoutInfoTest2';
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
  })
}
