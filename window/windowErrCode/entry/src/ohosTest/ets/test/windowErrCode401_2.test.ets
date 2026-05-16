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
export default function windowErrCode401_2() {
  describe('windowErrCode401_2', () => {
    console.log('describe windowErrCode401_2 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.name   testOnTouchOutsideErrCode401_0100
     * @tc.number testOnTouchOutsideErrCode401_0100
     * @tc.desc   testOnTouchOutsideErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnTouchOutsideErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnTouchOutsideErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnTouchOutsideErrCode401_0100",
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
        win!.on(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling on touchOutside.');
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
     * @tc.name   testOffTouchOutsideErrCode401_0100
     * @tc.number testOffTouchOutsideErrCode401_0100
     * @tc.desc   testOffTouchOutsideErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffTouchOutsideErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffTouchOutsideErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffTouchOutsideErrCode401_0100",
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
        win!.off(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling off touchOutside.');
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
     * @tc.name   testOnDisplayIdChangeErrCode401_0100
     * @tc.number testOnDisplayIdChangeErrCode401_0100
     * @tc.desc   testOnDisplayIdChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDisplayIdChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnDisplayIdChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnDisplayIdChangeErrCode401_0100",
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
        console.error(msgStr + 'Succeeded in calling on displayIdChange.');
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
     * @tc.name   testOffDisplayIdChangeErrCode401_0100
     * @tc.number testOffDisplayIdChangeErrCode401_0100
     * @tc.desc   testOffDisplayIdChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffDisplayIdChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffDisplayIdChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffDisplayIdChangeErrCode401_0100",
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
        console.error(msgStr + 'Succeeded in calling off displayIdChange.');
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
     * @tc.name   testOnWindowVisibilityChangeErrCode401_0100
     * @tc.number testOnWindowVisibilityChangeErrCode401_0100
     * @tc.desc   testOnWindowVisibilityChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowVisibilityChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowVisibilityChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnWindowVisibilityChangeErrCode401_0100",
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
        win!.on(null, (res: boolean) => {
        });
        console.error(msgStr + 'Succeeded in calling on windowVisibilityChange.');
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
     * @tc.name   testOffWindowVisibilityChangeErrCode401_0100
     * @tc.number testOffWindowVisibilityChangeErrCode401_0100
     * @tc.desc   testOffWindowVisibilityChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowVisibilityChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowVisibilityChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffWindowVisibilityChangeErrCode401_0100",
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
        win!.off(null, (res: boolean) => {
        });
        console.error(msgStr + 'Succeeded in calling off windowVisibilityChange.');
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
     * @tc.name   testOnSystemDensityChangeErrCode401_0100
     * @tc.number testOnSystemDensityChangeErrCode401_0100
     * @tc.desc   testOnSystemDensityChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnSystemDensityChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnSystemDensityChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnSystemDensityChangeErrCode401_0100",
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
        console.error(msgStr + 'Succeeded in calling on systemDensityChange.');
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
     * @tc.name   testOffSystemDensityChangeErrCode401_0100
     * @tc.number testOffSystemDensityChangeErrCode401_0100
     * @tc.desc   testOffSystemDensityChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffSystemDensityChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffSystemDensityChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffSystemDensityChangeErrCode401_0100",
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
        console.error(msgStr + 'Succeeded in calling off systemDensityChange.');
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
     * @tc.name   testOffNoInteractionDetectedErrCode401_0100
     * @tc.number testOffNoInteractionDetectedErrCode401_0100
     * @tc.desc   testOffNoInteractionDetectedErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffNoInteractionDetectedErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffNoInteractionDetectedErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffNoInteractionDetectedErrCode401_0100",
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
        win!.off(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling off noInteractionDetected.');
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
     * @tc.name   testOnScreenshotErrCode401_0100
     * @tc.number testOnScreenshotErrCode401_0100
     * @tc.desc   testOnScreenshotErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnScreenshotErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnScreenshotErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnScreenshotErrCode401_0100",
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
        win!.on(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling on screenshot.');
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
     * @tc.name   testOffScreenshotErrCode401_0100
     * @tc.number testOffScreenshotErrCode401_0100
     * @tc.desc   testOffScreenshotErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffScreenshotErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffScreenshotErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffScreenshotErrCode401_0100",
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
        win!.off(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling off screenshot.');
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
     * @tc.name   testOnDialogTargetTouchErrCode401_0100
     * @tc.number testOnDialogTargetTouchErrCode401_0100
     * @tc.desc   testOnDialogTargetTouchErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDialogTargetTouchErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnDialogTargetTouchErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnDialogTargetTouchErrCode401_0100",
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
        win!.on(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling on dialogTargetTouch.');
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
     * @tc.name   testOffDialogTargetTouchErrCode401_0100
     * @tc.number testOffDialogTargetTouchErrCode401_0100
     * @tc.desc   testOffDialogTargetTouchErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffDialogTargetTouchErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffDialogTargetTouchErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffDialogTargetTouchErrCode401_0100",
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
        win!.off(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling off dialogTargetTouch.');
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
     * @tc.name   testOnWindowEventErrCode401_0100
     * @tc.number testOnWindowEventErrCode401_0100
     * @tc.desc   testOnWindowEventErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowEventErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowEventErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnWindowEventErrCode401_0100",
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
        win!.on(null, (res: ohosWindow.WindowEventType) => {
        });
        console.error(msgStr + 'Succeeded in calling on windowEvent.');
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
     * @tc.name   testOffWindowEventErrCode401_0100
     * @tc.number testOffWindowEventErrCode401_0100
     * @tc.desc   testOffWindowEventErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowEventErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowEventErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffWindowEventErrCode401_0100",
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
        win!.off(null, (res: ohosWindow.WindowEventType) => {
        });
        console.error(msgStr + 'Succeeded in calling off windowEvent.');
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
     * @tc.name   testOnWindowStatusChangeErrCode401_0100
     * @tc.number testOnWindowStatusChangeErrCode401_0100
     * @tc.desc   testOnWindowStatusChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowStatusChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowStatusChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnWindowStatusChangeErrCode401_0100",
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
        win!.on(null, (res: ohosWindow.WindowStatusType) => {
        });
        console.error(msgStr + 'Succeeded in calling on windowStatusChange.');
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
     * @tc.name   testOffWindowStatusChangeErrCode401_0100
     * @tc.number testOffWindowStatusChangeErrCode401_0100
     * @tc.desc   testOffWindowStatusChangeErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffWindowStatusChangeErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowStatusChangeErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffWindowStatusChangeErrCode401_0100",
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
        win!.off(null, (res: ohosWindow.WindowStatusType) => {
        });
        console.error(msgStr + 'Succeeded in calling off windowStatusChange.');
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
     * @tc.name   testOnSubWindowCloseErrCode401_0100
     * @tc.number testOnSubWindowCloseErrCode401_0100
     * @tc.desc   testOnSubWindowCloseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnSubWindowCloseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnSubWindowCloseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOnSubWindowCloseErrCode401_0100",
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
        win!.on(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling on subWindowClose.');
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
     * @tc.name   testOffSubWindowCloseErrCode401_0100
     * @tc.number testOffSubWindowCloseErrCode401_0100
     * @tc.desc   testOffSubWindowCloseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffSubWindowCloseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffSubWindowCloseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testOffSubWindowCloseErrCode401_0100",
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
        win!.off(null, () => {
        });
        console.error(msgStr + 'Succeeded in calling off subWindowClose.');
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
     * @tc.name   testSetWindowTopmostPromiseErrCode401_0100
     * @tc.number testSetWindowTopmostPromiseErrCode401_0100
     * @tc.desc   testSetWindowTopmostPromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTopmostPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      {
        let caseName = "testSetWindowTopmostPromiseErrCode401_0100";
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
          await mainWindow!.setWindowTopmost(null).then(async () => {
            console.info(msgStr + 'Succeeded in calling setWindowTopmost.');
            expect().assertFail();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + 'Failed to call setWindowTopmost. Cause: ' + JSON.stringify(err));
            if (err.code == 801) {
              console.info(msgStr + '此设备不支持setWindowTopmost能力.');
              expect(err.message!=null).assertTrue();
            } else {
              expect().assertFail();
            }
          });
          done()
        } catch (exception) {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
          if (exception.code == 801) {
            console.info(msgStr + '此设备不支持setWindowTopmost能力.');
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
     * @tc.name   testSetWindowFocusablePromiseErrCode401_0100
     * @tc.number testSetWindowFocusablePromiseErrCode401_0100
     * @tc.desc   testSetWindowFocusablePromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowFocusablePromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowFocusablePromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowFocusablePromiseErrCode401_0100",
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
        await win!.setWindowFocusable(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowFocusable.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowFocusable. Cause: ' + JSON.stringify(err));
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
     * @tc.name   testSetWindowFocusableCallbackErrCode401_0100
     * @tc.number testSetWindowFocusableCallbackErrCode401_0100
     * @tc.desc   testSetWindowFocusableCallbackErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowFocusableCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowFocusableCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowFocusableCallbackErrCode401_0100",
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
        win!.setWindowFocusable(null, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setWindowFocusable. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setWindowFocusable.');
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
     * @tc.name   testSetWindowKeepScreenOnPromiseErrCode401_0100
     * @tc.number testSetWindowKeepScreenOnPromiseErrCode401_0100
     * @tc.desc   testSetWindowKeepScreenOnPromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowKeepScreenOnPromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowKeepScreenOnPromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowKeepScreenOnPromiseErrCode401_0100",
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
        await win!.setWindowKeepScreenOn(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowKeepScreenOn.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowKeepScreenOn. Cause: ' + JSON.stringify(err));
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
     * @tc.name   testSetWindowKeepScreenOnCallbackErrCode401_0100
     * @tc.number testSetWindowKeepScreenOnCallbackErrCode401_0100
     * @tc.desc   testSetWindowKeepScreenOnCallbackErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowKeepScreenOnCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowKeepScreenOnCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowKeepScreenOnCallbackErrCode401_0100",
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
        win!.setWindowKeepScreenOn(null, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setWindowKeepScreenOn. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setWindowKeepScreenOn.');
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
     * @tc.name   testSetWindowPrivacyModePromiseErrCode401_0100
     * @tc.number testSetWindowPrivacyModePromiseErrCode401_0100
     * @tc.desc   testSetWindowPrivacyModePromiseErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowPrivacyModePromiseErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowPrivacyModePromiseErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowPrivacyModePromiseErrCode401_0100",
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
        await win!.setWindowPrivacyMode(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowPrivacyMode.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowPrivacyMode. Cause: ' + JSON.stringify(err));
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
     * @tc.name   testSetWindowPrivacyModeCallbackErrCode401_0100
     * @tc.number testSetWindowPrivacyModeCallbackErrCode401_0100
     * @tc.desc   testSetWindowPrivacyModeCallbackErrCode401_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowPrivacyModeCallbackErrCode401_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowPrivacyModeCallbackErrCode401_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowPrivacyModeCallbackErrCode401_0100",
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
        win!.setWindowPrivacyMode(null, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setWindowPrivacyMode.');
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
  })
}