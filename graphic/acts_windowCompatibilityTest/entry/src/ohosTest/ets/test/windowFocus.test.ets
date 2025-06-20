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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise<string>(resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}
export default function windowFocusTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('window_focus_test', () => {
    console.log('describe window_focus_test start!!!')
    let tempWnd: window.Window | void;
    let subWin: window.Window | void;

    beforeEach(async ()=>{
      let msg = 'window_focus_test';
      console.log(msg + ' beforeEach start!!!');
      if(tempWnd !== null && tempWnd !== undefined){
        await (tempWnd as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      if(subWin !== null && subWin !== undefined){
        await (subWin as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      console.log(msg + ' beforeEach end!!!')
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4960
     * @tc.name      : testShiftAppWindowFocus_DialogWindow_SourceWinFocus
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShiftAppWindowFocus_DialogWindow_SourceWinFocus', 0, async () => {
      let caseName = 'testShiftAppWindowFocus_DialogWindow_SourceWinFocus';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testShiftAppWindowFocus_DialogWindow_SourceWinFocus",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/pageTwo");
      await (tempWnd as window.Window).showWindow();
      await sleep(500)
      await sleep(500)
      await sleep(500)
      let mainWin = windowStage.getMainWindowSync();
      let mainWinId = mainWin.getWindowProperties().id;
      let dialogWinId = (tempWnd as window.Window).getWindowProperties().id;
      try {
        await window.shiftAppWindowFocus(dialogWinId, mainWinId).then(() => {
          console.info(msgStr + 'Succeeded in shifting app window focus');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300004);
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4970
     * @tc.name      : testShiftAppWindowFocus_DialogWindow_SourceWinNotFocus
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShiftAppWindowFocus_DialogWindow_SourceWinNotFocus', 0, async () => {
      let caseName = 'testShiftAppWindowFocus_DialogWindow_SourceWinNotFocus';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testShiftAppWindowFocus_DialogWindow_SourceWinNotFocus",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/pageTwo");
      await (tempWnd as window.Window).showWindow();
      await sleep(500)
      await sleep(500)
      await sleep(500)
      let mainWin = windowStage.getMainWindowSync();
      let mainWinId = mainWin.getWindowProperties().id;
      let dialogWinId = (tempWnd as window.Window).getWindowProperties().id;
      try {
        await window.shiftAppWindowFocus(mainWinId, dialogWinId).then(() => {
          console.info(msgStr + 'Succeeded in shifting app window focus');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002);
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4980
     * @tc.name      : testShiftAppWindowFocus_SubWindow_SourceWinFocus
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShiftAppWindowFocus_SubWindow_SourceWinFocus', 0, async () => {
      let caseName = 'testShiftAppWindowFocus_SubWindow_SourceWinFocus';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testShiftAppWindowFocus_SubWindow_SourceWinFocus')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/pageTwo");
      await (subWin as window.Window).showWindow();
      await sleep(500)
      await sleep(500)
      await sleep(500)
      let mainWin = windowStage.getMainWindowSync();
      let mainWinId = mainWin.getWindowProperties().id;
      let subWinId = (subWin as window.Window).getWindowProperties().id;
      try {
        await window.shiftAppWindowFocus(subWinId, mainWinId).then(() => {
          console.info(msgStr + 'Succeeded in shifting app window focus');
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4990
     * @tc.name      : testShiftAppWindowFocus_SubWindow_SourceWinNotFocus
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShiftAppWindowFocus_SubWindow_SourceWinNotFocus', 0, async () => {
      let caseName = 'testShiftAppWindowFocus_SubWindow_SourceWinNotFocus';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testShiftAppWindowFocus_SubWindow_SourceWinNotFocus')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/pageTwo");
      await (subWin as window.Window).showWindow();
      await sleep(500)
      await sleep(500)
      await sleep(500)
      let mainWin = windowStage.getMainWindowSync();
      let mainWinId = mainWin.getWindowProperties().id;
      let subWinId = (subWin as window.Window).getWindowProperties().id;
      try {
        await window.shiftAppWindowFocus(mainWinId, subWinId).then(() => {
          console.info(msgStr + 'Succeeded in shifting app window focus');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002);
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (err) {
        if (err.code != 801) {
          console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5000
     * @tc.name      : testSetWindowFocusable_DialogWindow_Callback
     * @tc.desc      : Set whether the window supports switching from the focus window before the click to the window when clicking or other methods are used to focus the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowFocusable_DialogWindow_Callback', 0, async (done: Function) => {
      let caseName = 'testSetWindowFocusable_DialogWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetWindowFocusable_DialogWindow_Callback",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let isFocusable: boolean = true;
      try {
        (tempWnd as window.Window).setWindowFocusable(isFocusable, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to set the window to be focusable. Cause code: ${err.code}, message: ${err.message}`);
            await (tempWnd as window.Window).destroyWindow();
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
          await (tempWnd as window.Window).destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be focusable. out Cause code: ${exception.code}, message: ${exception.message}`);
        await (tempWnd as window.Window).destroyWindow();
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5010
     * @tc.name      : testSetWindowFocusable_DialogWindow_Promise
     * @tc.desc      : Set whether the window supports switching from the focus window before the click to the window when clicking or other methods are used to focus the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowFocusable_DialogWindow_Promise', 0, async () => {
      let caseName = 'testSetWindowFocusable_DialogWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetWindowFocusable_DialogWindow_Promise",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      let isFocusable: boolean = true;
      try {
        await (tempWnd as window.Window).setWindowFocusable(isFocusable).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the window to be focusable. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be focusable. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5020
     * @tc.name      : testSetWindowFocusable_MainWindow_Promise
     * @tc.desc      : Set whether the window supports switching from the focus window before the click to the window when clicking or other methods are used to focus the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowFocusable_MainWindow_Promise', 0, async () => {
      let caseName = 'testSetWindowFocusable_MainWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let isFocusable: boolean = true;
      try {
        await mainWin.setWindowFocusable(isFocusable).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the window to be focusable. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be focusable. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5030
     * @tc.name      : testSetWindowFocusable_MainWindow_Callback
     * @tc.desc      : Set whether the window supports switching from the focus window before the click to the window when clicking or other methods are used to focus the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowFocusable_MainWindow_Callback', 0, async (done: Function) => {
      let caseName = 'testSetWindowFocusable_MainWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let isFocusable: boolean = true;
      try {
        mainWin.setWindowFocusable(isFocusable, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to set the window to be focusable. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be focusable. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5040
     * @tc.name      : testSetWindowFocusable_SubWindow_Callback
     * @tc.desc      : Set whether the window supports switching from the focus window before the click to the window when clicking or other methods are used to focus the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowFocusable_SubWindow_Callback', 0, async (done: Function) => {
      let caseName = 'testSetWindowFocusable_SubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetWindowFocusable_SubWindow_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      let isFocusable: boolean = true;
      try {
        (subWin as window.Window).setWindowFocusable(isFocusable, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to set the window to be focusable. Cause code: ${err.code}, message: ${err.message}`);
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
          await (subWin as window.Window).destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be focusable. out Cause code: ${exception.code}, message: ${exception.message}`);
        await (subWin as window.Window).destroyWindow();
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5050
     * @tc.name      : testSetWindowFocusable_SubWindow_Promise
     * @tc.desc      : Set whether the window supports switching from the focus window before the click to the window when clicking or other methods are used to focus the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowFocusable_SubWindow_Promise', 0, async () => {
      let caseName = 'testSetWindowFocusable_SubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetWindowFocusable_SubWindow_Promise')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      let isFocusable: boolean = true;
      try {
        await (subWin as window.Window).setWindowFocusable(isFocusable).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the window to be focusable. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be focusable. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5550
     * @tc.name      : testShiftAppWindowFocus_SubWindowWithOptions_SourceWinFocus
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShiftAppWindowFocus_SubWindowWithOptions_SourceWinFocus', 0, async () => {
      let caseName = 'testShiftAppWindowFocus_SubWindowWithOptions_SourceWinFocus';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'SetPreOrie_SubWinOpt',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testShiftAppWindowFocus_SubWindowWithOptions_SourceWinFocus', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/pageTwo");
          await (subWin as window.Window).showWindow();
          await sleep(500)
          await sleep(500)
          await sleep(500)
          let mainWin = windowStage.getMainWindowSync();
          let mainWinId = mainWin.getWindowProperties().id;
          let subWinId = (subWin as window.Window).getWindowProperties().id;
          try {
            await window.shiftAppWindowFocus(subWinId, mainWinId).then(() => {
              console.info(msgStr + 'Succeeded in shifting app window focus');
            }).catch((err: BusinessError) => {
              if (err.code != 801) {
                console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
            });
          } catch (err) {
            if (err.code != 801) {
              console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
          }
          await (subWin as window.Window).destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
          }
        });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5560
     * @tc.name      : testShiftAppWindowFocus_SubWindowWithOptions_SourceWinNotFocus
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testShiftAppWindowFocus_SubWindowWithOptions_SourceWinNotFocus', 0, async () => {
      let caseName = 'testShiftAppWindowFocus_SubWindowWithOptions_SourceWinNotFocus';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'SetPreOrie_SubWinOptTwo',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testShiftAppWindowFocus_SubWindowWithOptions_SourceWinNotFocus', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/pageTwo");
          await (subWin as window.Window).showWindow();
          await sleep(500)
          await sleep(500)
          let mainWin = windowStage.getMainWindowSync();
          let mainWinId = mainWin.getWindowProperties().id;
          let subWinId = (subWin as window.Window).getWindowProperties().id;
          try {
            await window.shiftAppWindowFocus(mainWinId, subWinId).then(() => {
              console.info(msgStr + 'Succeeded in shifting app window focus');
              expect().assertFail();
            }).catch((err: BusinessError) => {
              if (err.code != 801) {
                console.error(msgStr + `Failed to shift app window focus. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002);
              } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
            });
          } catch (err) {
            if (err.code != 801) {
              console.error(msgStr + `Failed to shift app window focus. out catch Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(err))
              expect(err.code).assertEqual(801);
            }
          }
          await (subWin as window.Window).destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
          }
        });
    })


    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5570
     * @tc.name      : testSetWindowFocusable_SubWindowWithOps_Callback
     * @tc.desc      : Set whether the window supports switching from the focus window before the click to the window when clicking or other methods are used to focus the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowFocusable_SubWindowWithOps_Callback', 0, async (done: Function) => {
      let caseName = 'testSetWindowFocusable_SubWindowWithOps_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testSetWindowFocusable_SubWindowWithOps_Callback',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetWindowFocusable_SubWindowWithOps_Callback', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          let isFocusable: boolean = true;
          try {
            (subWin as window.Window).setWindowFocusable(isFocusable, async (err: BusinessError) => {
              const errCode: number = err.code;
              if (errCode) {
                console.error(msgStr + `Failed to set the window to be focusable. Cause code: ${err.code}, message: ${err.message}`);
                await (subWin as window.Window).destroyWindow();
                expect().assertFail();
                done();
                return;
              }
              console.info(msgStr + 'Succeeded in setting the window to be focusable.');
              await (subWin as window.Window).destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + `Failed to set the window to be focusable. out Cause code: ${exception.code}, message: ${exception.message}`);
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
          }
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5580
     * @tc.name      : testSetWindowFocusable_SubWindowWithOps_Promise
     * @tc.desc      : Set whether the window supports switching from the focus window before the click to the window when clicking or other methods are used to focus the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowFocusable_SubWindowWithOps_Promise', 0, async () => {
      let caseName = 'testSetWindowFocusable_SubWindowWithOps_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testSetWindowFocusable_SubWindowWithOps_Promise',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetWindowFocusable_SubWindowWithOps_Promise', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          let isFocusable: boolean = true;
          try {
            await (subWin as window.Window).setWindowFocusable(isFocusable).then(() => {
              console.info(msgStr + 'Succeeded in setting the window to be focusable.');
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set the window to be focusable. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            });
          } catch (exception) {
            console.error(msgStr + `Failed to set the window to be focusable. out Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          }
          await (subWin as window.Window).destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
          }
        });
    })
  })
}
