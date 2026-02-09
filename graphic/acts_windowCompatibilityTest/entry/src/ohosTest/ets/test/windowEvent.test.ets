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
import { UiDriver, BY, ON, PointerMatrix, UiComponent } from '@ohos.UiTest'
import { BusinessError, Callback } from '@ohos.base';
import common from '@ohos.app.ability.common';

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


function buttonClick(buttonText: string, msgStr: string) {
  console.info(msgStr + `case come in buttonClick fun`)
  return new Promise<string>(async (resolve, reject) => {
    let driver = await UiDriver.create()
    console.info(msgStr + `case come in buttonClick fun`)
    console.info(msgStr + `driver is ${JSON.stringify(driver)}`)
    await sleep(900)
    console.info(msgStr + `UiDriver start`)
    let button: UiComponent = await driver.findComponent(BY.text(buttonText))
    console.info(msgStr + `button is ${JSON.stringify(button)}`)
    await sleep(900)
    if (button) {
      console.info(msgStr + `button click begin`)
      await button.click()
      console.info(msgStr + `button click end`)
      resolve(msgStr + 'get button successed')
    } else {
      console.info(msgStr + `inter else: button is null`)
      reject(msgStr + 'get button failed')
    }
  })
}
export default function windowEventTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('window_event_test', () => {
    console.log('describe window_event_test start!!!')
    let tempWnd: window.Window | void;
    let subWin: window.Window | void;

    beforeEach(async ()=>{
      let msg = 'window_event_test';
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
     * @tc.name   testTouchOutside_OnDialogWindow_ClickMainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0010
     * @tc.desc   Enable listening for click events outside this window area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTouchOutside_OnDialogWindow_ClickMainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testTouchOutside_OnDialogWindow_ClickMainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testTouchOutside_OnDialogWindow_ClickMainWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/pageOne");
      await (tempWnd as window.Window).showWindow();
      await (tempWnd as window.Window).moveWindowTo(1000, 1000);

      let mainWin = windowStage.getMainWindowSync();
      try {
        // 模态窗口覆盖的主窗口点击不到，所以不会触发监听
        (tempWnd as window.Window).on('touchOutside', async () => {
          console.info(msgStr + 'touch outside');
          (tempWnd as window.Window).off('touchOutside');
          await (tempWnd as window.Window).destroyWindow();
          expect().assertFail();
          done();
        });
        console.info(msgStr + 'register touch outside listener successed');
      } catch (exception) {
        console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await buttonClick('MainPageButton', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as window.Window).destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(800);
      (tempWnd as window.Window).off('touchOutside');
      await (tempWnd as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.name   testTouchOutside_OnMainWindow_ClickDialog
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0020
     * @tc.desc   Enable listening for click events outside this window area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTouchOutside_OnMainWindow_ClickDialog', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testTouchOutside_OnMainWindow_ClickDialog';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testTouchOutside_OnMainWindow_ClickDialog",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/second");
      await (tempWnd as window.Window).showWindow();
      await (tempWnd as window.Window).moveWindowTo(10, 10);

      let mainWin = windowStage.getMainWindowSync();
      try {
        mainWin.on('touchOutside', async () => {
          console.info(msgStr + 'touch outside');
          mainWin.off('touchOutside');
          await (tempWnd as window.Window).destroyWindow();
          await sleep(800)
          done();
        });
        console.info(msgStr + 'register touch outside listener successed');
      } catch (exception) {
        console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as window.Window).destroyWindow();
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.name   testTouchOutside_OnSubWindow_ClickMainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0030
     * @tc.desc   Enable listening for click events outside this window area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTouchOutside_OnSubWindow_ClickMainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testTouchOutside_OnSubWindow_ClickMainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testTouchOutside_OnSubWindow_ClickMainWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/pageOne");
      await (subWin as window.Window).showWindow();
      await (subWin as window.Window).moveWindowTo(1000, 1000);
      let mainWin = windowStage.getMainWindowSync();
      try {
        (subWin as window.Window).on('touchOutside', async () => {
          console.info(msgStr + 'touch outside');
          (subWin as window.Window).off('touchOutside');
          await (subWin as window.Window).destroyWindow();
          await sleep(800)
          done();
        });
        console.info(msgStr + 'register touch outside listener successed');
      } catch (exception) {
        console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await buttonClick('MainPageButton', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (subWin as window.Window).destroyWindow();
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.name   testTouchOutside_OnMainWindow_ClickSubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0040
     * @tc.desc   Enable listening for click events outside this window area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTouchOutside_OnMainWindow_ClickSubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testTouchOutside_OnMainWindow_ClickSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testTouchOutside_OnMainWindow_ClickSubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/second");
      await (subWin as window.Window).showWindow();
      await (subWin as window.Window).moveWindowTo(10, 10);
      let mainWin = windowStage.getMainWindowSync();
      try {
        mainWin.on('touchOutside', async () => {
          console.info(msgStr + 'touch outside');
          mainWin.off('touchOutside');
          await (subWin as window.Window).destroyWindow();
          await sleep(800)
          done();
        });
        console.info(msgStr + 'register touch outside listener successed');
      } catch (exception) {
        console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await buttonClick('secondPage_BackToIndex', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (subWin as window.Window).destroyWindow();
        expect().assertFail();
        done();
      })
    })


    /**
     * @tc.name   testDialogTargetTouch_OnMainWindow_ClickMainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0050
     * @tc.desc   Enables listening for click or touch events for Windows covered by modal Windows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDialogTargetTouch_OnMainWindow_ClickMainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testDialogTargetTouch_OnMainWindow_ClickMainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testDialogTargetTouch_OnMainWindow_ClickMainWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/second");
      await (tempWnd as window.Window).showWindow();
      await (tempWnd as window.Window).moveWindowTo(1000, 1000);
      let mainWin = windowStage.getMainWindowSync();
      // The listener must be registered on the modal window or it is invalid
      try {
        mainWin.on('dialogTargetTouch', async () => {
          console.info(msgStr + 'touch dialog target');
          mainWin.off('dialogTargetTouch');
          await (tempWnd as window.Window).destroyWindow();
          expect().assertFail();
          done();
        });
        console.info(msgStr + 'register dialogTargetTouch listener successed');
      } catch (exception) {
        console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await buttonClick('MainPageButton', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as window.Window).destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(800)
      mainWin.off('dialogTargetTouch');
      await (tempWnd as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.name   testDialogTargetTouch_OnDialogWindow_ClickMainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0060
     * @tc.desc   Enables listening for click or touch events for Windows covered by modal Windows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDialogTargetTouch_OnDialogWindow_ClickMainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testDialogTargetTouch_OnDialogWindow_ClickMainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testDialogTargetTouch_OnDialogWindow_ClickMainWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/second");
      await (tempWnd as window.Window).showWindow();
      await (tempWnd as window.Window).moveWindowTo(1000, 1000);
      try {
        (tempWnd as window.Window).on('dialogTargetTouch', async () => {
          console.info(msgStr + 'touch dialog target');
          (tempWnd as window.Window).off('dialogTargetTouch');
          await (tempWnd as window.Window).destroyWindow();
          await sleep(800)
          done();
        });
        console.info(msgStr + 'register dialogTargetTouch listener successed');
      } catch (exception) {
        console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await buttonClick('MainPageButton', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as window.Window).destroyWindow();
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.name   testDialogTargetTouch_OnSubWindow_ClickSubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0070
     * @tc.desc   Enables listening for click or touch events for Windows covered by modal Windows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDialogTargetTouch_OnSubWindow_ClickSubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testDialogTargetTouch_OnSubWindow_ClickSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testDialogTargetTouch_OnSubWindow_Sub')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/pageOne");
      await (subWin as window.Window).showWindow();
      await (subWin as window.Window).moveWindowTo(10, 10);
      let windowConfig: window.Configuration = {
        name: "testDialogTargetTouch_OnSubWindow_Dialog",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/second");
      await (tempWnd as window.Window).showWindow();
      await (tempWnd as window.Window).moveWindowTo(900, 900);
      // The listener must be registered on the modal window or it is invalid
      try {
        (subWin as window.Window).on('dialogTargetTouch', async () => {
          console.info(msgStr + 'touch dialog target');
          (subWin as window.Window).off('dialogTargetTouch');
          await (subWin as window.Window).destroyWindow();
          await (tempWnd as window.Window).destroyWindow();
          expect().assertFail();
          done();
        });
        console.info(msgStr + 'register dialogTargetTouch listener successed');
      } catch (exception) {
        console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await buttonClick('点击pageOne', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as window.Window).destroyWindow();
        await (subWin as window.Window).destroyWindow();
        expect().assertFail();
        done();
      })
      await sleep(800);
      (subWin as window.Window).off('dialogTargetTouch');
      await (subWin as window.Window).destroyWindow();
      await (tempWnd as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.name   testDialogTargetTouch_OnDialogWindow_ClickSubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0080
     * @tc.desc   Enables listening for click or touch events for Windows covered by modal Windows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDialogTargetTouch_OnDialogWindow_ClickSubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testDialogTargetTouch_OnDialogWindow_ClickSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testDialogTargetTouch_OnDialogWindow_ClickSubWindow_Sub')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/pageOne");
      await (subWin as window.Window).showWindow();
      await (subWin as window.Window).moveWindowTo(10, 10);
      let windowConfig: window.Configuration = {
        name: "testDialogTargetTouch_OnDialogWindow_ClickSubWindow_Dialog",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/second");
      await (tempWnd as window.Window).showWindow();
      await (tempWnd as window.Window).moveWindowTo(900, 900);
      try {
        (tempWnd as window.Window).on('dialogTargetTouch', async () => {
          console.info(msgStr + 'touch dialog target');
          (tempWnd as window.Window).off('dialogTargetTouch');
          await (subWin as window.Window).destroyWindow();
          await (tempWnd as window.Window).destroyWindow();
          await sleep(800)
          done();
        });
        console.info(msgStr + 'register dialogTargetTouch listener successed');
      } catch (exception) {
        console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
      await buttonClick('点击pageOne', msgStr).catch(async (err: BusinessError) => {
        console.info(msgStr + err);
        await (tempWnd as window.Window).destroyWindow();
        await (subWin as window.Window).destroyWindow();
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testNoInteractionDetected_OnMainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0090
     * @tc.desc   Enables this window to not listen for interactive events within a specified timeout period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNoInteractionDetected_OnMainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testNoInteractionDetected_OnMainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        mainWin.on('noInteractionDetected', 1, () => {
          console.info(msgStr + 'no interaction in 10s');
          mainWin.off('noInteractionDetected');
          done();
        });
        console.info(msgStr + ' register noInteractionDetected successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
          done();
        }
      }
      await sleep(800)
      await sleep(800)
    })
    /**
     * @tc.name   testNoInteractionDetected_OnSubWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0100
     * @tc.desc   Enables this window to not listen for interactive events within a specified timeout period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNoInteractionDetected_OnSubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testNoInteractionDetected_OnSubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testNoInteractionDetected_OnSubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/pageOne");
      await (subWin as window.Window).showWindow();
      await (subWin as window.Window).moveWindowTo(10, 10);
      try {
        (subWin as window.Window).on('noInteractionDetected', 1, async () => {
          console.info(msgStr + 'no interaction in 10s');
          (subWin as window.Window).off('noInteractionDetected');
          await (subWin as window.Window).destroyWindow();
          done();
        });
        console.info(msgStr + ' register noInteractionDetected successed');
      } catch (exception) {
        if (exception.code != 801) {
          console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
          await (subWin as window.Window).destroyWindow();
          expect().assertFail();
          done();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          await (subWin as window.Window).destroyWindow();
          expect(exception.code).assertEqual(801);
          done();
        }
      }
      await sleep(800)
      await sleep(800)
    })

    /**
     * @tc.name   testSetWindowTouchable_MainWindow_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0110
     * @tc.desc   Sets whether the window is touchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowTouchable_MainWindow_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetWindowTouchable_MainWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let isTouchable: boolean = true;
      try {
        await mainWin.setWindowTouchable(isTouchable).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          let properties = mainWin.getWindowProperties();
          console.info(msgStr + 'getWindowProperties: ' + JSON.stringify(properties));
          expect(properties.touchable).assertEqual(isTouchable);
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetWindowTouchable_MainWindow_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0120
     * @tc.desc   Sets whether the window is touchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowTouchable_MainWindow_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetWindowTouchable_MainWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let isTouchable = true;
      try {
        mainWin.setWindowTouchable(isTouchable, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          let properties = mainWin.getWindowProperties();
          console.info(msgStr + 'getWindowProperties: ' + JSON.stringify(properties));
          expect(properties.touchable).assertEqual(isTouchable);
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testSetWindowTouchable_SubWindow_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0130
     * @tc.desc   Sets whether the window is touchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowTouchable_SubWindow_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetWindowTouchable_SubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetWindowTouchable_SubWindow_Promise')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/second");
      await (subWin as window.Window).showWindow();
      await (subWin as window.Window).moveWindowTo(10, 10);
      let isTouchable: boolean = true;
      try {
        await (subWin as window.Window).setWindowTouchable(isTouchable).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          let properties = (subWin as window.Window).getWindowProperties();
          console.info(msgStr + 'getWindowProperties: ' + JSON.stringify(properties));
          expect(properties.touchable).assertEqual(isTouchable);
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (subWin as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.name   testSetWindowTouchable_SubWindow_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0140
     * @tc.desc   Sets whether the window is touchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowTouchable_SubWindow_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetWindowTouchable_SubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetWindowTouchable_SubWindow_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWin).assertTrue();
      await (subWin as window.Window).resize(500, 500);
      await (subWin as window.Window).setUIContent("testability/pages/second/second");
      await (subWin as window.Window).showWindow();
      await (subWin as window.Window).moveWindowTo(10, 10);
      let isTouchable: boolean = true;
      try {
        (subWin as window.Window).setWindowTouchable(isTouchable, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${err.code}, message: ${err.message}`);
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          let properties = (subWin as window.Window).getWindowProperties();
          console.info(msgStr + 'getWindowProperties: ' + JSON.stringify(properties));
          expect(properties.touchable).assertEqual(isTouchable);
          await (subWin as window.Window).destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${exception.code}, message: ${exception.message}`);
        await (subWin as window.Window).destroyWindow();
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   testTouchOutside_OnSubWindowWithOps_ClickMainWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0150
     * @tc.desc   Enable listening for click events outside this window area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTouchOutside_OnSubWindowWithOps_ClickMainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testTouchOutside_OnSubWindowWithOps_ClickMainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testTouchOutside_OnSubWindowWithOps_ClickMainWindow',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testTouchOutside_OnSubWindowWithOps_ClickMainWindow', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/pageOne");
          await (subWin as window.Window).showWindow();
          await (subWin as window.Window).moveWindowTo(1000, 1000);
          let mainWin = windowStage.getMainWindowSync();
          try {
            (subWin as window.Window).on('touchOutside', async () => {
              console.info(msgStr + 'touch outside');
              (subWin as window.Window).off('touchOutside');
              await (subWin as window.Window).destroyWindow();
              await sleep(800)
              done();
            });
            console.info(msgStr + 'register touch outside listener successed');
          } catch (exception) {
            console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
            done();
          }
          await sleep(800)
          await buttonClick('MainPageButton', msgStr).catch(async (err: BusinessError) => {
            console.info(msgStr + err);
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
          })
        })
        .catch(async(err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })
    /**
     * @tc.name   testTouchOutside_OnMainWindow_ClickSubWindowWithOps
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0160
     * @tc.desc   Enable listening for click events outside this window area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTouchOutside_OnMainWindow_ClickSubWindowWithOps', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testTouchOutside_OnMainWindow_ClickSubWindowWithOps';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testTouchOutside_OnMainWindow_ClickSubWindowWithOps',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testTouchOutside_OnMainWindow_ClickSubWindowWithOps', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/second");
          await (subWin as window.Window).showWindow();
          await (subWin as window.Window).moveWindowTo(10, 10);
          let mainWin = windowStage.getMainWindowSync();
          try {
            mainWin.on('touchOutside', async () => {
              console.info(msgStr + 'touch outside');
              mainWin.off('touchOutside');
              await (subWin as window.Window).destroyWindow();
              await sleep(800)
              done();
            });
            console.info(msgStr + 'register touch outside listener successed');
          } catch (exception) {
            console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
            done();
          }
          await sleep(800)
          await buttonClick('secondPage_BackToIndex', msgStr).catch(async (err: BusinessError) => {
            console.info(msgStr + err);
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
          })
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })

    /**
     * @tc.name   testDialogTargetTouch_OnSubWindowWithOps_ClickSubWinOps
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0170
     * @tc.desc   Enables listening for click or touch events for Windows covered by modal Windows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDialogTargetTouch_OnSubWindowWithOps_ClickSubWinOps', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testDialogTargetTouch_OnSubWindowWithOps_ClickSubWinOps';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testDialogTargetTouch_OnSubWindowWithOps_ClickSubWinOps",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(500, 500);
      await (tempWnd as window.Window).setUIContent("testability/pages/second/second");
      await (tempWnd as window.Window).showWindow();
      await (tempWnd as window.Window).moveWindowTo(900, 900);
      let options: window.SubWindowOptions = {
        title: 'testDialogTargetTouch_OnSubWindowWithOps',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testDialogTargetTouch_OnSubWindowWithOps_Sub', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/pageOne");
          await (subWin as window.Window).showWindow();
          await (subWin as window.Window).moveWindowTo(10, 10);
          // The listener must be registered on the modal window or it is invalid
          try {
            (subWin as window.Window).on('dialogTargetTouch', async () => {
              console.info(msgStr + 'touch dialog target');
              (subWin as window.Window).off('dialogTargetTouch');
              await (subWin as window.Window).destroyWindow();
              await (tempWnd as window.Window).destroyWindow();
              expect().assertFail();
              done();
            });
            console.info(msgStr + 'register dialogTargetTouch listener successed');
          } catch (exception) {
            console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
            done();
          }
          await buttonClick('点击pageOne', msgStr).catch(async (err: BusinessError) => {
            console.info(msgStr + err);
            await (tempWnd as window.Window).destroyWindow();
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
          })
          await sleep(800)
          await (subWin as window.Window).destroyWindow();
          await (tempWnd as window.Window).destroyWindow();
          done();
        })
        .catch(async(err: BusinessError) => {
          await (tempWnd as window.Window).destroyWindow();
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })

    /**
     * @tc.name   testDialogTargetTouch_OnDialogWindow_ClickSubWinOps
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0180
     * @tc.desc   Enables listening for click or touch events for Windows covered by modal Windows
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDialogTargetTouch_OnDialogWindow_ClickSubWinOps', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testDialogTargetTouch_OnDialogWindow_ClickSubWinOps';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testDialogTargetTouch_OnDialogWindow_ClickSubWinOps',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testDialogTargetTouch_OnDialogWindow_ClickSubWinOps_Sub', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/pageOne");
          await (subWin as window.Window).showWindow();
          await (subWin as window.Window).moveWindowTo(10, 10);
          let windowConfig: window.Configuration = {
            name: "testDialogTargetTouch_OnDialogWindow_ClickSubWinOps_WithOps",
            windowType: window.WindowType.TYPE_DIALOG,
            ctx: context,
          };
          tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
            console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
          expect(!!tempWnd).assertTrue();
          await (tempWnd as window.Window).resize(500, 500);
          await (tempWnd as window.Window).setUIContent("testability/pages/second/second");
          await (tempWnd as window.Window).showWindow();
          await (tempWnd as window.Window).moveWindowTo(900, 900);
          try {
            (tempWnd as window.Window).on('dialogTargetTouch', async () => {
              console.info(msgStr + 'touch dialog target');
              (tempWnd as window.Window).off('dialogTargetTouch');
              await (subWin as window.Window).destroyWindow();
              await (tempWnd as window.Window).destroyWindow();
              await sleep(800)
              done();
            });
            console.info(msgStr + 'register dialogTargetTouch listener successed');
          } catch (exception) {
            console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
            done();
          }
          await buttonClick('点击pageOne', msgStr).catch(async (err: BusinessError) => {
            console.info(msgStr + err);
            await (tempWnd as window.Window).destroyWindow();
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
          })
          await sleep(800)
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })
    /**
     * @tc.name   testNoInteractionDetected_OnSubWindowWithOps
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0190
     * @tc.desc   Enables this window to not listen for interactive events within a specified timeout period
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testNoInteractionDetected_OnSubWindowWithOps', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testNoInteractionDetected_OnSubWindowWithOps';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testNoInteractionDetected_OnSubWindowWithOps',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testNoInteractionDetected_OnSubWindowWithOps', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/pageOne");
          await (subWin as window.Window).showWindow();
          await (subWin as window.Window).moveWindowTo(10, 10);
          try {
            (subWin as window.Window).on('noInteractionDetected', 1, async () => {
              console.info(msgStr + 'no interaction in 10s');
              (subWin as window.Window).off('noInteractionDetected');
              await (subWin as window.Window).destroyWindow();
              done();
            });
            console.info(msgStr + ' register noInteractionDetected successed');
          } catch (exception) {
            if (exception.code != 801) {
              console.error(msgStr + `Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
              expect().assertFail();
              done();
            } else {
              console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
              console.log(msgStr + JSON.stringify(exception))
              expect(exception.code).assertEqual(801);
              done();
            }
          }
          await sleep(500)
          await sleep(500)
          await sleep(500)
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })
    /**
     * @tc.name   testSetWindowTouchable_SubWindowWithOps_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0200
     * @tc.desc   Sets whether the window is touchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowTouchable_SubWindowWithOps_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetWindowTouchable_SubWindowWithOps_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testSetWindowTouchable_SubWindowWithOps_Promise',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetWindowTouchable_SubWindowWithOps_Promise', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/second");
          await (subWin as window.Window).showWindow();
          await (subWin as window.Window).moveWindowTo(10, 10);
          let isTouchable: boolean = true;
          try {
            await (subWin as window.Window).setWindowTouchable(isTouchable).then(() => {
              console.info(msgStr + 'Succeeded in setting the window to be touchable.');
              let properties: window.WindowProperties = (subWin as window.Window).getWindowProperties();
              console.info(msgStr + 'getWindowProperties: ' + JSON.stringify(properties));
              expect(properties.touchable).assertEqual(isTouchable);
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            });
          } catch (exception) {
            console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          }
          await (subWin as window.Window).destroyWindow();
          done();
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })

    /**
     * @tc.name   testSetWindowTouchable_SubWindowWithOps_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWEVENT_JS_API_0210
     * @tc.desc   Sets whether the window is touchable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowTouchable_SubWindowWithOps_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let caseName = 'testSetWindowTouchable_SubWindowWithOps_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testSetWindowTouchable_SubWindowWithOps_Callback',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetWindowTouchable_SubWindowWithOps_Callback', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          await (subWin as window.Window).resize(500, 500);
          await (subWin as window.Window).setUIContent("testability/pages/second/second");
          await (subWin as window.Window).showWindow();
          await (subWin as window.Window).moveWindowTo(10, 10);
          let isTouchable: boolean = true;
          try {
            (subWin as window.Window).setWindowTouchable(isTouchable, async (err: BusinessError) => {
              const errCode: number = err.code;
              if (errCode) {
                console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${err.code}, message: ${err.message}`);
                await (subWin as window.Window).destroyWindow();
                expect().assertFail();
                done();
                return;
              }
              console.info(msgStr + 'Succeeded in setting the window to be touchable.');
              let properties: window.WindowProperties = (subWin as window.Window).getWindowProperties();
              console.info(msgStr + 'getWindowProperties: ' + JSON.stringify(properties));
              expect(properties.touchable).assertEqual(isTouchable);
              await (subWin as window.Window).destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + `Failed to set the window to be touchable. Cause code: ${exception.code}, message: ${exception.message}`);
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
          }
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })
  })
}
