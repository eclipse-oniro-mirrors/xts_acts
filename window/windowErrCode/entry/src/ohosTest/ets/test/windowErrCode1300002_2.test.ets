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
import { common, StartOptions, bundleManager } from '@kit.AbilityKit';
import Want from '@ohos.app.ability.Want';
let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartAbility'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStart') as ohosWindow.WindowStage;
  return windowStageStart
}
async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('pageContext') as common.UIAbilityContext
  try {
    if (pageContext !== null && pageContext !== undefined) {
      console.log(`${caseName} terminateSelf begin`);
    }
    await pageContext.terminateSelf().then(() => {
      console.log(`${caseName} terminateSelf success`);
    }).catch((err: BusinessError) => {
      console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
    });
  } catch (e) {
    console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
  }
  await sleep(1000)
}
export default function windowErrCode1300002_2() {
  describe('windowErrCode1300002_2', () => {
    console.log('describe windowErrCode1300002_2 start!!!')
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
    })
    /**
     * @tc.number     : testRecoverPromiseErrCode1300002_0100
     * @tc.name       : testRecoverPromiseErrCode1300002_0100
     * @tc.desc       : testRecoverPromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testRecoverPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testRecoverPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testRecoverPromiseErrCode1300002_SubWindow_Promise')
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
        await (subWin! as ohosWindow.Window).recover().then(async () => {
          console.info(msgStr + 'Succeeded in calling recover.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call recover. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call recover. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testRestorePromiseErrCode1300002_0100
     * @tc.name       : testRestorePromiseErrCode1300002_0100
     * @tc.desc       : testRestorePromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testRestorePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testRestorePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testRestorePromiseErrCode1300002_SubWindow_Promise')
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
        await (subWin! as ohosWindow.Window).restore().then(async () => {
          console.info(msgStr + 'Succeeded in calling restore.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call restore. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call restore. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowDecorVisibleErrCode1300002_0100
     * @tc.name       : testSetWindowDecorVisibleErrCode1300002_0100
     * @tc.desc       : testSetWindowDecorVisibleErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowDecorVisibleErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowDecorVisibleErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowDecorVisibleErrCode1300002_SubWindow_Promise')
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
        subWin!.setWindowDecorVisible(true);
        console.error(msgStr + 'Succeeded in calling setWindowDecorVisible.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setWindowDecorVisible. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowTitleMoveEnabledErrCode1300002_0100
     * @tc.name       : testSetWindowTitleMoveEnabledErrCode1300002_0100
     * @tc.desc       : testSetWindowTitleMoveEnabledErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowTitleMoveEnabledErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitleMoveEnabledErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowTitleMoveEnabledErrCode1300002_SubWindow_Promise')
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
        subWin!.setWindowTitleMoveEnabled(true);
        console.error(msgStr + 'Succeeded in calling setWindowTitleMoveEnabled.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setWindowTitleMoveEnabled. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowTitlePromiseErrCode1300002_0100
     * @tc.name       : testSetWindowTitlePromiseErrCode1300002_0100
     * @tc.desc       : testSetWindowTitlePromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowTitlePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitlePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowTitlePromiseErrCode1300002_SubWindow_Promise')
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
        await (subWin! as ohosWindow.Window).setWindowTitle("titleName").then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowTitle.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowTitle. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowTitle. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowDecorHeightErrCode1300002_0100
     * @tc.name       : testSetWindowDecorHeightErrCode1300002_0100
     * @tc.desc       : testSetWindowDecorHeightErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowDecorHeightErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowDecorHeightErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowDecorHeightErrCode1300002_SubWindow_Promise')
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
        subWin!.setWindowDecorHeight(1);
        console.error(msgStr + 'Succeeded in calling setWindowDecorHeight.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setWindowDecorHeight. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testSetDecorButtonStyleErrCode1300002_0100
     * @tc.name       : testSetDecorButtonStyleErrCode1300002_0100
     * @tc.desc       : testSetDecorButtonStyleErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetDecorButtonStyleErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetDecorButtonStyleErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetDecorButtonStyleErrCode1300002_SubWindow_Promise')
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
        let param: ohosWindow.DecorButtonStyle = {
          buttonBackgroundSize: 1
        }
        subWin!.setDecorButtonStyle(param);
        console.error(msgStr + 'Succeeded in calling setDecorButtonStyle.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setDecorButtonStyle. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testGetDecorButtonStyleErrCode1300002_0100
     * @tc.name       : testGetDecorButtonStyleErrCode1300002_0100
     * @tc.desc       : testGetDecorButtonStyleErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetDecorButtonStyleErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetDecorButtonStyleErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testGetDecorButtonStyleErrCode1300002_SubWindow_Promise')
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
        subWin!.getDecorButtonStyle();
        console.error(msgStr + 'Succeeded in calling getDecorButtonStyle.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call getDecorButtonStyle. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testGetTitleButtonRectErrCode1300002_0100
     * @tc.name       : testGetTitleButtonRectErrCode1300002_0100
     * @tc.desc       : testGetTitleButtonRectErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetTitleButtonRectErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetTitleButtonRectErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testGetTitleButtonRectErrCode1300002_SubWindow_Promise')
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
        subWin!.getTitleButtonRect();
        console.error(msgStr + 'Succeeded in calling getTitleButtonRect.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call getTitleButtonRect. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowTitleButtonVisibleErrCode1300002_0100
     * @tc.name       : testSetWindowTitleButtonVisibleErrCode1300002_0100
     * @tc.desc       : testSetWindowTitleButtonVisibleErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowTitleButtonVisibleErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowTitleButtonVisibleErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowTitleButtonVisibleErrCode1300002_SubWindow_Promise')
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
        subWin!.setWindowTitleButtonVisible(true, true, true);
        console.error(msgStr + 'Succeeded in calling setWindowTitleButtonVisible.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setWindowTitleButtonVisible. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testEnableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.name       : testEnableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.desc       : testEnableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testEnableLandscapeMultiWindowPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testEnableLandscapeMultiWindowPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testEnableLandscapeMultiWindowPromiseErrCode1300002_SubWindow_Promise')
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
        await (subWin! as ohosWindow.Window).enableLandscapeMultiWindow().then(async () => {
          console.info(msgStr + 'Succeeded in calling enableLandscapeMultiWindow.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call enableLandscapeMultiWindow. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call enableLandscapeMultiWindow. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testStartMovingPromiseErrCode1300002_0100
     * @tc.name       : testStartMovingPromiseErrCode1300002_0100
     * @tc.desc       : testStartMovingPromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testStartMovingPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testStartMovingPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testStartMovingPromiseErrCode1300002_SubWindow_Promise')
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
        await (subWin! as ohosWindow.Window).startMoving().then(async () => {
          console.info(msgStr + 'Succeeded in calling startMoving.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call startMoving. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call startMoving. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testDisableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.name       : testDisableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.desc       : testDisableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testDisableLandscapeMultiWindowPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testDisableLandscapeMultiWindowPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testDisableLandscapeMultiWindowPromiseErrCode1300002_SubWindow_Promise')
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
        await (subWin! as ohosWindow.Window).disableLandscapeMultiWindow().then(async () => {
          console.info(msgStr + 'Succeeded in calling disableLandscapeMultiWindow.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call disableLandscapeMultiWindow. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call disableLandscapeMultiWindow. Cause:' +
        JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testOnWindowTitleButtonRectChangeErrCode1300002_0100
     * @tc.name       : testOnWindowTitleButtonRectChangeErrCode1300002_0100
     * @tc.desc       : testOnWindowTitleButtonRectChangeErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnWindowTitleButtonRectChangeErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowTitleButtonRectChangeErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testOnWindowTitleButtonRectChangeErrCode1300002_SubWindow_Promise')
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
        subWin!.on("windowTitleButtonRectChange", (res: ohosWindow.TitleButtonRect) => {
        });
        console.error(msgStr + 'Succeeded in calling on windowTitleButtonRectChange.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call on windowTitleButtonRectChange. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowGrayScalePromiseErrCode1300002_0100
     * @tc.name       : testSetWindowGrayScalePromiseErrCode1300002_0100
     * @tc.desc       : testSetWindowGrayScalePromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowGrayScalePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowGrayScalePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetWindowGrayScalePromiseErrCode1300002_SubWindow_Promise')
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
        await (subWin! as ohosWindow.Window).setWindowGrayScale(1).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowGrayScale.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowGrayScale. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowGrayScale. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testSetImmersiveModeEnabledStateErrCode1300002_0100
     * @tc.name       : testSetImmersiveModeEnabledStateErrCode1300002_0100
     * @tc.desc       : testSetImmersiveModeEnabledStateErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetImmersiveModeEnabledStateErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetImmersiveModeEnabledStateErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetImmersiveModeEnabledStateErrCode1300002_SubWindow_Promise')
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
        subWin!.setImmersiveModeEnabledState(true);
        console.error(msgStr + 'Succeeded in calling setImmersiveModeEnabledState.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call setImmersiveModeEnabledState. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testGetImmersiveModeEnabledStateErrCode1300002_0100
     * @tc.name       : testGetImmersiveModeEnabledStateErrCode1300002_0100
     * @tc.desc       : testGetImmersiveModeEnabledStateErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testGetImmersiveModeEnabledStateErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testGetImmersiveModeEnabledStateErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testGetImmersiveModeEnabledStateErrCode1300002_SubWindow_Promise')
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
        subWin!.getImmersiveModeEnabledState();
        console.error(msgStr + 'Succeeded in calling getImmersiveModeEnabledState.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call getImmersiveModeEnabledState. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testCreateSubWindowWithOptionsPromiseErrCode1300002_0100
     * @tc.name       : testCreateSubWindowWithOptionsPromiseErrCode1300002_0100
     * @tc.desc       : testCreateSubWindowWithOptionsPromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testCreateSubWindowWithOptionsPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testCreateSubWindowWithOptionsPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testCreateSubWindowWithOptionsPromiseErrCode1300002_SubWindow_Promise')
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
        let param: ohosWindow.SubWindowOptions = {
          title: "aa", decorEnabled: true
        }
        await (subWin! as ohosWindow.Window).createSubWindowWithOptions("name", param).then(async () => {
          console.info(msgStr + 'Succeeded in calling createSubWindowWithOptions.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call createSubWindowWithOptions. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call createSubWindowWithOptions. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testSetTitleAndDockHoverShownPromiseErrCode1300002_0100
     * @tc.name       : testSetTitleAndDockHoverShownPromiseErrCode1300002_0100
     * @tc.desc       : testSetTitleAndDockHoverShownPromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetTitleAndDockHoverShownPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetTitleAndDockHoverShownPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWin: ohosWindow.Window | undefined = undefined;
      await windowStage.createSubWindow('testSetTitleAndDockHoverShownPromiseErrCode1300002_SubWindow_Promise')
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
        await (subWin! as ohosWindow.Window).setTitleAndDockHoverShown(true, true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setTitleAndDockHoverShown.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setTitleAndDockHoverShown. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setTitleAndDockHoverShown. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testLoadContentByNameCallbackErrCode1300002_0100
     * @tc.name       : testLoadContentByNameCallbackErrCode1300002_0100
     * @tc.desc       : testLoadContentByNameCallbackErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testLoadContentByNameCallbackErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNameCallbackErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        let storage: LocalStorage = new LocalStorage();
        windowStageStart!.loadContentByName("entryAbility", storage, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call loadContentByName. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
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
     * @tc.number     : testLoadContentByNameCallbackErrCode1300002_0200
     * @tc.name       : testLoadContentByNameCallbackErrCode1300002_0200
     * @tc.desc       : testLoadContentByNameCallbackErrCode1300002_0200
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testLoadContentByNameCallbackErrCode1300002_0200', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNameCallbackErrCode1300002_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        windowStageStart!.loadContentByName("entryAbility", async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to call loadContentByName. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
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
     * @tc.number     : testLoadContentByNamePromiseErrCode1300002_0100
     * @tc.name       : testLoadContentByNamePromiseErrCode1300002_0100
     * @tc.desc       : testLoadContentByNamePromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testLoadContentByNamePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testLoadContentByNamePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        let storage: LocalStorage = new LocalStorage();
        await windowStageStart.loadContentByName("entryability", storage).then(async () => {
          console.info(msgStr + 'Succeeded in calling loadContentByName.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call loadContentByName. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call loadContentByName. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number     : testOn_windowStageEventErrCode1300002_0100
     * @tc.name       : testOn_windowStageEventErrCode1300002_0100
     * @tc.desc       : testOn_windowStageEventErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnWindowStageEventErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowStageEventErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        const callback = (res: ohosWindow.WindowStageEventType) => {
        };
        windowStageStart.on("windowStageEvent", callback);
        console.error(msgStr + 'Succeeded in calling on windowStageEvent.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call on windowStageEvent. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testOff_windowStageEventErrCode1300002_0100
     * @tc.name       : testOff_windowStageEventErrCode1300002_0100
     * @tc.desc       : testOff_windowStageEventErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOffWindowStageEventErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffWindowStageEventErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        const callback = (res: ohosWindow.WindowStageEventType) => {
        };
        windowStageStart.off("windowStageEvent", callback);
        console.error(msgStr + 'Succeeded in calling off windowStageEvent.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call off windowStageEvent. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testOn_windowStageCloseErrCode1300002_0100
     * @tc.name       : testOn_windowStageCloseErrCode1300002_0100
     * @tc.desc       : testOn_windowStageCloseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOnWindowStageCloseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnWindowStageCloseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        const callback = () => {
        };
        windowStageStart.on("windowStageClose", callback);
        console.error(msgStr + 'Succeeded in calling on windowStageClose.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call on windowStageClose. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testOff_windowStageCloseErrCode1300002_0100
     * @tc.name       : testOff_windowStageCloseErrCode1300002_0100
     * @tc.desc       : testOff_windowStageCloseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testOff_windowStageCloseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testOff_windowStageCloseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        const callback = () => {
        };
        windowStageStart.off("windowStageClose", callback);
        console.error(msgStr + 'Succeeded in calling off windowStageClose.');
        expect().assertFail();
        done()
      } catch (e) {
        console.log(msgStr + 'Failed to call off windowStageClose. Cause:' + JSON.stringify(e));
        expect(e.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testRemoveStartingWindowPromiseErrCode1300002_0100
     * @tc.name       : testRemoveStartingWindowPromiseErrCode1300002_0100
     * @tc.desc       : testRemoveStartingWindowPromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testRemoveStartingWindowPromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testRemoveStartingWindowPromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        await windowStageStart.removeStartingWindow().then(async () => {
          console.info(msgStr + 'Succeeded in calling removeStartingWindow.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call removeStartingWindow. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call removeStartingWindow. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testSetWindowRectAutoSavePromiseErrCode1300002_0100
     * @tc.name       : testSetWindowRectAutoSavePromiseErrCode1300002_0100
     * @tc.desc       : testSetWindowRectAutoSavePromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSetWindowRectAutoSavePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowRectAutoSavePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        await windowStageStart.setWindowRectAutoSave(true).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowRectAutoSave.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowRectAutoSave. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number     : testIsWindowRectAutoSavePromiseErrCode1300002_0100
     * @tc.name       : testIsWindowRectAutoSavePromiseErrCode1300002_0100
     * @tc.desc       : testIsWindowRectAutoSavePromiseErrCode1300002_0100
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testIsWindowRectAutoSavePromiseErrCode1300002_0100', Level.LEVEL3, async (done: Function) => {
      let caseName = "testIsWindowRectAutoSavePromiseErrCode1300002_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context);
      await terminateAbility(caseName);
      try {
        await windowStageStart.isWindowRectAutoSave().then(async () => {
          console.info(msgStr + 'Succeeded in calling isWindowRectAutoSave.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call isWindowRectAutoSave. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call isWindowRectAutoSave. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
  })
}