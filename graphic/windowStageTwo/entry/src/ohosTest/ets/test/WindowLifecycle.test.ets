/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';

export default function WindowLifecycle() {
  describe('WindowLifecycleTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0100
     * @tc.name      : test_findWindow_null
     * @tc.desc      : test_findWindow_null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_findWindow_null', 0, async (done:Function) => {
      let caseName = 'test_findWindow_null';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd : window.Window| null = null;
      try {
        tempWnd =  window.findWindow(null);
        console.log(msgStr + 'findWindow success');
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      };
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0200
     * @tc.name      : test_findWindow_notExist
     * @tc.desc      : test_findWindow_notExist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_findWindow_notExist', 0, async (done:Function) => {
      let caseName = 'test_findWindow_notExist';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd : window.Window| null = null;
      try {
        tempWnd = window.findWindow('aa');
        console.log(msgStr + 'findWindow success');
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      };
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0300
     * @tc.name      : test_findWindow_subWindow
     * @tc.desc      : test_findWindow_subWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_findWindow_subWindow', 0, async (done:Function) => {
      let caseName = 'test_findWindow_subWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd : window.Window| null = null;
      try {
        let promise = windowStage.createSubWindow('test_findWindow_subWindow');
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow = data;
          console.log(msgStr + "create the subWindow success");
          tempWnd = window.findWindow('test_findWindow_subWindow');
          if (tempWnd != null) {
            console.log(msgStr + 'findWindow success');
            await subWindow.destroyWindow();
            expect(true).assertTrue();
            done();
          } else {
            await subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      };
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0400
     * @tc.name      : test_findWindow_subWindow_loadContent
     * @tc.desc      : test_findWindow_subWindow_loadContent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_findWindow_subWindow_loadContent', 0, async (done:Function) => {
      let caseName = 'test_findWindow_subWindow_loadContent';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd : window.Window| null = null;
      let storage: LocalStorage = new LocalStorage();
      storage.setOrCreate('storageSimpleProp', 121);
      try {
        let promise = windowStage.createSubWindow('test_findWindow_subWindow_loadContent');
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow = data;
          console.log(msgStr + "create the subWindow success");
          let promise = subWindow.loadContent('testability/pages/First/index2', storage);
          promise.then(async () => {
            console.info(msgStr + 'Succeeded in loading the content.');
            tempWnd = window.findWindow('test_findWindow_subWindow_loadContent');
            if (tempWnd != null) {
              console.log(msgStr + 'findWindow success');
              await subWindow.destroyWindow();
              expect(true).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              await subWindow.destroyWindow();
              done();
            }
          }).catch((err:BusinessError) => {
            console.error(msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
            subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          });
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      };
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0500
     * @tc.name      : test_findWindow_mainWindow
     * @tc.desc      : test_findWindow_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_findWindow_mainWindow', 0, async (done:Function) => {
      let caseName = 'test_findWindow_mainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindowName:string | undefined = ' ';
      let tempWnd : window.Window;
      try {
        let mainWindowClass = await windowStage.getMainWindow();
        mainWindowName  =  mainWindowClass.getUIContext().getWindowName();
        console.log(msgStr + 'mainWindowName: ' + mainWindowName);
        tempWnd = window.findWindow(mainWindowName);
        if (tempWnd != null) {
          console.log(msgStr + 'findWindow success');
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      }
      ;
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_FINDWINDOW_0600
     * @tc.name      : test_findWindow_mainWindow_isObscured
     * @tc.desc      : test_findWindow_mainWindow_isObscured
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('test_findWindow_mainWindow_isObscured', 0, async (done:Function) => {
      let caseName = 'test_findWindow_mainWindow_isObscured';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let mainWindowName: string | undefined = '';
      console.log(msgStr + 'begin');
      let tempWnd:window.Window | null = null;
      let storage: LocalStorage = new LocalStorage();
      storage.setOrCreate('storageSimpleProp', 121);
      let mainWindowClass = await windowStage.getMainWindow();
      try {
        let promise = windowStage.createSubWindow('test_findWindow_subWindow_loadContent');
        promise.then(async (data) => {
          if (data == null) {
            console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
            expect(false).assertTrue();
            done();
          }
          let subWindow = data;
          console.log(msgStr + "create the subWindow success");
          let promise = subWindow.loadContent('testability/pages/First/index2', storage);
          promise.then(async () => {
            console.info(msgStr + 'Succeeded in loading the content.');
            mainWindowName = mainWindowClass.getUIContext().getWindowName();
            tempWnd = window.findWindow(mainWindowName);
            if (tempWnd != null) {
              console.log(msgStr + 'findWindow success');
              await subWindow.destroyWindow();
              expect(true).assertTrue();
              done();
            } else {
              subWindow.destroyWindow();
              expect(false).assertTrue();
              done();
            }
          }).catch((err:BusinessError) => {
            console.error(msgStr + `Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
            subWindow.destroyWindow();
            expect(false).assertTrue();
            done();
          });
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + exception.code + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      }
      ;
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSTAGEEVENT_0100
     * @tc.name      : testOffWindowStageEvent_RepeatOff
     * @tc.desc      : Turn off listening for Windows Stage lifecycle changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testOffWindowStageEvent_RepeatOff', 0, async (done:Function) => {
      let caseName = 'testOffWindowStageEvent_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.on('windowStageEvent', (data) => {
          console.info(msgStr + 'Succeeded in enabling the listener for window stage event changes. Data: ' +
          JSON.stringify(data));
          expect(true).assertTrue();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to enable the listener for window stage event changes. Cause:' +
        JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowStage.off('windowStageEvent');
        console.log(msgStr + 'windowStageEvent success first');
        expect(true).assertTrue();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for window stage event changes. Cause:' +
        JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowStage.off('windowStageEvent');
        console.log(msgStr + 'windowStageEvent success second');
        expect(true).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for window stage event changes. Cause:' +
        JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_IS_WINDOW_SHOWING_0100
     * @tc.name      : testIsWindowShowing_WindowStateAbnormal
     * @tc.desc      : Check whether the current window is displayed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsWindowShowing_WindowStateAbnormal', 0, async (done:Function) => {
      let caseName = 'testIsWindowShowing_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win : window.Window| null = null;
      win = await windowStage.createSubWindow('testIsWindowShowing_WindowStateAbnormal');
      //   .catch((err:BusinessError) => {
      //   console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
      //   expect().assertFail();
      //   done();
      // });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        let data = win.isWindowShowing();
        console.info(msgStr + 'Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
        win.destroyWindow();
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        win.destroyWindow();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_IS_WINDOW_SHOWING_0200
     * @tc.name      : testIsWindowShowingTest
     * @tc.desc      : To verify the widow isshowing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testIsWindowShowingTest', 0, async (done: Function) => {
      console.info('windowTest testIsWindowShowingTest begin');
      // let wnd: window.Window | undefined = undefined;
      let msgStr = "testIsWindowShowingTest";
      windowStage.createSubWindow('testIsWindowShowingTest').then(async (data) => {
        let wnd: window.Window = data;
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        let isWindowShowing:boolean = wnd.isWindowShowing();
        console.log(msgStr + 'isWindowShowing:' + isWindowShowing);
        expect(!isWindowShowing).assertTrue();
        await wnd.showWindow().then(async () => {
          let isWindowShowing2 = wnd.isWindowShowing();
          console.log(msgStr + 'isWindowShowing2:' + isWindowShowing2);
          expect(isWindowShowing2).assertTrue();
          await wnd.destroyWindow();
          done();
        }).catch(async (err:BusinessError) => {
          console.error('Failed to show window1. Cause:' + JSON.stringify(err));
          expect().assertFail();
          await wnd.destroyWindow();
          done();
        });
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_IS_WINDOW_SHOWING_0300
     * @tc.name      : testIsWindowShowing_Invoke_Interface_Two_Times
     * @tc.desc      : Check whether the current window is displayed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testIsWindowShowing_Invoke_Interface_Two_Times', 0, async (done: Function) => {
      let caseName: string = 'testIsWindowShowing_Invoke_Interface_Two_Times';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      await windowStage.createSubWindow('testIsWindowShowing_Invoke_Interface_Two_Times').then(async (data) => {
        windowClass = data;
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        try {
          let data:boolean = windowClass.isWindowShowing();
          expect(!data).assertTrue();
          console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
        } catch (exception) {
          console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          await windowClass.destroyWindow();
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
          await windowClass.destroyWindow();
          done();
        }

      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_IS_WINDOW_SHOWING_0400
     * @tc.name      : testIsWindowShowing_mainWindow
     * @tc.desc      : testIsWindowShowing_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testIsWindowShowing_mainWindow', 0, async (done: Function) => {
      let caseName: string = 'testIsWindowShowing_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindowClass = await windowStage.getMainWindow();
      try {
        let data = mainWindowClass.isWindowShowing();
        expect(data).assertTrue();
        done();
        console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSIZE_CHANGE_0100
     * @tc.name      : testOn_WindowSize_Change_subWindow
     * @tc.desc      : testOn_WindowSize_Change_subWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testOn_WindowSize_Change_subWindow', 0, async (done: Function) => {
      let caseName: string = 'testOn_WindowSize_Change_subWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass: window.Window;
      let storage: LocalStorage = new LocalStorage();
      try {
        await windowStage.createSubWindow('testOn_WindowSize_Change_subWindow').then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!subWindowClass).assertTrue();
          await subWindowClass.loadContent('testability/pages/First/index2', storage);
          let promise = subWindowClass.showWindow();
          promise.then(async () => {
            console.info(msgStr + 'Succeeded in showing the window.');
            await sleep(1000);
            subWindowClass.on('windowSizeChange', (data) => {
              console.info(msgStr + 'Succeeded in enabling the listener for window size changes. Data: ' +
              JSON.stringify(data));
              expect(data.width).assertEqual(800);
              expect(data.height).assertEqual(1000);
              subWindowClass.destroyWindow();
              done();
            });
            await subWindowClass.resize(800, 1000);
            console.info(msgStr + 'Succeeded in resize the subWindowClass');
          }).catch((err:BusinessError) => {
            console.error(msgStr + `Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
            subWindowClass.destroyWindow();
            expect().assertFail();
            done();
          });
        }).catch((err:BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          subWindowClass.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSIZE_CHANGE_0200
     * @tc.name      : testOn_WindowSize_Change_Two_callback
     * @tc.desc      : testOn_WindowSize_Change_Two_callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testOn_WindowSize_Change_Two_callback', 0, async (done: Function) => {
      let caseName: string = 'testOn_WindowSize_Change_Two_callback';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass: window.Window;
      let storage: LocalStorage = new LocalStorage();
      let num = 0;
      const callback1 = (size: window.Size) => {
        console.info(msgStr + 'callback1 is called ' + JSON.stringify(size));
        num++;
      };
      const callback2 = (size: window.Size) => {
        console.info(msgStr + 'callback2 is called ' + JSON.stringify(size));
        num++;
      };
      try {
        await windowStage.createSubWindow('testOn_WindowSize_Change_Two_callback').then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!subWindowClass).assertTrue();
          await subWindowClass.loadContent('testability/pages/First/index2', storage);
          await subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowSizeChange', callback1);
          subWindowClass.on('windowSizeChange', callback2);
          await subWindowClass.resize(800, 900);
          console.info(msgStr + 'Succeeded in resize the subWindowClass');
          await sleep(1000);
          console.info(msgStr + 'num: ' + num);
          expect(num).assertEqual(2);
          await subWindowClass.destroyWindow();
          done();
        }).catch((err:BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          subWindowClass.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSIZE_CHANGE_0300
     * @tc.name      : testOn_WindowSize_Change_off_callback1
     * @tc.desc      : testOn_WindowSize_Change_off_callback1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testOn_WindowSize_Change_off_callback1', 0, async (done: Function) => {
      let caseName: string = 'testOn_WindowSize_Change_off_callback1';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass: window.Window;
      let storage: LocalStorage = new LocalStorage();
      let num = 0;
      const callback1 = (size: window.Size) => {
        console.info(msgStr + 'callback1 is called ' + JSON.stringify(size));
        num++;
      };
      const callback2 = (size: window.Size) => {
        console.info(msgStr + 'callback2 is called ' + JSON.stringify(size));
        num--;
      };
      try {
        await windowStage.createSubWindow('testOn_WindowSize_Change_off_callback1').then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!subWindowClass).assertTrue();
          await subWindowClass.loadContent('testability/pages/First/index2', storage);
          await subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowSizeChange', callback1);
          subWindowClass.on('windowSizeChange', callback2);
          subWindowClass.off('windowSizeChange', callback1);
          await subWindowClass.resize(800, 1200);
          console.info(msgStr + 'Succeeded in resize the subWindowClass');
          await sleep(1000);
          console.info(msgStr + 'num: ' + num);
          expect(num).assertEqual(-1);
          await subWindowClass.destroyWindow();
          done();
        }).catch((err:BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          subWindowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOWSIZE_CHANGE_0400
     * @tc.name      : testOn_WindowSize_Change_off_callback_all
     * @tc.desc      : testOn_WindowSize_Change_off_callback_all
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testOn_WindowSize_Change_off_callback_all', 0, async (done: Function) => {
      let caseName: string = 'testOn_WindowSize_Change_off_callback_all';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass: window.Window;
      let storage: LocalStorage = new LocalStorage();
      let num = 0;
      const callback1 = (size: window.Size) => {
        console.info(msgStr + 'callback1 is called ' + JSON.stringify(size));
        num++;
      };
      const callback2 = (size: window.Size) => {
        console.info(msgStr + 'callback2 is called ' + JSON.stringify(size));
        num++;
      };
      try {
        await windowStage.createSubWindow('testOn_WindowSize_Change_off_callback_all').then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          expect(!!subWindowClass).assertTrue();
          await subWindowClass.loadContent('testability/pages/First/index2', storage);
          await subWindowClass.showWindow();
          await sleep(1000);
          subWindowClass.on('windowSizeChange', callback1);
          subWindowClass.on('windowSizeChange', callback2);
          subWindowClass.off('windowSizeChange');
          await subWindowClass.resize(800, 1300);
          console.info(msgStr + 'Succeeded in resize the subWindowClass');
          await sleep(1000);
          console.info(msgStr + 'num: ' + num);
          expect(num).assertEqual(0);
          await subWindowClass.destroyWindow();
          done();
        }).catch((err:BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          subWindowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_SHOW_WINDOW_0100
     * @tc.name      : test_showWindow_subWindow_top_promise
     * @tc.desc      : test move the subWindow to the top
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('test_showWindow_subWindow_top_promise', 0, async (done: Function) => {
      let caseName: string = 'test_showWindow_subWindow_top_promise';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass1: window.Window;
      let subWindowClass2: window.Window;
      let storage: LocalStorage = new LocalStorage();
      try {
        await windowStage.createSubWindow('test_showWindow_subWindow_top_promise').then(async (data) => {
          subWindowClass1 = data;
          console.info(msgStr + 'Succeeded in creating the subwindow1. Data: ' + JSON.stringify(data));
          let id = subWindowClass1.getWindowProperties().id;
          console.info(msgStr + 'Succeeded in getting the window id. : ' + id);
          expect(!!subWindowClass1).assertTrue();
          await subWindowClass1.loadContent('testability/pages/First/index2', storage);
          // await subWindowClass1.showWindow();
          await windowStage.createSubWindow('test_showWindow_subWindow_top_promise2').then(async (data) => {
            subWindowClass2 = data;
            console.info(msgStr + 'Succeeded in creating the subwindow2. Data: ' + JSON.stringify(data));
            expect(!!subWindowClass2).assertTrue();
            await subWindowClass2.loadContent('testability/pages/First/index3', storage);
            // await subWindowClass2.showWindow();
            await sleep(1000);
            let promise1 = subWindowClass1.showWindow();
            promise1.then(() => {
              console.info(msgStr + 'Succeeded in showing the window.');
              let promise = window.getTopWindow(context);
              promise.then((data) => {
                let windowClass = data;
                console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
                let id1 = windowClass.getWindowProperties().id;
                console.info(msgStr + 'Succeeded in getting the window id1. : ' + id1);
                expect(id1).assertEqual(id);
                sleep(1000);
                subWindowClass1.destroyWindow();
                subWindowClass2.destroyWindow();
                done();
              }).catch((err:BusinessError) => {
                console.error(msgStr +
                  `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                subWindowClass1.destroyWindow();
                subWindowClass2.destroyWindow();
                done();
              });
            }).catch((err:BusinessError) => {
              console.error(msgStr + `Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              subWindowClass1.destroyWindow();
              subWindowClass2.destroyWindow();
              done();
            });
          }).catch((err:BusinessError) => {
            console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
            subWindowClass1.destroyWindow();
            subWindowClass2.destroyWindow();
            expect().assertFail();
            done();
          });
        }).catch((err:BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_SHOW_WINDOW_0200
     * @tc.name      : test_showWindow_subWindow_top_callback
     * @tc.desc      : test move the subWindow to the top
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('test_showWindow_subWindow_top_callback', 0, async (done: Function) => {
      let caseName: string = 'test_showWindow_subWindow_top_callback';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindowClass1: window.Window;
      let subWindowClass2: window.Window;
      let storage: LocalStorage = new LocalStorage();
      try {
        await windowStage.createSubWindow('test_showWindow_subWindow_top_callback').then(async (data) => {
          subWindowClass1 = data;
          console.info(msgStr + 'Succeeded in creating the subwindow1. Data: ' + JSON.stringify(data));
          let id = subWindowClass1.getWindowProperties().id;
          console.info(msgStr + 'Succeeded in getting the window id. : ' + id);
          expect(!!subWindowClass1).assertTrue();
          await subWindowClass1.loadContent('testability/pages/First/index2', storage);
          await windowStage.createSubWindow('test_showWindow_subWindow_top_callback2').then(async (data) => {
            subWindowClass2 = data;
            console.info(msgStr + 'Succeeded in creating the subwindow2. Data: ' + JSON.stringify(data));
            expect(!!subWindowClass2).assertTrue();
            await subWindowClass2.loadContent('testability/pages/First/index3', storage);
            await sleep(1000);
            subWindowClass1.showWindow((err) => {
              const errCode: number = err.code;
              if (errCode) {
                console.error(msgStr + `Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
              }
              console.info(msgStr + 'Succeeded in showing the window.');
              let promise = window.getTopWindow(context);
              promise.then((data) => {
                let windowClass = data;
                console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
                let id1 = windowClass.getWindowProperties().id;
                console.info(msgStr + 'Succeeded in getting the window id1. : ' + id1);
                expect(id1).assertEqual(id);
                sleep(1000);
                subWindowClass1.destroyWindow();
                subWindowClass2.destroyWindow();
                done();
              }).catch((err:BusinessError) => {
                console.error(msgStr +
                  `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                subWindowClass1.destroyWindow();
                subWindowClass2.destroyWindow();
                done();
              });
            });
          }).catch((err:BusinessError) => {
            console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
            expect().assertFail();
            subWindowClass1.destroyWindow();
            subWindowClass2.destroyWindow();
            done();
          });
        }).catch((err:BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          subWindowClass1.destroyWindow();
          subWindowClass2.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_DESTORY_WINDOW_0100
     * @tc.name      : testDestroyWindow_Promise
     * @tc.desc      : Verification window destruction scenario.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDestroyWindow_Promise', 0, async (done:Function) => {
      let caseName = 'testDestroyWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd:window.Window;
      try {
        tempWnd = await windowStage.createSubWindow('testDestroyWindow_Promise');
        console.log(msgStr + 'ohosWindow.createWindow successed');
        expect(!!tempWnd).assertTrue();
        await tempWnd.destroyWindow().then(() => {
          console.info(msgStr + 'Succeeded in destroying the window.');
          expect(true).assertTrue();
          try {
            let findWnd = window.findWindow('testDestroyWindow_Promise');
            expect().assertFail();
            done();
          } catch (exception) {
            console.error(msgStr + 'try catch Failed to find the Window. Cause: ' + JSON.stringify(exception));
            expect(exception.code === 1300002).assertTrue();
            tempWnd.destroyWindow();
            done();
          };
        }).catch((err:BusinessError) => {
          console.error(msgStr + 'try catch Failed to destroy the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      };

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_DESTORY_WINDOW_0200
     * @tc.name      : testDestroyWindow_Callback
     * @tc.desc      : Verification window destruction scenario
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testDestroyWindow_Callback', 0, async (done:Function) => {
      let caseName = 'testDestroyWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let winData:window.Window;
      await windowStage.createSubWindow('testDestroyWindow_Callback').then((data)=>{
        winData = data;
        console.log(msgStr + 'ohosWindow.createWindow successed');
        expect(!!winData).assertTrue();
        winData.destroyWindow((err) => {
          if (err.code) {
            console.log(msgStr + 'windowTest DestroyTest fail' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            try {
              let findWnd = window.findWindow('testDestroyWindow_Callback');
              expect(false).assertTrue();
              done();
            } catch (exception) {
              console.error(msgStr + 'try catch Failed to find the Window. Cause: ' + JSON.stringify(exception));
              expect(exception.code === 1300002).assertTrue();
              winData.destroyWindow();
              done();
            };
          }
        });
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0100
     * @tc.name      : testWindowOffWindowEvent_RepeatOff
     * @tc.desc      : Disable the monitoring of window life cycle changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowEvent_RepeatOff', 0, async (done:Function) => {
      let caseName = 'testWindowOffWindowEvent_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win:window.Window;
      await windowStage.createSubWindow('testWindowOffWindowEvent_RepeatOff').then(async (data)=>{
        win = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!win).assertTrue();
        try {
          win.on('windowEvent', (data) => {
            console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await win.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          win.off('windowEvent');
          expect(true).assertTrue();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await win.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          win.off('windowEvent');
          await win.destroyWindow();
          expect(true).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await win.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0200
     * @tc.name      : testWindow_on_WindowEvent_subWindow_shown
     * @tc.desc      : Disable the monitoring of window life cycle changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindow_on_WindowEvent_subWindow_shown', 0, async (done:Function) => {
      let caseName = 'testWindow_on_WindowEvent_subWindow_shown';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow :window.Window;
      let promise = windowStage.createSubWindow('m1testWindow_on_WindowEvent_subWindow_shownySubWindow');
      promise.then((data) => {
        subWindow = data;
        console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        try {
          subWindow.on('windowEvent', async (data) => {
            console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
            expect(data).assertEqual(1);
            subWindow.off('windowEvent');
            subWindow.destroyWindow();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          expect(true).assertTrue();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0300
     * @tc.name      : testWindow_on_WindowEvent_subWindow_active
     * @tc.desc      : testWindow_on_WindowEvent_subWindow_active
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindow_on_WindowEvent_subWindow_active', 0, async (done:Function) => {
      let caseName = 'testWindow_on_WindowEvent_subWindow_active';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow:window.Window;
      await windowStage.createSubWindow('2testWindow_on_WindowEvent_subWindow_active').then(async (data)=>{
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          subWindow.on('windowEvent', async (data) => {
            console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
            if (data == 2) {
              expect(true).assertTrue();
              subWindow.off('windowEvent');
              subWindow.destroyWindow();
              done();
            } else {
              await sleep(1000);
            }
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          expect(true).assertTrue();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0400
     * @tc.name      : testWindow_on_WindowEvent_subWindow_inactive
     * @tc.desc      : testWindow_on_WindowEvent_subWindow_inactive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindow_on_WindowEvent_subWindow_inactive', 0, async (done:Function) => {
      let caseName = 'testWindow_on_WindowEvent_subWindow_inactive';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let errCode = 0;
      let subWindow : window.Window;
      let windowClass : window.Window;
      let windowClassId:number ;
      let subWindowClassId :number;
      let storage: LocalStorage = new LocalStorage();
      let promise = windowStage.getMainWindow();
      promise.then((data) => {
        if (data == null) {
          console.error(msgStr + "Failed to obtaining the window. Cause: The data is empty");
          expect().assertFail();
          done();
        }
        windowClass = data;
        windowClassId = windowClass.getWindowProperties().id;
        console.info(msgStr + 'Succeeded in obtaining the window');
      }).catch((err:BusinessError) => {
        console.error(msgStr + `Failed to obtaining the window. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      });
      let promise1 = windowStage.createSubWindow('3testWindow_on_WindowEvent_subWindow_inactive');
      promise1.then((data) => {
        if (data == null) {
          console.error(msgStr + "Failed to create the subWindow. Cause: The data is empty");
          expect().assertFail();
          done();
        }
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        subWindow.resize(1000, 800);
        subWindow.loadContent('testability/pages/First/index2', storage);
        let promise2 = subWindow.showWindow();
        promise2.then(async () => {
          console.info(msgStr + 'Succeeded in showing the window.');
          await sleep(2000);
          subWindowClassId = subWindow.getWindowProperties().id;
          try {
            subWindow.on('windowEvent', async (data) => {
              console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
              expect(data).assertEqual(3);
              subWindow.off('windowEvent');
              await subWindow.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
            await subWindow.destroyWindow();
            expect().assertFail();
            done();
          }
          try {
            let promise = window.shiftAppWindowFocus(subWindowClassId, windowClassId);
            promise.then(() => {
              console.info(msgStr + 'Succeeded in shifting app window focus');
              expect(true).assertTrue();
            }).catch(async (err:BusinessError) => {
              console.error(msgStr +
                `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
              if (err.code) {
                expect(err.code).assertEqual(801);
                subWindow.off('windowEvent');
                await subWindow.destroyWindow();
                done();
              } else {
                subWindow.off('windowEvent');
                await subWindow.destroyWindow();
                expect().assertFail();
                done();
              }
            });
          } catch (err) {
            console.error(msgStr + `Failed to shiftAppWindowFocus. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        }).catch((err:BusinessError) => {
          console.error(msgStr + `Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }).catch((err:BusinessError) => {
        console.error(msgStr + `Failed to creatw subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0600
     * @tc.name      : testWindow_on_WindowEvent_mainWindow_inactive
     * @tc.desc      : testWindow_on_WindowEvent_mainWindow_inactive
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindow_on_WindowEvent_mainWindow_inactive', 0, async (done:Function) => {
      let caseName = 'testWindow_on_WindowEvent_mainWindow_inactive';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow : window.Window;
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('windowEvent', async (data) => {
          console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
          expect(data).assertEqual(3);
          windowClass.off('windowEvent');
          await subWindow.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception) + exception.code);
        expect().assertFail();
        done();
      }
      await windowStage.createSubWindow('4testWindow_on_WindowEvent_mainWindow_inactive').then(async (data)=>{
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          await subWindow.showWindow();
          console.log(msgStr + 'windowStage.show SubWindow success');
          expect(true).assertTrue();
          await sleep(1000);
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0700
     * @tc.name      : testWindow_on_WindowEvent_mainWindow_active
     * @tc.desc      : testWindow_on_WindowEvent_mainWindow_active
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindow_on_WindowEvent_mainWindow_active', 0, async (done:Function) => {
      let caseName = 'testWindow_on_WindowEvent_mainWindow_active';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let storage: LocalStorage = new LocalStorage();
      let subWindow : window.Window;
      let windowClass = await windowStage.getMainWindow();
      let promise = windowStage.createSubWindow('5testWindow_on_WindowEvent_mainWindow_active');
      promise.then(async (data) => {
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        subWindow.resize(800, 1000);
        subWindow.loadContent('testability/pages/First/index2', storage);
        await subWindow.showWindow();
        console.log(msgStr + 'windowStage.show SubWindow success');
        try {
          await sleep(2000);
          windowClass.on('windowEvent', (data) => {
            console.info(msgStr + 'Window event happened. Event:' + JSON.stringify(data));
            expect(data).assertEqual(2);
            windowClass.off('windowEvent');
            subWindow.destroyWindow();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception) + exception.code);
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          await subWindow.destroyWindow();
          console.log(msgStr + ' SubWindow  destroy success');
          expect(true).assertTrue();
          await sleep(1000);
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0800
     * @tc.name      : testWindow_on_WindowEvent_Two_callback
     * @tc.desc      : testWindow_on_WindowEvent_Two_callback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindow_on_WindowEvent_Two_callback', 0, async (done:Function) => {
      let caseName = 'testWindow_on_WindowEvent_Two_callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow : window.Window;
      let num = 0;
      const callback1 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback1 is called,num: ' + num);
      };
      const callback2 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback2 is called,num: ' + num);
      };
      await windowStage.createSubWindow('6testWindow_on_WindowEvent_Two_callback').then(async (data)=>{
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          subWindow.on('windowEvent', callback1);
          subWindow.on('windowEvent', callback2);
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          await sleep(1000);
          if (num >= 2) {
            expect(true).assertTrue();
            subWindow.off('windowEvent');
            subWindow.destroyWindow();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_0900
     * @tc.name      : testWindow_on_WindowEvent_off_callback1
     * @tc.desc      : testWindow_on_WindowEvent_off_callback1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindow_on_WindowEvent_off_callback1', 0, async (done:Function) => {
      let caseName = 'testWindow_on_WindowEvent_off_callback1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow : window.Window;
      let num = 0;
      const callback1 = (windowEventType: window.WindowEventType) => {
        num--;
        console.log(msgStr + 'callback1 is called,num: ' + num);
      };
      const callback2 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback2 is called,num: ' + num);
      };
      await windowStage.createSubWindow('7testWindow_on_WindowEvent_off_callback1').then(async (data)=>{
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          subWindow.on('windowEvent', callback1);
          subWindow.on('windowEvent', callback2);
          subWindow.off('windowEvent', callback1);
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          await sleep(1000);
          expect(num).assertLarger(1);
          subWindow.off('windowEvent');
          subWindow.destroyWindow();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_ON_WINDOW_EVENT_1000
     * @tc.name      : testWindow_on_WindowEvent_off_callback_All
     * @tc.desc      : testWindow_on_WindowEvent_off_callback_All
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindow_on_WindowEvent_off_callback_All', 0, async (done:Function) => {
      let caseName = 'testWindow_on_WindowEvent_off_callback_All';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow : window.Window;
      let num = 0;
      const callback1 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback1 is called,num: ' + num);
      };
      const callback2 = (windowEventType: window.WindowEventType) => {
        num++;
        console.log(msgStr + 'callback2 is called,num: ' + num);
      };
      await windowStage.createSubWindow('8testWindow_on_WindowEvent_off_callback_All').then(async (data)=>{
        subWindow = data;
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(!!subWindow).assertTrue();
        try {
          subWindow.on('windowEvent', callback1);
          subWindow.on('windowEvent', callback2);
          subWindow.off('windowEvent');
        } catch (exception) {
          console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
        try {
          subWindow.showWindow();
          await sleep(1000);
          expect(num).assertEqual(0);
          subWindow.off('windowEvent');
          subWindow.destroyWindow();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          await subWindow.destroyWindow();
          expect().assertFail();
          done();
        }
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0100
     * @tc.name      : testWindowOffWindowVisibilityChange_UnregisteredOff
     * @tc.desc      : Enable this window to listen for status change events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowVisibilityChange_UnregisteredOff', 0, async (done:Function) => {
      let caseName: string = 'testWindowOffWindowVisibilityChange_UnregisteredOff';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win: window.Window | void =
        await windowStage.createSubWindow('testWindowOffWindowVisibilityChange_UnregisteredOff').catch((err:BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        (win as window.Window).off('windowVisibilityChange');
        await (win as window.Window).destroyWindow();
        expect(true).assertTrue();
        done();
      } catch (exception) {
        await (win as window.Window).destroyWindow();
        console.error(msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' +
        JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0200
     * @tc.name      : testWindowOffWindowVisibilityChange_RepeatOff
     * @tc.desc      : Enable this window to listen for status change events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowVisibilityChange_RepeatOff', 0, async (done:Function) => {
      let caseName: string = 'testWindowOffWindowVisibilityChange_RepeatOff';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win: window.Window | void = await windowStage.createSubWindow('testWindowOffWindowVisibilityChange_RepeatOff').catch((err:BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        (win as window.Window).on('windowVisibilityChange', (boolean) => {
          console.info(msgStr + 'Window visibility changed, isVisible=' + boolean);
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error('Failed to register callback. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
          console.log(msgStr + JSON.stringify(exception));
          expect(exception.code).assertEqual(801);
          // done();
        }
      }
      try {
        (win as window.Window).off('windowVisibilityChange');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
          console.log(msgStr + JSON.stringify(exception));
          expect(exception.code).assertEqual(1300002);
          // done();
        }
      }
      try {
        (win as window.Window).off('windowVisibilityChange');
        await (win as window.Window).destroyWindow();
        done();
      } catch (exception) {
        await (win as window.Window).destroyWindow();
        console.error(msgStr + 'Failed to unregister callback Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0300
     * @tc.name      : testWindowVisibilityChange_on_Function_Callback
     * @tc.desc      : window type windowVisibilityChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testWindowVisibilityChange_on_Function_Callback", 0, async (done:Function) => {
      let msgStr = "testWindowVisibilityChange_on_Function_Callback";
      console.log(msgStr + "begin");
      try {
        console.log(msgStr + "try begin");
        let windowClass = await windowStage.getMainWindow();
        windowClass.on('windowVisibilityChange', (boolean) => {
          console.log(msgStr + 'Window visibility changed, isVisible=' + boolean);
        });
        expect(true).assertTrue();
        windowClass.off('windowVisibilityChange');
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
        if (error.code != 801) {
          console.error(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
          console.log(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect(error.code).assertEqual(801);
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0400
     * @tc.name      : testWindowVisibilityChange_off_Function_Callback
     * @tc.desc      : window type windowVisibilityChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testWindowVisibilityChange_off_Function_Callback", 0, async (done:Function) => {
      let msgStr = "testWindowVisibilityChange_off_Function_Callback";
      console.log(msgStr + "begin");
      try {
        console.log(msgStr + "try begin");
        let windowClass = await windowStage.getMainWindow();
        windowClass.off('windowVisibilityChange');
        console.log(msgStr + 'Window visibility changed');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
        if (error.code != 801) {
          console.error(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
          console.log(msgStr + 'Failed to register callback. Cause:' + JSON.stringify(error));
          expect(error.code).assertEqual(801);
          done();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_API_REMOVE_STARTING_WINDOW_0100
     * @tc.name      : testRemoveStartingWindow_Promise
     * @tc.desc      : testRemoveStartingWindow_Promise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testRemoveStartingWindow_Promise", 2, async (done:Function) => {
      let msgStr = "testRemoveStartingWindow_Promise";
      console.log(msgStr + "begin");
      try {
        windowStage.removeStartingWindow().then(() => {
          console.info('Succeeded in removing starting window.');
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to remove starting window. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code != 801) {
            console.error(msgStr + 'Failed testRemoveStartingWindow_Promise. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + 'The device not support SystemCapability.Window.SessionManager');
            expect(err.code).assertEqual(801);
            done();
          }
        });

      } catch (error) {
        console.log(msgStr + 'Failed to testRemoveStartingWindow_Promise. Cause: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    });
  })
}