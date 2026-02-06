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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
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
       console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.number    : test_setWindowLimits_ErrorCode_401
     * @tc.name      : test_setWindowLimits_ErrorCode_401
     * @tc.desc      : test_setWindowLimits_ErrorCode_401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_CREAT_PIP_WITH_INVAILD_PARAMETERS
     * @tc.name      : testPIPCreatewithInvalidParameters
     * @tc.desc      : 验证画中画create接口抛401错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_LOAT_CONTENT_WITH_INVAILD_PARAMETERS
     * @tc.name      : testLoadContentwithInvalidParameters
     * @tc.desc      : 验证loadContent接口抛401错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_COLOR_SPACE_WITH_INVAILD_PARAMETERS
     * @tc.name      : testSetWindowColorSpacewithInvalidParameters
     * @tc.desc      : 验证setWindowColorSpace接口抛401错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
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
     * @tc.number     : SUB_BASIC_WMS_SET_RELATIVE_POSITION_TO_PARENT_WINDOWW_ENABLED_WITH_INVAILD_PARAMETERS
     * @tc.name       : testSetRelativePositionToParentWindowEnabledwithInvalidParameters
     * @tc.desc       : 验证setRelativePositionToParentWindowEnabled抛401错误码
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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

  })
}