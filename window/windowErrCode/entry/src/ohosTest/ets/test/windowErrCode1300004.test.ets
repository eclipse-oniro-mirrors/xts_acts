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
export default function windowErrCode1300004() {
  describe('windowErrCode1300004', () => {
    console.log('describe windowErrCode1300004 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.number     : testOnSubWindowCloseErrCode1300004_0100
     * @tc.name       : testOnSubWindowCloseErrCode1300004_0100
     * @tc.desc       : testOnSubWindowCloseErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnSubWindowCloseErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnSubWindowCloseErrCode1300004_0100";
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
        mainWindow!.on('subWindowClose', () => {
        });
        console.error(msgStr + 'Succeeded in calling on_subWindowClose.');
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        if (exception.code == 801) {
          console.info(msgStr + '此设备不支持on_subWindowClose能力.');
        } else {
          expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        }
        done();
      }
    })
    /**
     * @tc.number     : testSetRaiseByClickEnabledPromiseErrCode1300004_0100
     * @tc.name       : testSetRaiseByClickEnabledPromiseErrCode1300004_0100
     * @tc.desc       : testSetRaiseByClickEnabledPromiseErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetRaiseByClickEnabledPromiseErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetRaiseByClickEnabledPromiseErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetRaiseByClickEnabledPromiseErrCode1300004_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).setUIContent("testability/pages/second/PageOne");
      await (tempWnd as ohosWindow.Window).showWindow();
      try {
        await (tempWnd as ohosWindow.Window)!.setRaiseByClickEnabled(true).then(async () => {
          await (tempWnd! as ohosWindow.Window).destroyWindow();
          console.info(msgStr + 'Succeeded in calling setRaiseByClickEnabled.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setRaiseByClickEnabled. Cause: ' + JSON.stringify(err));
          await (tempWnd! as ohosWindow.Window).destroyWindow();
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowTitleMoveEnabled能力.');
          } else {
            expect(err.code).assertEqual(1300004);
        expect(err.message!=null).assertTrue();
          }
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        await (tempWnd! as ohosWindow.Window).destroyWindow();
        done()
      }
    })
    /**
     * @tc.number     : testMaximizePromiseErrCode1300004_0100
     * @tc.name       : testMaximizePromiseErrCode1300004_0100
     * @tc.desc       : testMaximizePromiseErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testMaximizePromiseErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMaximizePromiseErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testMaximizePromiseErrCode1300004_0100",
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
        await win!.maximize(ohosWindow.MaximizePresentation.EXIT_IMMERSIVE).then(async () => {
          console.info(msgStr + 'Succeeded in calling maximize.');
          await (win! as ohosWindow.Window).destroyWindow();
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
          await (win! as ohosWindow.Window).destroyWindow();
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        await (win! as ohosWindow.Window).destroyWindow();
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowTitleMoveEnabledErrCode1300004_0100
     * @tc.name       : testSetWindowTitleMoveEnabledErrCode1300004_0100
     * @tc.desc       : testSetWindowTitleMoveEnabledErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowTitleMoveEnabledErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitleMoveEnabledErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowTitleMoveEnabledErrCode1300004_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).setUIContent("testability/pages/second/PageOne");
      await (tempWnd as ohosWindow.Window).showWindow();
      try {
        (tempWnd! as ohosWindow.Window).setWindowTitleMoveEnabled(true);
        console.error(msgStr + 'Succeeded in calling setWindowTitleMoveEnabled.');
        expect().assertFail();
        await (tempWnd! as ohosWindow.Window).destroyWindow();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await (tempWnd! as ohosWindow.Window).destroyWindow();
        if (exception.code == 801) {
          console.info(msgStr + '此设备不支持setWindowTitleMoveEnabled能力.');
        } else {
          expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        }
        done();
      }
    })
    /**
     * @tc.number     : testSetDecorButtonStyleErrCode1300004_0100
     * @tc.name       : testSetDecorButtonStyleErrCode1300004_0100
     * @tc.desc       : testSetDecorButtonStyleErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetDecorButtonStyleErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetDecorButtonStyleErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetDecorButtonStyleErrCode1300004_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd: ohosWindow.Window | void;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).setUIContent("testability/pages/second/PageOne");
      await (tempWnd as ohosWindow.Window).showWindow();
      try {
        // let param: ohosWindow.DecorButtonStyle = {}
        (tempWnd as ohosWindow.Window).setDecorButtonStyle((tempWnd as ohosWindow.Window).getDecorButtonStyle());
        console.error(msgStr + 'Succeeded in calling setDecorButtonStyle.');
        await (tempWnd! as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await (tempWnd! as ohosWindow.Window).destroyWindow();
        if (exception.code == 801) {
          console.info(msgStr + '此设备不支持setDecorButtonStyle能力.');
        } else {
          expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        }
        done();
      }
    })
    /**
     * @tc.number     : testGetDecorButtonStyleErrCode1300004_0100
     * @tc.name       : testGetDecorButtonStyleErrCode1300004_0100
     * @tc.desc       : testGetDecorButtonStyleErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetDecorButtonStyleErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetDecorButtonStyleErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: ohosWindow.Configuration = {
        name: "test1",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context
      };
      ohosWindow.createWindow(config, (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(`Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
          return;
        }
        let win = data;
        win.setUIContent("testability/pages/second/PageOne");
        win.showWindow();
        try {
          (win! as ohosWindow.Window).getDecorButtonStyle();
          console.error(msgStr + 'Succeeded in calling getDecorButtonStyle.');
        } catch (exception) {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
          if (exception.code == 801) {
            done();
          } else if (exception.code == 1300004) {
            done()
          } else {
            expect(false).assertFail();
            done()
          }
        }
      })
    })
    /**
     * @tc.number     : testSetWindowTitleButtonVisibleErrCode1300004_0100
     * @tc.name       : testSetWindowTitleButtonVisibleErrCode1300004_0100
     * @tc.desc       : testSetWindowTitleButtonVisibleErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowTitleButtonVisibleErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitleButtonVisibleErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowTitleButtonVisibleErrCode1300004_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      expect(!!subWin).assertTrue();
      await (subWin! as ohosWindow.Window).setUIContent("testability/pages/second/PageOne");
      await (subWin! as ohosWindow.Window).showWindow();
      try {
        (subWin! as ohosWindow.Window).setWindowTitleButtonVisible(true, true, true);
        console.error(msgStr + 'Succeeded in calling setWindowTitleButtonVisible.');
        expect().assertFail();
        await (subWin!! as ohosWindow.Window).destroyWindow();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await (subWin!! as ohosWindow.Window).destroyWindow();
        if (exception.code == 801) {
          console.info(msgStr + '此设备不支持getDecorButtonStyle能力.');
        } else {
          expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        }
        done();
      }
    })
    /**
     * @tc.number     : testSetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.name       : testSetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.desc       : testSetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetImmersiveModeEnabledStateErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetImmersiveModeEnabledStateErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetImmersiveModeEnabledStateErrCode1300004_0100",
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
        (win as ohosWindow.Window).setImmersiveModeEnabledState(true);
        console.error(msgStr + 'Succeeded in calling setImmersiveModeEnabledState.');
        expect().assertFail();
        await (win! as ohosWindow.Window).destroyWindow();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        await (win! as ohosWindow.Window).destroyWindow();
        done();
      }
    })
    /**
     * @tc.number     : testGetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.name       : testGetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.desc       : testGetImmersiveModeEnabledStateErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetImmersiveModeEnabledStateErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetImmersiveModeEnabledStateErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowConfig: ohosWindow.Configuration = {
        name: "testGetImmersiveModeEnabledStateErrCode1300004_0100",
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
        (win as ohosWindow.Window).getImmersiveModeEnabledState();
        console.error(msgStr + 'Succeeded in calling getImmersiveModeEnabledState.');
        expect().assertFail();
        await (win! as ohosWindow.Window).destroyWindow();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        await (win! as ohosWindow.Window).destroyWindow();
        done();
      }
    })
    /**
     * @tc.number     : testCreateSubWindowWithOptionsPromiseErrCode1300004_0100
     * @tc.name       : testCreateSubWindowWithOptionsPromiseErrCode1300004_0100
     * @tc.desc       : testCreateSubWindowWithOptionsPromiseErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testCreateSubWindowWithOptionsPromiseErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindowWithOptionsPromiseErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: ohosWindow.Configuration = {
        name: "testCreateSubWindowWithOptionsPromiseErrCode1300004_0100",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let subWindowClass: ohosWindow.Window | null = null;
      try {
        subWindowClass = await ohosWindow.createWindow(config);
        expect(!!subWindowClass).assertTrue();
      } catch (err) {
        console.error(msgStr + 'ohosWindow.createWindow ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        let param: ohosWindow.SubWindowOptions = {
          title: "aa", decorEnabled: true
        }
        await subWindowClass!.createSubWindowWithOptions("bb", param).then(async () => {
          console.info(msgStr + 'Succeeded in calling createSubWindowWithOptions.');
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300004);
        expect(err.message!=null).assertTrue();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call createSubWindowWithOptions. Cause:' +
        JSON.stringify(exception));
        if (exception.code === undefined) {
          console.info(msgStr + '此设备不支持createSubWindowWithOptions能力.');
        } else {
          expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        }
        done()
      }
    })
    /**
     * @tc.number     : testSetTitleAndDockHoverShownPromiseErrCode1300004_0100
     * @tc.name       : testSetTitleAndDockHoverShownPromiseErrCode1300004_0100
     * @tc.desc       : testSetTitleAndDockHoverShownPromiseErrCode1300004_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetTitleAndDockHoverShownPromiseErrCode1300004_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetTitleAndDockHoverShownPromiseErrCode1300004_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetTitleAndDockHoverShownPromiseErrCode1300004_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      expect(!!subWin).assertTrue();
      await (subWin! as ohosWindow.Window).setUIContent("testability/pages/second/PageOne");
      await (subWin! as ohosWindow.Window).showWindow();
      try {
        await (subWin! as ohosWindow.Window).setTitleAndDockHoverShown(true, true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setTitleAndDockHoverShown.');
          expect().assertFail();
          await (subWin! as ohosWindow.Window).destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          await (subWin! as ohosWindow.Window).destroyWindow();
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setTitleAndDockHoverShown能力.');
          } else {
            expect(err.code).assertEqual(1300004);
        expect(err.message!=null).assertTrue();
          }
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setTitleAndDockHoverShown. Cause:' +
        JSON.stringify(exception));
        await (subWin! as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_SET_ASPECT_RATIO_WITH_SUBWINDOW
     * @tc.name       : testSetAspectRatiowithUnsupportedSubwindow
     * @tc.desc       : 验证setAspectRatio抛1300004错误码
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSetAspectRatiowithUnsupportedSubwindow', Level.LEVEL2, async (done: Function) => {
      let caseName = "testSetAspectRatiowithUnsupportedSubwindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      subWin = await windowStage.createSubWindow('testSetAspectRatiowithUnsupportedSubwindow')
      try {
        subWin.setAspectRatio(0, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setAspectRatio. Cause: ' + JSON.stringify(err));
            await (subWin! as ohosWindow.Window).destroyWindow();
            if (err.code == 801) {
              console.info(msgStr + '此设备不支持 setAspectRatio 能力.');
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.info(msgStr + 'Succeeded in calling setAspectRatio.');
            await (subWin! as ohosWindow.Window).destroyWindow();
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await (subWin! as ohosWindow.Window).destroyWindow();
        expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_RESET_ASPECT_RATIO_WITH_SUBWINDOW
     * @tc.name       : testResetAspectRatiowithUnsupportedSubwindow
     * @tc.desc       : 验证resetAspectRatio抛1300004错误码
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testResetAspectRatiowithUnsupportedSubwindow', Level.LEVEL2, async (done: Function) => {
      let caseName = "testResetAspectRatiowithUnsupportedSubwindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      subWin = await windowStage.createSubWindow('testResetAspectRatiowithUnsupportedSubwindow')
      try {
        subWin.resetAspectRatio(async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call resetAspectRatio. Cause: ' + JSON.stringify(err));
            await (subWin! as ohosWindow.Window).destroyWindow();
            if (err.code == 801) {
              console.info(msgStr + '此设备不支持 resetAspectRatio 能力.');
            } else {
              expect().assertFail();
            }
            done();
          } else {
            console.info(msgStr + 'Succeeded in calling resetAspectRatio.');
            await (subWin! as ohosWindow.Window).destroyWindow();
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        await (subWin! as ohosWindow.Window).destroyWindow();
        expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

  })
}