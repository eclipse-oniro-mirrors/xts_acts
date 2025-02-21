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
import displaySync from '@ohos.graphics.displaySync'

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
      'TYPE_FLOAT': 8,
    }
    var windowLayoutModeArr = [];
    var windowLayoutModeDic = {
      'WINDOW_LAYOUT_MODE_TILE': 1,
      'WINDOW_LAYOUT_MODE_CASCADE': 0
    };
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0450
     * @tc.name      : tesGetAllDisplays_Promise
     * @tc.desc      : Gets all current display objects
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('tesGetAllDisplays_Promise', 0, async function (done) {
      let caseName = 'tesGetAllDisplays_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0440
     * @tc.name      : tesGetAllDisplays_Callback
     * @tc.desc      : Gets all current display objects
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('tesGetAllDisplays_Callback', 0, async function (done) {
      let caseName = 'tesGetAllDisplays_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0090
     * @tc.name      : testCreateWindow_Diff_Type_Wins_Promise
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateWindow_Diff_Type_Wins_Promise', 0, async function (done) {
      let caseName = 'testCreateWindow_Diff_Type_Wins_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0150
     * @tc.name      : testCreateWindow_Same_Name_Wins_Promise
     * @tc.desc      : Verify the scenario of creating a window with duplicate IDs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateWindow_Same_Name_Wins_Promise', 0, async function (done) {
      let caseName = 'testCreateWindow_Same_Name_Wins_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'createWindowSameidsTest2'
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
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
            expect(errSencond.code).assertEqual(1300001)
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0130
     * @tc.name      : testCreateWindow_Not_Exist_WinType_Promise
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateWindow_Not_Exist_WinType_Promise', 0, async function (done) {
      sleep(1000)
      let caseName = 'testCreateWindow_Not_Exist_WinType_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let tempType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0160
     * @tc.name      : testCreateWindow_Type_Float_Win_Callback
     * @tc.desc      : Verify the scenario of creating the system type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateWindow_Type_Float_Win_Callback', 0, done => {
      let caseName = 'testCreateWindow_Type_Float_Win_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log('jsunittest loopCount: ' + loopCount);
      let tempType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0140
     * @tc.name      : testCreateWindow_Same_Name_Wins_Callback
     * @tc.desc      : Verify the scenario of creating a window with duplicate IDs
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateWindow_Same_Name_Wins_Callback', 0, async function (done) {
      let caseName = 'testCreateWindow_Same_Name_Wins_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'createWindowSameidTest6'
      let winsowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
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
              expect(err.code).assertEqual(1300001)
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0660
     * @tc.name      : testGetWindowAvoidArea_Type_System
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidArea_Type_System', 0, async function (done) {
      let caseName = 'testGetWindowAvoidArea_Type_System';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0640
     * @tc.name      : testGetWindowAvoidArea_Type_CutOut
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidArea_Type_CutOut', 0, async function (done) {
      let caseName = 'testGetWindowAvoidArea_Type_CutOut';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0670
     * @tc.name      : testGetWindowAvoidArea_Type_System_Gesture
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidArea_Type_System_Gesture', 0, async function (done) {
      let caseName = 'testGetWindowAvoidArea_Type_System_Gesture';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0650
     * @tc.name      : testGetWindowAvoidArea_Type_Keyboard
     * @tc.desc      : Obtain the area that the window content avoids
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowAvoidArea_Type_Keyboard', 0, async function (done) {
      let caseName = 'testGetWindowAvoidArea_Type_Keyboard';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0690
     * @tc.name      : testGetWindowPropertiesTest
     * @tc.desc      : Gets the properties of the current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowPropertiesTest', 0, async function (done) {
      let caseName = 'testGetWindowPropertiesTest';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0520
     * @tc.name      : testGetLastWindow_Promise
     * @tc.desc      : Get the final show window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetLastWindow_Promise', 0, async function (done) {
      let caseName = 'testGetLastWindow_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0510
     * @tc.name      : testGetLastWindow_Callback
     * @tc.desc      : Get the final show window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetLastWindow_Callback', 0, async function (done) {
      let caseName = 'testGetLastWindow_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2120
     * @tc.name      : testShowWindowTest_Callback_Form
     * @tc.desc      : show window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShowWindowTest_Callback_Form', 0, async function (done) {
      let caseName = 'testShowWindowTest_Callback_Form';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testShowWindowTest_Callback_Form';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2110
     * @tc.name      : testShowWindowTest_Promise_Form
     * @tc.desc      : show window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShowWindowTest_Promise_Form', 0, async function (done) {
      let caseName = 'testShowWindowTest_Promise_Form';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testShowWindowTest_Promise_Form';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0980
     * @tc.name      : testMoveWindowTo_X_Val300_Y_Val300_Promise
     * @tc.desc      : Set the position of a window.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowTo_X_Val300_Y_Val300_Promise', 0, async function (done) {
      let caseName = 'testMoveWindowTo_X_Val300_Y_Val300_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testMoveWindowTo_X_Val300_Y_Val300_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0940
     * @tc.name      : testMoveWindowTo_X_Val100_Y_Val50_Promise
     * @tc.desc      : Set the position of a window.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowTo_X_Val100_Y_Val50_Promise', 0, async function (done) {
      let caseName = 'testMoveWindowTo_X_Val100_Y_Val50_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testMoveWindowTo_X_Val100_Y_Val50_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0960
     * @tc.name      : testMoveWindowTo_X_Val20000_Y_Val20000_Promise
     * @tc.desc      : Set the position of a window.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowTo_X_Val20000_Y_Val20000_Promise', 0, async function (done) {
      let caseName = 'testMoveWindowTo_X_Val20000_Y_Val20000_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testMoveWindowTo_X_Val20000_Y_Val20000_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0920
     * @tc.name      : testMoveWindowTo_XYVal_Is_Negative_Num_Promise
     * @tc.desc      : Set the position of a window.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowTo_XYVal_Is_Negative_Num_Promise', 0, async function (done) {
      let caseName = 'testMoveWindowTo_XYVal_Is_Negative_Num_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testMoveWindowTo_XYVal_Is_Negative_Num_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0970
     * @tc.name      : testMoveWindowTo_X_Val300_Y_Va300_Callback
     * @tc.desc      : Set the position of a window.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowTo_X_Val300_Y_Va300_Callback', 0, async function (done) {
      let caseName = 'testMoveWindowTo_X_Val300_Y_Va300_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testMoveWindowTo_X_Val300_Y_Va300_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0930
     * @tc.name      : testMoveWindowTo_X_Val100_Y_Va50_Callback
     * @tc.desc      : Set the position of a window.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowTo_X_Val100_Y_Va50_Callback', 0, async function (done) {
      let caseName = 'testMoveWindowTo_X_Val100_Y_Va50_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testMoveWindowTo_X_Val100_Y_Va50_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0950
     * @tc.name      : testMoveWindowTo_X_Val20000_Y_Val20000_Callback
     * @tc.desc      : Set the position of a window.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowTo_X_Val20000_Y_Val20000_Callback', 0, async function (done) {
      let caseName = 'testMoveWindowTo_X_Val20000_Y_Val20000_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0910
     * @tc.name      : testMoveWindowTo_XYVal_Is_Negative_Num_Callback
     * @tc.desc      : Set the position of a window.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMoveWindowTo_XYVal_Is_Negative_Num_Callback', 0, async function (done) {
      let caseName = 'testMoveWindowTo_XYVal_Is_Negative_Num_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testMoveWindowTo_XYVal_Is_Negative_Num_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1060
     * @tc.name      : testResize_X_Val200_Y_Val600_Promise
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResize_X_Val200_Y_Val600_Promise', 0, async function (done) {
      let caseName = 'testResize_X_Val200_Y_Val600_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testResize_X_Val200_Y_Val600_Promise';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          console.error(msgStr + 'Failed to createWindow the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1040
     * @tc.name      : testResize_X_Val20000_Y_Val20000_Promise
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResize_X_Val20000_Y_Val20000_Promise', 0, async function (done) {
      let caseName = 'testResize_X_Val20000_Y_Val20000_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testResize_X_Val20000_Y_Val20000_Promise';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: windowId, windowType: baseWndType, ctx: context
      };
      let tempWnd = null;
      try {
        tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
          console.error(msgStr + 'Failed to createWindow the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1020
     * @tc.name      : testResize_XY_Value_Is_Zero_Promise
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResize_XY_Value_Is_Zero_Promise', 0, async function (done) {
      let caseName = 'testResize_XY_Value_Is_Zero_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
      let windowId = 'testResize_XY_Value_Is_Zero_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1010
     * @tc.name      : testResize_XY_Value_Is_Negative_Num_Promise
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResize_XY_Value_Is_Negative_Num_Promise', 0, async function (done) {
      let caseName = 'testResize_XY_Value_Is_Negative_Num_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1030
     * @tc.name      : testResize_X_Val100_Y_Val100_Multi_Set_Promise
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResize_X_Val100_Y_Val100_Multi_Set_Promise', 0, async function (done) {
      let caseName = 'testResize_X_Val100_Y_Val100_Multi_Set_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1050
     * @tc.name      : testResize_X_Val200_Y_Val200_Callback
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResize_X_Val200_Y_Val200_Callback', 0, async function (done) {
      let caseName = 'testResize_X_Val200_Y_Val200_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1000
     * @tc.name      : testResize_Set_Diff_XY_In_Turn
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResize_Set_Diff_XY_In_Turn', 0, async function (done) {
      let caseName = 'testResize_Set_Diff_XY_In_Turn';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0290
     * @tc.name      : testDestroyWindow_Promise
     * @tc.desc      : Verification window destruction scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDestroyWindow_Promise', 0, async function (done) {
      let caseName = 'testDestroyWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0270
     * @tc.name      : testDestroyWindow_Callback
     * @tc.desc      : Verification window destruction scenario
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDestroyWindow_Callback', 0, async function (done) {
      let caseName = 'testDestroyWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = ohosWindow.WindowType.TYPE_FLOAT;
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1910
     * @tc.name      : testSetWindowSystemBarEnable_Empty_Promise
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnable_Empty_Promise', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnable_Empty_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1920
     * @tc.name      : testSetWindowSystemBarEnable_StatusAndNavigation_Promise
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnable_StatusAndNavigation_Promise', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnable_StatusAndNavigation_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1930
     * @tc.name      : testSetWindowSystemBarEnable_Status_Promise
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnable_Status_Promise', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnable_Status_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1940
     * @tc.name      : testSetWindowSystemBarEnable_Navigation_Promise
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnable_Navigation_Promise', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnable_Navigation_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1950
     * @tc.name      : testSetWindowSystemBarEnable_StatusAndNavigation_Callback
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnable_StatusAndNavigation_Callback', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnable_StatusAndNavigation_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1960
     * @tc.name      : testSetWindowSystemBarEnable_Empty_Callback
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowSystemBarEnable_Empty_Callback', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnable_Empty_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0130
     * @tc.name      : testCreateWindow_Not_Exist_WinType_Promise
     * @tc.desc      : Verify the scenario of creating a window of a type that does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateWindow_Not_Exist_WinType_Promise', 0, async function (done) {
      let caseName = 'testCreateWindow_Not_Exist_WinType_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0120
     * @tc.name      : testCreateWindow_Not_Exist_WinType_Callback
     * @tc.desc      : Verify the scenario of creating a window of a type that does not exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testCreateWindow_Not_Exist_WinType_Callback', 0, done => {
      let caseName = 'testCreateWindow_Not_Exist_WinType_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1770
     * @tc.name      : testSetWindowLayoutFullScreen_True_Promise
     * @tc.desc      : set the property of the window can layout in full screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLayoutFullScreen_True_Promise', 0, async function (done) {
      let caseName = 'testSetWindowLayoutFullScreen_True_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1780
     * @tc.name      : testSetWindowLayoutFullScreen_False_Promise
     * @tc.desc      : set the property of the window can layout in full screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLayoutFullScreen_False_Promise', 0, async function (done) {
      let caseName = 'testSetWindowLayoutFullScreen_False_Promise';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1790
     * @tc.name      : testSetWindowLayoutFullScreen_True_Callback
     * @tc.desc      : set the property of the window can layout in full screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLayoutFullScreen_True_Callback', 0, async function (done) {
      let caseName = 'testSetWindowLayoutFullScreen_True_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1800
     * @tc.name      : testSetWindowLayoutFullScreen_False_Callback
     * @tc.desc      : set the property of the window can layout in full screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLayoutFullScreen_False_Callback', 0, async function (done) {
      let caseName = 'testSetWindowLayoutFullScreen_False_Callback';
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2300
     * @tc.name      : testEnumWindowStageEventTypeReName_Test_001.
     * @tc.desc      : To test the enum value of WindowStageEventType.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testEnumWindowStageEventTypeReName_Test_001', 0, async function (done) {
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
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1810
     * @tc.name      : testSetExpectedFrameRateRange
     * @tc.desc      : test the enum value of hdrFormats
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetExpectedFrameRateRange',0, async function (done){
        let msg = "testSetExpectedFrameRateRange"
        let backDisplaySyncBigger = displaySync.create()
        console.log(msg + ' www data '  + backDisplaySyncBigger)
        try {
          let range : ExpectedFrameRateRange = {
            expected: 10,
            min:0,
            max:120
          };
          console.log(msg + ' www data '  + range)
          backDisplaySyncBigger.setExpectedFrameRateRange(range)
          expect(true).assertTrue()
          done()
        } catch (error) {
          console.log(msg + ' www data Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code) {
            expect().assertFail()
          } else {
            expect(true).assertTrue()
          }
          done()
      }
    })
     /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1820
     * @tc.name      : testTargetTimestamp
     * @tc.desc      : test the enum value of IntervalInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testTargetTimestamp',0, async function (done){
        let msg = "testTargetTimestamp"
        let backDisplaySyncBigger = displaySync.create()
        console.log(msg + ' www data ' + backDisplaySyncBigger)
        try {
            let bigger = (frameInfo) => {
                let a = frameInfo.targetTimestamp
                console.log(msg + ' www data' + JSON.stringify(a))
            }
            expect(true).assertTrue()
            done()
        } catch (error) {
            console.log(msg + ' www data Failed to Cause: ' + JSON.stringify(error));
            if (error.code) {
                expect().assertFail()
            } else {
                expect(true).assertTrue()
            }
            done()
        }
    })
  })
}
