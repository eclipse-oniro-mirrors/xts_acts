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
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext';
import image from '@ohos.multimedia.image';
import { Callback } from '@ohos.base';

export default function windowAbnormalScenarioTest(context, windowStage, abilityStorage) {
  describe('window_Abnormal_Scenario_test', function () {
    console.log('describe window_api_test start!!!')

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1830
     * @tc.name      : testSetAspectRatio_EmptyValue_Promise
     * @tc.desc      : Set the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_EmptyValue_Promise', 0, async function () {
      let caseName = 'testSetAspectRatio_EmptyValue_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        await mainWin.setAspectRatio().then(async () => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1840
     * @tc.name      : testSetAspectRatio_NullValue_Promise
     * @tc.desc      : Set the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_NullValue_Promise', 0, async function () {
      let caseName = 'testSetAspectRatio_NullValue_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        await mainWin.setAspectRatio(null).then(async () => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1850
     * @tc.name      : testSetAspectRatio_NullValue_Callback
     * @tc.desc      : Set the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_NullValue_Callback', 0, async function (done) {
      let caseName = 'testSetAspectRatio_NullValue_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        mainWin.setAspectRatio(null, (err: BusinessError) => {
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
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2070
     * @tc.name      : testSetAspectRatio_UndefinedValue_Promise
     * @tc.desc      : Set the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_UndefinedValue_Promise', 0, async function () {
      let caseName = 'testSetAspectRatio_UndefinedValue_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        await mainWin.setAspectRatio(undefined).then(async () => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2080
     * @tc.name      : testSetAspectRatio_UndefinedValue_Callback
     * @tc.desc      : Set the proportion of the window content layout
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_UndefinedValue_Callback', 0, async function (done) {
      let caseName = 'testSetAspectRatio_UndefinedValue_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        mainWin.setAspectRatio(undefined, (err: BusinessError) => {
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
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3860
     * @tc.name      : testShowWindow_WindowStateAbnormal_Callback
     * @tc.desc      : show window windowStateAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testShowWindow_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testShowWindow_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testShowWindow_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      win.showWindow((err: BusinessError) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error('Failed to show the window. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
          return;
        }
        console.info('Succeeded in showing the window.');
        expect().assertFail();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3870
     * @tc.name      : testDestroyWindow_WindowStateAbnormal_Promise
     * @tc.desc      : destroy window windowStateAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDestroyWindow_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testDestroyWindow_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testDestroyWindow_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      await win.destroyWindow().then(() => {
        console.info(msgStr + 'Succeeded in destroying the window.');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to destroy the window. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2390
     * @tc.name      : testMoveWindowTo_WindowStateAbnormal_Promise
     * @tc.desc      : Move window windowStateAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowTo_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testDestroyWindow_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowTo_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.moveWindowTo(300, 300).then(() => {
          console.info(msgStr + 'Succeeded in moving the window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2400
     * @tc.name      : testMoveWindowTo_WindowStateAbnormal_Callback
     * @tc.desc      : Move window windowStateAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowTo_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testMoveWindowTo_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowTo_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.moveWindowTo(300, 300, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4520
     * @tc.name      : testMoveWindowToAsync_WindowStateAbnormal
     * @tc.desc      : Move window windowStateAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowToAsync_WindowStateAbnormal', 0, async function () {
      let caseName = 'testMoveWindowToAsync_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowToAsync_WindowStateAbnormal').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.moveWindowToAsync(300, 300).then(() => {
          console.info(msgStr + 'Succeeded in moving the window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2410
     * @tc.name      : testMoveWindowTo_DecimalScene_ParamesOne_Callback
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowTo_DecimalScene_ParamesOne_Callback', 0, async function (done) {
      let caseName = 'testMoveWindowTo_DecimalScene_ParamesOne_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowTo_DecimalScene_ParamesOne_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      // 疑问：为什么需要 loadContent、show之后设置的move，才能通过getWindowProperties获取移动的值？
      try {
        win.moveWindowTo(100.5555, 100, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.left).assertEqual(100)
          expect(properties.windowRect.top).assertEqual(100)
          await win.destroyWindow();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2420
     * @tc.name      : testMoveWindowTo_DecimalScene_ParamesTwo_Callback
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowTo_DecimalScene_ParamesTwo_Callback', 0, async function (done) {
      let caseName = 'testMoveWindowTo_DecimalScene_ParamesTwo_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowTo_DecimalScene_ParamesTwo_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.moveWindowTo(205.56, 10.25, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.left).assertEqual(205)
          expect(properties.windowRect.top).assertEqual(10)
          await win.destroyWindow();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2430
     * @tc.name      : testMoveWindowTo_DecimalScene_ParamesThree_Callback
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowTo_DecimalScene_ParamesThree_Callback', 0, async function (done) {
      let caseName = 'testMoveWindowTo_DecimalScene_ParamesThree_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowTo_DecimalScene_ParamesThree_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.moveWindowTo(-105.2, -1056.2, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(900)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.left).assertEqual(-105)
          expect(properties.windowRect.top).assertEqual(-1056)
          await win.destroyWindow();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2440
     * @tc.name      : testMoveWindowTo_DecimalScene_ParamesOne_Promise
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowTo_DecimalScene_ParamesOne_Promise', 0, async function () {
      let caseName = 'testMoveWindowTo_DecimalScene_ParamesOne_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowTo_DecimalScene_ParamesOne_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.moveWindowTo(100.5555, 100).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(100)
        expect(properties.windowRect.top).assertEqual(100)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2450
     * @tc.name      : testMoveWindowTo_DecimalScene_ParamesTwo_Promise
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowTo_DecimalScene_ParamesTwo_Promise', 0, async function () {
      let caseName = 'testMoveWindowTo_DecimalScene_ParamesTwo_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowTo_DecimalScene_ParamesTwo_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.moveWindowTo(205.56, 10.25).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(205)
        expect(properties.windowRect.top).assertEqual(10)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2460
     * @tc.name      : testMoveWindowTo_DecimalScene_ParamesThree_Promise
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowTo_DecimalScene_ParamesThree_Promise', 0, async function () {
      let caseName = 'testMoveWindowTo_DecimalScene_ParamesThree_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowTo_DecimalScene_ParamesThree_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.moveWindowTo(-105.2, -1056.2).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(-105)
        expect(properties.windowRect.top).assertEqual(-1056)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4530
     * @tc.name      : testMoveWindowToAsync_DecimalScene_ParamesOne
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowToAsync_DecimalScene_ParamesOne', 0, async function () {
      let caseName = 'testMoveWindowToAsync_DecimalScene_ParamesOne';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowToAsync_DecimalScene_ParamesOne').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resizeAsync(500, 500).then(async () => {
        console.info(msgStr + 'Succeeded in changing the window size.');
      }).catch(async(exception: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowToAsync(100.5555, 100).then(async () => {
        console.info(msgStr + 'Succeeded in moving the window.');
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(100)
        expect(properties.windowRect.top).assertEqual(100)
        await win.destroyWindow();
      }).catch(async (err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        await win.destroyWindow();
        if (err.code != 801) {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4540
     * @tc.name      : testMoveWindowToAsync_DecimalScene_ParamesTwo
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowToAsync_DecimalScene_ParamesTwo', 0, async function () {
      let caseName = 'testMoveWindowToAsync_DecimalScene_ParamesTwo';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowToAsync_DecimalScene_ParamesTwo').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resizeAsync(500, 500).then(async () => {
        console.info(msgStr + 'Succeeded in changing the window size.');
      }).catch(async(exception: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowToAsync(205.56, 10.25).then(async () => {
        console.info(msgStr + 'Succeeded in moving the window.');
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(205)
        expect(properties.windowRect.top).assertEqual(10)
        await win.destroyWindow();
      }).catch(async(err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        await win.destroyWindow();
        if (err.code != 801) {
          console.error(msgStr + 'Failed to move the window.out  Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4550
     * @tc.name      : testMoveWindowToAsync_DecimalScene_ParamesThree
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveWindowToAsync_DecimalScene_ParamesThree', 0, async function () {
      let caseName = 'testMoveWindowToAsync_DecimalScene_ParamesThree';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveWindowToAsync_DecimalScene_ParamesThree').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resizeAsync(500, 500).then(async () => {
        console.info(msgStr + 'Succeeded in changing the window size.');
      }).catch(async(exception: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowToAsync(-105.2, -1056.2).then(async () => {
        console.info(msgStr + 'Succeeded in moving the window.');
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(-105)
        expect(properties.windowRect.top).assertEqual(-1056)
        await win.destroyWindow();
      }).catch(async(err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        await win.destroyWindow();
        if (err.code != 801) {
          console.error(msgStr + 'Failed to move the window  Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2470
     * @tc.name      : testResize_WindowStateAbnormal_Promise
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testResize_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testResize_WindowStateAbnormal_Promise",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win = null;
      win = await windowStage.createSubWindow('testResize_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.resize(500, 1000).then(() => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2480
     * @tc.name      : testResize_WindowStateAbnormal_Callback
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testResize_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResize_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.resize(500, 1000, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4560
     * @tc.name      : testresizeAsync_WindowStateAbnormal
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testresizeAsync_WindowStateAbnormal', 0, async function () {
      let caseName = 'testresizeAsync_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testresizeAsync_WindowStateAbnormal').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.resizeAsync(500, 1000).then(() => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2490
     * @tc.name      : testResize_DecimalScene_ParamesOne_Promise
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_DecimalScene_ParamesOne_Promise', 0, async function () {
      let caseName = 'testResize_DecimalScene_ParamesOne_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResize_DecimalScene_ParamesOne_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.resize(1000.5555, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
        }).catch((err: BusinessError) => {
          console.error('Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(1000)
        expect(properties.windowRect.height).assertEqual(1000)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2750
     * @tc.name      : testResize_DecimalScene_ParamesTwo_Promise
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_DecimalScene_ParamesTwo_Promise', 0, async function () {
      let caseName = 'testResize_DecimalScene_ParamesTwo_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResize_DecimalScene_ParamesTwo_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.resize(1005.56, 1000.25).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
        }).catch((err: BusinessError) => {
          console.error('Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(1005)
        expect(properties.windowRect.height).assertEqual(1000)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2760
     * @tc.name      : testResize_DecimalScene_ParamesThree_Promise
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_DecimalScene_ParamesThree_Promise', 0, async function () {
      let caseName = 'testResize_DecimalScene_ParamesThree_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResize_DecimalScene_ParamesThree_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.resize(-105.2, -1056.2).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error('Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401)
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(0)
        expect(properties.windowRect.height).assertEqual(0)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4570
     * @tc.name      : testResizeAsync_DecimalScene_ParamesOne
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResizeAsync_DecimalScene_ParamesOne', 0, async function () {
      let caseName = 'testResizeAsync_DecimalScene_ParamesOne';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResizeAsync_DecimalScene_ParamesOne').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowToAsync(0, 0).then(async () => {
        console.info(msgStr + 'Succeeded in moving the window.');
      }).catch(async(err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        if (err.code != 801) {
          console.error(msgStr + 'Failed to move the window  Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.resizeAsync(1000.5555, 1000).then(async () => {
        console.info(msgStr + 'Succeeded in changing the window size.');
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(1000)
        expect(properties.windowRect.height).assertEqual(1000)
        await win.destroyWindow();
      }).catch(async(exception: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4580
     * @tc.name      : testResizeAsync_DecimalScene_ParamesTwo
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResizeAsync_DecimalScene_ParamesTwo', 0, async function () {
      let caseName = 'testResizeAsync_DecimalScene_ParamesTwo';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResizeAsync_DecimalScene_ParamesTwo').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowToAsync(0, 0).then(async () => {
        console.info(msgStr + 'Succeeded in moving the window.');
      }).catch(async(err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        if (err.code != 801) {
          console.error(msgStr + 'Failed to move the window  Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.resizeAsync(1005.56, 1000.25).then(async () => {
        console.info(msgStr + 'Succeeded in changing the window size.');
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(1005)
        expect(properties.windowRect.height).assertEqual(1000)
        await win.destroyWindow();
      }).catch(async(exception: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        if (exception.code != 801) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4590
     * @tc.name      : testResizeAsync_DecimalScene_ParamesThree
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResizeAsync_DecimalScene_ParamesThree', 0, async function () {
      let caseName = 'testResizeAsync_DecimalScene_ParamesThree';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResizeAsync_DecimalScene_ParamesThree').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowToAsync(0, 0).then(async () => {
        console.info(msgStr + 'Succeeded in moving the window.');
      }).catch(async(err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        if (err.code != 801) {
          console.error(msgStr + 'Failed to move the window  Cause: ' + JSON.stringify(err));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.resizeAsync(-105.2, -1056.2).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await win.destroyWindow();
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error('Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401)
        });
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width).assertEqual(0)
        expect(properties.windowRect.height).assertEqual(0)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2770
     * @tc.name      : testResize_DecimalScene_ParamesOne_Callback
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_DecimalScene_ParamesOne_Callback', 0, async function (done) {
      let caseName = 'testResize_DecimalScene_ParamesOne_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResize_DecimalScene_ParamesOne_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.resize(1000.5555, 1000, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.width).assertEqual(1000)
          expect(properties.windowRect.height).assertEqual(1000)
          await win.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2780
     * @tc.name      : testResize_DecimalScene_ParamesTwo_Callback
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_DecimalScene_ParamesTwo_Callback', 0, async function (done) {
      let caseName = 'testResize_DecimalScene_ParamesTwo_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResize_DecimalScene_ParamesTwo_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.resize(1005.56, 1000.25, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.width).assertEqual(1005)
          expect(properties.windowRect.height).assertEqual(1000)
          await win.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2790
     * @tc.name      : testResize_DecimalScene_ParamesThree_Callback
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_DecimalScene_ParamesThree_Callback', 0, async function (done) {
      let caseName = 'testResize_DecimalScene_ParamesThree_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResize_DecimalScene_ParamesThree_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.resize(-105.2, -1056.2, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            await win.destroyWindow();
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          expect().assertFail();
          await win.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect(exception.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2800
     * @tc.name      : testGetWindowProperties_WindowStateAbnormal
     * @tc.desc      : Gets the properties of the current window Window State Abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetWindowProperties_WindowStateAbnormal', 0, async function () {
      let caseName = 'testGetWindowProperties_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testGetWindowProperties_WindowStateAbnormal').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        let properties = win.getWindowProperties();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2810
     * @tc.name      : testGetWindowAvoidArea_WindowStateAbnormal
     * @tc.desc      : Gets the area where the window content is avoided
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetWindowAvoidArea_WindowStateAbnormal', 0, async function () {
      let caseName = 'testGetWindowAvoidArea_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testGetWindowAvoidArea_WindowStateAbnormal').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        let type = ohosWindow.AvoidAreaType.TYPE_SYSTEM;
        let avoidArea = win.getWindowAvoidArea(type);
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the area. Cause. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2820
     * @tc.name      : testSetWindowSystemBarProperties_WinAbnormal_Call
     * @tc.desc      : Set the properties of the navigation bar and status bar in the window in full screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowSystemBarProperties_WinAbnormal_Call', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarProperties_WinAbnormal_Call';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowSystemBarProperties_WinAbnormal_Call').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let SystemBarProperties: ohosWindow.SystemBarProperties = {
        statusBarColor: '#ff00ff',
        navigationBarColor: '#00ff00',
        statusBarContentColor: '#ffffff',
        navigationBarContentColor: '#00ffff'
      };
      try {
        win.setWindowSystemBarProperties(SystemBarProperties, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002)
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the system bar properties.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar properties. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2830
     * @tc.name      : testSetWindowSystemBarProperties_WinAbnormal_Promise
     * @tc.desc      : Set the properties of the navigation bar and status bar in the window in full screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowSystemBarProperties_WinAbnormal_Promise', 0, async function () {
      let caseName = 'testSetWindowSystemBarProperties_WinAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowSystemBarProperties_WinAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let SystemBarProperties: ohosWindow.SystemBarProperties = {
        statusBarColor: '#ff00ff',
        navigationBarColor: '#00ff00',
        statusBarContentColor: '#ffffff',
        navigationBarContentColor: '#00ffff'
      };
      try {
        win.setWindowSystemBarProperties(SystemBarProperties).then(() => {
          console.info(msgStr + 'Succeeded in setting the system bar properties.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002)
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar properties. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2840
     * @tc.name      : testSetPreferredOrientation_WinAbnormal_Promise
     * @tc.desc      : Set the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetPreferredOrientation_WinAbnormal_Promise', 0, async function () {
      let caseName = 'testSetPreferredOrientation_WinAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetPreferredOrientation_WinAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let orientation = ohosWindow.Orientation.AUTO_ROTATION;
      try {
        await win.setPreferredOrientation(orientation).then(() => {
          console.info(msgStr + 'Succeeded in setting the window orientation.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002)
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2850
     * @tc.name      : testSetPreferredOrientation_WinAbnormal_Call
     * @tc.desc      : Set the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetPreferredOrientation_WinAbnormal_Call', 0, async function (done) {
      let caseName = 'testSetPreferredOrientation_WinAbnormal_Call';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetPreferredOrientation_WinAbnormal_Call').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let orientation = ohosWindow.Orientation.AUTO_ROTATION;
      try {
        win.setPreferredOrientation(orientation, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002)
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting window orientation.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2860
     * @tc.name      : testGetUIContext_WindowStateAbnormal
     * @tc.desc      : Get the UIContext instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetUIContext_WindowStateAbnormal', 0, async function () {
      let caseName = 'testGetUIContext_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testGetUIContext_WindowStateAbnormal').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let orientation = ohosWindow.Orientation.AUTO_ROTATION;
      try {
        let uiContext: UIContext | null = null;
        uiContext = win.getUIContext();
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2870
     * @tc.name      : testSetUIContent_WindowStateAbnormal
     * @tc.desc      : Load the specific page content for the current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetUIContent_WindowStateAbnormal', 0, async function () {
      let caseName = 'testSetUIContent_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetUIContent_WindowStateAbnormal').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setUIContent('pages/page2/page2').then(() => {
          console.info(msgStr + 'Succeeded in loading the content.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002)
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2880
     * @tc.name      : testLoadContent_WindowStateAbnormal_Callback
     * @tc.desc      : Loads the specific page content associated with LocalStorage for the current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLoadContent_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testLoadContent_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testLoadContent_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let storage: LocalStorage = new LocalStorage();
      storage.setOrCreate('testLoadContent_WindowStateAbnormal_Callback', 121);
      try {
        win.loadContent('MainAbility/pages/second/pageOne2', storage, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to load the content. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002)
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in loading the content.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2890
     * @tc.name      : testLoadContent_WindowStateAbnormal_Promise
     * @tc.desc      : Loads the specific page content associated with LocalStorage for the current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testLoadContent_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testLoadContent_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testLoadContent_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let storage: LocalStorage = new LocalStorage();
      storage.setOrCreate('testLoadContent_WindowStateAbnormal_Promise', 121);
      try {
        await win.loadContent('MainAbility/pages/second/pageOne2', storage).then(() => {
          console.info('Succeeded in loading the content.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error('Failed to load the content. Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002)
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2910
     * @tc.name      : testIsWindowSupportWideGamut_WindowStateAbnormal_Callback
     * @tc.desc      : Check whether the current window supports the wide color gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsWindowSupportWideGamut_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testIsWindowSupportWideGamut_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testIsWindowSupportWideGamut_WindowStateAbnormal_Callback')
        .catch((err) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.isWindowSupportWideGamut((err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to check whether the window support WideGamut. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002)
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in checking whether the window support WideGamut Data: ' + JSON.stringify(data));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2920
     * @tc.name      : testIsWindowSupportWideGamut_WindowStateAbnormal_Promise
     * @tc.desc      : Check whether the current window supports the wide color gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsWindowSupportWideGamut_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testIsWindowSupportWideGamut_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testIsWindowSupportWideGamut_WindowStateAbnormal_Promise')
        .catch((err) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.isWindowSupportWideGamut().then((data) => {
          console.info(msgStr + 'Succeeded in checking whether the window support WideGamut. Data: ' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002)
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2930
     * @tc.name      : testGetWindowColorSpace_WindowStateAbnormal
     * @tc.desc      : Gets the current window gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetWindowColorSpace_WindowStateAbnormal', 0, async function () {
      let caseName = 'testGetWindowColorSpace_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testGetWindowColorSpace_WindowStateAbnormal').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        let colorSpace = win.getWindowColorSpace();
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2940
     * @tc.name      : testSetWindowColorSpace_WindowStateAbnormal_Callback
     * @tc.desc      : Set the current window to wide gamut mode or default gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowColorSpace_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSetWindowColorSpace_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowColorSpace_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setWindowColorSpace(ohosWindow.ColorSpace.WIDE_GAMUT, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002)
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting window colorspace.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2950
     * @tc.name      : testSetWindowColorSpace_WindowStateAbnormal_Promise
     * @tc.desc      : Set the current window to wide gamut mode or default gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowColorSpace_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testSetWindowColorSpace_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowColorSpace_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setWindowColorSpace(ohosWindow.ColorSpace.WIDE_GAMUT).then(() => {
          console.info(msgStr + 'Succeeded in setting window colorspace.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002)
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2960
     * @tc.name      : testSetWindowBackgroundColor_WindowStateAbnormal
     * @tc.desc      : Set the background color of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBackgroundColor_WindowStateAbnormal', 0, async function () {
      let caseName = 'testSetWindowBackgroundColor_WindowStateAbnormal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowBackgroundColor_WindowStateAbnormal').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let color: string = '#00ff33';
      try {
        win.setWindowBackgroundColor(color);
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2970
     * @tc.name      : testSetWindowBrightness_WindowStateAbnormal_Callback
     * @tc.desc      : Set the screen brightness value Window State Abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSetWindowBrightness_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowBrightness_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let brightness: number = 1.0;
      try {
        win.setWindowBrightness(brightness, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
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
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2980
     * @tc.name      : testSetWindowBrightness_WindowStateAbnormal_Promise
     * @tc.desc      : Set the screen brightness value Window State Abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testSetWindowBrightness_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowBrightness_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let brightness: number = 1.0;
      try {
        await win.setWindowBrightness(brightness).then(() => {
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
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2990
     * @tc.name      : testSetWindowFocusable_WindowStateAbnormal_Callback
     * @tc.desc      : Set whether to switch focus window when clicking
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowFocusable_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSetWindowFocusable_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowFocusable_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setWindowFocusable(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3000
     * @tc.name      : testSetWindowFocusable_WindowStateAbnormal_Promise
     * @tc.desc      : Set whether to switch focus window when clicking
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowFocusable_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testSetWindowFocusable_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowFocusable_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setWindowFocusable(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window to be focusable. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3010
     * @tc.name      : testSetWindowKeepScreenOn_WindowStateAbnormal_Callback
     * @tc.desc      : Set whether the screen is steady on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowKeepScreenOn_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSetWindowKeepScreenOn_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowKeepScreenOn_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setWindowKeepScreenOn(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the screen to be always on. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the screen to be always on');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3020
     * @tc.name      : testSetWindowTouchable_WindowStateAbnormal_Callback
     * @tc.desc      : Sets whether the window is touchable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowTouchable_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSetWindowTouchable_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetWindowTouchable_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setWindowTouchable(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be touchable');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3030
     * @tc.name      : testSnapshot_WindowStateAbnormal_Callback
     * @tc.desc      : get window snapshot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSnapshot_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSnapshot_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSnapshot_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.snapshot((err: BusinessError, pixelMap: image.PixelMap) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to snapshot window. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in snapshotting window. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
          pixelMap.release(); // PixelMap使用完后及时释放内存
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3040
     * @tc.name      : testSnapshot_WindowStateAbnormal_Promise
     * @tc.desc      : get window snapshot
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSnapshot_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testSnapshot_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSnapshot_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.snapshot().then((pixelMap: image.PixelMap) => {
          console.info(msgStr + 'Succeeded in snapshotting window. Pixel bytes number: ' + pixelMap.getPixelBytesNumber());
          expect().assertFail();
          pixelMap.release(); // PixelMap使用完后及时释放内存
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to snapshot window. Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3050
     * @tc.name      : testShow_WindowStateAbnormal_Callback
     * @tc.desc      : Show current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testShow_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testShow_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testShow_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.show((err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in showing the window.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to show the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3060
     * @tc.name      : testShow_WindowStateAbnormal_Promise
     * @tc.desc      : Show current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testShow_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testShow_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testShow_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.show().then(() => {
          console.info(msgStr + 'Succeeded in showing the window');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to show the window. Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to show the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3070
     * @tc.name      : testDestroy_WindowStateAbnormal_Callback
     * @tc.desc      : destroy current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDestroy_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testDestroy_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testDestroy_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.destroy((err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to destroy  the window. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in destroying the window.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to destroy  the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3080
     * @tc.name      : testDestroy_WindowStateAbnormal_Promise
     * @tc.desc      : destroy current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDestroy_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testDestroy_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testDestroy_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.destroy().then(() => {
          console.info(msgStr + 'Succeeded in destroying the window');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to destroy the window. Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to destroy the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3090
     * @tc.name      : testMoveTo_WindowStateAbnormal_Promise
     * @tc.desc      : Move window windowStateAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveTo_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testMoveTo_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveTo_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.moveTo(300, 300).then(() => {
          console.info(msgStr + 'Succeeded in moving the window.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3100
     * @tc.name      : testMoveTo_WindowStateAbnormal_Callback
     * @tc.desc      : Move window windowStateAbnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveTo_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testMoveTo_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveTo_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.moveTo(300, 300, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3110
     * @tc.name      : testMoveTo_DecimalScene_ParamesOne_Callback
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveTo_DecimalScene_ParamesOne_Callback', 0, async function (done) {
      let caseName = 'testMoveTo_DecimalScene_ParamesOne_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveTo_DecimalScene_ParamesOne_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.moveTo(100.5555, 100, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.left).assertEqual(100)
          expect(properties.windowRect.top).assertEqual(100)
          await win.destroyWindow();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3120
     * @tc.name      : testMoveTo_DecimalScene_ParamesTwo_Callback
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveTo_DecimalScene_ParamesTwo_Callback', 0, async function (done) {
      let caseName = 'testMoveTo_DecimalScene_ParamesTwo_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveTo_DecimalScene_ParamesTwo_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.moveTo(205.56, 10.25, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.left).assertEqual(205)
          expect(properties.windowRect.top).assertEqual(10)
          await win.destroyWindow();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3130
     * @tc.name      : testMoveTo_DecimalScene_ParamesThree_Callback
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveTo_DecimalScene_ParamesThree_Callback', 0, async function (done) {
      let caseName = 'testMoveTo_DecimalScene_ParamesThree_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveTo_DecimalScene_ParamesThree_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.moveTo(-105.2, -1056.2, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.left).assertEqual(-105)
          expect(properties.windowRect.top).assertEqual(-1056)
          await win.destroyWindow();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3140
     * @tc.name      : testMoveTo_DecimalScene_ParamesOne_Promise
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveTo_DecimalScene_ParamesOne_Promise', 0, async function () {
      let caseName = 'testMoveTo_DecimalScene_ParamesOne_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveTo_DecimalScene_ParamesOne_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.moveTo(100.5555, 100).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(100)
        expect(properties.windowRect.top).assertEqual(100)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3150
     * @tc.name      : testMoveTo_DecimalScene_ParamesTwo_Promise
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveTo_DecimalScene_ParamesTwo_Promise', 0, async function () {
      let caseName = 'testMoveTo_DecimalScene_ParamesTwo_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveTo_DecimalScene_ParamesTwo_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.moveTo(205.56, 10.25).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(205)
        expect(properties.windowRect.top).assertEqual(10)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3160
     * @tc.name      : testMoveTo_DecimalScene_ParamesThree_Promise
     * @tc.desc      : Move window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMoveTo_DecimalScene_ParamesThree_Promise', 0, async function () {
      let caseName = 'testMoveTo_DecimalScene_ParamesThree_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testMoveTo_DecimalScene_ParamesThree_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.resize(500, 500).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.moveTo(-105.2, -1056.2).then(async () => {
          console.info(msgStr + 'Succeeded in moving the window.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.left).assertEqual(-105)
        expect(properties.windowRect.top).assertEqual(-1056)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3170
     * @tc.name      : testResetSize_WindowStateAbnormal_Promise
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResetSize_WindowStateAbnormal_Promise', 0, async function () {
      let caseName = 'testResetSize_WindowStateAbnormal_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResetSize_WindowStateAbnormal_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.resetSize(500, 1000).then(() => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3180
     * @tc.name      : testResetSize_WindowStateAbnormal_Callback
     * @tc.desc      : Change the current window size
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResetSize_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testResetSize_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResetSize_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.resetSize(500, 1000, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3190
     * @tc.name      : testResetSize_DecimalScene_ParamesOne_Promise
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResetSize_DecimalScene_ParamesOne_Promise', 0, async function () {
      let caseName = 'testResetSize_DecimalScene_ParamesOne_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResetSize_DecimalScene_ParamesOne_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.resetSize(1000.5555, 1000).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
        }).catch((err: BusinessError) => {
          console.error('Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width == 1000).assertEqual(true)
        expect(properties.windowRect.height == 1000).assertEqual(true)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3200
     * @tc.name      : testResetSize_DecimalScene_ParamesTwo_Promise
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResetSize_DecimalScene_ParamesTwo_Promise', 0, async function () {
      let caseName = 'testResetSize_DecimalScene_ParamesTwo_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResetSize_DecimalScene_ParamesTwo_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.resetSize(1005.56, 1000.25).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
        }).catch((err: BusinessError) => {
          console.error('Failed to change the window size. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await sleep(800)
        let properties = win.getWindowProperties();
        console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
        expect(properties.windowRect.width == 1005).assertEqual(true)
        expect(properties.windowRect.height == 1000).assertEqual(true)
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3210
     * @tc.name      : testResetSize_DecimalScene_ParamesThree_Promise
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResetSize_DecimalScene_ParamesThree_Promise', 0, async function () {
      let caseName = 'testResetSize_DecimalScene_ParamesThree_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResetSize_DecimalScene_ParamesThree_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      try {
        await win.resetSize(-105.2, -1056.2).then(async () => {
          console.info(msgStr + 'Succeeded in changing the window size.');
          await win.destroyWindow();
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error('Failed to change the window size. Cause: ' + JSON.stringify(err));
          await win.destroyWindow();
          expect(err.code).assertEqual(1003)
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. out catch Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect(exception.code).assertEqual(1003)
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3220
     * @tc.name      : testResetSize_DecimalScene_ParamesOne_Callback
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResetSize_DecimalScene_ParamesOne_Callback', 0, async function (done) {
      let caseName = 'testResetSize_DecimalScene_ParamesOne_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResetSize_DecimalScene_ParamesOne_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.resetSize(1000.5555, 1000, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.width == 1000).assertEqual(true)
          expect(properties.windowRect.height == 1000).assertEqual(true)
          await win.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3230
     * @tc.name      : testResetSize_DecimalScene_ParamesTwo_Callback
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResetSize_DecimalScene_ParamesTwo_Callback', 0, async function (done) {
      let caseName = 'testResetSize_DecimalScene_ParamesTwo_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResetSize_DecimalScene_ParamesTwo_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.resetSize(1005.56, 1000.25, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await sleep(800)
          let properties = win.getWindowProperties();
          console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
          expect(properties.windowRect.width == 1005).assertEqual(true)
          expect(properties.windowRect.height == 1000).assertEqual(true)
          await win.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3240
     * @tc.name      : testResetSize_DecimalScene_ParamesThree_Callback
     * @tc.desc      : resize window Verify decimal scene
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResetSize_DecimalScene_ParamesThree_Callback', 0, async function (done) {
      let caseName = 'testResetSize_DecimalScene_ParamesThree_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testResetSize_DecimalScene_ParamesThree_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await win.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      try {
        win.resetSize(-105.2, -1056.2, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            await win.destroyWindow();
            expect(err.code).assertEqual(1003);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await win.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect(exception.code).assertEqual(1003);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3250
     * @tc.name      : testGetAvoidArea_WindowStateAbnormal_Callback
     * @tc.desc      : Gets the area where the window content is avoided
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetAvoidArea_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testGetAvoidArea_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testGetAvoidArea_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        let type = ohosWindow.AvoidAreaType.TYPE_SYSTEM;
        win.getAvoidArea(type, (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in obtaining the area. Data:' + JSON.stringify(data));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3260
     * @tc.name      : testSetFullScreen_WindowStateAbnormal_Callback
     * @tc.desc      : Sets whether the window layout is full-screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetFullScreen_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSetFullScreen_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetFullScreen_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setFullScreen(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in enabling the full-screen mode.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to enable the full-screen mode. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3270
     * @tc.name      : testSetLayoutFullScreen_WindowStateAbnormal_Callback
     * @tc.desc      : Sets whether the window layout is full-screen
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetLayoutFullScreen_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSetLayoutFullScreen_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetLayoutFullScreen_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setLayoutFullScreen(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3280
     * @tc.name      : testSetSystemBarEnable_WindowStateAbnormal_Callback
     * @tc.desc      : Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSystemBarEnable_WindowStateAbnormal_Callback', 0, async function (done) {
      let caseName = 'testSetSystemBarEnable_WindowStateAbnormal_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetSystemBarEnable_WindowStateAbnormal_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setSystemBarEnable(['status', 'navigation'], (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3290
     * @tc.name      : testSetSystemBarProperties_WinStateAb_Callback
     * @tc.desc      : Set the properties of the navigation bar and status bar in the window in full screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSystemBarProperties_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testSetSystemBarProperties_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetSystemBarProperties_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let SystemBarProperties: ohosWindow.SystemBarProperties = {
        statusBarColor: '#ff00ff',
        navigationBarColor: '#00ff00',
        statusBarContentColor: '#ffffff',
        navigationBarContentColor: '#00ffff'
      };
      try {
        win.setSystemBarProperties(SystemBarProperties, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the system bar properties');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar properties. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3300
     * @tc.name      : testSetSystemBarProperties_WinStateAb_Promise
     * @tc.desc      : Set the properties of the navigation bar and status bar in the window in full screen mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSystemBarProperties_WinStateAb_Promise', 0, async function () {
      let caseName = 'testSetSystemBarProperties_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetSystemBarProperties_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      let SystemBarProperties: ohosWindow.SystemBarProperties = {
        statusBarColor: '#ff00ff',
        navigationBarColor: '#00ff00',
        statusBarContentColor: '#ffffff',
        navigationBarContentColor: '#00ffff'
      };
      try {
        await win.setSystemBarProperties(SystemBarProperties).then(() => {
          console.info(msgStr + 'Succeeded in setting the system bar properties.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar properties. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3310
     * @tc.name      : testIsShowing_WinStateAb_Promise
     * @tc.desc      : Check whether the current window is displayed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsShowing_WinStateAb_Promise', 0, async function () {
      let caseName = 'testIsShowing_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testIsShowing_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.isShowing().then((data) => {
          console.info(msgStr + 'Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to check whether the window is showing. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to check whether the window is showing. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3320
     * @tc.name      : testIsShowing_WinStateAb_Callback
     * @tc.desc      : Check whether the current window is displayed
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsShowing_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testIsShowing_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testIsShowing_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.isShowing((err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to check whether the window is showing. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to check whether the window is showing. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3330
     * @tc.name      : testIsSupportWideGamut_WinStateAb_Callback
     * @tc.desc      : Check whether the current window supports the wide color gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsSupportWideGamut_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testIsSupportWideGamut_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testIsSupportWideGamut_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.isSupportWideGamut((err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in checking whether the window support WideGamut. Data: ' + JSON.stringify(data));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to check whether the window support WideGamut. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3340
     * @tc.name      : testIsSupportWideGamut_WinStateAb_Promise
     * @tc.desc      : Check whether the current window supports the wide color gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsSupportWideGamut_WinStateAb_Promise', 0, async function () {
      let caseName = 'testIsSupportWideGamut_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testIsSupportWideGamut_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.isSupportWideGamut().then((data) => {
          console.info(msgStr + 'Succeeded in checking whether the window support WideGamut. Data: ' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to check whether the window support WideGamut. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3350
     * @tc.name      : testSetColorSpace_WinStateAb_Promise
     * @tc.desc      : Set the current window to wide gamut mode or default gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetColorSpace_WinStateAb_Promise', 0, async function () {
      let caseName = 'testSetColorSpace_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetColorSpace_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setColorSpace(ohosWindow.ColorSpace.WIDE_GAMUT).then(() => {
          console.info(msgStr + 'Succeeded in setting window colorspace.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3360
     * @tc.name      : testSetColorSpace_WinStateAb_Callback
     * @tc.desc      : Set the current window to wide gamut mode or default gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetColorSpace_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testSetColorSpace_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetColorSpace_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setColorSpace(ohosWindow.ColorSpace.WIDE_GAMUT, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting window colorspace.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3370
     * @tc.name      : testGetColorSpace_WinStateAb_Callback
     * @tc.desc      : Gets the current window gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetColorSpace_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testGetColorSpace_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testGetColorSpace_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.getColorSpace((err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to get window colorspace. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in getting window colorspace. Cause:' + JSON.stringify(data));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to get window colorspace. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3380
     * @tc.name      : testGetColorSpace_WinStateAb_Promise
     * @tc.desc      : Gets the current window gamut mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetColorSpace_WinStateAb_Promise', 0, async function () {
      let caseName = 'testGetColorSpace_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testGetColorSpace_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.getColorSpace().then((data) => {
          console.info(msgStr + 'Succeeded in getting window color space. Cause:' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to get window colorspace. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to get window colorspace. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3390
     * @tc.name      : testSetFocusable_WinStateAb_Promise
     * @tc.desc      : Set whether to switch focus window when clicking
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetFocusable_WinStateAb_Promise', 0, async function () {
      let caseName = 'testSetFocusable_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetFocusable_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setFocusable(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be focusable');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window to be focusable. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be focusable. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3400
     * @tc.name      : testSetFocusable_WinStateAb_Callback
     * @tc.desc      : Set whether to switch focus window when clicking
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetFocusable_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testSetFocusable_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetFocusable_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setFocusable(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the window to be focusable. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3410
     * @tc.name      : testSetKeepScreenOn_WinStateAb_Callback
     * @tc.desc      : Set whether the screen is steady on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetKeepScreenOn_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testSetKeepScreenOn_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetKeepScreenOn_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setKeepScreenOn(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the screen to be always on.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3420
     * @tc.name      : testSetKeepScreenOn_WinStateAb_Promise
     * @tc.desc      : Set whether the screen is steady on
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetKeepScreenOn_WinStateAb_Promise', 0, async function () {
      let caseName = 'testSetKeepScreenOn_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetKeepScreenOn_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setKeepScreenOn(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the screen to be always on.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3430
     * @tc.name      : testSetOutsideTouchable_WinStateAb_Promise
     * @tc.desc      : Sets whether to allow areas outside of clickable subwindows
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetOutsideTouchable_WinStateAb_Promise', 0, async function () {
      let caseName = 'testSetOutsideTouchable_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetOutsideTouchable_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setOutsideTouchable(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the area to be touchable.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the area to be touchable. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(801);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the area to be touchable. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(801);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3440
     * @tc.name      : testSetOutsideTouchable_WinStateAb_Callback
     * @tc.desc      : Sets whether to allow areas outside of clickable subwindows
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetOutsideTouchable_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testSetOutsideTouchable_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetOutsideTouchable_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setOutsideTouchable(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the area to be touchable Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(801);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the area to be touchable.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the area to be touchable. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(801);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3450
     * @tc.name      : testSetPrivacyMode_WinStateAb_Callback
     * @tc.desc      : Sets whether the window is in private mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetPrivacyMode_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testSetPrivacyMode_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetPrivacyMode_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setPrivacyMode(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the window to privacy mode Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'SSucceeded in setting the window to privacy mode.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3460
     * @tc.name      : testSetPrivacyMode_WinStateAb_Promise
     * @tc.desc      : Sets whether the window is in private mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetPrivacyMode_WinStateAb_Promise', 0, async function () {
      let caseName = 'testSetPrivacyMode_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetPrivacyMode_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setPrivacyMode(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window to privacy mode. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3470
     * @tc.name      : testSetTouchable_WinStateAb_Promise
     * @tc.desc      : Sets whether the window is touchable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetTouchable_WinStateAb_Promise', 0, async function () {
      let caseName = 'testSetTouchable_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetTouchable_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setTouchable(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window to be touchable. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1001);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3480
     * @tc.name      : testSetTouchable_WinStateAb_Callback
     * @tc.desc      : Sets whether the window is touchable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetTouchable_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testSetTouchable_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetTouchable_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setTouchable(true, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the window to be touchable Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(1001);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1001);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3490
     * @tc.name      : testSetDimBehind_WinStateAb_Callback
     * @tc.desc      : When Windows are superimposed, if the device has child Windows, set the darkness value of the next window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetDimBehind_WinStateAb_Callback', 0, async function (done) {
      let caseName = 'testSetDimBehind_WinStateAb_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetDimBehind_WinStateAb_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        win.setDimBehind(0.5, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the dimness Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(801);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the dimness.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the dimness. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(801);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3500
     * @tc.name      : testSetDimBehind_WinStateAb_Promise
     * @tc.desc      : When Windows are superimposed, if the device has child Windows, set the darkness value of the next window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetDimBehind_WinStateAb_Promise', 0, async function () {
      let caseName = 'testSetDimBehind_WinStateAb_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetDimBehind_WinStateAb_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        await win.setDimBehind(0.5).then(() => {
          console.info(msgStr + 'Succeeded in setting the dimness.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the dimness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(801);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the dimness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(801);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3510
     * @tc.name      : testSetDimBehind_InvalidValue_Promise
     * @tc.desc      : When Windows are superimposed, if the device has child Windows, set the darkness value of the next window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetDimBehind_InvalidValue_Promise', 0, async function () {
      let caseName = 'testSetDimBehind_InvalidValueOne_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetDimBehind_InvalidValue_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        await win.setDimBehind(-0.5).then(() => {
          console.info(msgStr + 'Succeeded in setting the dimness.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to set the dimness. Cause: ' + JSON.stringify(err));
          await win.destroyWindow();
          expect(err.code).assertEqual(801);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the dimness. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect(exception.code).assertEqual(801);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3520
     * @tc.name      : testSetDimBehind_BoundaryValue_Promise
     * @tc.desc      : When Windows are superimposed, if the device has child Windows, set the darkness value of the next window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetDimBehind_BoundaryValue_Promise', 0, async function () {
      let caseName = 'testSetDimBehind_BoundaryValue_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetDimBehind_BoundaryValue_Promise').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        await win.setDimBehind(0).then(async () => {
          console.info(msgStr + 'Succeeded in setting the dimness.');
          await win.destroyWindow();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to set the dimness. Cause: ' + JSON.stringify(err));
          await win.destroyWindow();
          expect(err.code).assertEqual(801);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the dimness. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect(exception.code).assertEqual(801);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3530
     * @tc.name      : testSetDimBehind_InvalidValue_Callback
     * @tc.desc      : When Windows are superimposed, if the device has child Windows, set the darkness value of the next window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetDimBehind_InvalidValue_Callback', 0, async function (done) {
      let caseName = 'testSetDimBehind_InvalidValue_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetDimBehind_InvalidValue_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.setDimBehind(-0.5, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the dimness Cause: ' + JSON.stringify(err));
            await win.destroyWindow();
            expect(err.code).assertEqual(801);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the dimness.');
          await win.destroyWindow();
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the dimness. Cause:' + JSON.stringify(exception));
        await win.destroyWindow();
        expect(exception.code).assertEqual(801);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3540
     * @tc.name      : testSetDimBehind_BoundaryValue_Callback
     * @tc.desc      : When Windows are superimposed, if the device has child Windows, set the darkness value of the next window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetDimBehind_BoundaryValue_Callback', 0, async function (done) {
      let caseName = 'testSetDimBehind_BoundaryValue_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testSetDimBehind_BoundaryValue_Callback').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.setDimBehind(0, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the dimness Cause: ' + JSON.stringify(err));
            await win.destroyWindow();
            expect(err.code).assertEqual(801);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the dimness.');
          await win.destroyWindow();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the dimness. Cause:' + JSON.stringify(exception));
        await win.destroyWindow();
        expect(exception.code).assertEqual(801);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3550
     * @tc.name      : testWindowOffWindowSizeChange_RepeatOff
     * @tc.desc      : Turn off listening for window size changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowSizeChange_RepeatOff', 0, async function () {
      let caseName = 'testWindowOffWindowSizeChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffWindowSizeChange_RepeatOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.on('windowSizeChange', (data) => {
          console.info(msgStr + 'Succeeded in enabling the listener for window size changes. Data: ' + JSON.stringify(data));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to enable the listener for window size changes. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        win.off('windowSizeChange');
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for window size changes. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        win.off('windowSizeChange');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for window size changes. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3560
     * @tc.name      : testWindowOffWindowSizeChange_UnregisteredOff
     * @tc.desc      : Turn off listening for window size changes.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowSizeChange_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffWindowSizeChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffWindowSizeChange_UnregisteredOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.off('windowSizeChange');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for window size changes. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3570
     * @tc.name      : testWindowOffAvoidAreaChange_RepeatOff
     * @tc.desc      : Disable listening for system circumvention zone changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffAvoidAreaChange_RepeatOff', 0, async function () {
      let caseName = 'testWindowOffAvoidAreaChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffAvoidAreaChange_RepeatOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.on('avoidAreaChange', (data) => {
          console.info(msgStr + 'Succeeded in enabling the listener for system avoid area changes. type:' +
          JSON.stringify(data.type) + ', area: ' + JSON.stringify(data.area));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to enable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        win.off('avoidAreaChange');
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        win.off('avoidAreaChange');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3580
     * @tc.name      : testWindowOffAvoidAreaChange_UnregisteredOff
     * @tc.desc      : Disable listening for system circumvention zone changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffAvoidAreaChange_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffAvoidAreaChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffAvoidAreaChange_UnregisteredOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.off('avoidAreaChange');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3590
     * @tc.name      : testWindowOffKeyboardHeightChange_RepeatOff
     * @tc.desc      : Disable listening for the height change of the soft keyboard in the fixed state input method window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffKeyboardHeightChange_RepeatOff', 0, async function () {
      let caseName = 'testWindowOffKeyboardHeightChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffKeyboardHeightChange_RepeatOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.on('keyboardHeightChange', (data) => {
          console.info(msgStr + 'Succeeded in enabling the listener for keyboard height changes. Data: ' + JSON.stringify(data));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to enable the listener for keyboard height changes. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        win.off('keyboardHeightChange');
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for keyboard height changes. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        win.off('keyboardHeightChange');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for keyboard height changes. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3600
     * @tc.name      : testWindowOffKeyboardHeightChange_UnregisteredOff
     * @tc.desc      : Disable listening for the height change of the soft keyboard in the fixed state input method window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffKeyboardHeightChange_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffKeyboardHeightChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffKeyboardHeightChange_UnregisteredOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.off('keyboardHeightChange');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for keyboard height changes. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3610
     * @tc.name      : testWindowOffTouchOutside_RepeatOff
     * @tc.desc      : Turn off listening for click events outside this window area
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffTouchOutside_RepeatOff', 0, async function () {
      let caseName = 'testWindowOffTouchOutside_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffTouchOutside_RepeatOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.on('touchOutside', () => {
          console.info(msgStr + 'touch outside');
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
      try {
        win.off('touchOutside');
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
      try {
        win.off('touchOutside');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3620
     * @tc.name      : testWindowOffTouchOutside_UnregisteredOff
     * @tc.desc      : Turn off listening for click events outside this window area
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffTouchOutside_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffTouchOutside_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffTouchOutside_UnregisteredOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.off('touchOutside');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3630
     * @tc.name      : testWindowOffScreenshot_RepeatOff
     * @tc.desc      : Disable the monitoring of screenshot events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffScreenshot_RepeatOff', 0, async function () {
      let caseName = 'testWindowOffScreenshot_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffScreenshot_RepeatOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.on('screenshot', () => {
          console.info(msgStr + 'screenshot happened.');
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
      try {
        win.off('screenshot');
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
      try {
        win.off('screenshot');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3640
     * @tc.name      : testWindowOffScreenshot_UnregisteredOff
     * @tc.desc      : Disable the monitoring of screenshot events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffScreenshot_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffScreenshot_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffScreenshot_UnregisteredOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.off('screenshot');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3650
     * @tc.name      : testWindowOffDialogTargetTouch_RepeatOff
     * @tc.desc      : Turns off listening for click events on the target window of the modal window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffDialogTargetTouch_RepeatOff', 0, async function () {
      let caseName = 'testWindowOffDialogTargetTouch_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffDialogTargetTouch_RepeatOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.on('dialogTargetTouch', () => {
          console.info(msgStr + 'touch dialog target');
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
      try {
        win.off('dialogTargetTouch');
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
      try {
        win.off('dialogTargetTouch');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3660
     * @tc.name      : testWindowOffDialogTargetTouch_UnregisteredOff
     * @tc.desc      : Turns off listening for click events on the target window of the modal window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffDialogTargetTouch_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffDialogTargetTouch_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testWindowOffDialogTargetTouch_UnregisteredOff",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      try {
        win.off('dialogTargetTouch');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3680
     * @tc.name      : testWindowOffWindowEvent_UnregisteredOff
     * @tc.desc      : Disable the monitoring of window life cycle changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowEvent_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffWindowEvent_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffWindowEvent_UnregisteredOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.off('windowEvent');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3690
     * @tc.name      : testWindowOffSystemAvoidAreaChange_RepeatOff
     * @tc.desc      : Disable listening for system circumvention zone changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffSystemAvoidAreaChange_RepeatOff', 0, async function () {
      let caseName = 'testWindowOffSystemAvoidAreaChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffSystemAvoidAreaChange_RepeatOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.on('systemAvoidAreaChange', (data) => {
          console.info(msgStr + 'Succeeded in enabling the listener for system avoid area changes. Data: ' + JSON.stringify(data));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
      try {
        win.off('systemAvoidAreaChange');
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
      try {
        win.off('systemAvoidAreaChange');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3700
     * @tc.name      : testWindowOffSystemAvoidAreaChange_UnregisteredOff
     * @tc.desc      : Disable listening for system circumvention zone changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffSystemAvoidAreaChange_UnregisteredOff', 0, async function () {
      let caseName = 'testWindowOffSystemAvoidAreaChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let win = null;
      win = await windowStage.createSubWindow('testWindowOffSystemAvoidAreaChange_UnregisteredOff').catch((err) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      try {
        win.off('systemAvoidAreaChange');
        await win.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect().assertFail();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3720
     * @tc.name      : testOffWindowStageEvent_UnregisteredOff
     * @tc.desc      : Turn off listening for Windows Stage lifecycle changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testOffWindowStageEvent_UnregisteredOff', 0, async function () {
      let caseName = 'testOffWindowStageEvent_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.off('windowStageEvent');
        console.log(msgStr + 'windowStageEvent success')
      } catch (exception) {
        console.error(msgStr + 'Failed to disable the listener for window stage event changes. Cause:' +
        JSON.stringify(exception));
        expect().assertFail();
      }
    })

  })
}