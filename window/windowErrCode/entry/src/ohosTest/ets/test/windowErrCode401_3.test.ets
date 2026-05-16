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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import pipWindow from '@ohos.PiPWindow';
import { screenshot } from '@kit.ArkUI';
import { bundleManager } from '@kit.AbilityKit';
import floatingBall from '@ohos.window.floatingBall';

export default function windowErrCode401_3() {
  describe('windowErrCode401_3', () => {
    console.log('describe windowErrCode401_3 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.name   testSetWindowTouchablePromiseErrCode401_0100
     * @tc.number testSetWindowTouchablePromiseErrCode401_0100
     * @tc.desc   testSetWindowTouchablePromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTouchablePromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTouchablePromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowTouchablePromiseErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await win!.setWindowTouchable(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowTouchable.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowTouchable. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetWindowTouchableCallbackErrCode401_0100
     * @tc.number testSetWindowTouchableCallbackErrCode401_0100
     * @tc.desc   testSetWindowTouchableCallbackErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTouchableCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTouchableCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowTouchableCallbackErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.setWindowTouchable(null, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setWindowTouchable. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setWindowTouchable.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetRaiseByClickEnabledPromiseErrCode401_0100
     * @tc.number testSetRaiseByClickEnabledPromiseErrCode401_0100
     * @tc.desc   testSetRaiseByClickEnabledPromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetRaiseByClickEnabledPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetRaiseByClickEnabledPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetRaiseByClickEnabledPromiseErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await win!.setRaiseByClickEnabled(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setRaiseByClickEnabled.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setRaiseByClickEnabled. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testSetResizeByDragEnabledCallbackErrCode401_0100
     * @tc.number testSetResizeByDragEnabledCallbackErrCode401_0100
     * @tc.desc   testSetResizeByDragEnabledCallbackErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResizeByDragEnabledCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetResizeByDragEnabledCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWindow = data;
        console.info(caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(caseName + ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
        done()
      });
      expect(!!mainWindow).assertTrue();
      try {
        mainWindow!.setResizeByDragEnabled(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setResizeByDragEnabled. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            expect(err.message!=null).assertTrue();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setResizeByDragEnabled.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetResizeByDragEnabledPromiseErrCode401_0100
     * @tc.number testSetResizeByDragEnabledPromiseErrCode401_0100
     * @tc.desc   testSetResizeByDragEnabledPromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResizeByDragEnabledPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetResizeByDragEnabledPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWindow = data;
        console.info(caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(caseName + ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
        done()
      });
      expect(!!mainWindow).assertTrue();
      try {
        await mainWindow!.setResizeByDragEnabled(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setResizeByDragEnabled.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setResizeByDragEnabled. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetWindowLimitsPromiseErrCode401_0100
     * @tc.number testSetWindowLimitsPromiseErrCode401_0100
     * @tc.desc   testSetWindowLimitsPromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowLimitsPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowLimitsPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowLimitsPromiseErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await win!.setWindowLimits(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowLimits.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowLimits. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testKeepKeyboardOnFocusErrCode401_0100
     * @tc.number testKeepKeyboardOnFocusErrCode401_0100
     * @tc.desc   testKeepKeyboardOnFocusErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testKeepKeyboardOnFocusErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testKeepKeyboardOnFocusErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testKeepKeyboardOnFocusErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.keepKeyboardOnFocus(null);
        console.error(msgStr + 'Succeeded in calling keepKeyboardOnFocus.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testSetWindowDecorVisibleErrCode401_0100
     * @tc.number testSetWindowDecorVisibleErrCode401_0100
     * @tc.desc   testSetWindowDecorVisibleErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowDecorVisibleErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowDecorVisibleErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowDecorVisibleErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.setWindowDecorVisible(null);
        console.error(msgStr + 'Succeeded in calling setWindowDecorVisible.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testSetWindowTitleMoveEnabledErrCode401_0100
     * @tc.number testSetWindowTitleMoveEnabledErrCode401_0100
     * @tc.desc   testSetWindowTitleMoveEnabledErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleMoveEnabledErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitleMoveEnabledErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowTitleMoveEnabledErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.setWindowTitleMoveEnabled(null);
        console.error(msgStr + 'Succeeded in calling setWindowTitleMoveEnabled.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testSetWindowTitlePromiseErrCode401_0100
     * @tc.number testSetWindowTitlePromiseErrCode401_0100
     * @tc.desc   testSetWindowTitlePromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitlePromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitlePromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowTitlePromiseErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await win!.setWindowTitle(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowTitle.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowTitle. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetWindowDecorHeightErrCode401_0100
     * @tc.number testSetWindowDecorHeightErrCode401_0100
     * @tc.desc   testSetWindowDecorHeightErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowDecorHeightErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowDecorHeightErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowDecorHeightErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.setWindowDecorHeight(null);
        console.error(msgStr + 'Succeeded in calling setWindowDecorHeight.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
       console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testSetWindowTitleButtonVisibleErrCode401_0100
     * @tc.number testSetWindowTitleButtonVisibleErrCode401_0100
     * @tc.desc   testSetWindowTitleButtonVisibleErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTitleButtonVisibleErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitleButtonVisibleErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowTitleButtonVisibleErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.setWindowTitleButtonVisible(null, null, null);
        console.error(msgStr + 'Succeeded in calling setWindowTitleButtonVisible.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testOnWindowTitleButtonRectChangeErrCode401_0100
     * @tc.number testOnWindowTitleButtonRectChangeErrCode401_0100
     * @tc.desc   testOnWindowTitleButtonRectChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowTitleButtonRectChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowTitleButtonRectChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnWindowTitleButtonRectChangeErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.on(null, (res: ohosWindow.TitleButtonRect) => {
        });
        console.error(msgStr + 'Succeeded in calling on windowTitleButtonRectChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testOffWindowTitleButtonRectChangeErrCode401_0100
     * @tc.number testOffWindowTitleButtonRectChangeErrCode401_0100
     * @tc.desc   testOffWindowTitleButtonRectChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowTitleButtonRectChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowTitleButtonRectChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffWindowTitleButtonRectChangeErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.off(null, (res: ohosWindow.TitleButtonRect) => {
        });
        console.error(msgStr + 'Succeeded in calling off windowTitleButtonRectChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testSetWindowMaskPromiseErrCode401_0100
     * @tc.number testSetWindowMaskPromiseErrCode401_0100
     * @tc.desc   testSetWindowMaskPromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowMaskPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowMaskPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowMaskPromiseErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await win!.setWindowMask(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowMask.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowMask. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOnWindowRectChangeErrCode401_0100
     * @tc.number testOnWindowRectChangeErrCode401_0100
     * @tc.desc   testOnWindowRectChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowRectChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowRectChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnWindowRectChangeErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.on(null, (res: ohosWindow.RectChangeOptions) => {
        });
        console.error(msgStr + 'Succeeded in calling on WindowRectChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testOffWindowRectChangeErrCode401_0100
     * @tc.number testOffWindowRectChangeErrCode401_0100
     * @tc.desc   testOffWindowRectChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowRectChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowRectChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffWindowRectChangeErrCode401_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.off(null, (res: ohosWindow.RectChangeOptions) => {
        });
        console.error(msgStr + 'Succeeded in calling off WindowRectChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testCreateSubWindowWithOptionsPromiseErrCode401_0100
     * @tc.number testCreateSubWindowWithOptionsPromiseErrCode401_0100
     * @tc.desc   testCreateSubWindowWithOptionsPromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSubWindowWithOptionsPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindowWithOptionsPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWindow = data;
        console.info(caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(caseName + ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
        done()
      });
      expect(!!mainWindow).assertTrue();
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true
      };
      try {
        await mainWindow!.createSubWindowWithOptions(null, options).then(async () => {
          console.info(msgStr + 'Succeeded in calling createSubWindowWithOptions.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call createSubWindowWithOptions. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === undefined) {
          console.info(msgStr + '此设备不支持createSubWindowWithOptions能力.');
        } else {
          expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        }
        done()
      }
    })
     /**
     * @tc.name   testCreateSubWindowWithOptionsPromiseErrCode401_0200
     * @tc.number testCreateSubWindowWithOptionsPromiseErrCode401_0200
     * @tc.desc   testCreateSubWindowWithOptionsPromiseErrCode401_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSubWindowWithOptionsPromiseErrCode401_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindowWithOptionsPromiseErrCode401_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWindow = data;
        console.info(caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(caseName + ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
        done()
      });
      expect(!!mainWindow).assertTrue();
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true
      };
      try {
        await mainWindow!.createSubWindowWithOptions(null, null).then(async () => {
          console.info(msgStr + 'Succeeded in calling createSubWindowWithOptions.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call createSubWindowWithOptions. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === undefined) {
          console.info(msgStr + '此设备不支持createSubWindowWithOptions能力.');
        } else {
          expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        }
        done()
      }
    })
    /**
     * @tc.name   testCreateSubWindowWithOptionsPromiseErrCode401_0300
     * @tc.number testCreateSubWindowWithOptionsPromiseErrCode401_0300
     * @tc.desc   testCreateSubWindowWithOptionsPromiseErrCode401_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSubWindowWithOptionsPromiseErrCode401_0300', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindowWithOptionsPromiseErrCode401_0300";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow: ohosWindow.Window | undefined;
      await windowStage.getMainWindow().then((data) => {
        mainWindow = data;
        console.info(caseName + ' ' + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(caseName + ' ' + 'Failed in obtaining the main window. Cuase: ' + JSON.stringify(err));
        done()
      });
      expect(!!mainWindow).assertTrue();
      let options: ohosWindow.SubWindowOptions = {
        title: 'title',
        decorEnabled: true,
        isModal: true
      };
      try {
        await mainWindow!.createSubWindowWithOptions(undefined, undefined).then(async () => {
          console.info(msgStr + 'Succeeded in calling createSubWindowWithOptions.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call createSubWindowWithOptions. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === undefined) {
          console.info(msgStr + '此设备不支持createSubWindowWithOptions能力.');
        } else {
          expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        }
        done()
      }
    })
    /**
     * @tc.name   testLoadContentByNameCallbackErrCode401_0300
     * @tc.number testLoadContentByNameCallbackErrCode401_0300
     * @tc.desc   testLoadContentByNameCallbackErrCode401_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByNameCallbackErrCode401_0300', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNameCallbackErrCode401_0300";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage!.loadContentByName(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call loadContentByName. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling loadContentByName.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testLoadContentByNameCallbackErrCode401_0400
     * @tc.number testLoadContentByNameCallbackErrCode401_0400
     * @tc.desc   testLoadContentByNameCallbackErrCode401_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByNameCallbackErrCode401_0400', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNameCallbackErrCode401_0400";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage!.loadContentByName(null, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call loadContentByName. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling loadContentByName.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testLoadContentByNamePromiseErrCode401_0200
     * @tc.number testLoadContentByNamePromiseErrCode401_0200
     * @tc.desc   testLoadContentByNamePromiseErrCode401_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByNamePromiseErrCode401_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNamePromiseErrCode401_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await windowStage.loadContentByName(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling loadContentByName.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call loadContentByName. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOnWindowStageEventErrCode401_0100
     * @tc.number testOnWindowStageEventErrCode401_0100
     * @tc.desc   testOnWindowStageEventErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowStageEventErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowStageEventErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage.on(null, (res: ohosWindow.WindowStageEventType) => {
        });
        console.error(msgStr + 'Succeeded in calling on WindowStageEvent.');
        expect().assertFail();
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testOffWindowStageEventErrCode401_0100
     * @tc.number testOffWindowStageEventErrCode401_0100
     * @tc.desc   testOffWindowStageEventErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowStageEventErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowStageEventErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage.off(null, (res: ohosWindow.WindowStageEventType) => {
        });
        console.error(msgStr + 'Succeeded in calling off WindowStageEvent.');
        expect().assertFail();
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testOnWindowStageCloseErrCode401_0100
     * @tc.number testOnWindowStageCloseErrCode401_0100
     * @tc.desc   testOnWindowStageCloseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowStageCloseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowStageCloseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage.on(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling on WindowStageClose.');
        expect().assertFail();
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testOffWindowStageCloseErrCode401_0100
     * @tc.number testOffWindowStageCloseErrCode401_0100
     * @tc.desc   testOffWindowStageCloseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowStageCloseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowStageCloseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage.off(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling off WindowStageClose.');
        expect().assertFail();
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testSetDefaultDensityEnabledErrCode401_0100
     * @tc.number testSetDefaultDensityEnabledErrCode401_0100
     * @tc.desc   testSetDefaultDensityEnabledErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetDefaultDensityEnabledErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetDefaultDensityEnabledErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage.setDefaultDensityEnabled(null);
        console.error(msgStr + 'Succeeded in calling setDefaultDensityEnabled.');
        expect().assertFail();
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testSetCustomDensityErrCode401_0100
     * @tc.number testSetCustomDensityErrCode401_0100
     * @tc.desc   testSetCustomDensityErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetCustomDensityErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetCustomDensityErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        windowStage.setCustomDensity(null)
        console.error(msgStr + 'Succeeded in calling setCustomDensity.');
        expect().assertFail();
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.name   testSetWindowModalPromiseErrCode401_0100
     * @tc.number testSetWindowModalPromiseErrCode401_0100
     * @tc.desc   testSetWindowModalPromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowModalPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      {
        let caseName = "testSetWindowModalPromiseErrCode401_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        try {
          await windowStage.setWindowModal(null).then(async () => {
            console.info(msgStr + 'Succeeded in calling setWindowModal.');
            expect().assertFail();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + 'Failed to call setWindowModal. Cause: ' + JSON.stringify(err));
            if (err.code == 801) {
              console.info(msgStr + '此设备不支持setWindowModal能力.');
            } else {
              expect().assertFail();
            }
          });
          done()
        } catch (exception) {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
          if (exception.code == 801) {
            console.info(msgStr + '此设备不支持setWindowModal能力.');
            done();
          } else {
            expect(exception.code).assertEqual(401);
            expect(exception.message!=null).assertTrue();
            done();
          }
        }
      }
    })
    /**
     * @tc.name   testSetWindowRectAutoSavePromiseErrCode401_0100
     * @tc.number testSetWindowRectAutoSavePromiseErrCode401_0100
     * @tc.desc   testSetWindowRectAutoSavePromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowRectAutoSavePromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowRectAutoSavePromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await windowStage.setWindowRectAutoSave(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowRectAutoSave.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowLimits_ErrorCode_401
     * @tc.number test_setWindowLimits_ErrorCode_401
     * @tc.desc   test_setWindowLimits_ErrorCode_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowLimits_ErrorCode_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let CaseName:string = 'test_setWindowLimits_ErrorCode_401';
      let windowLimits: ohosWindow.WindowLimits = {
        maxWidth: 1500,
        maxHeight: 1000,
        minWidth: 100,
        minHeight: 100
      };
      let subWindow = await windowStage.createSubWindow('test_setWindowLimits_401');
      await sleep(200);

      try {
        let promise = subWindow.setWindowLimits(null,true);
        promise.then(async ()=>{
          console.log(CaseName + ' setWindowLimits success ');
          await subWindow.destroyWindow();
          expect(false).assertTrue();
          done();
        }).catch(async (err:BusinessError)=>{
          console.error(CaseName + ' setWindowLimits failed,casued: err.code '+err.code +' ,err.message: '+err.message);
          await subWindow.destroyWindow();
          expect(false).assertTrue();
          done();
        })
      }catch (err) {
        console.error(CaseName + ' failed,casued: err.code '+err.code +' ,err.message: '+err.message);
        await subWindow.destroyWindow();
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   testPIPCreatewithInvalidParameters
     * @tc.number SUB_BASIC_WMS_CREAT_PIP_WITH_INVAILD_PARAMETERS
     * @tc.desc   验证画中画create接口抛401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPIPCreatewithInvalidParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName: string = 'testPIPCreatewithInvalidParameters';
      let xComponentController: XComponentController = new XComponentController();
      let config: pipWindow.PiPConfiguration = {
        context: context,
        componentController: xComponentController,
        templateType: 10,
      };
      try {
        let promise = pipWindow.create(config);
        promise.then((data: pipWindow.PiPController) => {
          console.log(caseName + ' pipWindow create success');
          expect().assertFail();
          done();
        }).catch((err:BusinessError) => {
          console.error(caseName + ' failed, err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testLoadContentwithInvalidParameters
     * @tc.number SUB_BASIC_WMS_LOAT_CONTENT_WITH_INVAILD_PARAMETERS
     * @tc.desc   验证loadContent接口抛401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentwithInvalidParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName: string = 'testLoadContentwithInvalidParameters';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.loadContent(null, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' loadContent success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetWindowColorSpacewithInvalidParameters
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_COLOR_SPACE_WITH_INVAILD_PARAMETERS
     * @tc.desc   验证setWindowColorSpace接口抛401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowColorSpacewithInvalidParameters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName: string = 'testSetWindowColorSpacewithInvalidParameters';
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setWindowColorSpace(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' setWindowColorSpace success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabledwithInvalidParameters
     * @tc.number SUB_BASIC_WMS_SET_RELATIVE_POSITION_TO_PARENT_WINDOWW_ENABLED_WITH_INVAILD_PARAMETERS
     * @tc.desc   验证setRelativePositionToParentWindowEnabled抛401错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetRelativePositionToParentWindowEnabledwithInvalidParameters', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetRelativePositionToParentWindowEnabledwithInvalidParameters";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      try {
       windowClass.setRelativePositionToParentWindowEnabled(true, null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setRelativePositionToParentWindowEnabled.');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setRelativePositionToParentWindowEnabled. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testCreateWindow_0100
     * @tc.number testCreateWindow_0100
     * @tc.desc   testCreateWindow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateWindow_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateWindow_0100";
      try {
        ohosWindow.createWindow(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' createWindow success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        ohosWindow.createWindow(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' createWindow success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testCreateWindow_0200
     * @tc.number testCreateWindow_0200
     * @tc.desc   testCreateWindow_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateWindow_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateWindow_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        ohosWindow.createWindow(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling createWindow.');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call createWindow. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        ohosWindow.createWindow(undefined).then(async () => {
          console.info(msgStr + 'Succeeded2 in calling createWindow.');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed2 to call createWindow. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testFindWindow_0100
     * @tc.number testFindWindow_0100
     * @tc.desc   testFindWindow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFindWindow_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testFindWindow_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        ohosWindow.findWindow(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        ohosWindow.findWindow('');
        console.info(msgStr + 'Succeeded1');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed1. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
      }
      try {
        ohosWindow.findWindow(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testShiftAppWindowFocus_0100
     * @tc.number testShiftAppWindowFocus_0100
     * @tc.desc   testShiftAppWindowFocus_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testShiftAppWindowFocus_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testShiftAppWindowFocus_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.shiftAppWindowFocus(null, 1);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.shiftAppWindowFocus(undefined, 1);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.shiftAppWindowFocus(1, null);
        console.info(msgStr + 'Succeeded3');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed3. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.shiftAppWindowFocus(1, undefined);
        console.info(msgStr + 'Succeeded4.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed4. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testGetWindowsByCoordinate_0100
     * @tc.number testGetWindowsByCoordinate_0100
     * @tc.desc   testGetWindowsByCoordinate_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowsByCoordinate_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetWindowsByCoordinate_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.getWindowsByCoordinate(null, 1, 1, 1);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.getWindowsByCoordinate(1, null, 1, 1);
        console.info(msgStr + 'Succeeded2');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        // todo: 这里实际报错801
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
        }
      }
      try {
        await ohosWindow.getWindowsByCoordinate(1, 1, null, 1);
        console.info(msgStr + 'Succeeded3');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed3. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
        }
      }
      try {
        await ohosWindow.getWindowsByCoordinate(1, 1, 1, null);
        console.info(msgStr + 'Succeeded4');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed4. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
        }
      }
      try {
        await ohosWindow.getWindowsByCoordinate(undefined, 1, 1, 1);
        console.info(msgStr + 'Succeeded5.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed5. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.getWindowsByCoordinate(1, undefined, 1, 1);
        console.info(msgStr + 'Succeeded6.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed6. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
        }
      }
      try {
        await ohosWindow.getWindowsByCoordinate(1, 1, undefined, 1);
        console.info(msgStr + 'Succeeded7.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed7. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
        }
      }
      try {
        await ohosWindow.getWindowsByCoordinate(1, 1, 1, undefined);
        console.info(msgStr + 'Succeeded8.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed8. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect(exception.code).assertEqual(401);
          expect(exception.message!=null).assertTrue();
          done()
        }
      }
    })

    /**
     * @tc.name   testGetAllWindowLayoutInfo_0100
     * @tc.number testGetAllWindowLayoutInfo_0100
     * @tc.desc   testGetAllWindowLayoutInfo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAllWindowLayoutInfo_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetAllWindowLayoutInfo_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.getAllWindowLayoutInfo(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.getAllWindowLayoutInfo(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetWatermarkImageForAppWindows_0100
     * @tc.number testSetWatermarkImageForAppWindows_0100
     * @tc.desc   testSetWatermarkImageForAppWindows_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWatermarkImageForAppWindows_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWatermarkImageForAppWindows_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.setWatermarkImageForAppWindows(null);
        console.info(msgStr + 'Succeeded');
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
      try {
        await ohosWindow.setWatermarkImageForAppWindows(undefined);
        console.info(msgStr + 'Succeeded2.');
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code === 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testMoveWindowTo_0100
     * @tc.number testMoveWindowTo_0100
     * @tc.desc   testMoveWindowTo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowTo_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowTo_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.moveWindowTo(null, 1);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowTo(1, null);
        console.info(msgStr + 'Succeeded1');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed1. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowTo(undefined, 1);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowTo(1, undefined);
        console.info(msgStr + 'Succeeded3.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed3. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testMoveWindowTo_0200
     * @tc.number testMoveWindowTo_0200
     * @tc.desc   testMoveWindowTo_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowTo_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowTo_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.moveWindowTo(null, 1, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(errCode).assertEqual(401);
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.moveWindowTo(1, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed1, err: ' + JSON.stringify(err));
            expect(errCode).assertEqual(401);
          } else {
            console.log(caseName + ' success1');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed1. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.moveWindowTo(undefined, 1, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(errCode).assertEqual(401);
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.moveWindowTo(1, undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed3, err: ' + JSON.stringify(err));
            expect(errCode).assertEqual(401);
            done();
          } else {
            console.log(caseName + ' success3');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed3. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testMoveWindowToAsync_0100
     * @tc.number testMoveWindowToAsync_0100
     * @tc.desc   testMoveWindowToAsync_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToAsync_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToAsync_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.moveWindowToAsync(null, 1);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowToAsync(1, null);
        console.info(msgStr + 'Succeeded1');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed1. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowToAsync(undefined, 1);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowToAsync(1, undefined);
        console.info(msgStr + 'Succeeded3.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed3. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testMoveWindowToAsync_0200
     * @tc.number testMoveWindowToAsync_0200
     * @tc.desc   testMoveWindowToAsync_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToAsync_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToAsync_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.moveWindowToAsync(null, null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowToAsync(undefined, undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testMoveWindowToGlobal_0100
     * @tc.number testMoveWindowToGlobal_0100
     * @tc.desc   testMoveWindowToGlobal_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToGlobal_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToGlobal_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.moveWindowToGlobal(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowToGlobal(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testMoveWindowToGlobal_0200
     * @tc.number testMoveWindowToGlobal_0200
     * @tc.desc   testMoveWindowToGlobal_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToGlobal_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToGlobal_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.moveWindowToGlobal(null, null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowToGlobal(undefined, undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testMoveWindowToGlobalDisplay_0100
     * @tc.number testMoveWindowToGlobalDisplay_0100
     * @tc.desc   testMoveWindowToGlobalDisplay_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToGlobalDisplay_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToGlobalDisplay_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.moveWindowToGlobalDisplay(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveWindowToGlobalDisplay(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testResize_0100
     * @tc.number testResize_0100
     * @tc.desc   testResize_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResize_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testResize_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.resize(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.resize(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testResize_0200
     * @tc.number testResize_0200
     * @tc.desc   testResize_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResize_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testResize_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.resize(null, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.resize(undefined, undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResizeAsync_0100
     * @tc.number testResizeAsync_0100
     * @tc.desc   testResizeAsync_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResizeAsync_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testResizeAsync_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.resizeAsync(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.resizeAsync(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetRelativePositionToParentWindowEnabled_0100
     * @tc.number testSetRelativePositionToParentWindowEnabled_0100
     * @tc.desc   testSetRelativePositionToParentWindowEnabled_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetRelativePositionToParentWindowEnabled_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetRelativePositionToParentWindowEnabled_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabled_0100')
      try {
        await windowClass.setRelativePositionToParentWindowEnabled(true, ohosWindow.WindowAnchor.TOP_START, null, null);
        console.info(msgStr + 'Succeeded');
        await windowClass.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
      try {
        await windowClass.setRelativePositionToParentWindowEnabled(true, ohosWindow.WindowAnchor.TOP_START, undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        await windowClass.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        await windowClass.destroyWindow()
        done()
      }
    })

    /**
     * @tc.name   testSetSystemBarEnable_0100
     * @tc.number testSetSystemBarEnable_0100
     * @tc.desc   testSetSystemBarEnable_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSystemBarEnable_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSystemBarEnable_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setSystemBarEnable(null);
        console.info(msgStr + 'Succeeded');
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect().assertFail();
        done();
      }
      try {
        await windowClass.setSystemBarEnable(undefined);
        console.info(msgStr + 'Succeeded2.');
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testSetSystemBarEnable_0200
     * @tc.number testSetSystemBarEnable_0200
     * @tc.desc   testSetSystemBarEnable_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSystemBarEnable_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSystemBarEnable_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setSystemBarEnable(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
      try {
        windowClass.setSystemBarEnable(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSetWindowSystemBarEnable_0100
     * @tc.number testSetWindowSystemBarEnable_0100
     * @tc.desc   testSetWindowSystemBarEnable_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowSystemBarEnable_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowSystemBarEnable_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setWindowSystemBarEnable(null);
        console.info(msgStr + 'Succeeded');
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect().assertFail();
        done();
      }
      try {
        await windowClass.setWindowSystemBarEnable(undefined);
        console.info(msgStr + 'Succeeded2.');
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSetWindowSystemBarEnable_0200
     * @tc.number testSetWindowSystemBarEnable_0200
     * @tc.desc   testSetWindowSystemBarEnable_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowSystemBarEnable_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowSystemBarEnable_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setWindowSystemBarEnable(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowSystemBarEnable(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSetSpecificSystemBarEnabled_0100
     * @tc.number testSetSpecificSystemBarEnabled_0100
     * @tc.desc   testSetSpecificSystemBarEnabled_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSpecificSystemBarEnabled_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSpecificSystemBarEnabled_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setSpecificSystemBarEnabled(null, true, true);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setSpecificSystemBarEnabled(undefined, true, true);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetSystemBarProperties_0200
     * @tc.number testSetSystemBarProperties_0200
     * @tc.desc   testSetSystemBarProperties_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSystemBarProperties_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSystemBarProperties_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setSystemBarProperties(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
      try {
        windowClass.setSystemBarProperties(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSetSystemBarProperties_0100
     * @tc.number testSetSystemBarProperties_0100
     * @tc.desc   testSetSystemBarProperties_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSystemBarProperties_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSystemBarProperties_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setSystemBarProperties(null);
        console.info(msgStr + 'Succeeded');
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect().assertFail();
        done();
      }
      try {
        await windowClass.setSystemBarProperties(undefined);
        console.info(msgStr + 'Succeeded2.');
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testSetWindowSystemBarProperties_0200
     * @tc.number testSetWindowSystemBarProperties_0200
     * @tc.desc   testSetWindowSystemBarProperties_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowSystemBarProperties_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowSystemBarProperties_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setWindowSystemBarProperties(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success');
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowSystemBarProperties(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success2');
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCreate_0400
     * @tc.number testCreate_0400
     * @tc.desc   testCreate_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreate_0400', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreate_0400";
      try {
        ohosWindow.create(null, 'id', ohosWindow.WindowType.TYPE_STATUS_BAR, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
          } else {
            console.log(caseName + ' create success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1001);
        expect(err.message!=null).assertTrue();
      }
      try {
        ohosWindow.create(undefined, 'id', ohosWindow.WindowType.TYPE_STATUS_BAR, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
          } else {
            console.log(caseName + ' create success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1001);
        expect(err.message!=null).assertTrue();
      }
      try {
        ohosWindow.create(context, '', ohosWindow.WindowType.TYPE_STATUS_BAR, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed3, err: ' + JSON.stringify(err));
          } else {
            console.log(caseName + ' create success3');
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed3. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
      }
      try {
        ohosWindow.create(context, null, ohosWindow.WindowType.TYPE_STATUS_BAR, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed4, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
          } else {
            console.log(caseName + ' create success4');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed4. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        ohosWindow.create(context, undefined, ohosWindow.WindowType.TYPE_STATUS_BAR, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed5, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
            done()
          } else {
            console.log(caseName + ' create success5');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed5. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testFind_0100
     * @tc.number testFind_0100
     * @tc.desc   testFind_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFind_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testFind_0100";
      try {
        ohosWindow.find(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        ohosWindow.find('', async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed1, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
          } else {
            console.log(caseName + ' success1');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed1. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        ohosWindow.find(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testFind_0200
     * @tc.number testFind_0200
     * @tc.desc   testFind_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFind_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testFind_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.find(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.find('');
        console.info(msgStr + 'Succeeded1');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed1. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1001);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.find(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testMoveTo_0100
     * @tc.number testMoveTo_0100
     * @tc.desc   testMoveTo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveTo_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveTo_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.moveTo(null, 1);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveTo(1, null);
        console.info(msgStr + 'Succeeded2');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveTo(undefined, 1);
        console.info(msgStr + 'Succeeded3.');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed3. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.moveTo(1, undefined);
        console.info(msgStr + 'Succeeded4.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed4. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testMoveTo_0200
     * @tc.number testMoveTo_0200
     * @tc.desc   testMoveTo_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveTo_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveTo_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.moveTo(null, 1, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(errCode).assertEqual(1003);
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.moveTo(1, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed1, err: ' + JSON.stringify(err));
            expect(errCode).assertEqual(1003);
          } else {
            console.log(caseName + ' success1');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed1. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.moveTo(1, undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(errCode).assertEqual(1003);
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.moveTo(undefined, 1, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed3, err: ' + JSON.stringify(err));
            expect(errCode).assertEqual(1003);
            done();
          } else {
            console.log(caseName + ' success3');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed3. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResetSize_0100
     * @tc.number testResetSize_0100
     * @tc.desc   testResetSize_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetSize_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testResetSize_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.resetSize(null, null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.resetSize(undefined, undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testResetSize_0200
     * @tc.number testResetSize_0200
     * @tc.desc   testResetSize_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetSize_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testResetSize_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.resetSize(null, null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
            done();
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.resetSize(undefined, undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContent_0300
     * @tc.number testLoadContent_0300
     * @tc.desc   testLoadContent_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0300', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0300";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.loadContent(null,  async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContent('',  async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed1, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
          } else {
            console.log(caseName + ' success1');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed1. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContent(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContent_0400
     * @tc.number testLoadContent_0400
     * @tc.desc   testLoadContent_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContent_0400', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContent_0400";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.loadContent(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.loadContent('');
        console.info(msgStr + 'Succeeded1');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed1. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.loadContent(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testLoadContentByName_0200
     * @tc.number testLoadContentByName_0200
     * @tc.desc   testLoadContentByName_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByName_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByName_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.loadContentByName(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContentByName('', async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed1, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
          } else {
            console.log(caseName + ' success1');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed1. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContentByName(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetBackgroundColor_0100
     * @tc.number testSetBackgroundColor_0100
     * @tc.desc   testSetBackgroundColor_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetBackgroundColor_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetBackgroundColor_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      try {
        await windowClass.setBackgroundColor(null);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setBackgroundColor('');
        console.info(msgStr + 'Succeeded1');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed1. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await windowClass.setBackgroundColor(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSetBackgroundColor_0200
     * @tc.number testSetBackgroundColor_0200
     * @tc.desc   testSetBackgroundColor_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetBackgroundColor_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetBackgroundColor_0200";
      let windowClass = windowStage.getMainWindowSync()
      try {
        windowClass.setBackgroundColor(null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.setBackgroundColor('', async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed1, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
          } else {
            console.log(caseName + ' success1');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed1. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.setBackgroundColor(undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1003);
            done();
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(1003);
        expect(err.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testLoadContentByName_0100
     * @tc.number testLoadContentByName_0100
     * @tc.desc   testLoadContentByName_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByName_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByName_0100";
      let windowClass = windowStage.getMainWindowSync()
      let storage: LocalStorage = new LocalStorage();
      try {
        windowClass.loadContentByName('', storage, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
          } else {
            console.log(caseName + ' success');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContentByName(null, storage, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed1, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
          } else {
            console.log(caseName + ' success1');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed1. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContentByName(undefined, storage, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
          } else {
            console.log(caseName + ' success2');
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed2. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect(err.code).assertEqual(401);
        expect(err.message!=null).assertTrue();
      }
      try {
        windowClass.loadContentByName('pages/Index', null, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed3, err: ' + JSON.stringify(err));
            expect().assertFail();
          } else {
            console.log(caseName + ' success3');
          }
        });
      } catch (err) {
        console.error(caseName + ' failed3. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
      }
      try {
        windowClass.loadContentByName('pages/Index', undefined, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName + ' failed4, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            console.log(caseName + ' success4');
            done();
          }
        });
      } catch (err) {
        console.error(caseName + ' failed4. Caused: err.code '+ err.code +' ,err.message: '+err.message);
        expect().assertFail();
        done();
      }
    })

     /**
     * @tc.name testGetLastWindow_0100
     * @tc.number testGetLastWindow_0100
     * @tc.desc testGetLastWindow_0100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testGetLastWindow_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetLastWindow_0100";
      ohosWindow.getLastWindow(null, (err: BusinessError) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(caseName + ' failed, err: ' + JSON.stringify(err));
          expect(errCode).assertEqual(1300002);
          done();
        } else {
          console.log(caseName + ' success');
          expect().assertFail();
          done();
        }
      });
      ohosWindow.getLastWindow(undefined, (err: BusinessError) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(caseName + ' failed2, err: ' + JSON.stringify(err));
          expect(errCode).assertEqual(1300002);
          done();
        } else {
          console.log(caseName + ' success2');
          expect().assertFail();
          done();
        }
      });
    })

    /**
     * @tc.name   testGetLastWindow_0200
     * @tc.number testGetLastWindow_0200
     * @tc.desc   testGetLastWindow_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastWindow_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetLastWindow_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.getLastWindow(null);
        console.info(msgStr + 'Succeeded');
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.getLastWindow(undefined);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testCreate_0300
     * @tc.number testCreate_0300
     * @tc.desc   testCreate_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreate_0300', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreate_0300";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.create(null, 'id', ohosWindow.WindowType.TYPE_STATUS_BAR);
        console.info(msgStr + 'Succeeded');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(1001);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.create(undefined, 'id', ohosWindow.WindowType.TYPE_STATUS_BAR);
        console.info(msgStr + 'Succeeded2.');
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(1001);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.create(context, '', ohosWindow.WindowType.TYPE_STATUS_BAR);
        console.info(msgStr + 'Succeeded3');
      } catch (exception) {
        console.error(msgStr + 'Failed3. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(0);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.create(context, null, ohosWindow.WindowType.TYPE_STATUS_BAR);
        console.info(msgStr + 'Succeeded4');
      } catch (exception) {
        console.error (msgStr + 'Failed4. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
      }
      try {
        await ohosWindow.create(context, undefined, ohosWindow.WindowType.TYPE_STATUS_BAR);
        console.info(msgStr + 'Succeeded5');
        expect().assertFail();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed5. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(1003);
        expect(exception.message!=null).assertTrue();
        done();
      }
    })

    /**
     * @tc.name testShowWindow_0100
     * @tc.number testShowWindow_0100
     * @tc.desc testShowWindow_0100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL3
     */
    it('testShowWindow_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testShowWindow_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync()
      let options: ohosWindow.ShowWindowOptions|null = null;
      try {
        windowClass.showWindow(options).then(() => {
          console.info(caseName+'Succeeded in showing window');
          done();
        }).catch((err: BusinessError) => {
          console.error(caseName+`Failed to show window. Error code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let options1: ohosWindow.ShowWindowOptions|undefined = undefined;
        windowClass.showWindow(options1).then(() => {
          console.info(caseName+'Succeeded in showing 2 window');
          done();
        }).catch((err: BusinessError) => {
          console.error(caseName+`Failed to show window 2. Error code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed2. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}