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
import { describe, beforeAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function interfaceSupportSessionManagerTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  describe('interface_support_sessionManager_test', () => {
    console.log('describe interface_support_sessionManager_test start!!!')

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

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2510
     * @tc.name      : testKeepKeyboardOnFocus_SubWindow_True
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focusc.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SubWindow_True', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_SubWindow_True';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: ohosWindow.Window | void = await windowStage.createSubWindow('testKeepKeyboardOnFocus_SubWindow')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      try {
        (subWindow as ohosWindow.Window).keepKeyboardOnFocus(true);
        await (subWindow as ohosWindow.Window).destroyWindow();
      } catch (exception) {
        await (subWindow as ohosWindow.Window).destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
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
    it('testKeepKeyboardOnFocus_SubWindow_False', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_SubWindow_False';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: ohosWindow.Window | void = await windowStage.createSubWindow('testKeepKeyboardOnFocus_SubWindow_False')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      try {
        (subWindow as ohosWindow.Window).keepKeyboardOnFocus(false);
        await (subWindow as ohosWindow.Window).destroyWindow();
      } catch (exception) {
        await (subWindow as ohosWindow.Window).destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
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
    it('testKeepKeyboardOnFocus_MainWindow', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_MainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void = await windowStage.getMainWindow().catch((err: BusinessError) => {
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as ohosWindow.Window).keepKeyboardOnFocus(true);
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
      }
    })

    
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3730
     * @tc.name      : testResize_MinLimits
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_MinLimits', 0, async function () {
      let caseName = 'testResize_MinLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testResize_MinLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        console.log(msgStr + 'width is: ' + windowLimits.minWidth + ' ' + "height is: " + windowLimits.minHeight);
        await tempWnd.resize(windowLimits.minWidth, windowLimits.minHeight).catch((err) => {
          console.log(msgStr + 'tempWnd.resize failed');
          expect().assertFail();
        });
        console.log(msgStr + 'tempWnd.resize successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.showWindow().catch((err) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      console.log(msgStr + 'tempWnd.showWindow successed');
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3740
     * @tc.name      : testResize_MaxLimits
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_MaxLimits', 0, async function () {
      let caseName = 'testResize_MaxLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testResize_MaxLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        console.log(msgStr + 'width is: ' + windowLimits.maxWidth + ' ' + "height is: " + windowLimits.maxHeight);
        await tempWnd.resize(windowLimits.maxWidth, windowLimits.maxHeight).catch((err) => {
          console.log(msgStr + 'tempWnd.resize failed');
          expect().assertFail();
        });
        console.log(msgStr + 'tempWnd.resize successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.showWindow().catch((err) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      console.log(msgStr + 'tempWnd.showWindow successed');
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3750
     * @tc.name      : testResize_MaxAndMinLimits
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_MaxAndMinLimits', 0, async function () {
      let caseName = 'testResize_MaxAndMinLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testResize_MaxAndMinLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        console.log(msgStr + 'width is: ' + windowLimits.minWidth + ' ' + "height is: " + windowLimits.maxHeight);
        await tempWnd.resize(windowLimits.minWidth, windowLimits.maxHeight).catch((err) => {
          console.log(msgStr + 'tempWnd.resize failed');
          expect().assertFail();
        });
        console.log(msgStr + 'tempWnd.resize successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.showWindow().catch((err) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      console.log(msgStr + 'tempWnd.showWindow successed');
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3760
     * @tc.name      : testResize_Over_MaxLimits
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_Over_MaxLimits', 0, async function () {
      let caseName = 'testResize_Over_MaxLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testResize_Over_MaxLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      await tempWnd.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await tempWnd.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        let _width = windowLimits.maxWidth + 100;
        let _height = windowLimits.maxHeight + 5;
        console.log(msgStr + 'width is: ' + _width + ' ' + "height is: " + _height);
        await tempWnd.resize(_width, _height).then(() => {
          console.log(msgStr + 'tempWnd.resize successed');
        }).catch((err) => {
          console.log(msgStr + 'tempWnd.resize failed Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(900)
        let properties = tempWnd.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(windowLimits.maxWidth)
        expect(properties.windowRect.height).assertEqual(windowLimits.maxHeight)
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3770
     * @tc.name      : testResize_setAndGet_MinLimits
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_setAndGet_MinLimits', 0, async function () {
      let caseName = 'testResize_setAndGet_MinLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testResize_setAndGet_MinLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      let winLimits: ohosWindow.WindowLimits = {
        maxWidth: 1500,
        maxHeight: 1000,
        minWidth: 500,
        minHeight: 400
      };
      await tempWnd.setWindowLimits(winLimits).then((data) => {
        console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr + 'Failed to change the window limits. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        console.log(msgStr + 'width is: ' + windowLimits.minWidth + ' ' + "height is: " + windowLimits.minHeight);
        await tempWnd.resize(windowLimits.minWidth, windowLimits.minHeight).then(() => {
          console.log(msgStr + 'tempWnd.resize successed');
        }).catch((err) => {
          console.log(msgStr + 'tempWnd.resize failed');
          expect().assertFail();
        });
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.showWindow().catch((err) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      console.log(msgStr + 'tempWnd.showWindow successed');
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3780
     * @tc.name      : testResize_setAndGet_MaxLimits
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_setAndGet_MaxLimits', 0, async function () {
      let caseName = 'testResize_setAndGet_MaxLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testResize_setAndGet_MaxLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      let winLimits: ohosWindow.WindowLimits = {
        maxWidth: 1000,
        maxHeight: 1200,
        minWidth: 200,
        minHeight: 200
      };
      await tempWnd.setWindowLimits(winLimits).then((data) => {
        console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr + 'Failed to change the window limits. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        console.log(msgStr + 'width is: ' + windowLimits.maxWidth + ' ' + "height is: " + windowLimits.maxHeight);
        await tempWnd.resize(windowLimits.maxWidth, windowLimits.maxHeight).catch((err) => {
          console.log(msgStr + 'tempWnd.resize failed');
          expect().assertFail();
        });
        console.log(msgStr + 'tempWnd.resize successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.showWindow().catch((err) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      console.log(msgStr + 'tempWnd.showWindow successed');
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3790
     * @tc.name      : testResize_setAndGet_MaxAndMinLimits
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_setAndGet_MaxAndMinLimits', 0, async function () {
      let caseName = 'testResize_setAndGet_MaxAndMinLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testResize_setAndGet_MaxAndMinLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      let winLimits: ohosWindow.WindowLimits = {
        maxWidth: 1000,
        maxHeight: 1200,
        minWidth: 200,
        minHeight: 200
      };
      await tempWnd.setWindowLimits(winLimits).then((data) => {
        console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr + 'Failed to change the window limits. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        console.log(msgStr + 'width is: ' + windowLimits.minWidth + ' ' + "height is: " + windowLimits.maxHeight);
        await tempWnd.resize(windowLimits.minWidth, windowLimits.maxHeight).catch((err) => {
          console.log(msgStr + 'tempWnd.resize failed');
          expect().assertFail();
        });
        console.log(msgStr + 'tempWnd.resize successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.showWindow().catch((err) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      console.log(msgStr + 'tempWnd.showWindow successed');
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3800
     * @tc.name      : testResize_setAndGet_Over_MaxLimits
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_setAndGet_Over_MaxLimits', 0, async function () {
      let caseName = 'testResize_setAndGet_Over_MaxLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testResize_setAndGet_Over_MaxLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      await tempWnd.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await tempWnd.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let winLimits: ohosWindow.WindowLimits = {
        maxWidth: 1000,
        maxHeight: 1200,
        minWidth: 200,
        minHeight: 200
      };
      await tempWnd.setWindowLimits(winLimits).then((data) => {
        console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr + 'Failed to change the window limits. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        let _width = windowLimits.maxWidth + 100;
        let _height = windowLimits.maxHeight + 5;
        console.log(msgStr + 'width is: ' + _width + ' ' + "height is: " + _height);
        await tempWnd.resize(_width, _height).then(() => {
          console.log(msgStr + 'tempWnd.resize successed');
        }).catch((err) => {
          console.log(msgStr + 'tempWnd.resize failed Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(900)
        let properties = tempWnd.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(windowLimits.maxWidth)
        expect(properties.windowRect.height).assertEqual(windowLimits.maxHeight)
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3810
     * @tc.name      : testResize_SubWindow_LimitMin_Callback
     * @tc.desc      : Verify that the sub window size is limited
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_SubWindow_LimitMin_Callback', 0, async function (done) {
      let caseName = 'testResize_SubWindow_LimitMin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subMin = null;
      subMin = await windowStage.createSubWindow('testResize_SubWindow_LimitMin_Callback')
        .catch((err: BusinessError) => {
          console.error('Failed to create the subwindow. Cause: ' + JSON.stringify(err));
        });
      expect(!!subMin).assertTrue();
      await subMin.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await subMin.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await subMin.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      let windowLimits = null;
      try {
        windowLimits = subMin.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        let _width = windowLimits.minWidth;
        let _height = windowLimits.minHeight;
        console.log(msgStr + 'width is: ' + _width + ' ' + "height is: " + _height);
        subMin.resize(_width, _height, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(900)
          let properties = subMin.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.width).assertEqual(_width)
          expect(properties.windowRect.height).assertEqual(_height)
          await subMin.destroyWindow();
          done();
        });
      } catch (exception) {
        await subMin.destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3820
     * @tc.name      : testResize_SubWindow_LimitMax_Callback
     * @tc.desc      : Verify that the sub window size is limited
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_SubWindow_LimitMax_Callback', 0, async function (done) {
      let caseName = 'testResize_SubWindow_LimitMax_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subMin = null;
      subMin = await windowStage.createSubWindow('testResize_SubWindow_LimitMax_Callback')
        .catch((err: BusinessError) => {
          console.error('Failed to create the subwindow. Cause: ' + JSON.stringify(err));
        });
      expect(!!subMin).assertTrue();
      await subMin.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await subMin.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await subMin.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      let windowLimits = null;
      try {
        windowLimits = subMin.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        let _width = windowLimits.maxWidth;
        let _height = windowLimits.maxHeight;
        console.log(msgStr + 'width is: ' + _width + ' ' + "height is: " + _height);
        subMin.resize(_width, _height, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(900)
          let properties = subMin.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.width).assertEqual(_width)
          expect(properties.windowRect.height).assertEqual(_height)
          await subMin.destroyWindow();
          done();
        });
      } catch (exception) {
        await subMin.destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3830
     * @tc.name      : testResize_SubWindow_Over_MaxLimits
     * @tc.desc      : Verify that the sub window size is limited
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_SubWindow_Over_MaxLimits', 0, async function () {
      let caseName = 'testResize_SubWindow_Over_MaxLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subMin = null;
      subMin = await windowStage.createSubWindow('testResize_SubWindow_Over_MaxLimits').catch((err: BusinessError) => {
        console.error('Failed to create the subwindow. Cause: ' + JSON.stringify(err));
      });
      expect(!!subMin).assertTrue();
      await subMin.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await subMin.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await subMin.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let windowLimits = null;
      try {
        windowLimits = subMin.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        let _width = windowLimits.maxWidth + 10;
        let _height = windowLimits.maxHeight + 20;
        console.log(msgStr + 'width is: ' + _width + ' ' + "height is: " + _height);
        await subMin.resize(_width, _height).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(900)
        let properties = subMin.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(windowLimits.maxWidth)
        expect(properties.windowRect.height).assertEqual(windowLimits.maxHeight)
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await subMin.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3840
     * @tc.name      : testResize_SubWindow_LessThan_MinLimits
     * @tc.desc      : Verify that the sub window size is limited
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_SubWindow_LessThan_MinLimits', 0, async function () {
      let caseName = 'testResize_SubWindow_LessThan_MinLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subMin = null;
      subMin = await windowStage.createSubWindow('testResize_SubWindow_LessThan_MinLimits')
        .catch((err: BusinessError) => {
          console.error('Failed to create the subwindow. Cause: ' + JSON.stringify(err));
        });
      expect(!!subMin).assertTrue();
      await subMin.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await subMin.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await subMin.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let windowLimits = null;
      try {
        windowLimits = subMin.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        let _width = windowLimits.minWidth - 1;
        let _height = windowLimits.minHeight - 1;
        console.log(msgStr + 'width is: ' + _width + ' ' + "height is: " + _height);
        await subMin.resize(_width, _height).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(900)
        let properties = subMin.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(windowLimits.minWidth)
        expect(properties.windowRect.height).assertEqual(windowLimits.minHeight)
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await subMin.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4030
     * @tc.name      : testGetAndSetWindowLimits
     * @tc.desc      : Verify that get and set values are the same
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetAndSetWindowLimits', 0, async function () {
      let caseName = 'testGetAndSetWindowLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await windowStage.createSubWindow('testGetAndSetWindowLimits').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      await tempWnd.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await tempWnd.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let winLimits: ohosWindow.WindowLimits = {
        maxWidth: 3003,
        maxHeight: 3003,
        minWidth: 2002,
        minHeight: 2002
      };
      await tempWnd.setWindowLimits(winLimits).then((data) => {
        console.info(msgStr + 'Succeeded in changing the window limits. Cause:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr + 'Failed to change the window limits. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + +JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      try {
        windowLimits = tempWnd.getWindowLimits();
        console.log(msgStr + 'windowLimits is: ' + JSON.stringify(windowLimits));
        expect(windowLimits.maxWidth).assertEqual(3003);
        expect(windowLimits.maxHeight).assertEqual(3003);
        expect(windowLimits.minWidth).assertEqual(2002);
        expect(windowLimits.minHeight).assertEqual(2002);
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to obtain the window limits of window. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await tempWnd.destroyWindow();
    })
  })
}
