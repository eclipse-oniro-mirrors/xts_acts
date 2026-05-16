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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import window from '@ohos.window';
import { UiDriver, BY, ON, PointerMatrix, UiComponent } from '@ohos.UiTest'
import { BusinessError, Callback } from '@ohos.base';
import display from '@ohos.display';
import common from '@ohos.app.ability.common';

export default function windowInputTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('window_input_test', () => {
    console.log('describe window_input_test start!!!')
    let tempWnd: window.Window | void;
    let subWin: window.Window | void;

    beforeEach(async ()=>{
      let msg = 'window_input_test';
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
     * @tc.name   testKeepKeyboardOnFocus_DialogWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0010
     * @tc.desc   The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeepKeyboardOnFocus_DialogWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async () => {
      let caseName = 'testKeepKeyboardOnFocus_DialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testKeepKeyboardOnFocus_DialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as window.Window).keepKeyboardOnFocus(true);
        console.log(msgStr + 'window keepKeyboardOnFocus successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to keep keyboard onFocus. Cause code: ${exception.code}, message: ${exception.message}`);
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
     * @tc.name   testKeepKeyboardOnFocus_SubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0020
     * @tc.desc   The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeepKeyboardOnFocus_SubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async () => {
      let caseName = 'testKeepKeyboardOnFocus_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testKeepKeyboardOnFocus_SubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      try {
        (subWin as window.Window).keepKeyboardOnFocus(true);
        console.log(msgStr + 'window keepKeyboardOnFocus successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to keep keyboard onFocus. Cause code: ${exception.code}, message: ${exception.message}`);
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
     * @tc.name   testKeepKeyboardOnFocus_MainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0030
     * @tc.desc   The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeepKeyboardOnFocus_MainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async () => {
      let caseName = 'testKeepKeyboardOnFocus_MainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        mainWin.keepKeyboardOnFocus(true);
        console.log(msgStr + 'window keepKeyboardOnFocus successed');
        expect().assertFail();
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to keep keyboard onFocus. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300004);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.name   testKeepKeyboardOnFocus_SubWindowWithOps
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0040
     * @tc.desc   The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeepKeyboardOnFocus_SubWindowWithOps', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async () => {
      let caseName = 'testKeepKeyboardOnFocus_SubWindowWithOps';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testKeepKeyboardOnFocus_SubWindowWithOps',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testKeepKeyboardOnFocus_SubWindowWithOps', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          try {
            (subWin as window.Window).keepKeyboardOnFocus(true);
            console.log(msgStr + 'window keepKeyboardOnFocus successed');
          } catch (exception) {
            if (exception.code != 801) {
              console.error(msgStr + `Failed to keep keyboard onFocus. Cause code: ${exception.code}, message: ${exception.message}`);
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
     * @tc.name   testWindow_on_off_keyboardDidShow_normal
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0050
     * @tc.desc   Enable fixed soft keyboard to display animation completed listening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindow_on_off_keyboardDidShow_normal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindow_on_off_keyboardDidShow_normal';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindow_on_off_keyboardDidShow_normal').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).loadContent('testability/pages/second/pageTwo')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      let current_display_Class = display.getDefaultDisplaySync();
      await (tempWnd as window.Window).resize(800, current_display_Class.height).catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      await (tempWnd as window.Window).moveWindowTo(0, 0).catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      await (tempWnd as window.Window).showWindow().catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      let keyboard_info: window.KeyboardInfo;
      try {
        (tempWnd as window.Window).on('keyboardDidShow', (keyboardInfo: window.KeyboardInfo) => {
          console.info(msgStr + "first listener trigger");
          console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
          keyboard_info = keyboardInfo;
          expect(keyboard_info.beginRect.height != null).assertTrue();
          expect(keyboard_info.beginRect.width != null).assertTrue();
          expect(keyboard_info.beginRect.top != null).assertTrue();
          expect(keyboard_info.beginRect.left != null).assertTrue();
          expect(keyboard_info.endRect.height != null).assertTrue();
          expect(keyboard_info.endRect.width != null).assertTrue();
          expect(keyboard_info.endRect.top != null).assertTrue();
          expect(keyboard_info.endRect.left != null).assertTrue();
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
      try {
        (tempWnd as window.Window).on('keyboardDidShow', () => {
          console.info(msgStr + "second listener trigger");
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
      try {
        (tempWnd as window.Window).off('keyboardDidShow');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the unregister for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
      await (tempWnd as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.name   testWindowOffKeyboardDidShow_UnregisteredOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0060
     * @tc.desc   Disable listening for the height change of the soft keyboard in the fixed state input method window
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowOffKeyboardDidShow_UnregisteredOff', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testWindowOffKeyboardDidShow_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindowOffKeyboardDidShow_UnregisteredOff').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as window.Window).off('keyboardDidShow');
        await (tempWnd as window.Window).destroyWindow();
      } catch (exception) {
        await (tempWnd as window.Window).destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the unregister for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.name   testWindowOffKeyboardDidShow_RepeatOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0070
     * @tc.desc   test testWindowOffKeyboardDidShow_RepeatOff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowOffKeyboardDidShow_RepeatOff', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testWindowOffKeyboardDidShow_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindowOffKeyboardDidShow_RepeatOff').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as window.Window).on('keyboardDidShow', (keyboardInfo: window.KeyboardInfo) => {
          console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          await (tempWnd as window.Window).destroyWindow();
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        (tempWnd as window.Window).off('keyboardDidShow');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the unregister for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          await (tempWnd as window.Window).destroyWindow();
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        (tempWnd as window.Window).off('keyboardDidShow');
        await (tempWnd as window.Window).destroyWindow();
      } catch (exception) {
        await (tempWnd as window.Window).destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the unregister for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.name   testWindow_on_off_keyboardDidHide_normal
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0080
     * @tc.desc   Enable fixed soft keyboard to display animation completed listening
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindow_on_off_keyboardDidHide_normal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindow_on_off_keyboardDidHide_normal';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindow_on_off_keyboardDidHide_normal').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).loadContent('testability/pages/second/pageTwo')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      let current_display_Class = display.getDefaultDisplaySync();
      await (tempWnd as window.Window).resize(800, current_display_Class.height).catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      await (tempWnd as window.Window).moveWindowTo(0, 0).catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      await (tempWnd as window.Window).showWindow().catch((err: BusinessError) => {
        expect().assertFail();
        done();
      });
      try {
        (tempWnd as window.Window).on('keyboardDidHide', () => {
          console.info(msgStr + "first listener trigger");
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard hide. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
      try {
        (tempWnd as window.Window).on('keyboardDidHide', () => {
          console.info(msgStr + "second listener trigger");
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard hide. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
      try {
        (tempWnd as window.Window).off('keyboardDidHide');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the unregister for keyboard hide. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
      await (tempWnd as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.name   testWindowOffKeyboardDidHide_UnregisteredOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0090
     * @tc.desc   test testWindowOffKeyboardDidHide_UnregisteredOff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowOffKeyboardDidHide_UnregisteredOff', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testWindowOffKeyboardDidHide_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindowOffKeyboardDidHide_UnregisteredOff').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as window.Window).off('keyboardDidHide');
        await (tempWnd as window.Window).destroyWindow();
      } catch (exception) {
        await (tempWnd as window.Window).destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the unregister for keyboard hide. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.name   testWindowOffKeyboardDidHide_RepeatOff
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0100
     * @tc.desc   test testWindowOffKeyboardDidHide_RepeatOff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWindowOffKeyboardDidHide_RepeatOff', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testWindowOffKeyboardDidHide_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindowOffKeyboardDidHide_RepeatOff').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as window.Window).on('keyboardDidHide', (keyboardInfo: window.KeyboardInfo) => {
          console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard hide. Cause code: ${exception.code}, message: ${exception.message}`);
          await (tempWnd as window.Window).destroyWindow();
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        (tempWnd as window.Window).off('keyboardDidHide');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the unregister for keyboard hide. Cause code: ${exception.code}, message: ${exception.message}`);
          await (tempWnd as window.Window).destroyWindow();
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        (tempWnd as window.Window).off('keyboardDidHide');
        await (tempWnd as window.Window).destroyWindow();
      } catch (exception) {
        await (tempWnd as window.Window).destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the unregister for keyboard hide. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.name   testWindowOnkeyboardDidShow_WindowAbnormal
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0110
     * @tc.desc   test testWindowOnkeyboardDidShow_WindowAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testWindowOnkeyboardDidShow_WindowAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async () => {
      let caseName = 'testWindowOnkeyboardDidShow_WindowAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindowOnkeyboardDidShow_WindowAbnormal').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).destroyWindow();
      try {
        (tempWnd as window.Window).on('keyboardDidShow', (keyboardInfo: window.KeyboardInfo) => {
          console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
        });
        expect().assertFail();
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300002);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.name   testWindowOffkeyboardDidShow_WindowAbnormal
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0120
     * @tc.desc   test testWindowOffkeyboardDidShow_WindowAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testWindowOffkeyboardDidShow_WindowAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async () => {
      let caseName = 'testWindowOffkeyboardDidShow_WindowAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindowOffkeyboardDidShow_WindowAbnormal').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).destroyWindow();
      try {
        (tempWnd as window.Window).off('keyboardDidShow');
        expect().assertFail();
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300002);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.name   testWindowOnkeyboardDidHide_WindowAbnormal
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0130
     * @tc.desc   test testWindowOnkeyboardDidHide_WindowAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testWindowOnkeyboardDidHide_WindowAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async () => {
      let caseName = 'testWindowOnkeyboardDidHide_WindowAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindowOnkeyboardDidHide_WindowAbnormal').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).destroyWindow();
      try {
        (tempWnd as window.Window).on('keyboardDidHide', (keyboardInfo: window.KeyboardInfo) => {
          console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
        });
        expect().assertFail();
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300002);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.name   testWindowOffkeyboardDidHide_WindowAbnormal
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWINPUT_JS_API_0140
     * @tc.desc   test testWindowOffkeyboardDidHide_WindowAbnormal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testWindowOffkeyboardDidHide_WindowAbnormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async () => {
      let caseName = 'testWindowOffkeyboardDidHide_WindowAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      tempWnd = await windowStage.createSubWindow('testWindowOffkeyboardDidHide_WindowAbnormal').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).destroyWindow();
      try {
        (tempWnd as window.Window).off('keyboardDidHide');
        expect().assertFail();
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to enable the listener for keyboard show. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(exception.code).assertEqual(1300002);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
  })
}