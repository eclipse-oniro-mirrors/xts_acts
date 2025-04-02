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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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

    afterEach(async ()=>{
      if(tempWnd !== null && tempWnd !== undefined){
        await (tempWnd as window.Window).destroyWindow();
      }
      if(subWin !== null && subWin !== undefined){
        await (subWin as window.Window).destroyWindow();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5060
     * @tc.name      : testKeepKeyboardOnFocus_DialogWindow
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testKeepKeyboardOnFocus_DialogWindow', 0, async () => {
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5070
     * @tc.name      : testKeepKeyboardOnFocus_SubWindow
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testKeepKeyboardOnFocus_SubWindow', 0, async () => {
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5080
     * @tc.name      : testKeepKeyboardOnFocus_MainWindow
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testKeepKeyboardOnFocus_MainWindow', 0, async () => {
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5590
     * @tc.name      : testKeepKeyboardOnFocus_SubWindowWithOps
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
     */
    it('testKeepKeyboardOnFocus_SubWindowWithOps', 0, async () => {
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

  })
}