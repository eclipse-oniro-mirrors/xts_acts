/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import ohosWindow from '@ohos.window';
import screen from '@ohos.screen';
import display from '@ohos.display';
import deviceInfo from '@ohos.deviceInfo';
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'

export default function interfaceSupportSessionManagerTest(context, windowStage, abilityStorage) {
  describe('interface_support_sessionManager_test', function () {
    console.log('describe interface_support_sessionManager_test start!!!')

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }

    let currentDeviceIsRk = false;
    beforeAll(async function () {
      // 获取当前的设备类型，区分是否是RK
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsRk = deviceTypeInfo === 'default' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType);
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2510
     * @tc.name      : testKeepKeyboardOnFocus_SubWindow_True
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focusc.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SubWindow_True', 0, async function () {
      let caseName = 'testKeepKeyboardOnFocus_SubWindow_True';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow = null;
      subWindow = await windowStage.createSubWindow('testKeepKeyboardOnFocus_SubWindow').catch((err) => {
        expect().assertFail();
      });
      expect(!!subWindow).assertTrue();
      try {
        subWindow.keepKeyboardOnFocus(true);
        await subWindow.destroyWindow();
      } catch (exception) {
        await subWindow.destroyWindow();
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2520
     * @tc.name      : testKeepKeyboardOnFocus_SubWindow_False
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SubWindow_False', 0, async function () {
      let caseName = 'testKeepKeyboardOnFocus_SubWindow_False';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow = null;
      subWindow = await windowStage.createSubWindow('testKeepKeyboardOnFocus_SubWindow_False').catch((err) => {
        expect().assertFail();
      });
      expect(!!subWindow).assertTrue();
      try {
        subWindow.keepKeyboardOnFocus(false);
        await subWindow.destroyWindow();
      } catch (exception) {
        await subWindow.destroyWindow();
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2530
     * @tc.name      : testKeepKeyboardOnFocus_SystemWindow_False
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SystemWindow_False', 0, async function () {
      let caseName = 'testKeepKeyboardOnFocus_SystemWindow_False';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: 'testKeepKeyboardOnFocus_SystemWindow_False',
        windowType: ohosWindow.WindowType.TYPE_SYSTEM_TOAST,
        ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'createWindow tempWnd failed');
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        tempWnd.keepKeyboardOnFocus(false);
        await tempWnd.destroyWindow();
      } catch (exception) {
        await tempWnd.destroyWindow();
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2540
     * @tc.name      : testKeepKeyboardOnFocus_SystemWindow_True
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SystemWindow_True', 0, async function () {
      let caseName = 'testKeepKeyboardOnFocus_SystemWindow_True';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: 'testKeepKeyboardOnFocus_SystemWindow_True',
        windowType: ohosWindow.WindowType.TYPE_SYSTEM_TOAST,
        ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'createWindow tempWnd failed');
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        tempWnd.keepKeyboardOnFocus(false);
        await tempWnd.destroyWindow();
      } catch (exception) {
        await tempWnd.destroyWindow();
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2550
     * @tc.name      : testKeepKeyboardOnFocus_WindowStateAbnormal
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_WindowStateAbnormal', 0, async function () {
      let caseName = 'testKeepKeyboardOnFocus_SystemWindow_True';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: 'testKeepKeyboardOnFocus_SystemWindow_True',
        windowType: ohosWindow.WindowType.TYPE_SYSTEM_TOAST,
        ctx: context
      };
      let tempWnd = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'createWindow tempWnd failed');
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.destroyWindow();
      try {
        tempWnd.keepKeyboardOnFocus(false);
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2560
     * @tc.name      : testKeepKeyboardOnFocus_MainWindow
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_MainWindow', 0, async function () {
      let caseName = 'testKeepKeyboardOnFocus_MainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null
      tempWnd = await windowStage.getMainWindow().catch((err) => {
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        tempWnd.keepKeyboardOnFocus(true);
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2570
     * @tc.name      : testWindowOffWindowVisibilityChange_UnregisteredOff
     * @tc.desc      : Enable this window to listen for status change events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowVisibilityChange_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffWindowVisibilityChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testWindowOffWindowVisibilityChange_UnregisteredOff",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      try {
        win.off('windowVisibilityChange');
        await win.destroyWindow();
        expect().assertFail();
      } catch (exception) {
        await win.destroyWindow();
        console.error(msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2580
     * @tc.name      : testWindowOffWindowVisibilityChange_RepeatOff
     * @tc.desc      : Enable this window to listen for status change events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowVisibilityChange_RepeatOff', 0, async function () {
      let caseName = 'testWindowOffWindowVisibilityChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testWindowOffWindowVisibilityChange_RepeatOff",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      try {
        win.on('windowVisibilityChange', (boolean) => {
          console.info(msgStr + 'Window visibility changed, isVisible=' + boolean);
        });
      } catch (exception) {
        if (!currentDeviceIsRk) {
          console.error('Failed to register callback. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        win.off('windowVisibilityChange');
      } catch (exception) {
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(1300002);
        }
      }
      try {
        win.off('windowVisibilityChange');
        await win.destroyWindow();
        expect().assertFail();
      } catch (exception) {
        await win.destroyWindow();
        console.error(msgStr + 'Failed to unregister callback Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2590
     * @tc.name      : testSetSingleFrameComposerEnabled_True
     * @tc.desc      : Disable/Enable the function of single frame compositing render node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSingleFrameComposerEnabled_True', 0, async function () {
      let caseName = 'testSetSingleFrameComposerEnabled_True';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetSingleFrameComposerEnabled_True",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      await win.setSingleFrameComposerEnabled(true).then(async () => {
        console.info(msgStr + 'Succeeded in enabling the single-frame-composer function.');
        await win.destroyWindow();
      }).catch((err) => {
        if (!currentDeviceIsRk) {
          console.error(msgStr + `ailed to enable the single-frame-composer function. code:${err.code}, message:${err.message}.`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2600
     * @tc.name      : testSetSingleFrameComposerEnabled_False
     * @tc.desc      : Disable/Enable the function of single frame compositing render node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSingleFrameComposerEnabled_False', 0, async function () {
      let caseName = 'testSetSingleFrameComposerEnabled_False';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetSingleFrameComposerEnabled_False",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      await win.setSingleFrameComposerEnabled(false).then(async () => {
        console.info(msgStr + 'Succeeded in enabling the single-frame-composer function.');
        await win.destroyWindow();
      }).catch((err) => {
        if (!currentDeviceIsRk) {
          console.error(msgStr + `Failed to enable the single-frame-composer function. code:${err.code}, message:${err.message}.`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2610
     * @tc.name      : testSetSingleFrameComposerEnabled_WindowStateAbnormal
     * @tc.desc      : Disable/Enable the function of single frame compositing render node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSingleFrameComposerEnabled_WindowStateAbnormal', 0, async function () {
      let caseName = 'testSetSingleFrameComposerEnabled_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetSingleFrameComposerEnabled_WindowStateAbnormal",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      await win.destroyWindow();
      await win.setSingleFrameComposerEnabled(false).then(() => {
        console.info(msgStr + 'Succeeded in enabling the single-frame-composer function.');
        expect().assertFail();
      }).catch((err) => {
        console.error(msgStr + `Failed to enable the single-frame-composer function. code:${err.code}, message:${err.message}.`);
        expect(err.code).assertEqual(1300002);
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2620
     * @tc.name      : testSetSingleFrameComposerEnabled_Invalid_ParameThree
     * @tc.desc      : Disable/Enable the function of single frame compositing render node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSingleFrameComposerEnabled_Invalid_ParameThree', 0, async function () {
      let caseName = 'testSetSingleFrameComposerEnabled_Invalid_ParameThree';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetSingleFrameComposerEnabled_Invalid_ParameThree",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      await win.setSingleFrameComposerEnabled(false, true).then(async () => {
        console.info(msgStr + 'Succeeded in enabling the single-frame-composer function.');
        await win.destroyWindow();
        expect().assertFail();
      }).catch(async (err) => {
        console.error(msgStr + `Failed to enable the single-frame-composer function. code:${err.code}, message:${err.message}.`);
        await win.destroyWindow();
        expect(err.code).assertEqual(401);
      });
    })

  })
}
