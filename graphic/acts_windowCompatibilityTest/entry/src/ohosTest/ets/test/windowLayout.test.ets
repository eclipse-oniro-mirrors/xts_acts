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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';

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

export default function windowLayoutTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('window_layout_test', () => {
    console.log('describe window_focus_test start!!!')
    let tempWnd: window.Window | void;
    let subWin: window.Window | void;
    let isPCStatus: string = '';
    beforeAll(() => {
      console.info('window_layout_test beforeAll begin');
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
    })
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0010
     * @tc.name      : testSetAspectRatio_DialogWindow
     * @tc.desc      : Set the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_DialogWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetAspectRatio_DialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetAspectRatio_DialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        let ratio: number = 1.0;
        await (tempWnd as window.Window).setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the aspect ratio of window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(1300004);
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0020
     * @tc.name      : testSetAspectRatio_SubWindow
     * @tc.desc      : VSet the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_SubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetAspectRatio_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetAspectRatio_SubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      try {
        let ratio: number = 1.0;
        await (subWin as window.Window).setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the aspect ratio of window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(1300004);
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0030
     * @tc.name      : testSetAspectRatio_MainWindow_WinStatusType_Floating
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_MainWindow_WinStatusType_Floating', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetAspectRatio_MainWindow_WinStatusType_Floating';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let ratio: number = 1.0;
      await mainWin.setAspectRatio(ratio).then(() => {
        console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to set the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      await mainWin.resetAspectRatio().then(() => {
        console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to reset the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0040
     * @tc.name      : testResetAspectRatio_DialogWindow
     * @tc.desc      : Unset the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResetAspectRatio_DialogWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testResetAspectRatio_DialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testResetAspectRatio_DialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        await (tempWnd as window.Window).resetAspectRatio().then(() => {
          console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to reset the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
        });
      } catch (exception) {
        console.error(msgStr + `Failed to reset the aspect ratio of window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(1300004);
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0050
     * @tc.name      : testResetAspectRatio_SubWindow
     * @tc.desc      : Unset the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResetAspectRatio_SubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testResetAspectRatio_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testResetAspectRatio_SubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      try {
        await (subWin as window.Window).resetAspectRatio().then(() => {
          console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to reset the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
        });
      } catch (exception) {
        console.error(msgStr + `Failed to reset the aspect ratio of window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(1300004);
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0060
     * @tc.name      : testResetAspectRatio_MainWindow_WinStatusType_Floating
     * @tc.desc      : Unset the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResetAspectRatio_MainWindow_WinStatusType_Floating', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testResetAspectRatio_MainWindow_WinStatusType_Floating';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      await mainWin.resetAspectRatio().then(() => {
        console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to reset the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0070
     * @tc.name      : testResize_MainWindow_FullScreen_Promise
     * @tc.desc      : Verify the full screen window resize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_MainWindow_FullScreen_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testResize_MainWindow_FullScreen_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = windowStage.getMainWindowSync();
      expect(!!win).assertTrue();
      console.log(msgStr + 'getMainWindowSync success');
      await (win as window.Window).showWindow().catch((err: BusinessError) => {
        console.log(msgStr + 'showWindow failed');
        expect().assertFail();
      });
      if(isPCStatus != ''){
        await (win as window.Window).maximize(window.MaximizePresentation.ENTER_IMMERSIVE).then(async () => {
          console.info(msgStr + 'Succeeded in maximizing the main window.');
          await (win as window.Window).resize(707, 707).then(() => {
            console.info(msgStr + 'Succeeded in changing the window size.');
            expect().assertFail();
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
          });
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.log(msgStr + `The current device type does not support calling maximize Cause code: ${err.code}, message: ${err.message}`)
            expect(err.code).assertEqual(801);
          } else {
            console.error(msgStr + `Failed to maximize the main window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          }
        });
      } else {
          await (win as window.Window).setWindowLayoutFullScreen(true).then(() => {
            console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            expect().assertFail();
          });
          let names: Array<'status' | 'navigation'> = [];
          try {
            await (win as window.Window).setWindowSystemBarEnable(names).then(() => {
              console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            }).catch((err: BusinessError) => {
              console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
              expect().assertFail();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
            expect().assertFail();
          }
          await (win as window.Window).resize(707, 707).then(() => {
            console.info(msgStr + 'Succeeded in changing the window size.');
            expect().assertFail();
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
          });
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0080
     * @tc.name      : testResize_MainWindow_FullScreen_Callback
     * @tc.desc      : Verify the full screen window resize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_MainWindow_FullScreen_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testResize_MainWindow_FullScreen_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = windowStage.getMainWindowSync();
      expect(!!win).assertTrue();
      console.log(msgStr + 'getMainWindowSync success');
      await (win as window.Window).showWindow().catch((err: BusinessError) => {
        console.log(msgStr + '(tempWnd as window.Window).showWindow failed');
        expect().assertFail();
        done();
      });
      if(isPCStatus != ''){
        await (win as window.Window).maximize(window.MaximizePresentation.ENTER_IMMERSIVE).then(() => {
          console.info(msgStr + 'Succeeded in maximizing the main window.');
          (win as window.Window).resize(500, 1000, (err: BusinessError) => {
            const errCode: number = err.code;
            if (errCode) {
              console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300002);
              done();
              return;
            }
            expect().assertFail();
            done();
            console.info(msgStr + 'Succeeded in changing the window size.');
          });
        }).catch((err: BusinessError) => {
          if (err.code == 801) {
            console.log(msgStr + `The current device type does not support calling maximize Cause code: ${err.code}, message: ${err.message}`)
            expect(err.code).assertEqual(801);
            done();
          } else {
            console.error(msgStr + `Failed to maximize the main window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      } else {
          await (win as window.Window).setWindowLayoutFullScreen(true).then(() => {
            console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
          let names: Array<'status' | 'navigation'> = [];
          try {
            await (win as window.Window).setWindowSystemBarEnable(names).then(() => {
              console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            }).catch((err: BusinessError) => {
              console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
          (win as window.Window).resize(500, 1000, (err: BusinessError) => {
            const errCode: number = err.code;
            if (errCode) {
              console.error(msgStr + `Failed to change the window size. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300002);
              done();
              return;
            }
            expect().assertFail();
            done();
            console.info(msgStr + 'Succeeded in changing the window size.');
          });
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0090
     * @tc.name      : testGetWindowLimits_DialogWindow
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowLimits_DialogWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetWindowLimits_DialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testGetWindowLimits_DialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        let windowLimits: window.WindowLimits = (tempWnd as window.Window).getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(windowLimits));
        expect(!!windowLimits).assertTrue();
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to obtain the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0100
     * @tc.name      : testGetWindowLimits_SubWindow
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowLimits_SubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetWindowLimits_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testGetWindowLimits_SubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      try {
        let windowLimits: window.WindowLimits = (subWin as window.Window).getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(windowLimits));
        expect(!!windowLimits).assertTrue();
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to obtain the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0110
     * @tc.name      : testGetWindowLimits_MainWindow
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowLimits_MainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetWindowLimits_MainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let windowLimits: window.WindowLimits = mainWin.getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(windowLimits));
        expect(!!windowLimits).assertTrue();
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to obtain the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0120
     * @tc.name      : testSetWindowLimits_DialogWindow
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLimits_DialogWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowLimits_DialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetWindowLimits_DialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        let get_windowLimits_initValue: window.WindowLimits;
        get_windowLimits_initValue = (tempWnd as window.Window).getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(get_windowLimits_initValue));

        expect(!!get_windowLimits_initValue).assertTrue();
        let set_windowLimits: window.WindowLimits = {
          maxWidth: Number(get_windowLimits_initValue.maxWidth) - 1,
          maxHeight: Number(get_windowLimits_initValue.maxHeight) - 1,
          minWidth: Number(get_windowLimits_initValue.minWidth) + 1,
          minHeight: Number(get_windowLimits_initValue.minHeight) + 1
        };
        await (tempWnd as window.Window).setWindowLimits(set_windowLimits).then((data) => {
          expect(Number(get_windowLimits_initValue.maxWidth) - 1).assertEqual(data.maxWidth);
          expect(Number(get_windowLimits_initValue.maxHeight) - 1).assertEqual(data.maxHeight);
          expect(Number(get_windowLimits_initValue.minWidth) + 1).assertEqual(data.minWidth);
          expect(Number(get_windowLimits_initValue.minHeight) + 1).assertEqual(data.minHeight);
        }).catch((exception: BusinessError) => {
          if (exception.code != 801) {
            console.error(msgStr + `Failed to change the window limits. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
          }
        })
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to get the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0130
     * @tc.name      : testSetWindowLimits_SubWindow
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLimits_SubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowLimits_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetWindowLimits_SubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      try {
        let get_windowLimits_initValue: window.WindowLimits;
        get_windowLimits_initValue = (subWin as window.Window).getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(get_windowLimits_initValue));
        expect(!!get_windowLimits_initValue).assertTrue();
        let set_windowLimits: window.WindowLimits = {
          maxWidth: Number(get_windowLimits_initValue.maxWidth) - 1,
          maxHeight: Number(get_windowLimits_initValue.maxHeight) - 1,
          minWidth: Number(get_windowLimits_initValue.minWidth) + 1,
          minHeight: Number(get_windowLimits_initValue.minHeight) + 1
        };
        await (subWin as window.Window).setWindowLimits(set_windowLimits).then((data) => {
          expect(Number(get_windowLimits_initValue.maxWidth) - 1).assertEqual(data.maxWidth);
          expect(Number(get_windowLimits_initValue.maxHeight) - 1).assertEqual(data.maxHeight);
          expect(Number(get_windowLimits_initValue.minWidth) + 1).assertEqual(data.minWidth);
          expect(Number(get_windowLimits_initValue.minHeight) + 1).assertEqual(data.minHeight);
        }).catch((exception: BusinessError) => {
          if (exception.code != 801) {
            console.error(msgStr + `Failed to change the window limits. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
          }
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to get the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0140
     * @tc.name      : testSetWindowLimits_MainWindow
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLimits_MainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowLimits_MainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let get_windowLimits_initValue: window.WindowLimits;
        get_windowLimits_initValue = mainWin.getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(get_windowLimits_initValue));
        expect(!!get_windowLimits_initValue).assertTrue();
        let set_windowLimits: window.WindowLimits = {
          maxWidth: Number(get_windowLimits_initValue.maxWidth) - 1,
          maxHeight: Number(get_windowLimits_initValue.maxHeight) - 1,
          minWidth: Number(get_windowLimits_initValue.minWidth) + 1,
          minHeight: Number(get_windowLimits_initValue.minHeight) + 1
        };
        await mainWin.setWindowLimits(set_windowLimits).then((data) => {
          console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
          expect(Number(get_windowLimits_initValue.maxWidth) - 1).assertEqual(data.maxWidth);
          expect(Number(get_windowLimits_initValue.maxHeight) - 1).assertEqual(data.maxHeight);
          expect(Number(get_windowLimits_initValue.minWidth) + 1).assertEqual(data.minWidth);
          expect(Number(get_windowLimits_initValue.minHeight)+ 1).assertEqual(data.minHeight);
        }).catch((exception: BusinessError) => {
          if (exception.code != 801) {
            console.error(msgStr + `Failed to change the window limits. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
          }
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to get the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0150
     * @tc.name      : testSetWindowLimits_InvalidParameter
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLimits_InvalidParameter', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowLimits_InvalidParameter';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetWindowLimits_InvalidParameter')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      try {
        let get_windowLimits_initValue: window.WindowLimits;
        get_windowLimits_initValue = (subWin as window.Window).getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(get_windowLimits_initValue));
        expect(!!get_windowLimits_initValue).assertTrue();
        let set_windowLimits: window.WindowLimits = {
          maxWidth: -1,
          maxHeight: -3,
          minWidth: -100,
          minHeight: -200
        };
        await (subWin as window.Window).setWindowLimits(set_windowLimits).then((data) => {
          console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
          expect(get_windowLimits_initValue.maxWidth).assertEqual(data.maxWidth);
          expect(get_windowLimits_initValue.maxHeight).assertEqual(data.maxHeight);
          expect(get_windowLimits_initValue.minWidth).assertEqual(data.minWidth);
          expect(get_windowLimits_initValue.minHeight).assertEqual(data.minHeight);
        }).catch((exception: BusinessError) => {
          if (exception.code != 801) {
            console.error(msgStr + `Failed to obtain the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
          }
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to get the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0160
     * @tc.name      : testSetWindowLimits_MoreThenInitGetValue
     * @tc.desc      : Sets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLimits_MoreThenMaxInitGetValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowLimits_MoreThenInitGetValue';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetWindowLimits_MoreThenInitGetValue')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      let get_windowLimits_initValue: window.WindowLimits;
      try {
        get_windowLimits_initValue = (subWin as window.Window).getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(get_windowLimits_initValue));
        expect(!!get_windowLimits_initValue).assertTrue();
        try {
          let set_windowLimits: window.WindowLimits = {
            maxWidth: Number(get_windowLimits_initValue.maxWidth) + 1,
            maxHeight: Number(get_windowLimits_initValue.maxHeight) + 1,
            minWidth: Number(get_windowLimits_initValue.minWidth) + 1,
            minHeight: Number(get_windowLimits_initValue.minHeight) + 1
          };
          await (subWin as window.Window).setWindowLimits(set_windowLimits).then((data) => {
            console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
            expect(get_windowLimits_initValue.maxWidth).assertEqual(data.maxWidth);
            expect(get_windowLimits_initValue.maxHeight).assertEqual(data.maxHeight);
            expect(Number(get_windowLimits_initValue.minWidth)+ 1).assertEqual(data.minWidth);
            expect(Number(get_windowLimits_initValue.minHeight) + 1).assertEqual(data.minHeight);
          }).catch((exception: BusinessError) => {
            console.error(msgStr + `Failed to change the window limits. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          });
        } catch (exception) {
          if (exception.code != 801) {
            console.error(msgStr + `Failed to change the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
          }
        }
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to obtain the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0170
     * @tc.name      : testSetWindowLimits_LessThenMinInitGetValue
     * @tc.desc      : Sets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLimits_LessThenMinInitGetValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowLimits_LessThenMinInitGetValue';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetWindowLimits_LessThenMinInitGetValue')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      let get_windowLimits_initValue: window.WindowLimits;
      try {
        get_windowLimits_initValue = (subWin as window.Window).getWindowLimits();
        console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(get_windowLimits_initValue));
        expect(!!get_windowLimits_initValue).assertTrue();
        try {
          let set_windowLimits: window.WindowLimits = {
            maxWidth: Number(get_windowLimits_initValue.maxWidth) - 1,
            maxHeight: Number(get_windowLimits_initValue.maxHeight) - 1,
            minWidth: Number(get_windowLimits_initValue.minWidth) - 1,
            minHeight: Number(get_windowLimits_initValue.minHeight) - 1
          };
          await (subWin as window.Window).setWindowLimits(set_windowLimits).then((data) => {
            console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
            expect(Number(get_windowLimits_initValue.maxWidth) - 1).assertEqual(data.maxWidth);
            expect(Number(get_windowLimits_initValue.maxHeight) - 1).assertEqual(data.maxHeight);
            expect(get_windowLimits_initValue.minWidth).assertEqual(data.minWidth);
            expect(get_windowLimits_initValue.minHeight).assertEqual(data.minHeight);
          }).catch((exception: BusinessError) => {
            console.error(msgStr + `Failed to change the window limits. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          });
        } catch (exception) {
          if (exception.code != 801) {
            console.error(msgStr + `Failed to change the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(exception))
            expect(exception.code).assertEqual(801);
          }
        }
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to obtain the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0180
     * @tc.name      : testOnOffWindowStatusChange_OnSubWindow
     * @tc.desc      : Enable listening for window mode changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnOffWindowStatusChange_OnSubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testOnOffWindowStatusChange_OnSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testOnOffWindowStatusChange_OnSubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      const callback = (data:window.WindowStatusType) => {
        console.info(msgStr + 'Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(data));
      }
      try {
        (subWin as window.Window).on('windowStatusChange', callback);
        console.info(msgStr + 'Succeeded in enabling the listener for window status changes.');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        (subWin as window.Window).off('windowStatusChange', callback);
        console.info(msgStr + 'Succeeded in unregister for window status changes.');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        (subWin as window.Window).off('windowStatusChange');
        console.info(msgStr + 'Succeeded in unregister all for window status changes');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0190
     * @tc.name      : testOnOffWindowStatusChange_OnMainWindow
     * @tc.desc      : Enable listening for window mode changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnOffWindowStatusChange_OnMainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testOnOffWindowStatusChange_OnMainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      const callback = (data:window.WindowStatusType) => {
        console.info(msgStr + 'Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(data));
      }
      try {
        mainWin.on('windowStatusChange', callback);
        console.info(msgStr + 'Succeeded in enabling the listener for window status changes.');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        mainWin.off('windowStatusChange', callback);
        console.info(msgStr + 'Succeeded in unregister for window status changes.');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        mainWin.off('windowStatusChange');
        console.info(msgStr + 'Succeeded in unregister all for window status changes');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0200
     * @tc.name      : testSetAspectRatio_SubWindowWithOptions
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetAspectRatio_SubWindowWithOptions', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetAspectRatio_SubWindowWithOptions';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testSetAspectRatio_SubWindowWithOptions',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetAspectRatio_SubWindowWithOptions', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          try {
            let ratio: number = 1.0;
            await (subWin as window.Window).setAspectRatio(ratio).then(() => {
              console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
              expect().assertFail();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300004);
            });
          } catch (exception) {
            console.error(msgStr + `Failed to set the aspect ratio of window. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(exception.code).assertEqual(1300004);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0210
     * @tc.name      : testResetAspectRatio_SubWindowWithOptions
     * @tc.desc      : Unset the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testResetAspectRatio_SubWindowWithOptions', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testResetAspectRatio_SubWindowWithOptions';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testSetAspectRatio_SubWindowWithOptions',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testResetAspectRatio_SubWindowWithOptions', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          try {
            await (subWin as window.Window).resetAspectRatio().then(() => {
              console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
              expect().assertFail();
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to reset the aspect ratio of window. Cause code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(1300004);
            });
          } catch (exception) {
            console.error(msgStr + `Failed to reset the aspect ratio of window. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(exception.code).assertEqual(1300004);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0220
     * @tc.name      : testGetWindowLimits_SubWindowWithOptions
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetWindowLimits_SubWindowWithOptions', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetWindowLimits_SubWindowWithOptions';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testGetWindowLimits_SubWindowWithOptions',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testGetWindowLimits_SubWindowWithOptions', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          try {
            let windowLimits = (subWin as window.Window).getWindowLimits();
            console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(windowLimits));
            expect(!!windowLimits).assertTrue();
          } catch (exception) {
            if (exception.code != 801) {
              console.error(msgStr + `Failed to obtain the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(exception))
              expect(exception.code).assertEqual(801);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0230
     * @tc.name      : testSetWindowLimits_SubWindowWithOptions
     * @tc.desc      : Gets the size limit for the current application window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetWindowLimits_SubWindowWithOptions', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetWindowLimits_SubWindowWithOptions';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testGetWindowLimits_SubWindowWithOptions',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetWindowLimits_SubWindowWithOptions', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          try {
            let get_windowLimits_initValue: window.WindowLimits;
            get_windowLimits_initValue = (subWin as window.Window).getWindowLimits();
            console.info(msgStr + 'Succeeded in getWindowLimits ' + JSON.stringify(get_windowLimits_initValue));
            expect(!!get_windowLimits_initValue).assertTrue();
            let set_windowLimits: window.WindowLimits = {
              maxWidth: Number(get_windowLimits_initValue.maxWidth) - 1,
              maxHeight: Number(get_windowLimits_initValue.maxHeight) - 1,
              minWidth: Number(get_windowLimits_initValue.minWidth) + 1,
              minHeight: Number(get_windowLimits_initValue.minHeight) + 1
            };
            await (subWin as window.Window).setWindowLimits(set_windowLimits).then((data) => {
              expect(Number(get_windowLimits_initValue.maxWidth) - 1).assertEqual(data.maxWidth);
              expect(Number(get_windowLimits_initValue.maxHeight) - 1).assertEqual(data.maxHeight);
              expect(Number(get_windowLimits_initValue.minWidth) + 1).assertEqual(data.minWidth);
              expect(Number(get_windowLimits_initValue.minHeight) + 1).assertEqual(data.minHeight);
            }).catch((exception: BusinessError) => {
              if (exception.code != 801) {
                console.error(msgStr + `Failed to change the window limits. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(exception))
                expect(exception.code).assertEqual(801);
              }
            });
          } catch (exception) {
            if (exception.code != 801) {
              console.error(msgStr + `Failed to get the window limits of window. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(exception))
              expect(exception.code).assertEqual(801);
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLAYOUT_JS_API_0240
     * @tc.name      : testOnOffWindowStatusChange_OnSubWindowWithOptions
     * @tc.desc      : Enable listening for window mode changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testOnOffWindowStatusChange_OnSubWindowWithOptions', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testOnOffWindowStatusChange_OnSubWindowWithOptions';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testOnOffWindowStatusChange_OnSubWindowWithOptions',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testOnOffWindowStatusChange_OnSubWindowWithOptions', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          const callback = (data:window.WindowStatusType) => {
            console.info(msgStr + 'Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(data));
          }
          try {
            (subWin as window.Window).on('windowStatusChange', callback);
            console.info(msgStr + 'Succeeded in enabling the listener for window status changes.');
          } catch (exception) {
            if (exception.code != 801) {
              console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(exception))
              expect(exception.code).assertEqual(801);
            }
          }
          try {
            (subWin as window.Window).off('windowStatusChange', callback);
            console.info(msgStr + 'Succeeded in unregister for window status changes.');
          } catch (exception) {
            if (exception.code != 801) {
              console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(exception))
              expect(exception.code).assertEqual(801);
            }
          }
          try {
            (subWin as window.Window).off('windowStatusChange');
            console.info(msgStr + 'Succeeded in unregister all for window status changes');
          } catch (exception) {
            if (exception.code != 801) {
              console.error(msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(exception))
              expect(exception.code).assertEqual(801);
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
  })
}
