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

export default function windowLevelTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('window_level_test', () => {
    console.log('describe window_level_test start!!!')
    let subWindow: window.Window | void;
    let subWindowTwo: window.Window | void;
    let tempWnd: window.Window | void;

    beforeEach(async ()=>{
      let msg = 'window_level_test';
      console.log(msg + ' beforeEach start!!!');
      if(subWindow !== null && subWindow !== undefined){
        await (subWindow as window.Window).destroyWindow().then(() => {
          console.info(msg + ' Succeeded in destroying the window.');
        }).catch((err: BusinessError) => {
          console.error(msg + `Failed to destroy the window. Cause code: ${err.code}, message: ${err.message}`);
        });
      }
      if(subWindowTwo !== null && subWindowTwo !== undefined){
        await (subWindowTwo as window.Window).destroyWindow().then(() => {
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
      console.log(msg + ' beforeEach end!!!')
    })
    /**
     * @tc.name   testGetLastWindow_SubWindow_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLEVEL_JS_API_0010
     * @tc.desc   Gets the last window displayed in the current app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastWindow_SubWindow_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetLastWindow_SubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWindow = await windowStage.createSubWindow('testGetLastWindow_SubWindow_Promise')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as window.Window).resize(401, 401).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as window.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (subWindow as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await sleep(500);
      await sleep(500);
      let lastWindow: window.Window | void = await window.getLastWindow(context).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let properties = (lastWindow as window.Window).getWindowProperties();
      console.log(msgStr + 'properties is:' + JSON.stringify(properties));
      let SubProperties = (subWindow as window.Window).getWindowProperties();
      console.log(msgStr + 'SubProperties is:' + JSON.stringify(SubProperties));
      expect(properties.id).assertEqual(SubProperties.id);
      await (subWindow as window.Window).destroyWindow();
    })
    /**
     * @tc.name   testGetLastWindow_SubWindow_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLEVEL_JS_API_0020
     * @tc.desc   Gets the last window displayed in the current app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastWindow_SubWindow_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetLastWindow_SubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWindow= await windowStage.createSubWindow('testGetLastWindow_SubWindow_Callback')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as window.Window).resize(401, 401).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindow as window.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await (subWindow as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindow as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(500);
      await sleep(500);
      window.getLastWindow(context, async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        let lastWindow = data;
        console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        expect(!!lastWindow).assertTrue();
        let properties = (lastWindow as window.Window).getWindowProperties();
        console.log(msgStr + 'properties is:' + JSON.stringify(properties));
        let SubProperties = (subWindow as window.Window).getWindowProperties();
        console.log(msgStr + 'SubProperties is:' + JSON.stringify(SubProperties));
        expect(properties.id).assertEqual(SubProperties.id);
        await (subWindow as window.Window).destroyWindow();
        done();
      });
    })
    /**
     * @tc.name   testGetLastWindow_TwoSubWindow_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLEVEL_JS_API_0030
     * @tc.desc   Gets the last window displayed in the current app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastWindow_TwoSubWindow_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetLastWindow_TwoSubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWindow = await windowStage.createSubWindow('testGetLastWindow_TwoSubWindow_Promise')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as window.Window).resize(401, 401).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as window.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (subWindow as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await sleep(500);
      await sleep(500);
      subWindowTwo = await windowStage.createSubWindow('testGetLastWindow_SubWindowTwo')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindowTwo).assertTrue();
      await (subWindowTwo as window.Window).resize(501, 501).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindowTwo as window.Window).loadContent('testability/pages/second/pageOne')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (subWindowTwo as window.Window).moveWindowTo(200, 200).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindowTwo as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await sleep(500);
      await sleep(500);
      let lastWindow: window.Window | void = await window.getLastWindow(context).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let properties = (lastWindow as window.Window).getWindowProperties();
      console.log(msgStr + 'properties is:' + JSON.stringify(properties));
      let SubProperties = (subWindowTwo as window.Window).getWindowProperties();
      console.log(msgStr + 'SubProperties is:' + JSON.stringify(SubProperties));
      expect(properties.id).assertEqual(SubProperties.id);
      await (subWindow as window.Window).destroyWindow();
      await (subWindowTwo as window.Window).destroyWindow();
    })
    /**
     * @tc.name   testGetLastWindow_TwoSubWindow_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLEVEL_JS_API_0040
     * @tc.desc   Gets the last window displayed in the current app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastWindow_TwoSubWindow_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetLastWindow_TwoSubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWindow = await windowStage.createSubWindow('testGetLastWindow_TwoSubWindow_Callback')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as window.Window).resize(401, 401).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindow as window.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await (subWindow as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindow as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(500);
      await sleep(500);
      subWindowTwo = await windowStage.createSubWindow('testGetLastWindow_TwoSubWindow_CallbackTwo')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      expect(!!subWindowTwo).assertTrue();
      await (subWindowTwo as window.Window).resize(501, 501).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindowTwo as window.Window).loadContent('testability/pages/second/pageOne')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await (subWindowTwo as window.Window).moveWindowTo(200, 200).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindowTwo as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(500);
      await sleep(500);
      window.getLastWindow(context, async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        let lastWindow = data;
        console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        expect(!!lastWindow).assertTrue();
        let properties = (lastWindow as window.Window).getWindowProperties();
        console.log(msgStr + 'properties is:' + JSON.stringify(properties));
        let SubProperties = (subWindowTwo as window.Window).getWindowProperties();
        console.log(msgStr + 'SubProperties is:' + JSON.stringify(SubProperties));
        expect(properties.id).assertEqual(SubProperties.id);
        await (subWindow as window.Window).destroyWindow();
        await (subWindowTwo as window.Window).destroyWindow();
        done();
      });
    })
    /**
     * @tc.name   testGetLastWindow_DialogWindow_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLEVEL_JS_API_0050
     * @tc.desc   Gets the last window displayed in the current app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastWindow_DialogWindow_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      let caseName = 'testGetLastWindow_DialogWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId: string = 'testGetLastWindow_DialogWindow_Promise';
      let windowConfig: window.Configuration = {
        name: windowId, windowType: window.WindowType.TYPE_DIALOG, ctx: context
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(402, 402).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (tempWnd as window.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (tempWnd as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (tempWnd as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await sleep(500);
      await sleep(500);
      let lastWindow: window.Window | void = await window.getLastWindow(context).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let lastWindow_properties = (lastWindow as window.Window).getWindowProperties();
      console.log(msgStr + 'lastWindow_properties is:' + JSON.stringify(lastWindow_properties));
      let mainWin = windowStage.getMainWindowSync();
      let mainWin_properties = (mainWin as window.Window).getWindowProperties();
      console.log(msgStr + 'mainWin_properties is:' + JSON.stringify(mainWin_properties));
      expect(lastWindow_properties.id).assertEqual(mainWin_properties.id);
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.name   testGetLastWindow_DialogWindow_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOWLEVEL_JS_API_0060
     * @tc.desc   Gets the last window displayed in the current app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastWindow_DialogWindow_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testGetLastWindow_DialogWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId: string = 'testGetLastWindow_DialogWindow_Callback';
      let windowConfig: window.Configuration = {
        name: windowId, windowType: window.WindowType.TYPE_DIALOG, ctx: context
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(402, 402).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (tempWnd as window.Window).loadContent('testability/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await (tempWnd as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (tempWnd as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await sleep(500);
      await sleep(500);
      window.getLastWindow(context, async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        let lastWindow = data;
        console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        expect(!!lastWindow).assertTrue();
        let lastWindow_properties = (lastWindow as window.Window).getWindowProperties();
        console.log(msgStr + 'lastWindow_properties is:' + JSON.stringify(lastWindow_properties));
        let mainWin = windowStage.getMainWindowSync();
        let mainWin_properties = (mainWin as window.Window).getWindowProperties();
        console.log(msgStr + 'mainWin_properties is:' + JSON.stringify(mainWin_properties));
        expect(lastWindow_properties.id).assertEqual(mainWin_properties.id);
        await (tempWnd as window.Window).destroyWindow();
        done();
      });
    })
  })
}
