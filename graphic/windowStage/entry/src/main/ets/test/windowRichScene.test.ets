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
  describe('window_richScene_test', function () {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0110
     * @tc.name      : testCreateWindow_Invalid_WinType_Promise
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCreateWindow_Invalid_WinType_Promise', 0, async function (done) {
      let caseName = 'testCreateWindow_Invalid_WinType_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'createWindow_Test_001'
      let windowConfig = {
        name: windowId, windowType: 8888, ctx: context
      };
      try {
        await ohosWindow.createWindow(windowConfig).then((data) => {
          console.log(msgStr + 'Window createWindow data: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.log(msgStr + 'Window createWindow catch err: ' + JSON.stringify(err))
        expect(err.code).assertEqual(401)
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name      : testCreateWindow_Invalid_WinType_Callback
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCreateWindow_Invalid_WinType_Callback', 0, async function (done) {
      let caseName = 'testCreateWindow_Invalid_WinType_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'createWindow_Test_002'
      let windowConfig = {
        name: windowId, windowType: 8888, ctx: context
      };
      try {
        await ohosWindow.createWindow(windowConfig, (err, data) => {
          if (err.code) {
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
        });
      } catch (err) {
        console.log(msgStr + 'Window createWindow catch err: ' + JSON.stringify(err))
        expect(err.code).assertEqual(401)
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0410
     * @tc.name      : testFindWindow_WinName_Is_Exist
     * @tc.desc      : Find the window corresponding to name
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testFindWindow_WinName_Is_Exist', 0, async function (done) {
      let caseName = 'testFindWindow_WinName_Is_Exist';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'findWindow_Test_001'
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let win;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!win).assertTrue();
      try {
        let windowClass = ohosWindow.findWindow('findWindow_Test_001');
        console.log(msgStr + 'findWindow windowClass: ' + JSON.stringify(windowClass))
        expect(!!windowClass).assertTrue();
        await win.destroyWindow()
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0400
     * @tc.name      : testFindWindow_WinName_IsNot_Exist
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testFindWindow_WinName_IsNot_Exist', 0, async function (done) {
      let caseName = 'testFindWindow_WinName_IsNot_Exist';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowClass;
        windowClass = ohosWindow.findWindow('findWindow_Test_002');
        expect(!windowClass).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
     * @tc.name      : testCreate_Invalid_WinType_Promise
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCreate_Invalid_WinType_Promise', 0, async function (done) {
      let caseName = 'testCreate_Invalid_WinType_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      ohosWindow.create(context, 'create_Test_001', 888).catch((err) => {
        console.error(msgStr + 'Failed to create the subWindow. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1003);
        done();
      });

    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0190
     * @tc.name      : testCreate_Invalid_WinType_Callback
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCreate_Invalid_WinType_Callback', 0, async function (done) {
      let caseName = 'testCreate_Invalid_WinType_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      ohosWindow.create(context, 'create_Test_002', 888, (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to create the subWindow. Cause: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(1003);
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in creating the subWindow. Data: ' + JSON.stringify(data));
        try {
          expect().assertFail();
        } catch (error) {
          console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
        }
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0420
     * @tc.name      : testFind_Invoke_Interface_Continuously
     * @tc.desc      : Find the window corresponding to name
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testFind_Invoke_Interface_Continuously', 0, async function (done) {
      let caseName = 'testFind_Invoke_Interface_Continuously';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'find_Test_001'
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let win;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!win).assertTrue();
      try {
        let windowClass;
        windowClass = await ohosWindow.find('find_Test_001').catch((err) => {
          console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        expect(!!windowClass).assertTrue();
        let windowClass2;
        windowClass2 = await ohosWindow.find('find_Test_001').catch((err) => {
          console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        expect(!!windowClass2).assertTrue();
        await win.destroyWindow()
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0430
     * @tc.name      : testFind_WinName_IsNot_Exist
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testFind_WinName_IsNot_Exist', 0, async function (done) {
      let caseName = 'testFind_WinName_IsNot_Exist';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      ohosWindow.find('find_Test_002', (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(1001);
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        windowClass = data;
        console.info(msgStr + 'Succeeded in finding the window. Data: ' + JSON.stringify(data));
        try {
          expect().assertFail();
        } catch (error) {
          console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
        }
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0600
     * @tc.name      : testGetTopWindow_Invoke_Interfae_Two_Times
     * @tc.desc      : Gets the last window displayed in the current app
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetTopWindow_Invoke_Interfae_Two_Times', 0, async function (done) {
      let caseName = 'testGetTopWindow_Invoke_Interfae_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      ohosWindow.getTopWindow(context, (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        ohosWindow.getTopWindow(context, (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
          done();
        });
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2130
     * @tc.name      : testShowWindow_Invoked_Twice
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testShowWindow_Invoked_Twice', 0, async function (done) {
      let caseName = 'testShowWindow_Invoked_Twice';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      windowClass = await ohosWindow.getLastWindow(context).catch((err) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      windowClass.showWindow((err) => {
        if (err.code) {
          console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in showing the window.');
        windowClass.showWindow().then(() => {
          console.info(msgStr + 'Succeeded in showing the window.');
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2140
     * @tc.name      : testShowWindow_Window_NotExist
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testShowWindow_Window_NotExist', 0, async function (done) {
      let caseName = 'testShowWindow_Window_NotExist';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "showWindow_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      windowClass.showWindow().then(() => {
        console.info(msgStr + 'Succeeded in showing the window.');
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0280
     * @tc.name      : testDestroyWindow_Destory_Same_Win_Type
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testDestroyWindow_Destory_Same_Win_Type', 0, async function (done) {
      let caseName = 'testDestroyWindow_Destory_Same_Win_Type';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "destroyWindow_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      windowClass.destroyWindow((err) => {
        if (err.code) {
          console.error(msgStr + 'Failed to destroy the window. Cause:' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(1300002);
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in destroying the window.');
        expect().assertFail();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0700
     * @tc.name      : testGetWindowProperties_Invoke_Interface_Two_Times
     * @tc.desc      : Gets the properties of the current window Continuous call interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetWindowProperties_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testGetWindowProperties_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getWindowProperties_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        let properties = windowClass.getWindowProperties();
        expect(!!properties).assertTrue();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        let properties2 = windowClass.getWindowProperties();
        expect(!!properties2).assertTrue();
        await windowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0630
     * @tc.name      : testGetWindowAvoidArea_Invoke_Interface_Two_Times
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetWindowAvoidArea_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testGetWindowAvoidArea_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getWindowAvoidArea_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      let type = ohosWindow.AvoidAreaType.TYPE_SYSTEM;
      try {
        let avoidArea = windowClass.getWindowAvoidArea(type);
        expect(!!avoidArea).assertTrue();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      let type2 = ohosWindow.AvoidAreaType.TYPE_CUTOUT;
      try {
        let avoidArea = windowClass.getWindowAvoidArea(type2);
        expect(!!avoidArea).assertTrue();
        await windowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0620
     * @tc.name      : testGetWindowAvoidArea_Invalid_Parameter
     * @tc.desc      : Verify The optional parameter is error
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetWindowAvoidArea_Invalid_Parameter', 0, async function (done) {
      let caseName = 'testGetWindowAvoidArea_Invalid_Parameter';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getWindowAvoidArea_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        let avoidArea = windowClass.getWindowAvoidArea(888);
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        await windowClass.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1160
     * @tc.name      : testSetWindowLayoutFullScreen_Invoke_Interface_Two_Times
     * @tc.desc      : Sets whether the layout of the window is immersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowLayoutFullScreen_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testSetWindowLayoutFullScreen_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowLayoutFullScreen_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      let isLayoutFullScreen = true;
      try {
        await windowClass.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowLayoutFullScreen(false, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
          await windowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1150
     * @tc.name      : testSetWindowLayoutFullScreen_Destroyed_Win
     * @tc.desc      : Sets whether the layout of the window is immersive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowLayoutFullScreen_Destroyed_Win', 0, async function (done) {
      let caseName = 'testSetWindowLayoutFullScreen_Destroyed_Win';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowLayoutFullScreen_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      let isLayoutFullScreen = true;
      try {
        await windowClass.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      await windowClass.destroyWindow();
      try {
        windowClass.setWindowLayoutFullScreen(false, (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(1300002);
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. catch Cause:' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1660
     * @tc.name      : testSetWindowColorSpace_Invalid_ParamsOne
     * @tc.desc      : Set the current window to wide gamut mode or default gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowColorSpace_Invalid_ParamsOne', 0, async function (done) {
      let caseName = 'testSetWindowColorSpace_Invalid_ParamsOne';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      try {
        windowClass.setWindowColorSpace(2).then(() => {
          console.info(msgStr + 'Succeeded in setting window colorspace.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace.catch Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1680
     * @tc.name      : testSetWindowColorSpace_Multiple_Calls_Wide_Gamut_And_Default
     * @tc.desc      : Set the current window to wide gamut mode or default gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowColorSpace_Multiple_Calls_Wide_Gamut_And_Default', 0, async function (done) {
      let caseName = 'testSetWindowColorSpace_Multiple_Calls_Wide_Gamut_And_Default';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      try {
        windowClass.setWindowColorSpace(ohosWindow.ColorSpace.WIDE_GAMUT, (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting window colorspace.');
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        let promise = windowClass.setWindowColorSpace(ohosWindow.ColorSpace.DEFAULT);
        promise.then(() => {
          console.info(msgStr + 'Succeeded in setting window colorspace.');
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0680
     * @tc.name      : testGetWindowColorSpace_Invoke_Interface_Two_Times
     * @tc.desc      : Gets the current window gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetWindowColorSpace_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testGetWindowColorSpace_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let colorSpace = windowClass.getWindowColorSpace();
      let res1 = colorSpace == 0 || colorSpace == 1
      expect(res1).assertEqual(true);
      let colorSpace2 = windowClass.getWindowColorSpace();
      let res2 = colorSpace2 == 0 || colorSpace == 1
      expect(res2).assertEqual(true);
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1470
     * @tc.name      : testSetWindowBackgroundColor_Multiple_Calls
     * @tc.desc      : Set the background color of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowBackgroundColor_Multiple_Calls', 0, async function (done) {
      let caseName = 'testSetWindowBackgroundColor_Multiple_Calls';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let color = '#00ff33';
      try {
        windowClass.setWindowBackgroundColor(color);
      } catch (exception) {
        console.error(msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      let color2 = '#FFFFFF';
      try {
        windowClass.setWindowBackgroundColor(color2);
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1490
     * @tc.name      : testSetWindowBackgroundColor_Invalid_ParamsOne
     * @tc.desc      : Set the background color of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowBackgroundColor_Invalid_ParamsOne', 0, async function (done) {
      let caseName = 'testSetWindowBackgroundColor_Invalid_ParamsOne';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let color = '#00f';
      try {
        windowClass.setWindowBackgroundColor(color);
      } catch (exception) {
        console.error(msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1590
     * @tc.name      : testSetWindowBrightness_Invalid_ParamsOne_Promise
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowBrightness_Invalid_ParamsOne_Promise', 0, async function (done) {
      let caseName = 'testSetWindowBrightness_Invalid_ParamsOne_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let brightness = 2;
      try {
        windowClass.setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. catch Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1610
     * @tc.name      : testSetWindowBrightness_Multiple_Calls_Promise_And_Callback
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowBrightness_Multiple_Calls_Promise_And_Callback', 0, async function (done) {
      let caseName = 'testSetWindowBrightness_Multiple_Calls_Promise_And_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let brightness = 1;
      try {
        windowClass.setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. catch Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      let brightness2 = 0.5;
      try {
        windowClass.setWindowBrightness(brightness2, (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the brightness.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1710
     * @tc.name      : testSetWindowFocusable_Multiple_Calls_Promise_And_Callback
     * @tc.desc      : Set whether to switch focus window when clicking
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowFocusable_Multiple_Calls_Promise_And_Callback', 0, async function (done) {
      let caseName = 'testSetWindowFocusable_Multiple_Calls_Promise_And_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      try {
        let promise = windowClass.setWindowFocusable(false);
        promise.then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window to be focusable. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowFocusable(true, (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1740
     * @tc.name      : testSetWindowKeepScreenOn_Window_State_Abnorma
     * @tc.desc      : Set whether the screen is steady on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowKeepScreenOn_Window_State_Abnorma', 0, async function (done) {
      let caseName = 'testSetWindowKeepScreenOn_Window_State_Abnorma';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowKeepScreenOn_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      try {
        windowClass.setWindowKeepScreenOn(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the screen to be always on.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.info(msgStr + 'Failed to set the screen to be always on. Cause:  ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. catch Cause: ' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1760
     * @tc.name      : testSetWindowKeepScreenOn_Multiple_Calls
     * @tc.desc      : Set whether the screen is steady on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowKeepScreenOn_Multiple_Calls', 0, async function (done) {
      let caseName = 'testSetWindowKeepScreenOn_Multiple_Calls';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowKeepScreenOn_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        await windowClass.setWindowKeepScreenOn(false).then(() => {
          console.info(msgStr + 'Succeeded in setting the screen to be always on.');
        }).catch((err) => {
          console.info(msgStr + 'Failed to set the screen to be always on. Cause:  ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowKeepScreenOn(true, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            await windowClass.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the screen to be always on.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1880
     * @tc.name      : testSetWindowPrivacyMode_Window_State_Abnorma
     * @tc.desc      : Sets whether the window is in private mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowPrivacyMode_Window_State_Abnorma', 0, async function (done) {
      let caseName = 'testSetWindowPrivacyMode_Window_State_Abnorma';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowPrivacyMode_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      try {
        windowClass.setWindowPrivacyMode(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.info(msgStr + 'Failed to set the window to privacy mode. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. catch Cause: ' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1900
     * @tc.name      : testSetWindowPrivacyMode_Window_Multiple_Calls
     * @tc.desc      : Sets whether the window is in private mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowPrivacyMode_Window_Multiple_Calls', 0, async function (done) {
      let caseName = 'testSetWindowPrivacyMode_Window_Multiple_Calls';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowPrivacyMode_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        await windowClass.setWindowPrivacyMode(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window to privacy mode. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
      }
      try {
        windowClass.setWindowPrivacyMode(false, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            await windowClass.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2040
     * @tc.name      : testSetWindowTouchable_Promise_Form
     * @tc.desc      : Sets whether the window is touchable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowTouchable_Promise_Form', 0, async function (done) {
      let caseName = 'testSetWindowTouchable_Promise_Form';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowTouchable_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        await windowClass.setWindowTouchable(false).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window to be touchable. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowTouchable(true, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            await windowClass.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2060
     * @tc.name      : testSetWindowTouchable_Window_NotExist
     * @tc.desc      : Sets whether the window is touchable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowTouchable_Window_NotExist', 0, async function (done) {
      let caseName = 'testSetWindowTouchable_Window_NotExist';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowTouchable_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      try {
        await windowClass.setWindowTouchable(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window to be touchable. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1090
     * @tc.name      : testSetAspectRatio_Non_Main_Win
     * @tc.desc      : Set the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetAspectRatio_Non_Main_Win', 0, async function (done) {
      let caseName = 'testSetAspectRatio_Non_Main_Win';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setAspectRatio_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        let ratio = 1.0;
        await windowClass.setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
        await windowClass.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0990
     * @tc.name      : testResetAspectRatio_Non_Main_Win
     * @tc.desc      : Unset the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testResetAspectRatio_Non_Main_Win', 0, async function (done) {
      let caseName = 'testResetAspectRatio_Non_Main_Win';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "resetAspectRatio_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        await windowClass.resetAspectRatio().then(() => {
          console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to reset the aspect ratio of window. Cause:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to reset the aspect ratio of window. catch Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
        await windowClass.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0560
     * @tc.name      : testGetProperties_Invoke_Interface_Two_Times
     * @tc.desc      : Gets the properties of the current window Continuous call interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetProperties_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testGetProperties_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getProperties_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.getProperties().then((data) => {
        console.info(msgStr + 'Succeeded in obtaining the window properties. Data: ' + JSON.stringify(data));
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.getProperties(async (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in obtaining the window properties. Data: ' + JSON.stringify(data));
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0550
     * @tc.name      : testGetProperties_Destroyed_Win
     * @tc.desc      : Gets the properties of the current window Continuous call interface
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetProperties_Destroyed_Win', 0, async function (done) {
      let caseName = 'testGetProperties_Destroyed_Win';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getProperties_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      await windowClass.getProperties().then((data) => {
        console.info(msgStr + 'Succeeded in obtaining the window properties. Data: ' + JSON.stringify(data));
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0470
     * @tc.name      : testGetAvoidArea_Invoke_Interfaca_Two_Times
     * @tc.desc      : Gets the area where the window content is avoided
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetAvoidArea_Invoke_Interfaca_Two_Times', 0, async function (done) {
      let caseName = 'testGetAvoidArea_Invoke_Interfaca_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getAvoidArea_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.getAvoidArea(ohosWindow.AvoidAreaType.TYPE_SYSTEM).then((data) => {
        console.info('Succeeded in obtaining the area. Data:' + JSON.stringify(data));
        expect(!!data).assertTrue();
      }).catch((err) => {
        console.error('Failed to obtain the area. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.getAvoidArea(ohosWindow.AvoidAreaType.TYPE_CUTOUT, async (err, data) => {
        if (err.code) {
          console.error('Failed to obtain the area. Cause:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info('Succeeded in obtaining the area. Data:' + JSON.stringify(data));
        expect(!!data).assertTrue();
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0460
     * @tc.name      : testGetAvoidArea_Invalid_Parameter
     * @tc.desc      : Gets the area where the window content is avoided
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetAvoidArea_Invalid_Parameter', 0, async function (done) {
      let caseName = 'testGetAvoidArea_Invalid_Parameter';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getAvoidArea_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.getAvoidArea(6).then(async (data) => {
        console.info('Succeeded in obtaining the area. Data:' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch(async (err) => {
        console.error('Failed to obtain the area. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1003);
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0480
     * @tc.name      : testGetAvoidArea_Type_CutOut_Destroyed_Win
     * @tc.desc      : Gets the area where the window content is avoided
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetAvoidArea_Type_CutOut_Destroyed_Win', 0, async function (done) {
      let caseName = 'testGetAvoidArea_Type_CutOut_Destroyed_Win';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getAvoidArea_Test_003"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      await windowClass.getAvoidArea(ohosWindow.AvoidAreaType.TYPE_CUTOUT).then((data) => {
        console.info('Succeeded in obtaining the area. Data:' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error('Failed to obtain the area. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1140
     * @tc.name      : testSetFullScreen_Invoke_Interface_Two_Times
     * @tc.desc      : Sets whether the window layout is full-screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetFullScreen_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testSetFullScreen_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setFullScreen_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.setFullScreen(true).catch((err) => {
        console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.setFullScreen(false, async (err) => {
        if (err.code) {
          console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info('Succeeded in enabling the full-screen mode.');
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1130
     * @tc.name      : testSetFullScreen_Destroyed_Win
     * @tc.desc      : Sets whether the window layout is full-screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetFullScreen_Destroyed_Win', 0, async function (done) {
      let caseName = 'testSetFullScreen_Destroyed_Win';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setFullScreen_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      await windowClass.setFullScreen(true).then(() => {
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1160
     * @tc.name      : testSetLayoutFullScreen_Invoke_Interface_Two_Times
     * @tc.desc      : Sets whether the window layout is full-screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetLayoutFullScreen_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testSetLayoutFullScreen_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setLayoutFullScreen_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.setLayoutFullScreen(true).catch((err) => {
        console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.setLayoutFullScreen(false, async (err) => {
        if (err.code) {
          console.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info('Succeeded in setting the window layout to full-screen mode.');
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1150
     * @tc.name      : testSetLayoutFullScreen_Destroyed_Win
     * @tc.desc      : Sets whether the window layout is full-screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetLayoutFullScreen_Destroyed_Win', 0, async function (done) {
      let caseName = 'testSetLayoutFullScreen_Destroyed_Win';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setLayoutFullScreen_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      await windowClass.setLayoutFullScreen(true).then(() => {
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1290
     * @tc.name      : testSetSystemBarEnable_Invoke_Interface_Two_Times
     * @tc.desc      : Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetSystemBarEnable_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setSystemBarEnable_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.setSystemBarEnable([]).catch((err) => {
        console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.setSystemBarEnable(['status', 'navigation'], async (err) => {
        if (err.code) {
          console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info('Succeeded in setting the system bar to be invisible.');
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1220
     * @tc.name      : testSetSystemBarEnable_Destroyed_Win
     * @tc.desc      : Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetSystemBarEnable_Destroyed_Win', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_Destroyed_Win';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setSystemBarEnable_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      windowClass.setSystemBarEnable([]).then(() => {
        console.info('Succeeded in setting the system bar to be invisible.');
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0540
     * @tc.name      : testGetMainWindow_Invoke_Interface_Two_Times
     * @tc.desc      : Gets the main window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetMainWindow_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testGetMainWindow_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      let windowClass2 = null;
      await windowStage.getMainWindow().then((data) => {
        console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
        windowClass = data;
        expect(!!windowClass).assertTrue();
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowStage.getMainWindow((err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        windowClass2 = data;
        expect(!!windowClass2).assertTrue();
        done();
        console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0530
     * @tc.name      : testGetMainWindowSync_Invoke_Interface_Two_Times
     * @tc.desc      : Gets the main window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetMainWindowSync_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testGetMainWindowSync_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      let windowClass2 = null;
      try {
        windowClass = windowStage.getMainWindowSync();
        expect(!!windowClass).assertTrue();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
      try {
        windowClass2 = windowStage.getMainWindowSync();
        expect(!!windowClass2).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0030
     * @tc.name      : testCreateSubWindow_Two_Consecutive_Calls
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testCreateSubWindow_Two_Consecutive_Calls', 0, async function (done) {
      let caseName = 'testCreateSubWindow_Two_Consecutive_Calls';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      let windowClass2 = null;
      try {
        await windowStage.createSubWindow('createSubWindow_Test_001_mySubWindow1').then((data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          windowClass = data;
          expect(!!windowClass).assertTrue();
        }).catch((err) => {
          console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
      try {
        windowStage.createSubWindow('createSubWindow_Test_001_mySubWindow2', async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          windowClass2 = data;
          expect(!!windowClass2).assertTrue();
          await windowClass.destroyWindow();
          await windowClass2.destroyWindow();
          done();
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0580
     * @tc.name      : testGetSubWindow_Invoke_Interface_Two_Times
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testGetSubWindow_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testGetSubWindow_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      let windowClass2 = null;
      windowClass = await windowStage.getSubWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the subwindow. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      windowStage.getSubWindow((err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain the subwindow. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        windowClass2 = data;
        expect(!!windowClass2).assertTrue();
        done();
        console.info('Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0730
     * @tc.name      : testIsWindowSupportWideGamut_Invoke_Interface_Two_Times
     * @tc.desc      : Check whether the current window supports the wide color gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testIsWindowSupportWideGamut_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testIsWindowSupportWideGamut_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      await windowClass.isWindowSupportWideGamut().catch((err) => {
        console.error('Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.isWindowSupportWideGamut(async (err, data) => {
        if (err.code) {
          console.error('Failed to check whether the window support WideGamut. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        }
        console.info('Succeeded in checking whether the window support WideGamut Data: ' + JSON.stringify(data));
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0720
     * @tc.name      : testIsWindowShowing_Invoke_Interface_Two_Times
     * @tc.desc      : Check whether the current window is displayed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testIsWindowShowing_Invoke_Interface_Two_Times', 0, async function (done) {
      let caseName = 'testIsWindowShowing_Invoke_Interface_Two_Times';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "isWindowShowing_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        let data = windowClass.isWindowShowing();
        expect(!data).assertTrue();
        console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        let data2 = windowClass.isWindowShowing();
        expect(!data2).assertTrue();
        await windowClass.destroyWindow();
        done();
        console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data2));
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1440
     * @tc.name      : testSetUIContent_Window_State_Abnorma_Callback
     * @tc.desc      : Set the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetUIContent_Window_State_Abnorma_Callback', 0, async function (done) {
      let caseName = 'testSetUIContent_Window_State_Abnorma_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setUIContent_Test_001"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      try {
        windowClass.setUIContent('MainAbility/pages/second/pageTwo', (err) => {
          if (err.code) {
            console.error('Failed to load the content. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
            done();
            return;
          }
          console.info('Succeeded in loading the content.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to load the content. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1450
     * @tc.name      : testSetUIContent_Multiple_Calls
     * @tc.desc      : Set the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetUIContent_Multiple_Calls', 0, async function (done) {
      let caseName = 'testSetUIContent_Multiple_Calls';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setUIContent_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.setUIContent('MainAbility/pages/second/pageTwo').catch((err) => {
        console.error('Failed to load the content. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await windowClass.setUIContent('MainAbility/pages/second/pageOne').catch((err) => {
        console.error('Failed to load the content. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await windowClass.destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1970
     * @tc.name      : testSetWindowSystemBarEnable_More_Params
     * @tc.desc      : Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowSystemBarEnable_More_Params', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnable_More_Params';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await ohosWindow.getLastWindow(context).catch((err) => {
        console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
        return;
      })
      expect(!!windowClass).assertTrue();
      // 后端采用遍历方式，获取有效值，所以用例成功
      let names = ['parmes', 'status', 'navigation'];
      try {
        windowClass.setWindowSystemBarEnable(names).then(async () => {
          console.info('Succeeded in setting the system bar to be invisible.');
          done();
        }).catch((err) => {
          console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to set the system bar to be invisible. catch Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1980
     * @tc.name      : testSetWindowSystemBarEnable_Window_State_Abnorma
     * @tc.desc      : Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testSetWindowSystemBarEnable_Window_State_Abnorma', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnable_Window_State_Abnorma';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowSystemBarEnable_Test_002"
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_FLOAT, ctx: context
      };
      let windowClass = null;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      let names = ['status', 'navigation'];
      await windowClass.destroyWindow();
      try {
        windowClass.setWindowSystemBarEnable(names).then(() => {
          console.info('Succeeded in setting the system bar to be invisible.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (exception) {
        console.error('Failed to set the system bar to be invisible. catch Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
  })
}
