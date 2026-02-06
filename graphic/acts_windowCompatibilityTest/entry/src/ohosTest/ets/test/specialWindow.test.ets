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
import { BusinessError, Callback } from '@ohos.base';
import common from '@ohos.app.ability.common';


export default function specialWindowTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('special_window_test', () => {
    console.log('describe special_window_test start!!!')
    let windowClass: window.Window | void;
    let subWin: window.Window | void;
    let subWinFirst: window.Window | void;
    let subWinSecond: window.Window | void;
    let subWinThird: window.Window | void;
    let tempWnd: window.Window | void;
    let subWinWithOPs: window.Window | void;

    beforeEach(async ()=>{
      let msg = 'special_window_test';
      console.log(msg +  ' beforeEach start!!!');
      if(windowClass !== null && windowClass !== undefined){
        await (windowClass as window.Window).destroyWindow().then(() => {
          console.info(msg + 'Succeeded in destroying the window.');
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
      if(subWinFirst !== null && subWinFirst !== undefined){
        await (subWinFirst as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      if(subWinSecond !== null && subWinSecond !== undefined){
        await (subWinSecond as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      if(subWinThird !== null && subWinThird !== undefined){
        await (subWinThird as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      if(tempWnd !== null && tempWnd !== undefined){
        await (tempWnd as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      if(subWinWithOPs !== null && subWinWithOPs !== undefined){
        await (subWinWithOPs as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      console.log(msg +  ' beforeEach end!!!')
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0010
     * @tc.name      : testCreateWindow_DialogWindow_Callback
     * @tc.desc      : Create a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateWindow_DialogWindow_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreateWindow_DialogWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let config: window.Configuration = {
        name: "testCreateWindow_DialogWindow_Callback",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      try {
        window.createWindow(config, async (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the window. Data: ' + JSON.stringify(data));
          (windowClass as window.Window).resize(500, 1000);
          await (windowClass as window.Window).destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0020
     * @tc.name      : testCreateWindow_DialogWindow_Promise
     * @tc.desc      : Create a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateWindow_DialogWindow_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreateWindow_DialogWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let config: window.Configuration = {
        name: "testCreateWindow_DialogWindow_Promise",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      try {
        await window.createWindow(config).then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          await (windowClass as window.Window).destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the Window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0030
     * @tc.name      : testCreate_DialogWindow_Callback
     * @tc.desc      : Create a system window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreate_DialogWindow_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreate_DialogWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      window.create(context, 'testCreate_DialogWindow_Callback', window.WindowType.TYPE_DIALOG, async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        windowClass = data;
        console.info(msgStr + 'Succeeded in creating the window. Data: ' + JSON.stringify(data));
        windowClass.resetSize(500, 1000);
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0040
     * @tc.name      : testCreate_DialogWindow_Promise
     * @tc.desc      : Create a system window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreate_DialogWindow_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreate_DialogWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      await window.create(context, 'testCreate_DialogWindow_Promise', window.WindowType.TYPE_DIALOG)
        .then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          await windowClass.destroyWindow();
          done();
        })
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the Window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0050
     * @tc.name      : testGetSubWindow_SubWinNumIsOne_Promise
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinNumIsOne_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetSubWindow_SubWinNumIsOne_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsOne_Promise')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWin).assertTrue();
      let windowArray: window.Window[] = [];
      await windowStage.getSubWindow().then(async (data) => {
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(1);
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      await (subWin as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0060
     * @tc.name      : testGetSubWindow_SubWinNumIsMore_Promise
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinNumIsMore_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetSubWindow_SubWinNumIsMore_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Promise_First')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      subWinSecond = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Promise_Second')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinSecond).assertTrue();
      subWinThird = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Promise_Third')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinThird).assertTrue();
      let windowArray: window.Window[] = [];
      await windowStage.getSubWindow().then(async (data) => {
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(3);
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      await (subWinFirst as window.Window).destroyWindow();
      await (subWinSecond as window.Window).destroyWindow();
      await (subWinThird as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0070
     * @tc.name      : testGetSubWindow_SubWinAndHasDialogWin_Promise
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinAndHasDialogWin_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetSubWindow_SubWinAndHasDialogWin_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_SubWinAndHasDialogWin_Promise_First')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      subWinSecond = await windowStage.createSubWindow('testGetSubWindow_SubWinAndHasDialogWin_Promise_Second')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinSecond).assertTrue();
      let windowConfig: window.Configuration = {
        name: "testGetSubWindow_SubWinAndHasDialogWin_Promise",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let windowArray: window.Window[] = [];
      await windowStage.getSubWindow().then(async (data) => {
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(2);
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      await (subWinFirst as window.Window).destroyWindow();
      await (subWinSecond as window.Window).destroyWindow();
      await (tempWnd as window.Window).destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0080
     * @tc.name      : testGetSubWindow_SubWinNumIsOne_Callback
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinNumIsOne_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetSubWindow_SubWinNumIsOne_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsOne_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWin).assertTrue();
      let windowArray: window.Window[] = [];
      windowStage.getSubWindow(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await (subWin as window.Window).destroyWindow();
          expect().assertFail();
          done();
          return;
        }
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(1);
        await (subWin as window.Window).destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0090
     * @tc.name      : testGetSubWindow_SubWinNumIsMore_Callback
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinNumIsMore_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetSubWindow_SubWinNumIsMore_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Callback_First')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      subWinSecond = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Callback_Second')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinSecond).assertTrue();
      subWinThird = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Callback_Third')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinThird).assertTrue();
      let windowArray: window.Window[] = [];
      windowStage.getSubWindow(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await (subWinFirst as window.Window).destroyWindow();
          await (subWinSecond as window.Window).destroyWindow();
          await (subWinThird as window.Window).destroyWindow();
          expect().assertFail();
          done();
          return;
        }
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(3);
        await (subWinFirst as window.Window).destroyWindow();
        await (subWinSecond as window.Window).destroyWindow();
        await (subWinThird as window.Window).destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0100
     * @tc.name      : testGetSubWindow_SubWinAndHasDialogWin_Callback
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinAndHasDialogWin_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetSubWindow_SubWinAndHasDialogWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_SubWinAndHasDialogWin_Callback_First')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      subWinSecond = await windowStage.createSubWindow('testGetSubWindow_SubWinAndHasDialogWin_Callback_Second')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinSecond).assertTrue();
      let windowConfig: window.Configuration = {
        name: "testGetSubWindow_SubWinAndHasDialogWin_Callback",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let windowArray: window.Window[] = [];
      windowStage.getSubWindow(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await (subWinFirst as window.Window).destroyWindow();
          await (subWinSecond as window.Window).destroyWindow();
          await (tempWnd as window.Window).destroyWindow();
          expect().assertFail();
          done();
          return;
        }
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(2);
        await (subWinFirst as window.Window).destroyWindow();
        await (subWinSecond as window.Window).destroyWindow();
        await (tempWnd as window.Window).destroyWindow();
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0110
     * @tc.name      : testCreateSubWindow_Callback
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreateSubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.createSubWindow('testCreateSubWindow_Callback', async (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0120
     * @tc.name      : testCreateSubWindow_Promise
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testCreateSubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        await windowStage.createSubWindow('testCreateSubWindow_Promise').then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0130
     * @tc.name      : testCreateSubWindow_WinNameNull_Promise
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_WinNameNull_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testCreateSubWindow_WinNameNull_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        await windowStage.createSubWindow(null).then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0140
     * @tc.name      : testCreateSubWindow_WinNameNull_Callback
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_WinNameNull_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreateSubWindow_WinNameNull_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.createSubWindow(null, async (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0150
     * @tc.name      : testCreateSubWindow_WinNameUndefined_Promise
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_WinNameUndefined_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testCreateSubWindow_WinNameUndefined_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        await windowStage.createSubWindow(undefined).then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0160
     * @tc.name      : testCreateSubWindow_WinNameUndefined_Callback
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_WinNameUndefined_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreateSubWindow_WinNameUndefined_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.createSubWindow(undefined, async (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0170
     * @tc.name      : testSetSubWindowModal_DialogWindow
     * @tc.desc      : Sets whether the modal properties of the subwindow are enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSubWindowModal_DialogWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetSubWindowModal_DialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetSubWindowModal_DialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).setSubWindowModal(true).then(() => {
        console.info(msgStr + 'Succeeded in setting subwindow modal');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300004);
      });
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0180
     * @tc.name      : testSetSubWindowModal_MainWindow
     * @tc.desc      : Sets whether the modal properties of the subwindow are enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSubWindowModal_MainWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetSubWindowModal_MainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      await mainWin.setSubWindowModal(true).then(() => {
        console.info(msgStr + 'Succeeded in setting subwindow modal');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300004);
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0190
     * @tc.name      : testSetSubWindowModal_SubWindow
     * @tc.desc      : Sets whether the modal properties of the subwindow are enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSubWindowModal_SubWindow', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetSubWindowModal_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetSubWindowModal_SubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      try {
        await (subWin as window.Window).setSubWindowModal(false).then(() => {
          console.info(msgStr + 'Succeeded in setting subwindow modal');
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subWindow. out Cause code: ${exception.code}, message: ${exception.message}`);
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0200
     * @tc.name      : testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_subWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      let windowConfig: window.Configuration = {
        name: "testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let subWinWithOPsCreateSuccessed = false;
      let options: window.SubWindowOptions = {
        title: 'testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback_Sub',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback_Sub', options)
        .then(async (data) => {
          subWinWithOPs = data;
          expect(!!subWinWithOPs).assertTrue();
          subWinWithOPsCreateSuccessed = true;
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
          }
        });
      let windowArray: window.Window[] = [];
      windowStage.getSubWindow(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await (subWinFirst as window.Window).destroyWindow();
          await (tempWnd as window.Window).destroyWindow();
          if (subWinWithOPsCreateSuccessed) {
            await (subWinWithOPs as window.Window).destroyWindow();
          }
          expect().assertFail();
          done();
          return;
        }
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        if (subWinWithOPsCreateSuccessed) {
          expect(windowArrayLength).assertEqual(2);
          await (subWinWithOPs as window.Window).destroyWindow();
        } else {
          expect(windowArrayLength).assertEqual(1);
        }
        await (subWinFirst as window.Window).destroyWindow();
        await (tempWnd as window.Window).destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0210
     * @tc.name      : testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_subWindow_Promise')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      let windowConfig: window.Configuration = {
        name: "testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let subWinWithOPsCreateSuccessed = false;
      let options: window.SubWindowOptions = {
        title: 'testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise_Sub',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise_Sub', options)
        .then(async (data) => {
          subWinWithOPs = data;
          expect(!!subWinWithOPs).assertTrue();
          subWinWithOPsCreateSuccessed = true;
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
          }
        });
      let windowArray: window.Window[] = [];
      await windowStage.getSubWindow().then(async (data) => {
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        if (subWinWithOPsCreateSuccessed) {
          expect(windowArrayLength).assertEqual(2);
          await (subWinWithOPs as window.Window).destroyWindow();
        } else {
          expect(windowArrayLength).assertEqual(1);
        }
        await (subWinFirst as window.Window).destroyWindow();
        await (tempWnd as window.Window).destroyWindow();
        done();
      }).catch(async (err: BusinessError) => {
        console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        await (subWinFirst as window.Window).destroyWindow();
        await (tempWnd as window.Window).destroyWindow();
        if (subWinWithOPsCreateSuccessed) {
          await (subWinWithOPs as window.Window).destroyWindow();
        }
        expect().assertFail();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0220
     * @tc.name      : testCreateSubWindowWithOptions_Normal
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindowWithOptions_Normal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testCreateSubWindowWithOptions_Normal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testCreateSubWindowWithOptions_Normal',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_Normal', options)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await data.destroyWindow();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0230
     * @tc.name      : testCreateSubWindowWithOptions_isModalIsUndefined
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindowWithOptions_isModalIsUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testCreateSubWindowWithOptions_isModalIsUndefined';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testCreateSubWindowWithOptions_isModalIsUndefined',
        decorEnabled: true,
        isModal: undefined
      };
      await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_isModalIsUndefined', options)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await data.destroyWindow();
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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_0240
     * @tc.name      : testSetSubWindowModal_SubWindowWithOps
     * @tc.desc      : Sets whether the modal properties of the subwindow are enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSubWindowModal_SubWindowWithOps', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testSetSubWindowModal_SubWindowWithOps';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testSetSubWindowModal_SubWindowWithOps',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetSubWindowModal_SubWindowWithOps', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          try {
            await subWin.setSubWindowModal(false).then(() => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
            }).catch((err: BusinessError) => {
              if (err.code != 801) {
                console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
            });
          } catch (exception) {
            console.error(msgStr + `Failed to create the subWindow. out Cause code: ${exception.code}, message: ${exception.message}`);
          }
          await subWin.destroyWindow();
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
