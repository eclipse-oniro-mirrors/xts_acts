/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
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

export default function windowVerificationProblemTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage) {
  describe('window_verification_problem_test', () => {
    console.log('describe window_verification_problem_test start!!!')

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4040
     * @tc.name      : testSetWindowBrightness_NotAppWin_Callback
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_NotAppWin_Callback', 0, async (done: Function) => {
      let caseName = 'testSetWindowBrightness_NotAppWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowBrightness_NotAppWin_Callback",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | void;
      win = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      });
      expect(!!win).assertTrue();
      let brightness: number = -1.0;
      try {
        (win as ohosWindow.Window).setWindowBrightness(brightness, async (err) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
            await (win as ohosWindow.Window).destroyWindow();
            expect(err.code).assertEqual(1300002);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the brightness.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        await (win as ohosWindow.Window).destroyWindow();
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4050
     * @tc.name      : testSetWindowBrightness_NotAppWin_Promise
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_NotAppWin_Promise', 0, async () => {
      let caseName = 'testSetWindowBrightness_NotAppWin_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowBrightness_NotAppWin_Promise",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | void;
      win = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      let brightness: number = -1.0;
      try {
        await (win as ohosWindow.Window).setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
      await (win as ohosWindow.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4060
     * @tc.name      : testSetWindowBrightness_MainWin_DefaultValue_Promise
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_MainWin_DefaultValue_Promise', 0, async () => {
      let caseName = 'testSetWindowBrightness_MainWin_DefaultValue_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let brightness: number = -1.0;
      try {
        await mainWin.setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4070
     * @tc.name      : testSetWindowBrightness_MainWin_DefaultValue_Callback
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_MainWin_DefaultValue_Callback', 0, async (done: Function) => {
      let caseName = 'testSetWindowBrightness_NotAppWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let brightness: number = -1.0;
      try {
        mainWin.setWindowBrightness(brightness, (err) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the brightness.');
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4080
     * @tc.name      : testSetWindowBrightness_SubWin_DefaultValue_Callback
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_SubWin_DefaultValue_Callback', 0, async (done: Function) => {
      let caseName = 'testSetWindowBrightness_SubWin_DefaultValue_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWin: ohosWindow.Window | void;
      subWin = await windowStage.createSubWindow('testSetWindowBrightness_SubWin_DefaultValue_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      expect(!!subWin).assertTrue();
      let brightness: number = -1.0;
      try {
        (subWin as ohosWindow.Window).setWindowBrightness(brightness, async (err) => {
          await (subWin as ohosWindow.Window).destroyWindow();
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the brightness.');
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        await (subWin as ohosWindow.Window).destroyWindow();
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4090
     * @tc.name      : testSetWindowBrightness_SubWin_DefaultValue_Promise
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_SubWin_DefaultValue_Promise', 0, async () => {
      let caseName = 'testSetWindowBrightness_SubWin_DefaultValue_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWin: ohosWindow.Window | void;
      subWin = await windowStage.createSubWindow('testSetWindowBrightness_SubWin_DefaultValue_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      let brightness: number = -1.0;
      try {
        await (subWin as ohosWindow.Window).setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await (subWin as ohosWindow.Window).destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4100
     * @tc.name      : testResize_FullScreen_Promise
     * @tc.desc      : Verify the full screen window resize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_FullScreen_Promise', 0, async () => {
      let caseName = 'testResize_FullScreen_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = windowStage.getMainWindowSync();
      expect(!!win).assertTrue();
      console.log(msgStr + 'getMainWindowSync success');
      await (win as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      await (win as ohosWindow.Window).setWindowLayoutFullScreen(true).then(() => {
        console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
      }).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        expect().assertFail();
      });
      let names: Array<'status' | 'navigation'> = [];
      try {
        await (win as ohosWindow.Window).setWindowSystemBarEnable(names).then(() => {
          console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
      await (win as ohosWindow.Window).resize(707, 707).then(() => {
        console.info(msgStr + 'Succeeded in changing the window size.');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4600
     * @tc.name      : testResizeAsync_FullScreen
     * @tc.desc      : Verify the full screen window resize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResizeAsync_FullScreen', 0, async () => {
      let caseName = 'testResizeAsync_FullScreen';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = windowStage.getMainWindowSync();
      expect(!!win).assertTrue();
      console.log(msgStr + 'getMainWindowSync success');
      await (win as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      await (win as ohosWindow.Window).setWindowLayoutFullScreen(true).then(() => {
        console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
      }).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        expect().assertFail();
      });
      let names: Array<'status' | 'navigation'> = [];
      try {
        await (win as ohosWindow.Window).setWindowSystemBarEnable(names).then(() => {
          console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
      await (win as ohosWindow.Window).resizeAsync(707, 707).then(() => {
        console.info(msgStr + 'Succeeded in changing the window size.');
        expect().assertFail();
      }).catch((exception: BusinessError) => {
        if (exception.code == 801) {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        } else if (exception.code == 1300010) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(1300010);
        } else {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4610
     * @tc.name      : testMoveWindowToAsync_FullScreen
     * @tc.desc      : Verify the full screen window move
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowToAsync_FullScreen', 0, async () => {
      let caseName = 'testMoveWindowToAsync_FullScreen';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = windowStage.getMainWindowSync();
      expect(!!win).assertTrue();
      console.log(msgStr + 'getMainWindowSync success');
      await (win as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      await (win as ohosWindow.Window).setWindowLayoutFullScreen(true).then(() => {
        console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
      }).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        expect().assertFail();
      });
      let names: Array<'status' | 'navigation'> = [];
      try {
        await (win as ohosWindow.Window).setWindowSystemBarEnable(names).then(() => {
          console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
      await (win as ohosWindow.Window).moveWindowToAsync(808, 808).then(() => {
        console.info(msgStr + 'Succeeded in changing the window size.');
        expect().assertFail();
      }).catch((exception: BusinessError) => {
        if (exception.code == 801) {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
        else if (exception.code == 1300010) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(1300010);
        } else {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4110
     * @tc.name      : testSetAspectRatio_Max_Value_Promise
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Max_Value_Promise', 0, async () => {
      let caseName = 'testSetAspectRatio_Max_Value_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = Number.MAX_VALUE;
        await mainWin.setAspectRatio(ratio).then(async () => {
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4120
     * @tc.name      : testSetAspectRatio_Max_Value_Callback
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Max_Value_Callback', 0, async (done: Function) => {
      let caseName = 'testSetAspectRatio_Max_Value_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = Number.MAX_VALUE;
        mainWin.setAspectRatio(ratio, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the aspect ratio of window.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4130
     * @tc.name      : testSetAspectRatio_Min_Value_Promise
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Min_Value_Promise', 0, async () => {
      let caseName = 'testSetAspectRatio_Min_Value_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = Number.MIN_VALUE;
        await mainWin.setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4140
     * @tc.name      : testSetAspectRatio_Minus_Min_Value_Promise
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Minus_Min_Value_Promise', 0, async () => {
      let caseName = 'testSetAspectRatio_Minus_Min_Value_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = -Number.MIN_VALUE;
        await mainWin.setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4150
     * @tc.name      : testSetAspectRatio_Min_Value_Callback
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Min_Value_Callback', 0, async (done: Function) => {
      let caseName = 'testSetAspectRatio_Min_Value_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = Number.MIN_VALUE;
        mainWin.setAspectRatio(ratio, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
            expect(errCode).assertEqual(401);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the aspect ratio of window.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4160
     * @tc.name      : testSetAspectRatio_Minus_Min_Value_Callback
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Minus_Min_Value_Callback', 0, async (done: Function) => {
      let caseName = 'testSetAspectRatio_Minus_Min_Value_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = -Number.MIN_VALUE;
        mainWin.setAspectRatio(ratio, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the aspect ratio of window.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4270
     * @tc.name      : testResize_Dialog_SetLessThenWindowLimits
     * @tc.desc      : Verify that get and set values are the same
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_Dialog_SetLessThenWindowLimits', 0, async () => {
      let caseName = 'testResize_Dialog_SetLessThenWindowLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'testResize_Dialog_SetLessThenWindowLimits';
      let windowConfig: ohosWindow.Configuration = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd: ohosWindow.Window | void;
      let windowLimits:ohosWindow.WindowLimits;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'createWindow tempWnd failed');
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).loadContent('testability/pages/second/second').catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      await (tempWnd as ohosWindow.Window).moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (tempWnd as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (tempWnd as ohosWindow.Window).resize(10, 10).then(() => {
        console.log(msgStr + 'tempWnd.resize successed');
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.resize failed Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await sleep(800)
      let properties = (tempWnd as ohosWindow.Window).getWindowProperties();
      console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
      expect(properties.windowRect.width !== 10).assertEqual(true)
      expect(properties.windowRect.height !== 10).assertEqual(true)
      await (tempWnd as ohosWindow.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4280
     * @tc.name      : testGetPreferredOrientation_AutoRotationUnspecified
     * @tc.desc      : Sets the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetPreferredOrientation_AutoRotationUnspecified', 0, async () => {
      let caseName: string = 'testGetPreferredOrientation_AutoRotationUnspecified';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin: ohosWindow.Window | void;
      mainWin = await windowStage.getMainWindow().catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.getMainWindow :' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      await (mainWin as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.AUTO_ROTATION_UNSPECIFIED).then(() => {
        console.log(msgStr + 'success set window.setPreferredOrientation : AUTO_ROTATION_UNSPECIFIED');
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'window.setPreferredOrientation failed set error:' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        let currentOrientation = (mainWin as ohosWindow.Window).getPreferredOrientation();
        expect(currentOrientation).assertEqual(12)
      } catch (exception) {
        console.error(`Failed to get window orientation. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (mainWin as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.UNSPECIFIED).catch((err: BusinessError) => {
        console.log(msgStr + 'window.setPreferredOrientation failed set error:' + JSON.stringify(err));
        expect().assertFail();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4290
     * @tc.name      : testGetPreferredOrientation_UserRotationPortrait
     * @tc.desc      : Sets the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetPreferredOrientation_UserRotationPortrait', 0, async () => {
      let caseName: string = 'testGetPreferredOrientation_UserRotationPortrait';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin: ohosWindow.Window | void;
      mainWin = await windowStage.getMainWindow().catch((err: BusinessError) => {
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.getMainWindow :' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      await (mainWin as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.USER_ROTATION_PORTRAIT).then(() => {
        console.log(msgStr + 'success set window.setPreferredOrientation : USER_ROTATION_PORTRAIT');
      }).catch((err: BusinessError) => {
        console.log(msgStr + 'window.setPreferredOrientation failed set error:' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        let currentOrientation = (mainWin as ohosWindow.Window).getPreferredOrientation();
        expect(currentOrientation).assertEqual(13)
      } catch (exception) {
        console.error(`Failed to get window orientation. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (mainWin as ohosWindow.Window).setPreferredOrientation(ohosWindow.Orientation.UNSPECIFIED).catch((err: BusinessError) => {
        console.log(msgStr + 'window.setPreferredOrientation failed set error:' + JSON.stringify(err));
        expect().assertFail();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4290
     * @tc.name      : testGetPreferredOrientation_WindowAbnormal
     * @tc.desc      : Sets the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetPreferredOrientation_WindowAbnormal', 0, async () => {
      let caseName: string = 'testGetPreferredOrientation_WindowAbnormal';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: ohosWindow.Window | void;
      windowClass = await windowStage.createSubWindow('testGetPreferredOrientation_WindowAbnormal').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!windowClass).assertTrue();
      await (windowClass as ohosWindow.Window).destroyWindow();
      try {
        let currentOrientation = (windowClass as ohosWindow.Window).getPreferredOrientation();
        expect().assertFail();
      } catch (exception) {
        console.error(`Failed to get window orientation. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(1300002);
      }
    })
  })
}
