/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
export default function windowErrCode1300002_1() {
  describe('windowErrCode1300002_1', () => {
    console.log('describe windowErrCode1300002_1 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.name   testMoveWindowToAsyncPromiseErrCode1300002_0100
     * @tc.number testMoveWindowToAsyncPromiseErrCode1300002_0100
     * @tc.desc   testMoveWindowToAsyncPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToAsyncPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToAsyncPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testMoveWindowToAsyncPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        await (subWin! as ohosWindow.Window).moveWindowToAsync(0, 0).then(async () => {
          console.info(msgStr + 'Succeeded in calling moveWindowToAsync.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300002);
        expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call moveWindowToAsync. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testMoveWindowToGlobalPromiseErrCode1300002_0100
     * @tc.number testMoveWindowToGlobalPromiseErrCode1300002_0100
     * @tc.desc   testMoveWindowToGlobalPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToGlobalPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToGlobalPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testMoveWindowToGlobalPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        await (subWin! as ohosWindow.Window).moveWindowToGlobal(0, 0).then(async () => {
          console.info(msgStr + 'Succeeded in calling moveWindowToGlobal.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call moveWindowToGlobal. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testMoveWindowToGlobalPromiseErrCode1300002_0200
     * @tc.number testMoveWindowToGlobalPromiseErrCode1300002_0200
     * @tc.desc   testMoveWindowToGlobalPromiseErrCode1300002_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMoveWindowToGlobalPromiseErrCode1300002_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMoveWindowToGlobalPromiseErrCode1300002_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testMoveWindowToGlobalPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        let param: ohosWindow.MoveConfiguration = {
          displayId: 0
        }
        await (subWin! as ohosWindow.Window).moveWindowToGlobal(0, 0, param).then(async () => {
          console.info(msgStr + 'Succeeded in calling moveWindowToGlobal.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call moveWindowToGlobal. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testGetGlobalRectErrCode1300002_0100
     * @tc.number testGetGlobalRectErrCode1300002_0100
     * @tc.desc   testGetGlobalRectErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetGlobalRectErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetGlobalRectErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testGetGlobalRectErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.getGlobalRect();
        console.error(msgStr + 'Succeeded in calling getGlobalRect.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testGetWindowDensityInfoErrCode1300002_0100
     * @tc.number testGetWindowDensityInfoErrCode1300002_0100
     * @tc.desc   testGetWindowDensityInfoErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowDensityInfoErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetWindowDensityInfoErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testGetWindowDensityInfoErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.getWindowDensityInfo();
        console.error(msgStr + 'Succeeded in calling getWindowDensityInfo.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetSpecificSystemBarEnabledPromiseErrCode1300002_0100
     * @tc.number testSetSpecificSystemBarEnabledPromiseErrCode1300002_0100
     * @tc.desc   testSetSpecificSystemBarEnabledPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetSpecificSystemBarEnabledPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetSpecificSystemBarEnabledPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetSpecificSystemBarEnabledPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        let param: ohosWindow.MoveConfiguration = {
          displayId: 0
        }
        await (subWin! as ohosWindow.Window).setSpecificSystemBarEnabled('status', true, true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setSpecificSystemBarEnabled.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300002);
        expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setSpecificSystemBarEnabled. Cause:' +
        JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testGetWindowSystemBarPropertiesErrCode1300002_0100
     * @tc.number testGetWindowSystemBarPropertiesErrCode1300002_0100
     * @tc.desc   testGetWindowSystemBarPropertiesErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowSystemBarPropertiesErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetWindowSystemBarPropertiesErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testGetWindowSystemBarPropertiesErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.getWindowSystemBarProperties();
        console.error(msgStr + 'Succeeded in calling getWindowSystemBarProperties.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testIsGestureBackEnabledErrCode1300002_0100
     * @tc.number testIsGestureBackEnabledErrCode1300002_0100
     * @tc.desc   testIsGestureBackEnabledErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsGestureBackEnabledErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testIsGestureBackEnabledErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testIsGestureBackEnabledErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.isGestureBackEnabled();
        console.error(msgStr + 'Succeeded in calling isGestureBackEnabled.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testLoadContentByNameCallbackErrCode1300002_0100
     * @tc.number testLoadContentByNameCallbackErrCode1300002_0100
     * @tc.desc   testLoadContentByNameCallbackErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByNameCallbackErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNameCallbackErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testLoadContentByNameCallbackErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        let storage: LocalStorage = new LocalStorage();
        subWin!.loadContentByName("entryAbility", storage, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
            expect(err.code).assertEqual(1300002);
            expect(err.message!=null).assertTrue();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling loadContentByName.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call loadContentByName. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testLoadContentByNamePromiseErrCode1300002_0100
     * @tc.number testLoadContentByNamePromiseErrCode1300002_0100
     * @tc.desc   testLoadContentByNamePromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLoadContentByNamePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNamePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testLoadContentByNamePromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        let storage: LocalStorage = new LocalStorage();
        await (subWin! as ohosWindow.Window).loadContentByName("entryability", storage).then(async () => {
          console.info(msgStr + 'Succeeded in calling loadContentByName.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call loadContentByName. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testOnDisplayIdChangeErrCode1300002_0100
     * @tc.number testOnDisplayIdChangeErrCode1300002_0100
     * @tc.desc   testOnDisplayIdChangeErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDisplayIdChangeErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnDisplayIdChangeErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOnDisplayIdChangeErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.on("displayIdChange", (res: number) => {
        });
        console.error(msgStr + 'Succeeded in calling on displayIdChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOffDisplayIdChangeErrCode1300002_0100
     * @tc.number testOffDisplayIdChangeErrCode1300002_0100
     * @tc.desc   testOffDisplayIdChangeErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffDisplayIdChangeErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffDisplayIdChangeErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOffDisplayIdChangeErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.off("displayIdChange", (res: number) => {
        });
        console.error(msgStr + 'Succeeded in calling off displayIdChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOnWindowVisibilityChangeErrCode1300002_0100
     * @tc.number testOnWindowVisibilityChangeErrCode1300002_0100
     * @tc.desc   testOnWindowVisibilityChangeErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnWindowVisibilityChangeErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowVisibilityChangeErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOnWindowVisibilityChangeErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.on("windowVisibilityChange", (res: boolean) => {
        });
        console.error(msgStr + 'Succeeded in calling on windowVisibilityChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOnSystemDensityChangeErrCode1300002_0100
     * @tc.number testOnSystemDensityChangeErrCode1300002_0100
     * @tc.desc   testOnSystemDensityChangeErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnSystemDensityChangeErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnSystemDensityChangeErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOnSystemDensityChangeErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.on("systemDensityChange", (res: number) => {
        });
        console.error(msgStr + 'Succeeded in calling on systemDensityChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOffSystemDensityChangeErrCode1300002_0100
     * @tc.number testOffSystemDensityChangeErrCode1300002_0100
     * @tc.desc   testOffSystemDensityChangeErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffSystemDensityChangeErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffSystemDensityChangeErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOffSystemDensityChangeErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.off("systemDensityChange", (res: number) => {
        });
        console.error(msgStr + 'Succeeded in calling off systemDensityChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOnNoInteractionDetectedErrCode1300002_0100
     * @tc.number testOnNoInteractionDetectedErrCode1300002_0100
     * @tc.desc   testOnNoInteractionDetectedErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnNoInteractionDetectedErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnNoInteractionDetectedErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOnNoInteractionDetectedErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.on("noInteractionDetected", 1, () => {
        });
        console.error(msgStr + 'Succeeded in calling on noInteractionDetected.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOffNoInteractionDetectedErrCode1300002_0100
     * @tc.number testOffNoInteractionDetectedErrCode1300002_0100
     * @tc.desc   testOffNoInteractionDetectedErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffNoInteractionDetectedErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffNoInteractionDetectedErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOffNoInteractionDetectedErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.off("noInteractionDetected", () => {
        });
        console.error(msgStr + 'Succeeded in calling off noInteractionDetected.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOnSubWindowCloseErrCode1300002_0100
     * @tc.number testOnSubWindowCloseErrCode1300002_0100
     * @tc.desc   testOnSubWindowCloseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnSubWindowCloseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnSubWindowCloseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOnSubWindowCloseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.on("subWindowClose", () => {
        });
        console.error(msgStr + 'Succeeded in calling on subWindowClose.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testOffSubWindowCloseErrCode1300002_0100
     * @tc.number testOffSubWindowCloseErrCode1300002_0100
     * @tc.desc   testOffSubWindowCloseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffSubWindowCloseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffSubWindowCloseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOffSubWindowCloseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.off("subWindowClose", () => {
        });
        console.error(msgStr + 'Succeeded in calling off subWindowClose.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetWindowTopmostPromiseErrCode1300002_0100
     * @tc.number testSetWindowTopmostPromiseErrCode1300002_0100
     * @tc.desc   testSetWindowTopmostPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowTopmostPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTopmostPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowTopmostPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        await (subWin! as ohosWindow.Window).setWindowTopmost(true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowTopmost.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowTopmost. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetAspectRatioCallbackErrCode1300002_0100
     * @tc.number testSetAspectRatioCallbackErrCode1300002_0100
     * @tc.desc   testSetAspectRatioCallbackErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAspectRatioCallbackErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetAspectRatioCallbackErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetAspectRatioCallbackErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.setAspectRatio(1, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call setAspectRatio. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setAspectRatio.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetAspectRatioPromiseErrCode1300002_0100
     * @tc.number testSetAspectRatioPromiseErrCode1300002_0100
     * @tc.desc   testSetAspectRatioPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAspectRatioPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetAspectRatioPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetAspectRatioPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        await (subWin! as ohosWindow.Window).setAspectRatio(1).then(async () => {
          console.info(msgStr + 'Succeeded in calling setAspectRatio.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setAspectRatio. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testResetAspectRatioCallbackErrCode1300002_0100
     * @tc.number testResetAspectRatioCallbackErrCode1300002_0100
     * @tc.desc   testResetAspectRatioCallbackErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetAspectRatioCallbackErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testResetAspectRatioCallbackErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testResetAspectRatioCallbackErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.resetAspectRatio(async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call resetAspectRatio. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling resetAspectRatio.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testResetAspectRatioPromiseErrCode1300002_0100
     * @tc.number testResetAspectRatioPromiseErrCode1300002_0100
     * @tc.desc   testResetAspectRatioPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetAspectRatioPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testResetAspectRatioPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testResetAspectRatioPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        await (subWin! as ohosWindow.Window).resetAspectRatio().then(async () => {
          console.info(msgStr + 'Succeeded in calling resetAspectRatio.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call resetAspectRatio. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testMinimizeCallbackErrCode1300002_0100
     * @tc.number testMinimizeCallbackErrCode1300002_0100
     * @tc.desc   testMinimizeCallbackErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMinimizeCallbackErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMinimizeCallbackErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testMinimizeCallbackErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.minimize(async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
            expect(err.code).assertEqual(1300002);
            expect(err.message!=null).assertTrue();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling minimize.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call minimize. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testMinimizePromiseErrCode1300002_0100
     * @tc.number testMinimizePromiseErrCode1300002_0100
     * @tc.desc   testMinimizePromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMinimizePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMinimizePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testMinimizePromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        await (subWin! as ohosWindow.Window).minimize().then(async () => {
          console.info(msgStr + 'Succeeded in calling minimize.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call minimize. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testMaximizePromiseErrCode1300002_0100
     * @tc.number testMaximizePromiseErrCode1300002_0100
     * @tc.desc   testMaximizePromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testMaximizePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testMaximizePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testMaximizePromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        await (subWin! as ohosWindow.Window).maximize(ohosWindow.MaximizePresentation.EXIT_IMMERSIVE).then(async () => {
          console.info(msgStr + 'Succeeded in calling maximize.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetResizeByDragEnabledCallbackErrCode1300002_0100
     * @tc.number testSetResizeByDragEnabledCallbackErrCode1300002_0100
     * @tc.desc   testSetResizeByDragEnabledCallbackErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResizeByDragEnabledCallbackErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetResizeByDragEnabledCallbackErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetResizeByDragEnabledCallbackErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.setResizeByDragEnabled(true, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
            expect(err.code).assertEqual(1300002);
            expect(err.message!=null).assertTrue();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in calling setResizeByDragEnabled.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to call setResizeByDragEnabled. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testSetResizeByDragEnabledPromiseErrCode1300002_0100
     * @tc.number testSetResizeByDragEnabledPromiseErrCode1300002_0100
     * @tc.desc   testSetResizeByDragEnabledPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetResizeByDragEnabledPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetResizeByDragEnabledPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetResizeByDragEnabledPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        await (subWin! as ohosWindow.Window).setResizeByDragEnabled(true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setResizeByDragEnabled.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setResizeByDragEnabled. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testGetWindowLimitsErrCode1300002_0100
     * @tc.number testGetWindowLimitsErrCode1300002_0100
     * @tc.desc   testGetWindowLimitsErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetWindowLimitsErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetWindowLimitsErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testGetWindowLimitsErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.getWindowLimits();
        console.error(msgStr + 'Succeeded in calling getWindowLimits.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   testSetWindowLimitsPromiseErrCode1300002_0100
     * @tc.number testSetWindowLimitsPromiseErrCode1300002_0100
     * @tc.desc   testSetWindowLimitsPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowLimitsPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowLimitsPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowLimitsPromiseErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        let param: ohosWindow.WindowLimits = {
          maxWidth: 1,
          maxHeight: 1,
          minWidth: 0,
          minHeight: 0
        }
        await (subWin! as ohosWindow.Window).setWindowLimits(param).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowLimits.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowLimits. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.name   testKeepKeyboardOnFocusErrCode1300002_0100
     * @tc.number testKeepKeyboardOnFocusErrCode1300002_0100
     * @tc.desc   testKeepKeyboardOnFocusErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testKeepKeyboardOnFocusErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testKeepKeyboardOnFocusErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testKeepKeyboardOnFocusErrCode1300002_SubWindow_Promise')
        .then((data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
        })
        .catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      await (subWin! as ohosWindow.Window).destroyWindow();
      try {
        subWin!.keepKeyboardOnFocus(true);
        console.error(msgStr + 'Succeeded in calling keepKeyboardOnFocus.');
        expect().assertFail();
        done()
      } catch (e) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
        expect(e.code).assertEqual(1300002);
        expect(e.message!=null).assertTrue();
        done()
      }
    })
  })
}