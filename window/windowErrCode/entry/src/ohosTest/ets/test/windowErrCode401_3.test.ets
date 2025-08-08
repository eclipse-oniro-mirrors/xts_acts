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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
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
     * @tc.number     : testSetWindowTouchablePromiseErrCode401_0100
     * @tc.name       : testSetWindowTouchablePromiseErrCode401_0100
     * @tc.desc       : testSetWindowTouchablePromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to set the call setWindowTouchable. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowTouchableCallbackErrCode401_0100
     * @tc.name       : testSetWindowTouchableCallbackErrCode401_0100
     * @tc.desc       : testSetWindowTouchableCallbackErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to call setWindowTouchable. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testSetRaiseByClickEnabledPromiseErrCode401_0100
     * @tc.name       : testSetRaiseByClickEnabledPromiseErrCode401_0100
     * @tc.desc       : testSetRaiseByClickEnabledPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setRaiseByClickEnabled. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testSetResizeByDragEnabledCallbackErrCode401_0100
     * @tc.name       : testSetResizeByDragEnabledCallbackErrCode401_0100
     * @tc.desc       : testSetResizeByDragEnabledCallbackErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setResizeByDragEnabled.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call setResizeByDragEnabled. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testSetResizeByDragEnabledPromiseErrCode401_0100
     * @tc.name       : testSetResizeByDragEnabledPromiseErrCode401_0100
     * @tc.desc       : testSetResizeByDragEnabledPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setResizeByDragEnabled. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowLimitsPromiseErrCode401_0100
     * @tc.name       : testSetWindowLimitsPromiseErrCode401_0100
     * @tc.desc       : testSetWindowLimitsPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to set the call setWindowLimits. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testKeepKeyboardOnFocusErrCode401_0100
     * @tc.name       : testKeepKeyboardOnFocusErrCode401_0100
     * @tc.desc       : testKeepKeyboardOnFocusErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call keepKeyboardOnFocus. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowDecorVisibleErrCode401_0100
     * @tc.name       : testSetWindowDecorVisibleErrCode401_0100
     * @tc.desc       : testSetWindowDecorVisibleErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call setWindowDecorVisible. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowTitleMoveEnabledErrCode401_0100
     * @tc.name       : testSetWindowTitleMoveEnabledErrCode401_0100
     * @tc.desc       : testSetWindowTitleMoveEnabledErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call setWindowTitleMoveEnabled. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowTitlePromiseErrCode401_0100
     * @tc.name       : testSetWindowTitlePromiseErrCode401_0100
     * @tc.desc       : testSetWindowTitlePromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to set the call setWindowTitle. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowDecorHeightErrCode401_0100
     * @tc.name       : testSetWindowDecorHeightErrCode401_0100
     * @tc.desc       : testSetWindowDecorHeightErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call setWindowDecorHeight. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowTitleButtonVisibleErrCode401_0100
     * @tc.name       : testSetWindowTitleButtonVisibleErrCode401_0100
     * @tc.desc       : testSetWindowTitleButtonVisibleErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call setWindowTitleButtonVisible. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOnWindowTitleButtonRectChangeErrCode401_0100
     * @tc.name       : testOnWindowTitleButtonRectChangeErrCode401_0100
     * @tc.desc       : testOnWindowTitleButtonRectChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call on windowTitleButtonRectChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOffWindowTitleButtonRectChangeErrCode401_0100
     * @tc.name       : testOffWindowTitleButtonRectChangeErrCode401_0100
     * @tc.desc       : testOffWindowTitleButtonRectChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call off windowTitleButtonRectChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowMaskPromiseErrCode401_0100
     * @tc.name       : testSetWindowMaskPromiseErrCode401_0100
     * @tc.desc       : testSetWindowMaskPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to set the call setWindowMask. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testOnWindowRectChangeErrCode401_0100
     * @tc.name       : testOnWindowRectChangeErrCode401_0100
     * @tc.desc       : testOnWindowRectChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call on WindowRectChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOffWindowRectChangeErrCode401_0100
     * @tc.name       : testOffWindowRectChangeErrCode401_0100
     * @tc.desc       : testOffWindowRectChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call off WindowRectChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testCreateSubWindowWithOptionsPromiseErrCode401_0100
     * @tc.name       : testCreateSubWindowWithOptionsPromiseErrCode401_0100
     * @tc.desc       : testCreateSubWindowWithOptionsPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call createSubWindowWithOptions. Cause:' +
        JSON.stringify(exception));
        if (exception.code === undefined) {
          console.info(msgStr + '此设备不支持createSubWindowWithOptions能力.');
        } else {
          expect(exception.code).assertEqual(401);
        }
        done()
      }
    })
    /**
     * @tc.number     : testLoadContentByNameCallbackErrCode401_0300
     * @tc.name       : testLoadContentByNameCallbackErrCode401_0300
     * @tc.desc       : testLoadContentByNameCallbackErrCode401_0300
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to call loadContentByName. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testLoadContentByNameCallbackErrCode401_0400
     * @tc.name       : testLoadContentByNameCallbackErrCode401_0400
     * @tc.desc       : testLoadContentByNameCallbackErrCode401_0400
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to call loadContentByName. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testLoadContentByNamePromiseErrCode401_0200
     * @tc.name       : testLoadContentByNamePromiseErrCode401_0200
     * @tc.desc       : testLoadContentByNamePromiseErrCode401_0200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to set the call loadContentByName. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number     : testOnWindowStageEventErrCode401_0100
     * @tc.name       : testOnWindowStageEventErrCode401_0100
     * @tc.desc       : testOnWindowStageEventErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call on WindowStageEvent. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOffWindowStageEventErrCode401_0100
     * @tc.name       : testOffWindowStageEventErrCode401_0100
     * @tc.desc       : testOffWindowStageEventErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call off WindowStageEvent. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOnWindowStageCloseErrCode401_0100
     * @tc.name       : testOnWindowStageCloseErrCode401_0100
     * @tc.desc       : testOnWindowStageCloseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call on WindowStageClose. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOffWindowStageCloseErrCode401_0100
     * @tc.name       : testOffWindowStageCloseErrCode401_0100
     * @tc.desc       : testOffWindowStageCloseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call off WindowStageClose. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testSetDefaultDensityEnabledErrCode401_0100
     * @tc.name       : testSetDefaultDensityEnabledErrCode401_0100
     * @tc.desc       : testSetDefaultDensityEnabledErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call setDefaultDensityEnabled. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testSetCustomDensityErrCode401_0100
     * @tc.name       : testSetCustomDensityErrCode401_0100
     * @tc.desc       : testSetCustomDensityErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.log(msgStr + 'Failed to call setCustomDensity. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(401);
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowModalPromiseErrCode401_0100
     * @tc.name       : testSetWindowModalPromiseErrCode401_0100
     * @tc.desc       : testSetWindowModalPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
          console.error(msgStr + 'Failed to set the call setWindowModal. Cause:' + JSON.stringify(exception));
          if (exception.code == 801) {
            console.info(msgStr + '此设备不支持setWindowModal能力.');
            done();
          } else {
            expect(exception.code).assertEqual(401);
            done();
          }
        }
      }
    })
    /**
     * @tc.number     : testSetWindowRectAutoSavePromiseErrCode401_0100
     * @tc.name       : testSetWindowRectAutoSavePromiseErrCode401_0100
     * @tc.desc       : testSetWindowRectAutoSavePromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
        console.error(msgStr + 'Failed to set the call setWindowRectAutoSave. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
  })
}