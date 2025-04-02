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
import { describe, it, expect } from "@ohos/hypium"
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function windowDialogTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('window_dialog_test', () => {
    console.log('describe window_dialog_test start!!!')

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4520
     * @tc.name      : testSetDialogBackGestureEnabled_Dialog_True
     * @tc.desc      : Sets whether the modal window responds to gesture return events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetDialogBackGestureEnabled_Dialog_True', 0, async () => {
      let caseName = 'testSetDialogBackGestureEnabled_Dialog_True';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetDialogBackGestureEnabled_Dialog_True",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd: window.Window | undefined = undefined;
      await window.createWindow(windowConfig).then((data) => {
        tempWnd = data;
        expect(!!tempWnd).assertTrue();
        console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let enabled = true;
      await tempWnd!.setDialogBackGestureEnabled(enabled).then(() => {
        console.info(msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
      }).catch(async (err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr +
            `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
          await tempWnd!.destroyWindow();
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      await tempWnd!.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4530
     * @tc.name      : testSetDialogBackGestureEnabled_Dialog_False
     * @tc.desc      : Sets whether the modal window responds to gesture return events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetDialogBackGestureEnabled_Dialog_False', 0, async () => {
      let caseName = 'testSetDialogBackGestureEnabled_Dialog_False';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetDialogBackGestureEnabled_Dialog_False",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd: window.Window | undefined = undefined;
      await window.createWindow(windowConfig).then((data) => {
        tempWnd = data;
        expect(!!tempWnd).assertTrue();
        console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let enabled = false;
      await tempWnd!.setDialogBackGestureEnabled(enabled).then(() => {
        console.info(msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
      }).catch(async (err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr +
            `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
          await tempWnd!.destroyWindow();
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      await tempWnd!.destroyWindow();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4540
     * @tc.name      : testSetDialogBackGestureEnabled_Dialog_WindowAbnormal
     * @tc.desc      : Sets whether the modal window responds to gesture return events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetDialogBackGestureEnabled_Dialog_WindowAbnormal', 0, async () => {
      let caseName = 'testSetDialogBackGestureEnabled_Dialog_WindowAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetDialogBackGestureEnabled_Dialog_WindowAbnormal",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd: window.Window | undefined = undefined;
      await window.createWindow(windowConfig).then((data) => {
        tempWnd = data;
        expect(!!tempWnd).assertTrue();
        console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let enabled = true;
      await tempWnd!.destroyWindow();
      await tempWnd!.setDialogBackGestureEnabled(enabled).then(() => {
        console.info(msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
        expect().assertFail();
      }).catch(async (err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr +
            `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300002);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4550
     * @tc.name      : testSetDialogBackGestureEnabled_MainWindow
     * @tc.desc      : Sets whether the modal window responds to gesture return events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetDialogBackGestureEnabled_MainWindow', 0, async () => {
      let caseName = 'testSetDialogBackGestureEnabled_MainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin: window.Window = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let enabled = false;
      await mainWin.setDialogBackGestureEnabled(enabled).then(() => {
        console.info(msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
        expect().assertFail();
      }).catch(async (err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr +
            `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4560
     * @tc.name      : testSetDialogBackGestureEnabled_SubWindow
     * @tc.desc      : Sets whether the modal window responds to gesture return events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetDialogBackGestureEnabled_SubWindow', 0, async () => {
      let caseName = 'testSetDialogBackGestureEnabled_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWin: window.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetDialogBackGestureEnabled_SubWindow').then((data) => {
        subWin = data;
        expect(!!subWin).assertTrue();
        console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      let enabled = false;
      await subWin!.setDialogBackGestureEnabled(enabled).then(() => {
        console.info(msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
        expect().assertFail();
      }).catch(async (err: BusinessError) => {
        if (err.code != 801) {
          console.error(msgStr +
            `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300004);
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      await subWin!.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4590
     * @tc.name      : testSetDialogBackGestureEnabled_Null
     * @tc.desc      : Sets whether the modal window responds to gesture return events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetDialogBackGestureEnabled_Null', 0, async () => {
      let caseName = 'testSetDialogBackGestureEnabled_Null';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetDialogBackGestureEnabled_Null",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd: window.Window | undefined = undefined;
      await window.createWindow(windowConfig).then((data) => {
        tempWnd = data;
        expect(!!tempWnd).assertTrue();
        console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await tempWnd!.setDialogBackGestureEnabled(null).then(() => {
          console.info(msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr +
              `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (exception) {
        console.error(msgStr +
          `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
      await tempWnd!.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4600
     * @tc.name      : testSetDialogBackGestureEnabled_Undefined
     * @tc.desc      : Sets whether the modal window responds to gesture return events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetDialogBackGestureEnabled_Undefined', 0, async () => {
      let caseName = 'testSetDialogBackGestureEnabled_Undefined';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetDialogBackGestureEnabled_Undefined",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd: window.Window | undefined = undefined;
      await window.createWindow(windowConfig).then((data) => {
        tempWnd = data;
        expect(!!tempWnd).assertTrue();
        console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await tempWnd!.setDialogBackGestureEnabled(undefined).then(() => {
          console.info(msgStr + 'Succeeded in setting dialog window to ignore back gesture.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr +
              `Failed to set dialog window to ignore back gesture. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (exception) {
        console.error(msgStr +
          `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
      await tempWnd!.destroyWindow();
    })
  })
}