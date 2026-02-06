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
export default function windowErrCode401_1() {
  describe('windowErrCode401_1', () => {
    console.log('describe windowErrCode401_1 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.number     : testShiftAppWindowFocusPromiseErrCode401_0100
     * @tc.name       : testShiftAppWindowFocusPromiseErrCode401_0100
     * @tc.desc       : testShiftAppWindowFocusPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testShiftAppWindowFocusPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testShiftAppWindowFocusPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.shiftAppWindowFocus(null, null).then(async () => {
          console.info(msgStr + 'Succeeded in calling shiftAppWindowFocus.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call shiftAppWindowFocus. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call shiftAppWindowFocus. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testGetWindowsByCoordinatePromiseErrCode401_0100
     * @tc.name       : testGetWindowsByCoordinatePromiseErrCode401_0100
     * @tc.desc       : testGetWindowsByCoordinatePromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetWindowsByCoordinatePromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetWindowsByCoordinatePromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.getWindowsByCoordinate(null, null).then(async () => {
          console.info(msgStr + 'Succeeded in calling getWindowsByCoordinate.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call getWindowsByCoordinate. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call getWindowsByCoordinate. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testGetAllWindowLayoutInfoPromiseErrCode401_0100
     * @tc.name       : testGetAllWindowLayoutInfoPromiseErrCode401_0100
     * @tc.desc       : testGetAllWindowLayoutInfoPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetAllWindowLayoutInfoPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetAllWindowLayoutInfoPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        await ohosWindow.getAllWindowLayoutInfo(null).then(async (res: Array<ohosWindow.WindowLayoutInfo>) => {
          console.info(msgStr + 'Succeeded in calling getAllWindowLayoutInfo.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call getAllWindowLayoutInfo. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call getAllWindowLayoutInfo. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testMoveWindowToPromiseErrCode401_0100
     * @tc.name       : testMoveWindowToPromiseErrCode401_0100
     * @tc.desc       : testMoveWindowToPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testMoveWindowToPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testMoveWindowToPromiseErrCode401_0100",
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
        await win!.moveWindowTo(null, null).then(async () => {
          console.info(msgStr + 'Succeeded in calling moveWindowTo.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call moveWindowTo. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        await win!.destroyWindow()
        console.error(msgStr + 'Failed to set the call moveWindowTo. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testMoveWindowToCallbackErrCode401_0100
     * @tc.name       : testMoveWindowToCallbackErrCode401_0100
     * @tc.desc       : testMoveWindowToCallbackErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testMoveWindowToCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testMoveWindowToCallbackErrCode401_0100",
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
        win!.moveWindowTo(null, null, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call moveWindowTo. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling moveWindowTo.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call moveWindowTo. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testMoveWindowToAsyncPromiseErrCode401_0100
     * @tc.name       : testMoveWindowToAsyncPromiseErrCode401_0100
     * @tc.desc       : testMoveWindowToAsyncPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testMoveWindowToAsyncPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToAsyncPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testMoveWindowToAsyncPromiseErrCode401_0100",
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
        await win!.moveWindowToAsync(null, null).then(async () => {
          console.info(msgStr + 'Succeeded in calling moveWindowToAsync.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call moveWindowToAsync. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        await win!.destroyWindow()
        console.error(msgStr + 'Failed to set the call moveWindowToAsync. Cause:' + JSON.stringify(exception)+ JSON.stringify(exception.message));
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testMoveWindowToGlobalPromiseErrCode401_0100
     * @tc.name       : testMoveWindowToGlobalPromiseErrCode401_0100
     * @tc.desc       : testMoveWindowToGlobalPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testMoveWindowToGlobalPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToGlobalPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testMoveWindowToGlobalPromiseErrCode401_0100",
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
        await win!.moveWindowToGlobal(null, null).then(async () => {
          console.info(msgStr + 'Succeeded in calling moveWindowToGlobal.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call moveWindowToGlobal. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        await win!.destroyWindow()
        console.error(msgStr + 'Failed to set the call moveWindowToGlobal. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowLayoutFullScreenCallbackErrCode401_0100
     * @tc.name       : testSetWindowLayoutFullScreenCallbackErrCode401_0100
     * @tc.desc       : testSetWindowLayoutFullScreenCallbackErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowLayoutFullScreenCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowLayoutFullScreenCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testMoveWindowToCallbackErrCode401_0100",
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
        win!.setWindowLayoutFullScreen (null, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setWindowLayoutFullScreen. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setWindowLayoutFullScreen.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call setWindowLayoutFullScreen. Cause:' + JSON.stringify(exception.code)+ `message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowLayoutFullScreenPromiseErrCode401_0100
     * @tc.name       : testSetWindowLayoutFullScreenPromiseErrCode401_0100
     * @tc.desc       : testSetWindowLayoutFullScreenPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowLayoutFullScreenPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowLayoutFullScreenPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testMoveWindowToGlobalPromiseErrCode401_0100",
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
        await win!.setWindowLayoutFullScreen(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowLayoutFullScreen.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowLayoutFullScreen. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed . Cause: ' + JSON.stringify(exception.code)+`message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowSystemBarEnableCallbackErrCode401_0100
     * @tc.name       : testSetWindowSystemBarEnableCallbackErrCode401_0100
     * @tc.desc       : testSetWindowSystemBarEnableCallbackErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowSystemBarEnableCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowSystemBarEnableCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowSystemBarEnableCallbackErrCode401_0100",
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
        win!.setWindowSystemBarEnable([undefined], async (err: BusinessError) => {
          await win!.destroyWindow()
          console.error(msgStr + 'Failed to call setWindowSystemBarEnable xx. Cause:' + JSON.stringify(err));
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setWindowSystemBarEnable. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setWindowSystemBarEnable.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call setWindowSystemBarEnable. Cause:' + JSON.stringify(exception.code)+`message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowSystemBarEnablePromiseErrCode401_0100
     * @tc.name       : testSetWindowSystemBarEnablePromiseErrCode401_0100
     * @tc.desc       : testSetWindowSystemBarEnablePromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowSystemBarEnablePromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowSystemBarEnablePromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowSystemBarEnablePromiseErrCode401_0100",
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
        await win!.setWindowSystemBarEnable([undefined]).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowSystemBarEnable.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowSystemBarEnable. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+`message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testSetSpecificSystemBarEnabledPromiseErrCode401_0100
     * @tc.name       : testSetSpecificSystemBarEnabledPromiseErrCode401_0100
     * @tc.desc       : testSetSpecificSystemBarEnabledPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetSpecificSystemBarEnabledPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSpecificSystemBarEnabledPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetSpecificSystemBarEnabledPromiseErrCode401_0100",
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
        await win!.setSpecificSystemBarEnabled(null, null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setSpecificSystemBarEnabled.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setSpecificSystemBarEnabled. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        await win!.destroyWindow()
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+`message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testSetGestureBackEnabledPromiseErrCode401_0100
     * @tc.name       : testSetGestureBackEnabledPromiseErrCode401_0100
     * @tc.desc       : testSetGestureBackEnabledPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetGestureBackEnabledPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetGestureBackEnabledPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetGestureBackEnabledPromiseErrCode401_0100",
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
        await win!.setGestureBackEnabled(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setGestureBackEnabled.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setGestureBackEnabled. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        await win!.destroyWindow()
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+`message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testSetPreferredOrientationPromiseErrCode401_0100
     * @tc.name       : testSetPreferredOrientationPromiseErrCode401_0100
     * @tc.desc       : testSetPreferredOrientationPromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetPreferredOrientationPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetPreferredOrientationPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetPreferredOrientationPromiseErrCode401_0100",
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
        await win!.setPreferredOrientation(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setPreferredOrientation.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setPreferredOrientation. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        await win!.destroyWindow()
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+`message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testSetPreferredOrientationCallbackErrCode401_0100
     * @tc.name       : testSetPreferredOrientationCallbackErrCode401_0100
     * @tc.desc       : testSetPreferredOrientationCallbackErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetPreferredOrientationCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetPreferredOrientationCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetPreferredOrientationCallbackErrCode401_0100",
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
        win!.setPreferredOrientation(null, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setPreferredOrientation. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setPreferredOrientation.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+`message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testLoadContentByNameCallbackErrCode401_0200
     * @tc.name       : testLoadContentByNameCallbackErrCode401_0200
     * @tc.desc       : testLoadContentByNameCallbackErrCode401_0200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testLoadContentByNameCallbackErrCode401_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNameCallbackErrCode401_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testLoadContentByNameCallbackErrCode401_0200",
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
        win!.loadContentByName(null, null, async (err: BusinessError) => {
          await win!.destroyWindow()
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
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+`message:${exception.message}`);
        await win!.destroyWindow()
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testLoadContentByNamePromiseErrCode401_0100
     * @tc.name       : testLoadContentByNamePromiseErrCode401_0100
     * @tc.desc       : testLoadContentByNamePromiseErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testLoadContentByNamePromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNamePromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testLoadContentByNamePromiseErrCode401_0100",
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
        let storage: LocalStorage = new LocalStorage();
        await win!.loadContentByName(null, storage).then(async () => {
          console.info(msgStr + 'Succeeded in calling loadContentByName.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call loadContentByName. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await win!.destroyWindow()
        done()
      } catch (exception) {
        await win!.destroyWindow()
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+`message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.number     : testOnWindowSizeChangeErrCode401_0100
     * @tc.name       : testOnWindowSizeChangeErrCode401_0100
     * @tc.desc       : testOnWindowSizeChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnWindowSizeChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowSizeChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnWindowSizeChangeErrCode401_0100",
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
        const callback = (res: ohosWindow.Size) => {
        };
        win!.on(null, callback);
        console.error(msgStr + 'Succeeded in calling on windowSizeChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+`message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOffWindowSizeChangeErrCode401_0100
     * @tc.name       : testOffWindowSizeChangeErrCode401_0100
     * @tc.desc       : testOffWindowSizeChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOffWindowSizeChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowSizeChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffWindowSizeChangeErrCode401_0100",
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
        win!.off(null, (res: ohosWindow.Size) => {
        });
        console.error(msgStr + 'Succeeded in calling on windowSizeChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+`message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOnAvoidAreaChangeErrCode401_0100
     * @tc.name       : testOnAvoidAreaChangeErrCode401_0100
     * @tc.desc       : testOnAvoidAreaChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnAvoidAreaChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnAvoidAreaChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnAvoidAreaChangeErrCode401_0100",
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
        win!.on(null, (res: ohosWindow.AvoidAreaOptions) => {
        });
        console.error(msgStr + 'Succeeded in calling on avoidAreaChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+`message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOffAvoidAreaChangeErrCode401_0100
     * @tc.name       : testOffAvoidAreaChangeErrCode401_0100
     * @tc.desc       : testOffAvoidAreaChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOffAvoidAreaChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffAvoidAreaChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffAvoidAreaChangeErrCode401_0100",
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
        win!.off(null, (res: ohosWindow.AvoidAreaOptions) => {
        });
        console.error(msgStr + 'Succeeded in calling off avoidAreaChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+`message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOnKeyboardHeightChangeErrCode401_0100
     * @tc.name       : testOnKeyboardHeightChangeErrCode401_0100
     * @tc.desc       : testOnKeyboardHeightChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnKeyboardHeightChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnKeyboardHeightChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnKeyboardHeightChangeErrCode401_0100",
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
        win!.on(null, (res: number) => {
        });
        console.error(msgStr + 'Succeeded in calling on keyboardHeightChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+`message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
    /**
     * @tc.number     : testOffKeyboardHeightChangeErrCode401_0100
     * @tc.name       : testOffKeyboardHeightChangeErrCode401_0100
     * @tc.desc       : testOffKeyboardHeightChangeErrCode401_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOffKeyboardHeightChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffKeyboardHeightChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffKeyboardHeightChangeErrCode401_0100",
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
        win!.off(null, (res: number) => {
        });
        console.error(msgStr + 'Succeeded in calling off keyboardHeightChange.');
        expect().assertFail();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+`message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message!=null).assertTrue();
        await win!.destroyWindow()
        console.log(msgStr + 'end.');
        done()
      }
    })
  })
}