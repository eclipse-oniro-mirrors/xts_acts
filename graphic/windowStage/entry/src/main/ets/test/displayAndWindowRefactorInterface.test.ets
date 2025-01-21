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
import screenManager from '@ohos.screen';
import display from '@ohos.display';

export default function displayAndWindowRefactorInterfaceTest(context, windowStage, abilityStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('displayAndWindowRefactorInterface_test', function () {
    console.log('describe window_api_test3 start!!!')
    const TRUE_FLAG = true;
    var appWindowTypeArr = [];
    var windowTypeArr = [];
    var appWindowTypeDic = {
      'TYPE_BASE': 0,
      'TYPE_APP': 0,
      'TYPE_APP_SUB_WINDOW': 1,
    };
    var systemWindowValueArr = [];
    var systemWindowTypeArr = [];
    var systemWindowTypeDicArr = [];
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
    const WINDOW_NAME = 'windowName';

    beforeAll(function () {
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsunittest beforeall systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowValueArr = Object.keys(systemWindowTypeDic);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      for (var i in ohosWindow.WindowType) {
        console.log('jsunittest beforeall i=' + i);
        windowTypeArr.push(ohosWindow.WindowType[i])
      }
    })
    beforeEach(function () {
    })
    afterEach(async function (done) {
      windowCount++;
      if (listenerData.on) {
        listenerData.on = false;
        console.log('jsunittest afterEach listener off, listenerData:' + JSON.stringify(listenerData));
        if (listenerData.typeStr === 'systemBarTintChange') {
          ohosWindow.off(listenerData.typeStr);
        } else if (newWindowObj) {
          newWindowObj.off(listenerData.typeStr);
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
      if (error.code === code) {
        expect(TRUE_FLAG).assertTrue();
      }
      done();
    }

    function unexpectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      try {

        expect(TRUE_FLAG).assertFail();
      } catch (error) {
        console.info(`unexpectedError catch error: ${JSON.stringify(error)}`)
      }
      done();
    }

    async function sleep(time) {
      let timeoutId= null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }
    /**
     * @tc.number SUB_WINDOW_GETALLDISPLAYS_JSAPI_001
     * @tc.name Test getAllDisplaysTest1
     * @tc.desc Gets all current display objects
     */
    it('getAllDisplaysTest1', 0, async function (done) {
      let caseName = 'getAllDisplaysTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      await display.getAllDisplays().then((data) => {
        console.info(msgStr + 'Succeeded in obtaining all the display objects. Data: ' + JSON.stringify(data));
        expect(data[0].id != null).assertTrue();
        expect(data[0].refreshRate != null).assertTrue();
        expect(data[0].width != null).assertTrue();
        expect(data[0].height != null).assertTrue();
        expect(data[0].rotation != null).assertTrue();
        expect(data[0].densityDPI != null).assertTrue();
        expect(data[0].name != null).assertTrue();
        expect(data[0].alive).assertTrue();
        expect(data[0].state != null).assertTrue();
        expect(data[0].densityPixels != null).assertTrue();
        expect(data[0].scaledDensity != null).assertTrue();
        expect(data[0].xDPI != null).assertTrue();
        expect(data[0].yDPI != null).assertTrue();
        done();
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETALLDISPLAYS_JSAPI_002
     * @tc.name Test getAllDisplaysTest2
     * @tc.desc Gets all current display objects
     */
    it('getAllDisplaysTest2', 0, async function (done) {
      let caseName = 'getAllDisplaysTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      display.getAllDisplays((err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`display.getAllDisplays catch error: ${JSON.stringify(error)}`)
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in obtaining all the display objects. Data: ' + JSON.stringify(data));
        expect(data[0].refreshRate != null).assertTrue();
        expect(data[0].width != null).assertTrue();
        expect(data[0].height != null).assertTrue();
        expect(data[0].rotation != null).assertTrue();
        expect(data[0].densityDPI != null).assertTrue();
        expect(data[0].name != null).assertTrue();
        expect(data[0].alive).assertTrue();
        expect(data[0].state != null).assertTrue();
        expect(data[0].densityPixels != null).assertTrue();
        expect(data[0].scaledDensity != null).assertTrue();
        expect(data[0].xDPI != null).assertTrue();
        expect(data[0].yDPI != null).assertTrue();
        done();
        console.log(msgStr + 'done ');
      });
    })
    /**
     * @tc.number SUB_WINDOW_CREATEWINDOW_JSAPI_001
     * @tc.name Test createWindowTest1
     * @tc.desc Verify the scenario of creating the application type window
     */
    it('createWindowTest1', 0, async function (done) {
      let caseName = 'createWindowTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeDicArr.length;
      console.log(msgStr + 'loopCount: ' + loopCount);
      for(let i=0;i<loopCount;i++ ){
        let tempType = Number(ohosWindow.WindowType[systemWindowTypeDicArr[i]])
        let windId = 'createWindowTest1' + i;
        console.log(msgStr + 'ohosWindow.createWindow:  ' + tempType + ' start');
        let windowConfig = {
          name: windId,
          windowType: tempType,
          ctx: context,
          displayId: 0,
          parentId: 0
        };
        let tempWnd;
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          console.log(msgStr + 'ohosWindow.createWindow ' + tempType + 'catched, err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        });
        console.log(msgStr + 'ohosWindow.createWindow ' + tempType + 'finished, wnd: ' + JSON.stringify(tempWnd));
        console.log(msgStr + 'ohosWindow.createWindow ' + tempType + 'finished, step: ' + i);
        expect(!!tempWnd).assertTrue();
        await tempWnd.destroyWindow();
        if (i == loopCount-1) done();
      }
    })

    /**
     * @tc.number SUB_WINDOW_CREATEWINDOW_JSAPI_002
     * @tc.name Test createWindowTest2
     * @tc.desc Verify the scenario of creating a window with duplicate IDs
     */
    it('createWindowTest2', 0, async function (done) {
      let caseName = 'createWindowTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'createWindowSameidsTest2'
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let ohosData;
      try {
        ohosData = await ohosWindow.createWindow(windowConfig).catch((err) => {
          console.log(msgStr + 'ohosWindow.createWindow 1 once err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        })
        expect(!!ohosData).assertTrue();
        try {
          let ohosDataError = await ohosWindow.createWindow(windowConfig).catch(async (errSencond) => {
            console.log(msgStr + 'ohosWindow.createWindow 1 twice err: ' + JSON.stringify(errSencond));
            expect(errSencond.code).assertEqual(1300002)
            await ohosData.destroyWindow();
            done();
          })
          console.log(msgStr + 'ohosWindow.createWindow 1 twice ohosDataError: ' + JSON.stringify(ohosDataError));
        } catch (exception) {
          console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_CREATEWINDOW_JSAPI_004
     * @tc.name Test createWindowTest4
     * @tc.desc Verify the scenario of creating the application type window
     */
    it('createWindowTest4', 0, async function (done) {
      sleep(1000)
      let caseName = 'createWindowTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let tempType = 1;
      let windId = 'createWindowTest4_0';
      let windIdTwo = 'createWindowTest4_1';
      console.log(msgStr + 'ohosWindow.createWindow ' + tempType + ' start');
      let windowConfig = {
        name: windId, windowType: tempType, ctx: context
      };
      let windowConfigTwo = {
        name: windIdTwo, windowType: tempType, ctx: context
      };

      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(windowConfig, (err, data) => {
              if (err && err.code) {
                console.log(msgStr + 'ohosWindow.createWindow err.code==' + JSON.stringify(err.code))
                try {
                  expect().assertFail();
                } catch (err) {
                  console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
                }
                done();
                reject(null)
              }
              console.info('Succeeded in creating the window. Data: ' + JSON.stringify(data));
              resolve(data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }

      let dataOne;
      dataOne = await createFirstWindow();
      expect(!!dataOne).assertTrue();
      try {
        ohosWindow.createWindow(windowConfigTwo, async (err, dataTwo) => {
          console.log(msgStr + 'ohosWindow.createWindow two twice' + JSON.stringify(err));
          if (err && err.code) {
            console.log(msgStr + 'ohosWindow.createWindow two twice data: ' + JSON.stringify(dataTwo));
            try {
              expect().assertFail();
            } catch (error) {
              console.info(`ohosWindow.createWindow two twice catch error: ${JSON.stringify(error)}`)
            }
          } else {
            console.log(msgStr + 'ohosWindow.createWindow two success twice data: ' + JSON.stringify(dataTwo));
            await dataOne.destroyWindow();
            await dataTwo.destroyWindow();
          }
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_CREATEWINDOW_JSAPI_005
     * @tc.name Test createWindowTest5
     * @tc.desc Verify the scenario of creating the system type window
     */
    it('createWindowTest5', 0, done => {
      let caseName = 'createWindowTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log('jsunittest loopCount: ' + loopCount);
      let tempType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
      let windId = 'createWindowTest5';
      console.log(msgStr + 'ohosWindow.createWindow ' + tempType + ' start');
      let windowConfig = {
        name: windId, windowType: tempType, ctx: context
      };
      try {
        ohosWindow.createWindow(windowConfig, async (err, data) => {
          if (err && err.code) {
            try {
              expect().assertFail();
            } catch (error) {
              console.info(msgStr + `ohosWindow.createWindow  catch error: ${JSON.stringify(error)}`)
            }
            done();
            return;
          }
          try {
            expect(!!data).assertTrue();
          } catch (error) {
            console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(error)}`)
          }
          let tempWnd = data
          console.log(msgStr + 'ohosWindow.createWindow ' + tempType + ' wnd: ' + tempWnd);
          try {
            let proData = tempWnd.getWindowProperties();
            console.log(msgStr + 'proData.type:' + proData.type);
            expect(proData.type == tempType).assertTrue();
            await tempWnd.destroyWindow();
            done();
          } catch (exception) {
            console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_CREATEWINDOW_JSAPI_006
     * @tc.name Test createWindowTest6
     * @tc.desc Verify the scenario of creating a window with duplicate IDs
     */
    it('createWindowTest6', 0, async function (done) {
      let caseName = 'createWindowTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'createWindowSameidTest6'
      let winsowConfig = {
        name: windowId, windowType: 1, ctx: context
      };

      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (err, data) => {
              console.log(msgStr + 'ohosWindow.createWindow 1 once err: ' + JSON.stringify(err));
              if (err && err.code) {
                try {
                  expect().assertFail();
                } catch (error) {
                  console.info(msgStr + `ohosWindow.createWindow  catch error: ${JSON.stringify(error)}`)
                }
                done();
                reject(null)
              }
              resolve(data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }

      let dataOne;
      dataOne = await createFirstWindow();
      expect(!!dataOne).assertTrue();
      try {
        ohosWindow.createWindow(winsowConfig, async (err, dataTwo) => {
          console.log(msgStr + 'ohosWindow.createWindow 1 twice err: ' + JSON.stringify(err));
          if (err && err.code) {
            console.log(msgStr + 'ohosWindow.createWindow 1 twice data: ' + JSON.stringify(dataTwo));
            try {
              expect(err.code).assertEqual(1300002)
            } catch (error) {
              console.info(`ohosWindow.createWindow catch error: ${JSON.stringify(error)}`)
            }
          } else {
            console.log(msgStr + 'ohosWindow.createWindow 1 twice data: ' + JSON.stringify(dataTwo));
          }
          await dataOne.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_GETWINDOWAVOIDAREA_JSAPI_001
     * @tc.name Test getWindowAvoidAreaTest1
     * @tc.desc Obtain the area that the window content avoids
     */
    it('getWindowAvoidAreaTest1', 0, async function (done) {
      let caseName = 'getWindowAvoidAreaTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd = windowStage.getMainWindowSync();
        expect(!!tempWnd).assertTrue();
        try {
          let type = ohosWindow.AvoidAreaType.TYPE_SYSTEM;
          let avoidArea = tempWnd.getWindowAvoidArea(type);
          console.log(msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect != null).assertTrue();
          expect(avoidArea.rightRect != null).assertTrue();
          expect(avoidArea.bottomRect != null).assertTrue();
          expect(avoidArea.leftRect != null).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })

    /**
     * @tc.number SUB_WINDOW_GETWINDOWAVOIDAREA_JSAPI_002
     * @tc.name Test getWindowAvoidAreaTest2
     * @tc.desc Obtain the area that the window content avoids
     */
    it('getWindowAvoidAreaTest2', 0, async function (done) {
      let caseName = 'getWindowAvoidAreaTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd = windowStage.getMainWindowSync();
        expect(tempWnd != null).assertTrue();
        try {
          let type = ohosWindow.AvoidAreaType.TYPE_CUTOUT;
          let avoidArea = tempWnd.getWindowAvoidArea(type);
          console.log(msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
          expect(!avoidArea.visible).assertTrue();
          expect(avoidArea.topRect != null).assertTrue();
          expect(avoidArea.rightRect != null).assertTrue();
          expect(avoidArea.bottomRect != null).assertTrue();
          expect(avoidArea.leftRect != null).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_GETWINDOWAVOIDAREA_JSAPI_003
     * @tc.name Test getWindowAvoidAreaTest3
     * @tc.desc Obtain the area that the window content avoids
     */
    it('getWindowAvoidAreaTest3', 0, async function (done) {
      let caseName = 'getWindowAvoidAreaTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd = windowStage.getMainWindowSync();
        expect(!!tempWnd).assertTrue();
        try {
          let type = ohosWindow.AvoidAreaType.TYPE_SYSTEM_GESTURE;
          let avoidArea = tempWnd.getWindowAvoidArea(type);
          console.log(msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect != null).assertTrue();
          expect(avoidArea.rightRect != null).assertTrue();
          expect(avoidArea.bottomRect != null).assertTrue();
          expect(avoidArea.leftRect != null).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_GETWINDOWAVOIDAREA_JSAPI_004
     * @tc.name Test getWindowAvoidAreaTest4
     * @tc.desc Obtain the area that the window content avoids
     */
    it('getWindowAvoidAreaTest4', 0, async function (done) {
      let caseName = 'getWindowAvoidAreaTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd = windowStage.getMainWindowSync();
        expect(!!tempWnd).assertTrue();
        try {
          let type = ohosWindow.AvoidAreaType.TYPE_KEYBOARD;
          let avoidArea = tempWnd.getWindowAvoidArea(type);
          console.log(msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect != null).assertTrue();
          expect(avoidArea.rightRect != null).assertTrue();
          expect(avoidArea.bottomRect != null).assertTrue();
          expect(avoidArea.leftRect != null).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_GETWINDOWPROPERTIES_JSAPI_001
     * @tc.name Test getWindowPropertiesTest1
     * @tc.desc Gets the properties of the current window
     */
    it('getWindowPropertiesTest1', 0, async function (done) {
      let caseName = 'getWindowPropertiesTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd = windowStage.getMainWindowSync();
        expect(!!tempWnd).assertTrue();
        try {
          let data = tempWnd.getWindowProperties();
          console.log(msgStr + 'ohosWindow.getWindowProperties ' + JSON.stringify(data));
          expect(data.type != null).assertTrue();
          expect(data.windowRect.height != null).assertTrue();
          expect(data.windowRect.left != null).assertTrue();
          expect(data.windowRect.top != null).assertTrue();
          expect(data.windowRect.width != null).assertTrue();
          expect(data.isFullScreen != null).assertTrue();
          expect(data.isLayoutFullScreen != null).assertTrue();
          expect(data.focusable != null).assertTrue();
          expect(data.touchable != null).assertTrue();
          expect(data.isKeepScreenOn != null).assertTrue();
          expect(data.isTransparent != null).assertTrue();
          expect(data.brightness != null).assertTrue();
          expect(data.dimBehindValue).assertEqual(0);
          expect(data.isRoundCorner != null).assertTrue();
          expect(data.isPrivacyMode != null).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the main window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_GETLASTWINDOW_JSAPI_001
     * @tc.name Test getLastWindowTest1
     * @tc.desc Get the final show window
     */
    it('getLastWindowTest1', 0, async function (done) {
      let caseName = 'getLastWindowTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let proData = null
      try {
        let lastWindow = await ohosWindow.getLastWindow(context).catch((err) => {
          console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
        expect(lastWindow != null).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_GETLASTWINDOW_JSAPI_002
     * @tc.name Test getLastWindowTest2
     * @tc.desc Get the final show window
     */
    it('getLastWindowTest2', 0, async function (done) {
      let caseName = 'getLastWindowTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        ohosWindow.getLastWindow(context, (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.info(msgStr + `ohosWindow.getLastWindow  catch error: ${JSON.stringify(error)}`)
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SHOWWINDOW_JSAPI_001
     * @tc.name Test showWindowTest1
     * @tc.desc show window
     */
    it('showWindowTest1', 0, async function (done) {
      let caseName = 'showWindowTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = 1;
      let windowId = 'showWindowTest1';
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'ohosWindow.createWindow ' + baseWndType + ' wnd: ' + JSON.stringify(tempWnd));
        expect(!!tempWnd).assertTrue();
        await tempWnd.showWindow().then(async (data) => {
          console.info(msgStr + 'Succeeded in showing the window. Data: ' + JSON.stringify(data));
          await tempWnd.destroyWindow();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SHOWWINDOW_JSAPI_002
     * @tc.name Test showWindowTest2
     * @tc.desc show window
     */
    it('showWindowTest2', 0, async function (done) {
      let caseName = 'showWindowTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = 1;
      let windowId = 'showWindowTest2';
      let winsowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };

      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (create_err, create_data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(create_data));
              if (create_err && create_err.code) {
                try {
                  expect().assertFail();
                } catch (err) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
                }
                done();
                reject(null)
              }
              resolve(create_data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }

      let winData;
      winData = await createFirstWindow();
      expect(!!winData).assertTrue();
      winData.showWindow(async (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (err) {
            console.info(msgStr + `ohosWindow.showWindow catch error: ${JSON.stringify(err)}`)
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in showing the window. Data: ' + JSON.stringify(data));
        await winData.destroyWindow();
        done();
      })

    })
    /**
     * @tc.number SUB_WINDOW_MOVEWINDOWTO_JSAPI_001
     * @tc.name Test moveWindowToTest1
     * @tc.desc Set the position of a window.
     */
    it('moveWindowToTest1', 0, async function (done) {
      let caseName = 'moveWindowToTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'moveWindowToTest1';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      try {
        await ohosWindow.createWindow(windowConfig).then(async (wnd) => {
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(wnd));
          expect(wnd != null).assertTrue();
          try {
            await wnd.moveWindowTo(300, 300).then(async () => {
              console.info(msgStr + 'Succeeded in moving the window.');
              await wnd.destroyWindow();
              done();
            }).catch(async (err) => {
              console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              await wnd.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
          ;
        }).catch((err) => {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_MOVEWINDOWTO_JSAPI_002
     * @tc.name Test moveWindowToTest2
     * @tc.desc Set the position of a window.
     */
    it('moveWindowToTest2', 0, async function (done) {
      let caseName = 'moveWindowToTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'moveWindowToTest2';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      try {
        await ohosWindow.createWindow(windowConfig).then(async (wnd) => {
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(wnd));
          expect(wnd != null).assertTrue();
          try {
            await wnd.moveWindowTo(100, 50).then(async () => {
              console.info(msgStr + 'Succeeded in moving the window.');
              await wnd.destroyWindow();
              done();
            }).catch(async (err) => {
              console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              await wnd.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
          ;
        }).catch((err) => {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_MOVEWINDOWTO_JSAPI_003
     * @tc.name Test moveWindowToTest3
     * @tc.desc Set the position of a window.
     */
    it('moveWindowToTest3', 0, async function (done) {
      let caseName = 'moveWindowToTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'moveWindowToTest3';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      try {
        await ohosWindow.createWindow(windowConfig).then(async (wnd) => {
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(wnd));
          expect(wnd != null).assertTrue();
          try {
            await wnd.moveWindowTo(20000, 20000).then(async () => {
              console.info(msgStr + 'Succeeded in moving the window.');
              await wnd.destroyWindow();
              done();
            }).catch(async (err) => {
              console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              await wnd.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
          ;
        }).catch((err) => {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_MOVEWINDOWTO_JSAPI_004
     * @tc.name Test moveWindowToTest4
     * @tc.desc Set the position of a window.
     */
    it('moveWindowToTest4', 0, async function (done) {
      let caseName = 'moveWindowToTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'moveWindowToTest4';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      try {
        await ohosWindow.createWindow(windowConfig).then(async (wnd) => {
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(wnd));
          expect(wnd != null).assertTrue();
          try {
            await wnd.moveWindowTo(-200, -200).then(async () => {
              console.info(msgStr + 'Succeeded in moving the window.');
              await wnd.destroyWindow();
              done();
            }).catch(async (err) => {
              console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              await wnd.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
          ;
        }).catch((err) => {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_MOVEWINDOWTO_JSAPI_005
     * @tc.name Test moveWindowToTest5
     * @tc.desc Set the position of a window.
     */
    it('moveWindowToTest5', 0, async function (done) {
      let caseName = 'moveWindowToTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = 1;
      let windowId = 'moveWindowToTest5';
      let winsowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (create_err, create_data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(create_data));
              if (create_err && create_err.code) {
                try {
                  expect().assertFail();
                } catch (err) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
                }
                done();
                reject(null)
              }
              resolve(create_data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }
      let winData;
      winData = await createFirstWindow();
      expect(!!winData).assertTrue();
      try {
        winData.moveWindowTo(300, 300, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'ohosWindow.moveWindow catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window. Data: ' + JSON.stringify(data));
          await winData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
      };
    })
    /**
     * @tc.number SUB_WINDOW_MOVEWINDOWTO_JSAPI_006
     * @tc.name Test moveWindowToTest6
     * @tc.desc Set the position of a window.
     */
    it('moveWindowToTest6', 0, async function (done) {
      let caseName = 'moveWindowToTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = 1;
      let windowId = 'moveWindowToTest6';
      let winsowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (create_err, create_data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(create_data));
              if (create_err && create_err.code) {
                try {
                  expect().assertFail();
                } catch (err) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
                }
                done();
                reject(null)
              }
              resolve(create_data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }
      let winData;
      winData = await createFirstWindow();
      expect(!!winData).assertTrue();
      try {
        winData.moveWindowTo(100, 50, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window. Data: ' + JSON.stringify(data));
          await winData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
      };
    })
    /**
     * @tc.number SUB_WINDOW_MOVEWINDOWTO_JSAPI_007
     * @tc.name Test moveWindowToTest7
     * @tc.desc Set the position of a window.
     */
    it('moveWindowToTest7', 0, async function (done) {
      let caseName = 'moveWindowToTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = 1;
      let windowId = 'moveWindowToTest7';
      let winsowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (create_err, create_data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(create_data));
              if (create_err && create_err.code) {
                try {
                  expect().assertFail();
                } catch (err) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
                }
                done();
                reject(null)
              }
              resolve(create_data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }
      let winData;
      winData = await createFirstWindow();
      expect(!!winData).assertTrue();
      try {
        winData.moveWindowTo(20000, 20000, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window. Data: ' + JSON.stringify(data));
          await winData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
      };
    })
    /**
     * @tc.number SUB_WINDOW_MOVEWINDOWTO_JSAPI_008
     * @tc.name Test moveWindowToTest8
     * @tc.desc Set the position of a window.
     */
    it('moveWindowToTest8', 0, async function (done) {
      let caseName = 'moveWindowToTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = 1;
      let windowId = 'moveWindowToTest8';
      let winsowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (create_err, create_data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(create_data));
              if (create_err && create_err.code) {
                try {
                  expect().assertFail();
                } catch (err) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
                }
                done();
                reject(null)
              }
              resolve(create_data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }
      let winData;
      winData = await createFirstWindow();
      expect(!!winData).assertTrue();
      try {
        winData.moveWindowTo(-200, -200, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window. Data: ' + JSON.stringify(data));
          await winData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
      };
    })
    /**
     * @tc.number SUB_WINDOW_RESIZE_JSAPI_001
     * @tc.name Test resizeTest1
     * @tc.desc Set the size of a window
     */
    it('resizeTest1', 0, async function (done) {
      let caseName = 'resizeTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'resizeTest1';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
        });
        console.log(msgStr + 'ohosWindow.createWindow ' + baseWndType + ' wnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        try {
          await tempWnd.resize(200, 600).then(async (data) => {
            console.info(msgStr + 'Succeeded in changing the window size. Data:' + JSON.stringify(data));
            await tempWnd.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect().assertFail();
            await tempWnd.destroyWindow();
            done();
          })
        } catch (exception) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_RESIZE_JSAPI_002
     * @tc.name Test resizeTest2
     * @tc.desc Set the size of a window
     */
    it('resizeTest2', 0, async function (done) {
      let caseName = 'resizeTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'resizeTest2';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          unexpectedError(err, caseName, 'ohosWindow.createWindow', done);
        });
        console.log(msgStr + 'ohosWindow.createWindow ' + baseWndType + ' wnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        try {
          await tempWnd.resize(20000, 20000).then(async (data) => {
            console.info(msgStr + 'Succeeded in changing the window size. Data:' + JSON.stringify(data));
            await tempWnd.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect().assertFail();
            await tempWnd.destroyWindow();
            done();
          })
        } catch (exception) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_RESIZE_JSAPI_003
     * @tc.name Test resizeTest3
     * @tc.desc Set the size of a window
     */
    it('resizeTest3', 0, async function (done) {
      let caseName = 'resizeTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'resizeTest3';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          expect().assertFail();
          done();
          return;
        });
        console.log(msgStr + 'ohosWindow.createWindow ' + baseWndType + ' wnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        try {
          await tempWnd.resize(0, 0).then(async (data) => {
            console.info(msgStr + 'Succeeded in changing the window size. Data:' + JSON.stringify(data));
            await tempWnd.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            await tempWnd.destroyWindow();
            done();
          })
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          await tempWnd.destroyWindow();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_RESIZE_JSAPI_004
     * @tc.name Test resizeTest4
     * @tc.desc Set the size of a window
     */
    it('resizeTest4', 0, async function (done) {
      let caseName = 'resizeTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'resizeTest4';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          expect().assertFail();
          done();
          return;
        });
        console.log(msgStr + 'ohosWindow.createWindow ' + baseWndType + ' wnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        try {
          await tempWnd.resize(-1, -1).then(async (data) => {
            console.info(msgStr + 'Succeeded in changing the window size. Data:' + JSON.stringify(data));
            await tempWnd.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            await tempWnd.destroyWindow();
            done();
          })
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          await tempWnd.destroyWindow();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_RESIZE_JSAPI_005
     * @tc.name Test resizeTest5
     * @tc.desc Set the size of a window
     */
    it('resizeTest5', 0, async function (done) {
      let caseName = 'resizeTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'resizeTest5';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          expect().assertFail();
          done();
          return;
        });
        console.log(msgStr + 'ohosWindow.createWindow ' + baseWndType + ' wnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        for(let i=0;i<5;i++){
          console.log(msgStr + 'begin resize current step:' + i)
          await tempWnd.resize(100, 100).catch((err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(6);
            done()
            return;
          })
          console.log(msgStr + 'success resize current step:' + i)
          if(i==4){
            console.log(msgStr + 'finish resize current step:' + i)
            done()
          }
        }
        await tempWnd.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_RESIZE_JSAPI_006
     * @tc.name Test resizeTest6
     * @tc.desc Set the size of a window
     */
    it('resizeTest6', 0, async function (done) {
      let caseName = 'resizeTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = 1;
      let windowId = 'resizeTest6';
      let winsowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (create_err, create_data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(create_data));
              if (create_err && create_err.code) {
                try {
                  expect().assertFail();
                } catch (err) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
                }
                done();
                reject(null)
              }
              resolve(create_data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }

      let winData;
      winData = await createFirstWindow();
      expect(!!winData).assertTrue();
      try {
        winData.resize(200, 200, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await winData.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(exception));
      };
    })
    /**
     * @tc.number SUB_WINDOW_RESIZE_JSAPI_007
     * @tc.name Test resizeTest7
     * @tc.desc Set the size of a window
     */
    it('resizeTest7', 0, async function (done) {
      let caseName = 'resizeTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = 1;
      let windowId = 'resizeTest7';
      let winsowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (create_err, create_data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(create_data));
              if (create_err && create_err.code) {
                try {
                  expect().assertFail();
                } catch (err) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
                }
                done();
                reject(null)
              }
              resolve(create_data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }
      function resizeFun(width, height,i){
        console.log(msgStr + 'resize begin step:'+i)
        return new Promise((resolve,reject)=>{
          try {
            winData.resize(width, height, async (err) => {
              if (err.code) {
                console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
                try {
                  expect().assertFail();
                } catch (err) {
                  console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
                }
                done();
                reject(null)
              }
              console.info(msgStr + 'Succeeded in changing the window size. step:'+i);
              resolve(true)
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(exception));
          };
        })
      }
      let winData;
      winData = await createFirstWindow();
      expect(!!winData).assertTrue();
      let width = 100;
      let height = 100;
      for(let i=1;i<5;i++){
        width = width * i;
        height = height * i;
        await resizeFun(width, height,i);
        if(i==4){
          console.log(msgStr + 'resize finished step:'+i)
          await winData.destroyWindow();
          done()
        }
      }
    })
    /**
     * @tc.number SUB_WINDOW_DESTROYWINDOW_JSAPI_001
     * @tc.name Test destroyWindowTest1
     * @tc.desc Verification window destruction scenario.
     */
    it('destroyWindowTest1', 0, async function (done) {
      let caseName = 'destroyWindowTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
      let windowId = 'destroyWindowTest1';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          expect().assertFail();
          done();
          return;
        });
        console.log(msgStr + 'ohosWindow.createWindow ' + baseWndType + ' wnd: ' + JSON.stringify(tempWnd));
        expect(!!tempWnd).assertTrue();
        await tempWnd.destroyWindow().then(() => {
          console.info(msgStr + 'Succeeded in destroying the window.');
          try {
            let findWnd = ohosWindow.findWindow(windowId)
            expect(!findWnd).assertTrue();
            done();
          } catch (exception) {
            console.error(msgStr + 'try catch Failed to find the Window. Cause: ' + JSON.stringify(exception));
            expect(exception.code === 1300002).assertTrue();
            done();
          }
          ;
        }).catch((err) => {
          console.error(msgStr + 'try catch Failed to destroy the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_DESTROYWINDOW_JSAPI_002
     * @tc.name Test destroyWindowTest2
     * @tc.desc Verification window destruction scenario
     */
    it('destroyWindowTest2', 0, async function (done) {
      let caseName = 'destroyWindowTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'destroyWindowTest2';
      console.log(msgStr + 'begin');
      let winsowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      function createFirstWindow() {
        return new Promise((resolve, reject) => {
          try {
            ohosWindow.createWindow(winsowConfig, (create_err, create_data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(create_data));
              if (create_err && create_err.code) {
                try {
                  expect().assertFail();
                } catch (err) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
                }
                done();
                reject(null)
              }
              resolve(create_data)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }

      let winData;
      winData = await createFirstWindow();
      expect(!!winData).assertTrue();
      winData.destroyWindow((err) => {
        if (err.code != 0) {
          console.log('windowTest DestroyTest2 create callback fail' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (err) {
            console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
          }
        } else {
          try {
            let findWnd = ohosWindow.findWindow(windowId)
            expect(!findWnd).assertTrue();
          } catch (exception) {
            console.error(msgStr + 'try catch Failed to find the Window. Cause: ' + JSON.stringify(exception));
            expect(exception.code === 1300002).assertTrue();
          }
          ;
        }
        done();
      })
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWSYSTEMBARENABLE_JSAPI_001
     * @tc.name Test setWindowSystemBarEnableTest1
     * @tc.desc Set the visible mode of navigation bar and status bar
     */
    it('setWindowSystemBarEnableTest1', 0, async function (done) {
      let caseName = 'setWindowSystemBarEnableTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = await ohosWindow.getLastWindow(context).catch((err) => {
          console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        })
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable([]).then(() => {
            console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            expect(TRUE_FLAG).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWSYSTEMBARENABLE_JSAPI_002
     * @tc.name Test setWindowSystemBarEnableTest2
     * @tc.desc Set the visible mode of navigation bar and status bar
     */
    it('setWindowSystemBarEnableTest2', 0, async function (done) {
      let caseName = 'setWindowSystemBarEnableTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = await ohosWindow.getLastWindow(context).catch((err) => {
          console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        })
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable(['status', 'navigation']).then(() => {
            console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            expect(TRUE_FLAG).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWSYSTEMBARENABLE_JSAPI_003
     * @tc.name Test setWindowSystemBarEnableTest3
     * @tc.desc Set the visible mode of navigation bar and status bar
     */
    it('setWindowSystemBarEnableTest3', 0, async function (done) {
      let caseName = 'setWindowSystemBarEnableTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = await ohosWindow.getLastWindow(context).catch((err) => {
          console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        })
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable(['status']).then(() => {
            console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            expect(TRUE_FLAG).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWSYSTEMBARENABLE_JSAPI_004
     * @tc.name Test setWindowSystemBarEnableTest4
     * @tc.desc Set the visible mode of navigation bar and status bar
     */
    it('setWindowSystemBarEnableTest4', 0, async function (done) {
      let caseName = 'setWindowSystemBarEnableTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = await ohosWindow.getLastWindow(context).catch((err) => {
          console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        })
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable(['navigation']).then(() => {
            console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            expect(TRUE_FLAG).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWSYSTEMBARENABLE_JSAPI_005
     * @tc.name Test setWindowSystemBarEnableTest5
     * @tc.desc Set the visible mode of navigation bar and status bar
     */
    it('setWindowSystemBarEnableTest5', 0, async function (done) {
      let caseName = 'setWindowSystemBarEnableTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let wnd = null;
      try {
        wnd = await ohosWindow.getLastWindow(context).catch((err) => {
          console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        })
        expect(wnd != null).assertTrue();
        try {
          wnd.setWindowSystemBarEnable(['status', 'navigation'], (err) => {
            console.log(msgStr + 'windowTest SetLayoutFullScreenTest2 wnd.setFullScreen(true) callback begin');
            if (err.code != 0) {
              console.log(msgStr + 'windowTest SetLayoutFullScreenTest2 wnd.setFullScreen callback fail' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (err) {
                console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
              }
              done();
              return;
            }
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (err) {
              console.log(msgStr + 'assertTrue catch' + JSON.stringify(err));
            }
            done();
          })
        } catch (exception) {
          console.error(msgStr + ' try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to get the last window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWSYSTEMBARENABLE_JSAPI_006
     * @tc.name Test setWindowSystemBarEnableTest6
     * @tc.desc Set the visible mode of navigation bar and status bar
     */
    it('setWindowSystemBarEnableTest6', 0, async function (done) {
      let caseName = 'setWindowSystemBarEnableTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let wnd = null;
      try {
        wnd = await ohosWindow.getLastWindow(context).catch((err) => {
          console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        })
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable([], (err) => {
            console.log(msgStr + 'windowTest SetLayoutFullScreenTest2 wnd.setFullScreen(true) callback begin');
            if (err.code != 0) {
              console.log(msgStr + 'windowTest SetLayoutFullScreenTest2 wnd.setFullScreen callback fail' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (err) {
                console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
              }
              done();
              return;
            }
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (err) {
              console.log(msgStr + 'assertTrue catch' + JSON.stringify(err));
            }
            done();
          })
        } catch (exception) {
          console.error(msgStr + ' try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to get the last window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_CREATEWINDOW_JSAPI_003
     * @tc.name Test createWindowTest3
     * @tc.desc Verify the scenario of creating a window of a type that does not exist
     */
    it('createWindowTest3', 0, async function (done) {
      let caseName = 'createWindowTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType = 5000;
      let windId = 'nonExistWindowType';
      console.log(msgStr + 'ohosWindow.createWindow ' + tempType + ' start');
      let windowConfig = {
        name: windId, windowType: tempType, ctx: context
      };
      let nonExistWnd = null;
      try {
        nonExistWnd = await ohosWindow.createWindow(windowConfig).then((data) => {
          console.log(msgStr + 'ohosWindow.createWindow success: ' + JSON.stringify(nonExistWnd));
          done();
        }).catch((err) => {
          console.log(msgStr + 'ohosWindow.createWindow err: ' + JSON.stringify(err));
          expect(err.code === 401).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect(exception.code === 401).assertTrue();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_CREATEWINDOW_JSAPI_007
     * @tc.name Test createWindowTest7
     * @tc.desc Verify the scenario of creating a window of a type that does not exist
     */
    it('createWindowTest7', 0, done => {
      let caseName = 'createWindowTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType = 5000;
      let windId = 'createTest7';
      console.log(msgStr + 'ohosWindow.createWindow ' + tempType + ' start');
      let winsowConfig = {
        name: windId, windowType: tempType, ctx: context
      };
      try {
        ohosWindow.createWindow(winsowConfig, (err, data) => {
          if (err && err.code) {
            console.log(msgStr + 'ohosWindow.createWindow  err' + JSON.stringify(err));
            try {
              expect(err.code === 401).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.createWindow catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect(exception.code === 401).assertTrue();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWLAYOUTFULLSCREEN_JSAPI_001
     * @tc.name Test setWindowLayoutFullScreenTest1
     * @tc.desc set the property of the window can layout in full screen
     */
    it('setWindowLayoutFullScreenTest1', 0, async function (done) {
      let caseName = 'setWindowLayoutFullScreenTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = windowStage.getMainWindowSync();
        console.log(msgStr + 'ohosWindow.getLastWindow ' + JSON.stringify(wnd));
        expect(wnd != null).assertTrue();
        try {
          let isLayoutFullScreen = true;
          await wnd.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
            console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
            try {
              let propData = wnd.getWindowProperties()
              console.info(msgStr + 'wnd.getWindowProperties propData: ' + JSON.stringify(propData));
              expect(propData.isLayoutFullScreen).assertTrue();
              done();
            } catch (exception) {
              console.error(msgStr + 'try catch Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
              expect().assertFail();
              done();
            }
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWLAYOUTFULLSCREEN_JSAPI_002
     * @tc.name Test setWindowLayoutFullScreenTest2
     * @tc.desc set the property of the window can layout in full screen
     */
    it('setWindowLayoutFullScreenTest2', 0, async function (done) {
      let caseName = 'setWindowLayoutFullScreenTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = windowStage.getMainWindowSync();
        expect(wnd != null).assertTrue();
        try {
          let isLayoutFullScreen = false;
         await wnd.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
            console.info(msgStr + 'Succeeded in setting the window not layout to full-screen mode.');
            try {
              let propData = wnd.getWindowProperties()
              console.info(msgStr + 'wnd.getWindowProperties propData: ' + JSON.stringify(propData));
              expect(!propData.isLayoutFullScreen).assertTrue();
              done();
            } catch (exception) {
              console.error(msgStr + 'try catch Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
              expect().assertFail();
              done();
            }
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWLAYOUTFULLSCREEN_JSAPI_003
     * @tc.name Test setWindowLayoutFullScreenTest3
     * @tc.desc set the property of the window can layout in full screen
     */
    it('setWindowLayoutFullScreenTest3', 0, async function (done) {
      let caseName = 'setWindowLayoutFullScreenTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = windowStage.getMainWindowSync();
        expect(wnd != null).assertTrue();
        let isLayoutFullScreen = true;
        try {
          wnd.setWindowLayoutFullScreen(isLayoutFullScreen, (err) => {
            if (err.code) {
              console.error(msgStr + 'err Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`ohosWindow.createWindow catch error: ${JSON.stringify(error)}`)
              }
              done();
              return;
            }
            console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
            try {
              let propData = wnd.getWindowProperties()
              console.log(msgStr + JSON.stringify(propData));
              expect(propData.isLayoutFullScreen).assertTrue();
              done();
            } catch (exception) {
              console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
              expect().assertFail();
              done();
            }
            ;
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'Failed to get the main window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWLAYOUTFULLSCREEN_JSAPI_004
     * @tc.name Test setWindowLayoutFullScreenTest4
     * @tc.desc set the property of the window can layout in full screen
     */
    it('setWindowLayoutFullScreenTest4', 0, async function (done) {
      let caseName = 'setWindowLayoutFullScreenTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = windowStage.getMainWindowSync();
        expect(wnd != null).assertTrue();
        let isLayoutFullScreen = false;
        try {
          wnd.setWindowLayoutFullScreen(isLayoutFullScreen, (err) => {
            if (err.code) {
              console.error(msgStr + 'err Failed to set the window not layout to full-screen mode. Cause:' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`ohosWindow.createWindow catch error: ${JSON.stringify(error)}`)
              }
              done();
              return;
            }
            console.info(msgStr + 'Succeeded in setting the window not layout to full-screen mode.');
            try {
              let propData = wnd.getWindowProperties()
              console.log(msgStr + JSON.stringify(propData));
              expect(!propData.isLayoutFullScreen).assertTrue();
              done();
            } catch (exception) {
              console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
              expect().assertFail();
              done();
            }
            ;
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
        ;
      } catch (exception) {
        console.error(msgStr + 'Failed to create the main window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWMODE_JSAPI_001
     * @tc.name Test setWindowModeTest1
     * @tc.desc Test window.setWindowMode API function test.
     */
    it('setWindowModeTest1', 0, async function (done) {
      let windowModeArr = ['FULLSCREEN', 'PRIMARY', 'SECONDARY', 'FLOATING','FULLSCREEN']
      let caseName = 'setWindowModeTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let sumCount = 0
      let baseWndType = 1;
      let windowId = 'setWindowModeTest1';
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd;
      try {
       tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          console.info(msgStr + 'fail createWindow. Data: ' + JSON.stringify(err));
        })
        expect(!!tempWnd).assertTrue();
        console.log(msgStr + 'ohosWindow.windowType' + JSON.stringify(windowModeArr))
        for(let i=0;i<windowModeArr.length;i++){
          let tempType = ohosWindow.WindowMode[windowModeArr[i]];
          console.log(msgStr + 'tempWnd.setWindowMode ' + tempType + ' start current step:' + i);
          try {
            await tempWnd.setWindowMode(tempType).then(() => {
              console.info(msgStr + 'Succeeded in setting the window mode. current tempType:' + tempType);
              console.info(msgStr + 'Succeeded in setting the window mode. current step:' + i);
              if(i == windowModeArr.length-1){
                console.info(msgStr + 'finished in setting the window mode. current step:' + i);
                done()
              }
            }).catch((err) => {
              console.log(msgStr + 'currentType: ' + tempType)
              console.error(msgStr + 'Failed to set the window mode. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'try catch Failed to set the window mode. Cause: ' + JSON.stringify(exception));
          }
          ;
        }
        await tempWnd.destroyWindow()
      } catch (exception) {
        console.error('try catch Failed to obtain the getMainWindowSync. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWMODE_JSAPI_002
     * @tc.name Test setWindowModeTest2
     * @tc.desc Verify the scenario where the normal window mode is set
     */
    it('setWindowModeTest2', 0, async function (done) {
      let windowModeArr = ['FULLSCREEN', 'PRIMARY', 'SECONDARY', 'FLOATING','FULLSCREEN']
      let caseName = 'setWindowModeTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let sumCount = 0
      let baseWndType = 1;
      let windowId = 'setWindowModeTest2';
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let wnd;
      try {
        wnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          console.info(msgStr + 'fail createWindow. Data: ' + JSON.stringify(err));
        })
        expect(!!wnd).assertTrue();

        function setWindowModeFun(tempType,i){
          console.log(msgStr + 'tempWnd.setWindowMode tempType:' + tempType + ' begin i:' + i);
          return new Promise((resolve,reject)=>{
            try {
              wnd.setWindowMode(tempType, (err, data) => {
                if (err && err.code) {
                  console.log(msgStr + 'currentType: ' + tempType)
                  console.error(msgStr + 'Failed to set the window mode. Cause: ' + JSON.stringify(err));
                  try {
                    expect().assertFail();
                  } catch (err) {
                    console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
                  }
                  done();
                  reject(false)
                }
                resolve(true)
                console.log(msgStr + 'tempWnd.setWindowMode tempType:' + tempType + ' successed i:' + i);
              })
            } catch (exception) {
              console.error(msgStr + 'try catch Failed to set the window mode. Cause: ' + JSON.stringify(exception));
            }
          })
        }
        for(let i=0;i<windowModeArr.length;i++){
          let tempType = ohosWindow.WindowMode[windowModeArr[i]];
          await setWindowModeFun(tempType,i);
          if(i==windowModeArr.length-1){
            console.log(msgStr + 'tempWnd.setWindowMode tempType:' + tempType + ' finished i:' + i);
            await wnd.destroyWindow()
            done()
          }
        }
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to create the window. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWMODE_JSAPI_003
     * @tc.name Test setWindowModeTest3
     * @tc.desc Test window.setWindowMode API function test.
     */
    it('setWindowModeTest3', 0, async function (done) {
      let caseName = 'setWindowModeTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'setWindowModeTest3';
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          console.info(msgStr + 'fail createWindow. Data: ' + JSON.stringify(err));
        })
        expect(!!tempWnd).assertTrue();
        await tempWnd.setWindowMode(ohosWindow.WindowMode.UNDEFINED).catch(async (err) => {
          console.error(msgStr + 'Failed to set the window mode. Cause: ' + JSON.stringify(err));
          expect(err.code == 401).assertTrue();
          await tempWnd.destroyWindow()
          console.log(msgStr + 'tempWnd.setWindowMode failed ' + 'finished');
          done();
        });
      } catch (exception) {
        console.error('try catch Failed to obtain the getMainWindowSync. Cause: ' + JSON.stringify(exception));
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWMODE_JSAPI_004
     * @tc.name Test setWindowModeTest4
     * @tc.desc Verify the scenario where the normal window mode is set
     */
    it('setWindowModeTest4', 0, async function (done) {
      let caseName = 'setWindowModeTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'setWindowModeTest4';
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let wnd;
      try {
        wnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          console.info(msgStr + 'fail createWindow. Data: ' + JSON.stringify(err));
        })
        expect(!!wnd).assertTrue();
        let tempType =ohosWindow.WindowMode.UNDEFINED;
        try {
          wnd.setWindowMode(tempType, async (err, data) => {
            if (err && err.code) {
              console.log(msgStr + 'currentType: ' + tempType)
              console.error(msgStr + 'Failed to set the window mode. Cause: ' + JSON.stringify(err));
              try {
                expect(err.code == 401).assertTrue();
              } catch (error) {
                console.info(`ohosWindow.createWindow catch error: ${JSON.stringify(error)}`)
              }
              await wnd.destroyWindow()
              done();
            } else {
              console.info(msgStr + 'Succeeded in setting the window mode');
            }
          })
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the window mode. Cause: ' + JSON.stringify(exception));
        };
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to create the window. Cause: ' + JSON.stringify(exception));
      };
    })

    /**
     * @tc.number SUB_WMS_ENUM_WINDOWSTAGEEVENTTYPERENAME_JSAPI_001
     * @tc.name Test enumWindowStageEventTypeReName_Test_001.
     * @tc.desc To test the enum value of WindowStageEventType.
     */
    it('enumWindowStageEventTypeReName_Test_001', 0, async function (done) {
      console.info('test the enum value of WindowStageEventType begin');
      try {
        expect(1).assertEqual(ohosWindow.WindowStageEventType.SHOWN);
        expect(2).assertEqual(ohosWindow.WindowStageEventType.ACTIVE);
        expect(3).assertEqual(ohosWindow.WindowStageEventType.INACTIVE);
        expect(4).assertEqual(ohosWindow.WindowStageEventType.HIDDEN);
        done();
      } catch (err) {
        console.info('test enum value of windowStageEventType error ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}
