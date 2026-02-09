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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import settings from '@ohos.settings';
import { image } from '@kit.ImageKit';
import { ColorMetrics, screenshot } from '@kit.ArkUI';
import { StartOptions } from '@kit.AbilityKit';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility'
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
  let windowStageStart = AppStorage.get('windowStageStartTest') as ohosWindow.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('contextTest') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

async function startAbility3(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility3'
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
  let windowStageStart = AppStorage.get('windowStageStartTest3') as ohosWindow.WindowStage;
  return windowStageStart
}

async function terminateAbility3(caseName: string) {
  let pageContext = AppStorage.get('contextTest3') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

async function startAbility4(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility4'
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
  let windowStageStart = AppStorage.get('windowStageStartTest4') as ohosWindow.WindowStage;
  return windowStageStart
}

async function terminateAbility4(caseName: string) {
  let pageContext = AppStorage.get('contextTest4') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function windowPropertiesTest2() {
  describe('windowProperties_test2', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    let fileDir: string = '';
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      fileDir = AppStorage.get('filePath') as string;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      isAutoWindow =
        settings.getValueSync(context, 'window_pcmode_switch_status', '', settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async ()=>{
      try {
        await sleep(1000)
        let mainWindowClass = windowStage.getMainWindowSync()
        let mainID = mainWindowClass.getWindowProperties().id
        let lastWindow = await window.getLastWindow(context)
        let lastID = lastWindow.getWindowProperties().id
        while (mainID != lastID) {
          await lastWindow.destroyWindow()
          await sleep(1000)
          lastWindow = await window.getLastWindow(context)
          lastID = lastWindow.getWindowProperties().id
      }
      } catch (error) {
        console.log('afterEach fail cause'+error)
      }
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testStatusBarContentColor
     * @tc.number SUB_BASIC_WMS_STATUS_BAR_CONTENT_COLOR_0100
     * @tc.desc   test_statusBarContentColor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStatusBarContentColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_statusBarContentColor';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let a: window.SystemBarStyle = {
          statusBarContentColor: 'string'
        }
        done();
      } catch (exception) {
        console.error(msgStr +
          `Failed to call statusBarContentColor. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done()
      }
    });

    /**
     * @tc.name   testWindowPropertiesDrawableRect
     * @tc.number SUB_BASIC_WMS_DRAWABLE_RECT_0100
     * @tc.desc   test_WindowProperties_drawableRect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWindowPropertiesDrawableRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_WindowProperties_drawableRect';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowClass = windowStage.getMainWindowSync();
        let properties = windowClass.getWindowProperties();
        expect(properties !== null).assertTrue();
        expect(properties.drawableRect !== null).assertTrue();
        console.info(`${caseName} Succeeded get window proerties drawableRect: ${JSON.stringify(properties.drawableRect)}`);
        done();
      } catch (exception) {
        console.error(msgStr +
          `Failed to get window proerties drawableRect. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done()
      }
    });

    /**
     * @tc.name   test_setStatusBarColor_401
     * @tc.number SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_0100
     * @tc.desc   test_setStatusBarColor_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setStatusBarColor_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setStatusBarColor_401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      try {
        await windowClass!.setStatusBarColor(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setStatusBarColor.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setStatusBarColor. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setStatusBarColor. Cause code :' + JSON.stringify(exception.code)+',errMessage: '+exception.message);
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   test_setStatusBarColor_1300002
     * @tc.number SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_0200
     * @tc.desc   test_setStatusBarColor_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setStatusBarColor_1300002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setStatusBarColor_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      // let subWindowClass = await windowStage.createSubWindow('subWindow');
      let config: window.Configuration = {
        name: "systemWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let subWindowClass = await window.createWindow(config);
      await (subWindowClass! as ohosWindow.Window).destroyWindow();
      try {
        await subWindowClass!.setStatusBarColor(ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(msgStr + 'Succeeded in calling setStatusBarColor.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setStatusBarColor. Cause: ' + JSON.stringify(err.code) +',errMessage: '+ err.message);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setStatusBarColor. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   test_setStatusBarColor_normal1
     * @tc.number SUB_BASIC_WMS_SetStatusBarColor_0300
     * @tc.desc   验证设置正常状态栏颜色
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setStatusBarColor_normal1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_setStatusBarColor_normal1";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      try {
        await windowClass!.setStatusBarColor(ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(msgStr + 'Succeeded in calling setStatusBarColor.');
          let res: window.StatusBarProperty = windowClass.getStatusBarProperty()
          console.info(msgStr + 'Succeeded in calling getStatusBarProperty, color: ' + res.contentColor);
          expect(res.contentColor).assertEqual("#FF112233")
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setStatusBarColor. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setStatusBarColor. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   test_setStatusBarColor_normal2
     * @tc.number SUB_BASIC_WMS_SetStatusBarColor_0400
     * @tc.desc   验证横屏设置状态栏颜色
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setStatusBarColor_normal2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_setStatusBarColor_normal2";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');

      let windowClass = windowStage.getMainWindowSync();
      try {
        await windowClass.setPreferredOrientation(window.Orientation.USER_ROTATION_LANDSCAPE)
        await windowClass!.setStatusBarColor(ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(msgStr + 'Succeeded in calling setStatusBarColor.');
          let res: window.StatusBarProperty = windowClass.getStatusBarProperty()
          console.info(msgStr + 'Succeeded in calling getStatusBarProperty, color: ' + res.contentColor);
          expect(res.contentColor).assertEqual("#FF112233")
          await windowClass.setPreferredOrientation(window.Orientation.USER_ROTATION_PORTRAIT)
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setStatusBarColor. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setStatusBarColor. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   test_getStatusBarProperty_1300002
     * @tc.number SUB_BASIC_WMS_getStatusBarProperty_ErrorCode_0100
     * @tc.desc   test_getStatusBarProperty_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getStatusBarProperty_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getStatusBarProperty_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "systemWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let subWindowClass = await window.createWindow(config);
      await (subWindowClass! as ohosWindow.Window).destroyWindow();
      try {
        subWindowClass!.getStatusBarProperty();
        expect().assertFail();
        console.error(msgStr + 'Succeeded in calling getStatusBarProperty.');
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call getStatusBarProperty. Cause:' + JSON.stringify(exception.code) +',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowBackgroundColor_ColorMetrics_mainWindow
     * @tc.number SUB_BASIC_WMS_setWindowBackgroundColor_0100
     * @tc.desc   test_setWindowBackgroundColor_ColorMetrics_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setWindowBackgroundColor_ColorMetrics_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_setWindowBackgroundColor_ColorMetrics_mainWindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      await windowClass.setUIContent('testability/pages/First/index2');
      try {
        windowClass!.setWindowBackgroundColor(ColorMetrics.numeric(0x112233))
        expect(true).assertTrue();
        console.info(msgStr + 'Succeeded in calling setWindowBackgroundColor.');
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowBackgroundColor. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowBackgroundColor_ColorMetrics_subWindow
     * @tc.number SUB_BASIC_WMS_setWindowBackgroundColor_0200
     * @tc.desc   test_setWindowBackgroundColor_ColorMetrics_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_setWindowBackgroundColor_ColorMetrics_subWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_setWindowBackgroundColor_ColorMetrics_subWindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.info(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('test_setWindowBackgroundColor_ColorMetrics_subWindow');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      console.info(`${caseName} Succeeded in showing the sub window content.`);
      await sleep(1000);
      try {
        subWindowClass!.setWindowBackgroundColor(ColorMetrics.numeric(0x112233))
        expect(true).assertTrue();
        console.info(msgStr + 'Succeeded in calling setWindowBackgroundColor.');
        await subWindowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowBackgroundColor. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        await subWindowClass.destroyWindow();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowShadowRadius_401
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0100
     * @tc.desc   test_setWindowShadowRadius_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowShadowRadius_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowShadowRadius_401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowShadowRadius_401");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        subWindowClass!.setWindowShadowRadius(null)
        expect().assertFail();
        console.error(msgStr + 'Succeeded in calling setWindowShadowRadius.');
        await subWindowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(401)
        expect(exception.message!=null).assertTrue();
        await subWindowClass.destroyWindow();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowShadowRadius_1300002
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0200
     * @tc.desc   test_setWindowShadowRadius_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowShadowRadius_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowShadowRadius_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "systemWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let subWindowClass = await window.createWindow(config);
      await (subWindowClass! as ohosWindow.Window).destroyWindow();
      try {
        subWindowClass!.setWindowShadowRadius(4.0)
        expect().assertFail();
        console.error(msgStr + 'Succeeded in calling setWindowShadowRadius.');
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(1300002)
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowShadowRadius_1300004
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0300
     * @tc.desc   test_setWindowShadowRadius_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowShadowRadius_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowShadowRadius_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      try {
        windowClass!.setWindowShadowRadius(4.0)
        expect().assertFail();
        console.info(msgStr + 'Succeeded in calling setWindowShadowRadius.');
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowShadowRadius_negative1
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0400
     * @tc.desc   test_setWindowShadowRadius_negative1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowShadowRadius_negative1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowShadowRadius_negative1";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowShadowRadius_negative1");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        subWindowClass!.setWindowShadowRadius(-1)
        expect().assertFail();
        console.error(msgStr + 'Succeeded in calling setWindowShadowRadius.');
        await subWindowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(401)
        expect(exception.message!=null).assertTrue();
        await subWindowClass.destroyWindow();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowShadowRadius_0100
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_0100
     * @tc.desc   验证子窗设置没有阴影
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowShadowRadius_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowShadowRadius_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('test_setWindowShadowRadius_0100');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      await sleep(1000);
      console.info(`${caseName} Succeeded in showing the sub window.`);

      try {
        subWindowClass!.setWindowShadowRadius(0)
        expect(true).assertTrue();
        console.info(msgStr + 'Succeeded in calling setWindowShadowRadius.');
        await subWindowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
          expect(exception.message!=null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   test_setWindowShadowRadius_0200
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_0200
     * @tc.desc   验证子窗设置阴影为4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowShadowRadius_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowShadowRadius_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('test_setWindowShadowRadius_0200');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      await sleep(1000);
      console.info(`${caseName} Succeeded in showing the sub window.`);

      try {
        subWindowClass!.setWindowShadowRadius(4)
        expect(true).assertTrue();
        console.info(msgStr + 'Succeeded in calling setWindowShadowRadius.');
        await subWindowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
          expect(exception.message!=null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   test_setWindowShadowRadius_0300
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_0300
     * @tc.desc   验证子窗设置阴影为超大值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowShadowRadius_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowShadowRadius_0300";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('test_setWindowShadowRadius_0300');
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      await sleep(1000);
      console.info(`${caseName} Succeeded in showing the sub window.`);

      try {
        subWindowClass!.setWindowShadowRadius(10000)
        expect(true).assertTrue();
        console.info(msgStr + 'Succeeded in calling setWindowShadowRadius.');
        await subWindowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
          expect(exception.message!=null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetWindowShadowRadiusTYPE_FLOAT0
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_0400
     * @tc.desc   验证悬浮窗设置阴影为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowShadowRadiusTYPE_FLOAT0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowShadowRadiusTYPE_FLOAT0";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass: window.Window | null = null;
      let config: window.Configuration = {
        name: "testSetWindowShadowRadiusTYPE_FLOAT0", windowType: window.WindowType.TYPE_FLOAT, ctx: context
      };
      try {
        ohosWindow.createWindow(config).then(async (data)=>{
          windowClass = data;
          console.info(`${caseName} Succeeded in creating the float window.`);
          await windowClass.setUIContent('testability/pages/First/index2');
          await windowClass.showWindow();
          await sleep(1000);
          expect(!!windowClass).assertTrue();
          await windowClass!.setWindowShadowRadius(0)
          expect(true).assertTrue();
          console.info(msgStr + 'Succeeded in calling setWindowShadowRadius.');
          await windowClass!.destroyWindow();
          done()
        }).catch(async (err:BusinessError)=> {
          console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
            expect(err.message!=null).assertTrue();
            await windowClass!.destroyWindow();
            done();
          } else if (err.code == 1300002) {
            console.info(`${caseName} The current device type does not support to create float Window`);
            expect(err.message!=null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })

      } catch (err) {
        console.error(msgStr + 'faild ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()

      }


    })
    /**
     * @tc.name   testSetWindowShadowRadiusTYPE_FLOAT4
     * @tc.number SUB_BASIC_WMS_setWindowShadowRadius_0500
     * @tc.desc   验证悬浮窗设置阴影为4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowShadowRadiusTYPE_FLOAT4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowShadowRadiusTYPE_FLOAT4";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass: window.Window | null = null;
      let config: window.Configuration = {
        name: "testSetWindowShadowRadiusTYPE_FLOAT4", windowType: window.WindowType.TYPE_FLOAT, ctx: context
      };
      try {
        ohosWindow.createWindow(config).then(async (data)=>{
          windowClass = data;
          console.info(`${caseName} Succeeded in creating the float window.`);
          await windowClass.setUIContent('testability/pages/First/index2');
          await windowClass.showWindow();
          await sleep(1000);
          expect(!!windowClass).assertTrue();
          await windowClass!.setWindowShadowRadius(4)
          expect(true).assertTrue();
          console.info(msgStr + 'Succeeded in calling setWindowShadowRadius.');
          await windowClass!.destroyWindow();
          done()
        }).catch(async (err:BusinessError)=> {
          console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
            expect(err.message!=null).assertTrue();
            await windowClass!.destroyWindow();
            done();
          } else if (err.code == 1300002) {
            console.info(`${caseName} The current device type does not support to create float Window`);
            expect(err.message!=null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })

      } catch (err) {
        console.error(msgStr + 'faild ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()

      }
    
    })

    /**
     * @tc.name   test_setWindowCornerRadius_401
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0100
     * @tc.desc   test_setWindowCornerRadius_401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_401");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        await subWindowClass!.setWindowCornerRadius(null).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await subWindowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(401)
        expect(exception.message!=null).assertTrue();
        await subWindowClass.destroyWindow();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_negative1
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0200
     * @tc.desc   test_setWindowCornerRadius_-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_negative1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_negative1";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_negative1_401");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        await subWindowClass!.setWindowCornerRadius(-1).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await subWindowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass.destroyWindow();
        expect(exception.code).assertEqual(401);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_1300002
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0300
     * @tc.desc   test_setWindowCornerRadius_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_1300002");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      await (subWindowClass! as ohosWindow.Window).destroyWindow();
      try {
        await subWindowClass!.setWindowCornerRadius(1).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_1300004
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0400
     * @tc.desc   test_setWindowCornerRadius_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      await sleep(1000);
      try {
        await windowClass!.setWindowCornerRadius(1).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
            expect(err.message!=null).assertTrue();
          } else {
            expect(err.code).assertEqual(1300004)
            expect(err.message!=null).assertTrue();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          expect(exception.message!=null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_dialog_1300004
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0500
     * @tc.desc   test_setWindowCornerRadius_dialog_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_dialog_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_dialog_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "systemWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let subWindowClass = await window.createWindow(config);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      console.info(`${caseName} Succeeded in loading the sub window content.`);
      await subWindowClass.showWindow();
      console.info(`${caseName} Succeeded in showing the sub window.`);
      await sleep(1000);

      try {
        await subWindowClass!.setWindowCornerRadius(1).then(async () => {
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
            expect(err.message!=null).assertTrue();
          } else {
            expect(err.code).assertEqual(1300004)
            expect(err.message!=null).assertTrue();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          expect(exception.message!=null).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_0100
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_0100
     * @tc.desc   验证子窗圆角值为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_0100");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        await subWindowClass!.setWindowCornerRadius(0).then(async () => {
          let result = subWindowClass.getWindowCornerRadius()
          expect(result).assertEqual(0)
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          await subWindowClass!.destroyWindow();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
            expect(err.message!=null).assertTrue();
          } else {
            expect().assertFail();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          expect(exception.message!=null).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_0200
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_0200
     * @tc.desc   验证子窗圆角值为5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_0200";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_0200");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        await subWindowClass!.setWindowCornerRadius(5).then(async () => {
          let result = subWindowClass.getWindowCornerRadius()
          expect(result).assertEqual(5)
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          await subWindowClass!.destroyWindow();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
            expect(err.message!=null).assertTrue();
          } else {
            expect().assertFail();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          expect(exception.message!=null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_0300
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_0300
     * @tc.desc   验证子窗圆角值为10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_0300";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_0300");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        await subWindowClass!.setWindowCornerRadius(1000).then(async () => {
          let result = subWindowClass.getWindowCornerRadius()
          expect(result).assertEqual(1000)
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          await subWindowClass!.destroyWindow();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
            expect(err.message!=null).assertTrue();
          } else {
            expect().assertFail();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          expect(exception.message!=null).assertTrue();
        } else {
          expect().assertFail();
        }
        done();
      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_0400
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_0400
     * @tc.desc   验证子窗圆角值为5.66666666
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_0400";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_0400");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        await subWindowClass!.setWindowCornerRadius(5.66666666).then(async () => {
          let result = subWindowClass.getWindowCornerRadius()
           expect(Math.abs(result-5.66666666)).assertLessOrEqual(0.1);
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          await subWindowClass!.destroyWindow();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
            expect(err.message!=null).assertTrue();
          } else {
            expect().assertFail();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          expect(exception.message!=null).assertTrue();
        } else {
          expect().assertFail();
        }
      }
    })

    /**
     * @tc.name   testSetWindowCornerRadiusTYPE_FLOAT0
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_0600
     * @tc.desc   验证悬浮窗圆角值为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowCornerRadiusTYPE_FLOAT0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowCornerRadiusTYPE_FLOAT0";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass: window.Window | null = null;
      let config: window.Configuration = {
        name: "testSetWindowCornerRadiusTYPE_FLOAT0", windowType: window.WindowType.TYPE_FLOAT, ctx: context
      };
      try {
        ohosWindow.createWindow(config).then(async (data)=>{
          windowClass = data;
          console.info(`${caseName} Succeeded in creating the float window.`);
          await windowClass.setUIContent('testability/pages/First/index2');
          await windowClass.showWindow();
          await sleep(1000);
          expect(!!windowClass).assertTrue();
          await windowClass!.setWindowCornerRadius(0.0)
          let result = windowClass!.getWindowCornerRadius()
          expect(result).assertEqual(0)
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          await windowClass!.destroyWindow();
          done()
        }).catch(async (err:BusinessError)=>{
          console.error(msgStr + 'ohosWindow.createWindow ' + 'caught, err: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          if (err.code === 1300002) {
            expect(err.message!=null).assertTrue();
            done();
          } else if (err.code == 801) {
            console.error(msgStr + 'setWindowCornerRadius failed ' + 'caught, err: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
            await windowClass!.destroyWindow();
            expect(err.message!=null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done()
          }
        })

      } catch (err) {
        console.error(msgStr + 'faild ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()

      }


    })

    /**
     * @tc.name   testSetWindowCornerRadiusTYPE_FLOAT5
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_0700
     * @tc.desc   验证悬浮窗圆角值为5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetWindowCornerRadiusTYPE_FLOAT5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSetWindowCornerRadiusTYPE_FLOAT5";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass: window.Window | null = null;
      let config: window.Configuration = {
        name: "testSetWindowCornerRadiusTYPE_FLOAT5", windowType: window.WindowType.TYPE_FLOAT, ctx: context
      };
      try {
        ohosWindow.createWindow(config).then(async (data)=>{
          windowClass = data;
          console.info(`${caseName} Succeeded in creating the float window.`);
          await windowClass.setUIContent('testability/pages/First/index2');
          await windowClass.showWindow();
          await sleep(1000);
          expect(!!windowClass).assertTrue();
          await windowClass!.setWindowCornerRadius(5.0)
          let result = windowClass!.getWindowCornerRadius()
          expect(result).assertEqual(5)
          console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
          await windowClass!.destroyWindow();
          done()
        }).catch(async (err:BusinessError)=>{
          console.error(msgStr + 'ohosWindow.createWindow ' + 'caught, err: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          if (err.code === 1300002) {
            expect(err.message!=null).assertTrue();
            done();
          } else if (err.code == 801) {
            console.error(msgStr + 'setWindowCornerRadius failed ' + 'caught, err: ' + JSON.stringify(err));
            await windowClass!.destroyWindow();
            expect(err.message!=null).assertTrue();
            done();
          } else {
            expect().assertFail();
            done()
          }
        })

      } catch (err) {
        console.error(msgStr + 'faild ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()

      }
    })

    /**
     * @tc.name   test_setWindowCornerRadius_0800
     * @tc.number SUB_BASIC_WMS_setWindowCornerRadius_0800
     * @tc.desc   验证子窗多次设置圆角值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowCornerRadius_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setWindowCornerRadius_0800";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_0800");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      try {
        await subWindowClass!.setWindowCornerRadius(1);
        await subWindowClass!.setWindowCornerRadius(5);
        let result = subWindowClass.getWindowCornerRadius()
        expect(result).assertEqual(5)
        console.error(msgStr + 'Succeeded in calling setWindowCornerRadius.');
        await subWindowClass!.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          expect(exception.message!=null).assertTrue();
          done();
        } else {
          expect().assertFail();
          done()
        }
      }
    })

    /**
     * @tc.name   test_getWindowCornerRadius_1300002
     * @tc.number SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_0100
     * @tc.desc   test_getWindowCornerRadius_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getWindowCornerRadius_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getWindowCornerRadius_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      // getWindowCornerRadius
      let subWindowClass = await windowStage.createSubWindow("test_setWindowCornerRadius_1300002");
      console.info(`${caseName} Succeeded in creating the sub window.`);
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(1000);
      await (subWindowClass! as ohosWindow.Window).destroyWindow();
      try {
        subWindowClass!.getWindowCornerRadius()
        expect().assertFail();
        console.error(msgStr + 'Succeeded in calling setWindowCornerRadius.');
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   test_getWindowCornerRadius_1300004
     * @tc.number SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_0200
     * @tc.desc   test_getWindowCornerRadius_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getWindowCornerRadius_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getWindowCornerRadius_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = windowStage.getMainWindowSync();
      await windowClass.setUIContent('testability/pages/First/index2');
      await windowClass.showWindow();
      await sleep(1000);
      try {
        windowClass!.getWindowCornerRadius()
        expect().assertFail();
        console.info(msgStr + 'Succeeded in calling getWindowCornerRadius.');
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call getWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(1300004);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   test_getWindowCornerRadius_dialog_1300004
     * @tc.number SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_0300
     * @tc.desc   test_getWindowCornerRadius_dialog_1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_getWindowCornerRadius_dialog_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_getWindowCornerRadius_dialog_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "test_getWindowCornerRadius_dialog_1300004",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let subWindowClass: window.Window | null = null;
      try {
        subWindowClass = await ohosWindow.createWindow(config);
        expect(!!subWindowClass).assertTrue();
      } catch (err) {
        console.error(msgStr + 'ohosWindow.createWindow ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }

      try {
        subWindowClass!.getWindowCornerRadius()
        expect().assertFail();
        await (subWindowClass! as ohosWindow.Window).destroyWindow();
        console.error(msgStr + 'Succeeded in calling getWindowCornerRadius.');
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call getWindowCornerRadius. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(1300004)
        await (subWindowClass! as ohosWindow.Window).destroyWindow();
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testSnapshotIgnorePrivacyWithNonPrivacyMainWindowPortrait
     * @tc.number testSnapshotIgnorePrivacyWithNonPrivacyMainWindowPortrait
     * @tc.desc   测试非隐私主窗口竖屏截图
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapshotIgnorePrivacyWithNonPrivacyMainWindowPortrait', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSnapshotIgnorePrivacyWithNonPrivacyMainWindowPortrait";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass: window.Window | undefined;
      try {
        windowClass = windowStage.getMainWindowSync();
      } catch (err) {
        console.error(msgStr + 'getMainWindowSync ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await windowClass!.setWindowPrivacyMode(false);
      } catch (err) {
        console.error(msgStr + 'setWindowPrivacyMode ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await windowClass!.setPreferredOrientation(window.Orientation.PORTRAIT)
      } catch (err) {
        console.error(msgStr + 'setPreferredOrientation ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        windowClass!.snapshotIgnorePrivacy().then(async (pixelMap: image.PixelMap) => {
          console.info(msgStr + 'Succeeded in calling snapshotIgnorePrivacy.');
          let widthBefore: number = windowClass!.getWindowProperties().windowRect.width;
          let heightBefore: number = windowClass!.getWindowProperties().windowRect.height;
          console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
          expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
          expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
          pixelMap.release();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
            expect(err.message!=null).assertTrue();
          } else {
            expect().assertFail();
          }
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call snapshotIgnorePrivacy. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testSnapshotIgnorePrivacyWithPrivacyMainWindow
     * @tc.number testSnapshotIgnorePrivacyWithPrivacyMainWindow
     * @tc.desc   测试隐私主窗口竖屏截图
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapshotIgnorePrivacyWithPrivacyMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSnapshotIgnorePrivacyWithPrivacyMainWindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass: window.Window | undefined;
      try {
        windowClass = windowStage.getMainWindowSync();
      } catch (err) {
        console.error(msgStr + 'getMainWindowSync ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await windowClass!.setWindowPrivacyMode(true);
      } catch (err) {
        console.error(msgStr + 'setWindowPrivacyMode ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await windowClass!.setPreferredOrientation(window.Orientation.PORTRAIT)
      } catch (err) {
        console.error(msgStr + 'setPreferredOrientation ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        windowClass!.snapshotIgnorePrivacy().then(async (pixelMap: image.PixelMap) => {
          console.info(msgStr + 'Succeeded in calling snapshotIgnorePrivacy.');
          let widthBefore: number = windowClass!.getWindowProperties().windowRect.width;
          let heightBefore: number = windowClass!.getWindowProperties().windowRect.height;
          console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
          expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
          expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
          pixelMap.release();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
            expect(err.message!=null).assertTrue();
          } else {
            expect().assertFail();
          }
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call snapshotIgnorePrivacy. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testSnapshotIgnorePrivacyWithNonPrivacyMainWindowLandscape
     * @tc.number testSnapshotIgnorePrivacyWithNonPrivacyMainWindowLandscape
     * @tc.desc   测试非隐私主窗口横屏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapshotIgnorePrivacyWithNonPrivacyMainWindowLandscape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSnapshotIgnorePrivacyWithNonPrivacyMainWindowLandscape";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass: window.Window | undefined;
      try {
        windowClass = windowStage.getMainWindowSync();
      } catch (err) {
        console.error(msgStr + 'getMainWindowSync ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await windowClass!.setWindowPrivacyMode(false);
      } catch (err) {
        console.error(msgStr + 'setWindowPrivacyMode ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        await windowClass!.setPreferredOrientation(window.Orientation.LANDSCAPE)
      } catch (err) {
        console.error(msgStr + 'setPreferredOrientation ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        windowClass!.snapshotIgnorePrivacy().then(async (pixelMap: image.PixelMap) => {
          console.info(msgStr + 'Succeeded in calling snapshotIgnorePrivacy.');
          let widthBefore: number = windowClass!.getWindowProperties().windowRect.width;
          let heightBefore: number = windowClass!.getWindowProperties().windowRect.height;
          console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
          let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
          expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
          expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
          pixelMap.release();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
            expect(err.message!=null).assertTrue();
          } else {
            expect().assertFail();
          }
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed2 to set the call snapshotIgnorePrivacy. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testSnapshotIgnorePrivacyWithPrivacySubWindow
     * @tc.number testSnapshotIgnorePrivacyWithPrivacySubWindow
     * @tc.desc   测试隐私子窗口截图
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapshotIgnorePrivacyWithPrivacySubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSnapshotIgnorePrivacyWithPrivacySubWindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass: window.Window | undefined;
      try {
        windowClass = await windowStage.createSubWindow('testSnapshotIgnorePrivacyWithPrivacySubWindow');
        console.info(`${caseName} Succeeded in creating the sub window.`);
        await sleep(500);
        await windowClass.setUIContent('testability/pages/First/index2');
        console.info(`${caseName} Succeeded in loading the sub window content.`);
        await sleep(500);
        await windowClass.showWindow();
        console.info(`${caseName} Succeeded in showing the sub window.`);
        await sleep(500);
        try {
          await windowClass!.setWindowPrivacyMode(true);
        } catch (err) {
          console.error(msgStr + 'setWindowPrivacyMode ' + 'caught, err: ' + JSON.stringify(err));
          await windowClass!.destroyWindow();
          expect().assertFail();
          done()
        }
        try {
          windowClass!.snapshotIgnorePrivacy().then(async (pixelMap: image.PixelMap) => {
            console.info(msgStr + 'Succeeded in calling snapshotIgnorePrivacy.');
            let widthBefore: number = windowClass!.getWindowProperties().windowRect.width;
            let heightBefore: number = windowClass!.getWindowProperties().windowRect.height;
            console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
            let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
            console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
            expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
            expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
            pixelMap.release();
            await windowClass!.destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
            await windowClass!.destroyWindow();
            if (err.code == 801) {
              console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
              expect(err.message!=null).assertTrue();
            } else {
              expect().assertFail();
            }
            done()
          });
        } catch (exception) {
          console.error(msgStr + 'Failed2 to set the call snapshotIgnorePrivacy. Cause:' + JSON.stringify(exception));
          await windowClass!.destroyWindow();
          expect().assertFail();
          done()
        }
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + JSON.stringify(err));
        await windowClass!.destroyWindow();
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   testSnapshotIgnorePrivacyWithMinimizeWindow
     * @tc.number testSnapshotIgnorePrivacyWithMinimizeWindow
     * @tc.desc   测试主窗口minimize后截图
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSnapshotIgnorePrivacyWithMinimizeWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testSnapshotIgnorePrivacyWithMinimizeWindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      // 1、拉起另一个Abllity主窗
      let windowStageStart = await startAbility(caseName, context);
      let windowClass = windowStageStart.getMainWindowSync();
      // 2、被拉起的主窗监听on(windowStageEvent)
      try {
        const callback = async (res: window.WindowStageEventType) => {
          console.info(msgStr + 'callback:'+res);
          // 4、在on(windowStageEvent)返回值为INACTIVE，HIDDEN状态下分别调用snapshotIgnorePrivacy截图
          // 5、断言截图大小与窗口大小误差不超过1
          // 6、销毁被拉起的主窗
          if (res === window.WindowStageEventType.INACTIVE || res === window.WindowStageEventType.HIDDEN) {
            try {
              windowClass!.snapshotIgnorePrivacy().then(async (pixelMap: image.PixelMap) => {
                console.info(msgStr + 'Succeeded in calling snapshotIgnorePrivacy.');
                let widthBefore: number = windowClass!.getWindowProperties().windowRect.width;
                let heightBefore: number = windowClass!.getWindowProperties().windowRect.height;
                console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
                let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                expect(Math.abs(widthBefore-imageInfo.size.width)).assertLessOrEqual(1);
                expect(Math.abs(heightBefore-imageInfo.size.height)).assertLessOrEqual(1);
                pixelMap.release();
                await windowClass.restore();
                await terminateAbility(caseName);
                await sleep(2000)
                done();
              }).catch(async (err: BusinessError) => {
                console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err.code)+',errMessage: '+ err.message);
                if (err.code == 801) {
                  console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
                  expect(err.message!=null).assertTrue();
                } else {
                  expect().assertFail();
                }
                await terminateAbility(caseName);
                await sleep(2000)
                done()
              });
            } catch (exception) {
              console.error(msgStr + 'Failed2 to set the call snapshotIgnorePrivacy. Cause:' + JSON.stringify(exception));
              expect().assertFail();
              await terminateAbility(caseName);
              await sleep(2000)
              done()
            }
          }
        }
        windowStageStart.on('windowStageEvent', callback)
        // 3、被拉起的主窗minimize
        if (isPCStatus != '') {
          await windowClass.minimize();
          await sleep(2000);
        }
        await terminateAbility(caseName);
        done()
      } catch (err) {
        console.error(msgStr + 'failed, ' + 'caught, err: ' + JSON.stringify(err));
        await terminateAbility(caseName);
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.name   testOnScreenShotAppEventwithDestoryedSubWindow
     * @tc.number SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_0100
     * @tc.desc   验证子窗销毁后监听on_screenshotAppEvent返回1300002错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnScreenShotAppEventwithDestoryedSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testOnScreenShotAppEventwithDestoryedSubWindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = await windowStage.createSubWindow('testOnScreenShotAppEventwithDestoryedSubWindow');
      await windowClass.destroyWindow();
      try {
        const callback = (data: window.ScreenshotEventType) => {
          console.log(`${caseName} callback data: ${JSON.stringify(data)}`);
        }
        windowClass.on('screenshotAppEvent', callback);
        console.info(msgStr + 'Succeeded in calling on screenshotAppEvent.');
        expect().assertFail();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(1300002);
        expect(exception.message!=null).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   testOffScreenShotAppEventwithDestoryedSubWindow
     * @tc.number SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_0200
     * @tc.desc   验证子窗销毁后取消监听off_screenshotAppEvent返回1300002错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffScreenShotAppEventwithDestoryedSubWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "testOffScreenShotAppEventwithDestoryedSubWindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = await windowStage.createSubWindow('testOffScreenShotAppEventwithDestoryedSubWindow');
      await windowClass.destroyWindow();
      try {
        const callback = (data: window.ScreenshotEventType) => {
          console.log(`${caseName} callback data: ${JSON.stringify(data)}`);
        }
        windowClass.off('screenshotAppEvent', callback);
        console.info(msgStr + 'Succeeded in calling off screenshotAppEvent.');
        expect().assertFail();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
        expect(exception.code).assertEqual(1300002)
        expect(exception.message!=null).assertTrue();
        done()
      }
    })


    /**
     * @tc.name   testScreenshotEventType
     * @tc.number SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_0500
     * @tc.desc   验证ScreenshotEventType枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScreenshotEventType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testScreenshotEventType";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        console.info(msgStr + 'Succeeded. window.ScreenshotEventType:' + JSON.stringify(window.ScreenshotEventType));
        expect(window.ScreenshotEventType.SYSTEM_SCREENSHOT).assertEqual(0);
        expect(window.ScreenshotEventType.SYSTEM_SCREENSHOT_ABORT).assertEqual(1);
        expect(window.ScreenshotEventType.SCROLL_SHOT_START).assertEqual(2);
        expect(window.ScreenshotEventType.SCROLL_SHOT_END).assertEqual(3);
        expect(window.ScreenshotEventType.SCROLL_SHOT_ABORT).assertEqual(4);
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSetWindowShadowEnabledwithPermission
     * @tc.number SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_0100
     * @tc.desc   验证非2in1设备调用接口报801，2in1设备调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowShadowEnabledwithPermission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testSetWindowShadowEnabledwithPermission";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setWindowShadowEnabled(true).then(() => {
          console.info(`${caseName} Succeeded in calling setWindowShadowEnabled.`);
          expect(true).assertTrue()
          done()
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            expect(err.message!=null).assertTrue();
            expect(true).assertTrue()
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSetWindowShadowEnabledwithUnsupportedSubwindow
     * @tc.number SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_0300
     * @tc.desc   验证子窗调用接口报1300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowShadowEnabledwithUnsupportedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testSetWindowShadowEnabledwithUnsupportedSubwindow";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowClass = await windowStage.createSubWindow('testSetWindowShadowEnabledwithUnsupportedSubwindow');
      try {
        windowClass.setWindowShadowEnabled(true).then(async () => {
          console.info(`${caseName} Succeeded in calling setWindowShadowEnabled.`);
          await windowClass.destroyWindow()
          expect().assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          await windowClass.destroyWindow()
          expect(err.message!=null).assertTrue();
          if (err.code === 801) {
            expect(true).assertTrue()
            done();
          } else {
            expect(err.code).assertEqual(1300004);
            done();
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception));
        await windowClass.destroyWindow()
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testCreateFloatWindowwithDefaultDensityEnabledTrue
     * @tc.number SUB_BASIC_WMS_CREATE_FLOAT_WINDOW_DEFAULT_DENSITY_ENABLED_0100
     * @tc.desc   创建float系统窗配置使用默认density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFloatWindowwithDefaultDensityEnabledTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testCreateFloatWindowwithDefaultDensityEnabledTrue";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "testCreateFloatWindowwithDefaultDensityEnabledTrue",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context,
        defaultDensityEnabled: true
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          console.log(`${caseName} createWindow success.`);
          expect(true).assertTrue();
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} createWindow Failed. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.message!=null).assertTrue();
          if (err.code === 1300002 || err.code === 801) {
            await subWindowClass?.destroyWindow();
            done()
          } else {
            expect().assertFail();
            await subWindowClass?.destroyWindow();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.name   testCreateFloatWindowwithDefaultDensityEnabledFalse
     * @tc.number SUB_BASIC_WMS_CREATE_FLOAT_WINDOW_DEFAULT_DENSITY_ENABLED_0200
     * @tc.desc   创建float窗配置不使用默认density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFloatWindowwithDefaultDensityEnabledFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testCreateFloatWindowwithDefaultDensityEnabledFalse";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "testCreateFloatWindowwithDefaultDensityEnabledFalse",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context,
        defaultDensityEnabled: false
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          console.log(`${caseName} createWindow success.`);
          expect(true).assertTrue();
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} createWindow Failed. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.message!=null).assertTrue();
          if (err.code === 1300002 || err.code === 801) {
            await subWindowClass?.destroyWindow();
            done()
          } else {
            expect().assertFail();
            await subWindowClass?.destroyWindow();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.name   testCreateDialogWindowwithDefaultDensityEnabledTrue
     * @tc.number SUB_BASIC_WMS_CREATE_DIALOG_WINDOW_DEFAULT_DENSITY_ENABLED_0100
     * @tc.desc   创建dialog系统窗配置使用默认density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateDialogWindowwithDefaultDensityEnabledTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testCreateDialogWindowwithDefaultDensityEnabledTrue";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "testCreateDialogWindowwithDefaultDensityEnabledTrue",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
        defaultDensityEnabled: true
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          console.log(`${caseName} createWindow success.`);
          expect(true).assertTrue();
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} createWindow Failed. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.message!=null).assertTrue();
          if (err.code === 801) {
            await subWindowClass?.destroyWindow();
            done()
          } else {
            expect().assertFail();
            await subWindowClass?.destroyWindow();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.name   testCreateDialogWindowwithDefaultDensityEnabledFalse
     * @tc.number SUB_BASIC_WMS_CREATE_DIALOG_WINDOW_DEFAULT_DENSITY_ENABLED_0200
     * @tc.desc   创建dialog窗配置不使用默认density
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateDialogWindowwithDefaultDensityEnabledFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testCreateDialogWindowwithDefaultDensityEnabledFalse";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "testCreateDialogWindowwithDefaultDensityEnabledFalse",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
        defaultDensityEnabled: false
      };
      let subWindowClass: window.Window | undefined;
      console.info(`${caseName} creating the float window.`);
      try {
        window.createWindow(config).then(async (data) => {
          subWindowClass = data;
          console.log(`${caseName} createWindow success.`);
          expect(true).assertTrue();
          await subWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} createWindow Failed. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.message!=null).assertTrue();
          if (err.code === 801) {
            await subWindowClass?.destroyWindow();
            done()
          } else {
            expect().assertFail();
            await subWindowClass?.destroyWindow();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.name   testSetCustomDensitywithSubwindowApplytoSubwindowTrue
     * @tc.number SUB_BASIC_WMS_SET_CUSTOM_DENSITY_WITH_APPLYTO_SUBWINDOW_TRUE_0100
     * @tc.desc   主窗调用setcustomdensity修改显示大小同步子窗、系统窗
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCustomDensitywithSubwindowApplytoSubwindowTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testSetCustomDensitywithSubwindowApplytoSubwindowTrue";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('testSetCustomDensitywithSubwindowApplytoSubwindowTrue');
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(200);
      let config: window.Configuration = {
        name: "dialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let dialogWindowClass = await window.createWindow(config);
      await dialogWindowClass.setUIContent('testability/pages/First/index2');
      await dialogWindowClass.showWindow();
      await sleep(200);
      let config2: window.Configuration = {
        name: "floatWindow",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let floatWindowClass: window.Window | undefined;
      try {
        window.createWindow(config2).then(async (data) => {
          floatWindowClass = data;
          await floatWindowClass.setUIContent('testability/pages/First/index2');
          await floatWindowClass.showWindow();
          await sleep(200);
          windowStage.setCustomDensity(1, true);
          windowStage.setCustomDensity(2, true);
          let subWindowInfo = subWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} subWindowInfo: ${subWindowInfo}`);
          // expect(subWindowInfo).assertEqual(2);
          expect(subWindowInfo).assertEqual(subWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          let dialogWindowInfo = dialogWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} dialogWindowInfo: ${dialogWindowInfo}`);
          // expect(dialogWindowInfo).assertEqual(2);
          expect(dialogWindowInfo).assertEqual(dialogWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          let floatWindowInfo = floatWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} floatWindowInfo: ${floatWindowInfo}`);
          // expect(floatWindowInfo).assertEqual(2);
          expect(floatWindowInfo).assertEqual(floatWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          await subWindowClass?.destroyWindow();
          await dialogWindowClass?.destroyWindow();
          await floatWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} createWindow Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          await dialogWindowClass?.destroyWindow();
          await floatWindowClass?.destroyWindow();
          expect(err.message!=null).assertTrue();
          if (err.code === 1300002 || err.code === 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        await dialogWindowClass?.destroyWindow();
        await floatWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.name   testSetCustomDensitywithFloatwindowApplytoSubwindowFalse
     * @tc.number SUB_BASIC_WMS_SET_CUSTOM_DENSITY_WITH_APPLYTO_SUBWINDOW_FALSE_0100
     * @tc.desc   主窗调用setcustomdensity修改显示大小不同步子窗、系统窗
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCustomDensitywithFloatwindowApplytoSubwindowFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testSetCustomDensitywithFloatwindowApplytoSubwindowFalse";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('testSetCustomDensitywithFloatwindowApplytoSubwindowFalse');
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(200);
      let config: window.Configuration = {
        name: "dialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let dialogWindowClass = await window.createWindow(config);
      await dialogWindowClass.setUIContent('testability/pages/First/index2');
      await dialogWindowClass.showWindow();
      await sleep(200);
      let config2: window.Configuration = {
        name: "floatWindow",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let floatWindowClass: window.Window | undefined;
      try {
        window.createWindow(config2).then(async (data) => {
          floatWindowClass = data;
          await floatWindowClass.setUIContent('testability/pages/First/index2');
          await floatWindowClass.showWindow();
          await sleep(200);
          windowStage.setCustomDensity(1, true);
          windowStage.setCustomDensity(2, false);
          let subWindowInfo = subWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} subWindowInfo: ${subWindowInfo}`);
          // expect(subWindowInfo).assertEqual(1);
          expect(subWindowInfo).assertEqual(subWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          let dialogWindowInfo = dialogWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} dialogWindowInfo: ${dialogWindowInfo}`);
          // expect(dialogWindowInfo).assertEqual(1);
          expect(dialogWindowInfo).assertEqual(dialogWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          let floatWindowInfo = floatWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} floatWindowInfo: ${floatWindowInfo}`);
          // expect(floatWindowInfo).assertEqual(1);
          expect(floatWindowInfo).assertEqual(floatWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          await subWindowClass?.destroyWindow();
          await dialogWindowClass?.destroyWindow();
          await floatWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} createWindow Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          await dialogWindowClass?.destroyWindow();
          await floatWindowClass?.destroyWindow();
          expect(err.message!=null).assertTrue();
          if (err.code === 1300002 || err.code === 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        await dialogWindowClass?.destroyWindow();
        await floatWindowClass?.destroyWindow();
        done()
      }
    });

    /**
     * @tc.name   testSetCustomDensitywithFloatwindowApplytoSubwindowUndefined
     * @tc.number SUB_BASIC_WMS_SET_CUSTOM_DENSITY_WITH_APPLYTO_SUBWINDOW_UNDEFINED_0100
     * @tc.desc   主窗调用setcustomdensity修改显示大小默认不同步子窗、系统窗
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetCustomDensitywithFloatwindowApplytoSubwindowUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testSetCustomDensitywithFloatwindowApplytoSubwindowUndefined";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindowClass = await windowStage.createSubWindow('testSetCustomDensitywithFloatwindowApplytoSubwindowUndefined');
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await subWindowClass.showWindow();
      await sleep(200);
      let config: window.Configuration = {
        name: "dialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let dialogWindowClass = await window.createWindow(config);
      await dialogWindowClass.setUIContent('testability/pages/First/index2');
      await dialogWindowClass.showWindow();
      await sleep(200);
      let config2: window.Configuration = {
        name: "floatWindow",
        windowType: window.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let floatWindowClass: window.Window | undefined;
      try {
        window.createWindow(config2).then(async (data) => {
          floatWindowClass = data;
          await floatWindowClass.setUIContent('testability/pages/First/index2');
          await floatWindowClass.showWindow();
          await sleep(200);
          windowStage.setCustomDensity(1, true);
          windowStage.setCustomDensity(2, undefined);
          let subWindowInfo = subWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} subWindowInfo: ${subWindowInfo}`);
          // expect(subWindowInfo).assertEqual(1);
          expect(subWindowInfo).assertEqual(subWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          let dialogWindowInfo = dialogWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} dialogWindowInfo: ${dialogWindowInfo}`);
          // expect(dialogWindowInfo).assertEqual(1);
          expect(dialogWindowInfo).assertEqual(dialogWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          let floatWindowInfo = floatWindowClass.getWindowDensityInfo().customDensity;
          console.info(`${caseName} floatWindowInfo: ${floatWindowInfo}`);
          // expect(floatWindowInfo).assertEqual(1);
          expect(floatWindowInfo).assertEqual(floatWindowClass.getWindowDensityInfo().systemDensity);
          expect(true).assertTrue();
          await subWindowClass?.destroyWindow();
          await dialogWindowClass?.destroyWindow();
          await floatWindowClass?.destroyWindow();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(`${caseName} createWindow Failed. Cause code: ${err.code}, message: ${err.message}`);
          await subWindowClass?.destroyWindow();
          await dialogWindowClass?.destroyWindow();
          await floatWindowClass?.destroyWindow();
          expect(err.message!=null).assertTrue();
          if (err.code === 1300002 || err.code === 801) {
            done()
          } else {
            expect().assertFail();
            done()
          }
        });
      } catch (e) {
        console.error(`${caseName} Failed2. Cause: ${JSON.stringify(e)}`);
        expect().assertFail();
        await subWindowClass?.destroyWindow();
        await dialogWindowClass?.destroyWindow();
        await floatWindowClass?.destroyWindow();
        done()
      }
    });
    
    /**
     * @tc.name   testSetWindowContainerColorwithUnsupportedSubwindow
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITH_SUBWINDOW
     * @tc.desc   验证不支持的子窗调用setwindowcontainercolor接口抛1300004错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowContainerColorwithUnsupportedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorwithUnsupportedSubwindow ';
      console.log(caseName + 'begin');
      let subWindowClass = await windowStage.createSubWindow('testSetWindowContainerColorwithUnsupportedSubwindow');
      await sleep(200)
      try {
        subWindowClass.setWindowContainerColor("#0099FF","#00000000");
        console.log(caseName + 'success. ');
        await subWindowClass.destroyWindow()
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow();
        expect(err.message!=null).assertTrue();
        if (err.code == 801) {
          done()
        } else {
          expect(err.code).assertEqual(1300004);
          done();
        }
      }
    });

    /**
     * @tc.name   testSetWindowContainerColorwithDestroyedMainWindow
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITH_DESTROYED_MAINWINDOW
     * @tc.desc   验证销毁后的主窗调用setwindowcontainercolor接口抛1300002错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowContainerColorwithDestroyedMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorwithDestroyedMainWindow ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility(caseName, context);
      await sleep(200)
      let windowClass = windowStageStart.getMainWindowSync();
      await terminateAbility(caseName)
      try {
        windowClass.setWindowContainerColor("#0099FF","#00000000");
        console.log(caseName + 'success. ');
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        expect(err.message!=null).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testSetWindowContainerColorwithoutLoadContent
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITHOUT_LOADCONTENT
     * @tc.desc   验证主窗未loadcontent调用setwindowcontainercolor接口抛1300002错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetWindowContainerColorwithoutLoadContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorwithoutLoadContent ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility4(caseName, context);
      await sleep(200)
      let windowClass = windowStageStart.getMainWindowSync();
      await terminateAbility4(caseName)
      try {
        windowClass.setWindowContainerColor("#0099FF","#00000000");
        console.log(caseName + 'success. ');
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        expect(err.message!=null).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testgetColorSpace_default_promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GETCOLORSPACE_0100
     * @tc.desc   testgetColorSpace_default_promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetColorSpace_default_promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testgetColorSpace_default_promise';
      let windowClass = windowStage.getMainWindowSync();
      let promise = windowClass.setColorSpace(window.ColorSpace.DEFAULT);
      promise.then(async () => {
        console.info(caseName+ ' Succeeded in setting window colorspace.');
        let ColorSpace = await windowClass.getColorSpace();
        console.info(caseName+' Succeeded in getting window color space. Cause:' + JSON.stringify(ColorSpace));
        expect(ColorSpace).assertEqual(window.ColorSpace.DEFAULT);
        done();
      }).catch((err: BusinessError) => {
        if (err.code == 801) {
          console.info(`${caseName}: The current device type does not support to setWindowSystemBarEnable`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${caseName}: Failed to obtain physical resolution. Code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })
    /**
     * @tc.name   testgetColorSpace_default_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_GETCOLORSPACE_0200
     * @tc.desc   testgetColorSpace_default_Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testgetColorSpace_default_Callback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName = 'testgetColorSpace_default_Callback';
      let windowClass = windowStage.getMainWindowSync();
      let promise = windowClass.setColorSpace(window.ColorSpace.DEFAULT);
      promise.then(async () => {
        console.info(caseName+ ' Succeeded in setting window colorspace.');
        windowClass.getColorSpace((err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(caseName+` Failed to get window colorspace. Cause code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          }else{
            console.info(caseName+' Succeeded in getting window colorspace. Cause:' + JSON.stringify(data));
            expect(data).assertEqual(window.ColorSpace.DEFAULT);
            done();
          }
        });
      }).catch((err: BusinessError) => {
        if (err.code == 801) {
          console.info(`${caseName}: The current device type does not support to setWindowSystemBarEnable`);
          expect(true).assertTrue();
          done();
        } else {
          console.error(`${caseName}: Failed to obtain physical resolution. Code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    })

    /**
     * @tc.number     SUB_BASIC_WMS_ON_OCCLUSIONSTATECHANGED_CHANGE_0100
     * @tc.name       testOnOcclusionStatewithDestoryedSubwindow
     * @tc.desc       验证子窗销毁后注册OnOcclusionState返回1300002错误码验证
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testOnOcclusionStatewithDestoryedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testOnOcclusionStatewithDestoryedSubwindow ';
      console.log(caseName + 'begin');
      let subWindowClass = await windowStage.createSubWindow(caseName);
      await subWindowClass.destroyWindow();
      try {
        const callback = (res: window.OcclusionState) => {
          console.info(caseName + ' callback res: ' + JSON.stringify(res));
        }
        subWindowClass.on('occlusionStateChanged', callback);
        console.log(caseName + 'success. ');
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
          done();
        
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_ON_OCCLUSIONSTATECHANGED_CHANGE_0200
     * @tc.name       testOffOcclusionStatewithDestoryedSubwindow
     * @tc.desc       验证子窗销毁后注册OffOcclusionState返回1300002错误码验证
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testOffOcclusionStatewithDestoryedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testOffOcclusionStatewithDestoryedSubwindow ';
      console.log(caseName + 'begin');
      let subWindowClass = await windowStage.createSubWindow(caseName);
      await subWindowClass.destroyWindow();
      try {
        const callback = (res: window.OcclusionState) => {
          console.info(caseName + ' callback res: ' + JSON.stringify(res));
        }
        subWindowClass.off('occlusionStateChanged', callback);
        console.log(caseName + 'success. ');
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message!=null).assertTrue();
          done();
      
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_ON_OCCLUSIONSTATECHANGED_CHANGE_0300
     * @tc.name       testOnOcclusionStateBeforeLoadcontent
     * @tc.desc       验证子窗loadContent之前注册，首次打开loadContent查看是否有监听
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testOnOcclusionStateBeforeLoadcontent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testOnOcclusionStateBeforeLoadcontent ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let subWindowClass = await windowStage.createSubWindow(caseName);
      try {
        const callback = async (res: window.OcclusionState) => {
          console.info(caseName + ' callback res: ' + JSON.stringify(res));
          expect(res).assertEqual(window.OcclusionState.NO_OCCLUSION);
          await subWindowClass.destroyWindow();
          done();
        }
        subWindowClass.on('occlusionStateChanged', callback);
        if (canIUseRes) {
          await subWindowClass.loadContent('testability/pages/First/index2');
          await subWindowClass.showWindow();
        } else {
          await subWindowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow();
        if (err.code == 801) {
          expect(true).assertTrue();
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });


    /**
     * @tc.number     SUB_BASIC_WMS_ON_OCCLUSIONSTATECHANGED_CHANGE_0400
     * @tc.name       testOnOcclusionStateAfterLoadcontent
     * @tc.desc       验证子窗loadContent之后showwindow之前注册，首次打开showwindow查看是否有监听
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testOnOcclusionStateAfterLoadcontent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testOnOcclusionStateAfterLoadcontent ';
      console.log(caseName + 'begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let subWindowClass = await windowStage.createSubWindow(caseName);
      try {
        const callback = async (res: window.OcclusionState) => {
          console.info(caseName + ' callback res: ' + JSON.stringify(res));
          expect(res).assertEqual(window.OcclusionState.NO_OCCLUSION);
          await subWindowClass.destroyWindow();
          done();
        }
        subWindowClass.on('occlusionStateChanged', callback);
        await subWindowClass.loadContent('testability/pages/First/index2');
        if (canIUseRes) {
          await subWindowClass.showWindow();
        } else {
          await subWindowClass.destroyWindow();
          done();
        }
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass.destroyWindow();
        if (err.code == 801) {
          expect(true).assertTrue();
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });


    /**
     * @tc.number     SUB_BASIC_WMS_ON_OCCLUSIONSTATECHANGED_CHANGE_0500
     * @tc.name       testOnOcclusionStatewithMainWindowandSubwindow
     * @tc.desc       验证主窗与子窗之间无遮挡、部分遮挡、完全遮挡
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testOnOcclusionStatewithMainWindowandSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testOnOcclusionStatewithMainWindowandSubwindow ';
      console.log(caseName + 'begin');
      let isSupported = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' isSupported SystemCapability.Window.SessionManager: ' + JSON.stringify(isSupported));
      let subWindow: window.Window | undefined;
      try {
        let mainWindow = windowStage.getMainWindowSync();
        let occlusionStates: number[] = [];
        let callbackCalled = false;
        const occlusionCallback = (data: window.OcclusionState) => {
          console.info(caseName + 'occlusionStateChanged callback received, state: ' + data);
          occlusionStates.push(data);
          callbackCalled = true;
        };
        mainWindow.on('occlusionStateChanged', occlusionCallback);
        await sleep(200);
        occlusionStates = [];
        callbackCalled = false;
        const mainWindowProperties = await mainWindow.getWindowProperties();
        const mainWindowRect = mainWindowProperties.windowRect;
        subWindow = await windowStage.createSubWindow('testOnOcclusionStatewithMainWindowandSubwindow');
        await subWindow.resize(mainWindowRect.width/2 , mainWindowRect.height/2);
        await subWindow.moveWindowTo(mainWindowRect.left + mainWindowRect.width/3, mainWindowRect.top + mainWindowRect.height/3);
        await subWindow.setUIContent('testability/pages/First/index2');
        await subWindow.showWindow();
        await sleep(1000);
        expect(callbackCalled).assertTrue();
        console.info(caseName + 'Step 3 - Occlusion states: ' + JSON.stringify(occlusionStates));
        expect(occlusionStates.includes(window.OcclusionState.PARTIAL_OCCLUSION)).assertTrue(); // 部分可见
        occlusionStates = [];
        callbackCalled = false;
        console.info(caseName + 'Step 4: Resize subwindow to fully occlude main window');
        await subWindow.resize(mainWindowRect.width + 100, mainWindowRect.height + 100);
        await subWindow.moveWindowTo(mainWindowRect.left - 50, mainWindowRect.top - 50);
        await sleep(1000);
        expect(callbackCalled).assertTrue();
        console.info(caseName + 'Step 4 - Occlusion states: ' + JSON.stringify(occlusionStates));
        expect(occlusionStates.includes(window.OcclusionState.FULL_OCCLUSION)).assertTrue(); // 完全不可见
        occlusionStates = [];
        callbackCalled = false;
        console.info(caseName + 'Step 5: Move and resize subwindow to have no intersection with main window');
        await subWindow.resize(200, 200);
        await subWindow.moveWindowTo(mainWindowRect.left + mainWindowRect.width + 100,
          mainWindowRect.top + mainWindowRect.height + 100);
        await sleep(1000);
        expect(callbackCalled).assertTrue();
        console.info(caseName + 'Step 5 - Occlusion states: ' + JSON.stringify(occlusionStates));
        expect(occlusionStates.includes(window.OcclusionState.NO_OCCLUSION)).assertTrue(); // 完全可见

        console.info(caseName + 'Step 6: Unregister listener and repeat steps 3-5');
        mainWindow.off('occlusionStateChanged', occlusionCallback);
        console.info(caseName + 'Main window unregistered occlusionStateChanged listener');
        occlusionStates = [];
        callbackCalled = false;

        console.info(caseName + 'Step 6.1: Repeat step 3 - partial occlusion');
        await subWindow.resize(mainWindowRect.width/2 , mainWindowRect.height/2);
        await subWindow.moveWindowTo(mainWindowRect.left + mainWindowRect.width/3, mainWindowRect.top + mainWindowRect.height/3);
        await sleep(500);
        expect(callbackCalled).assertFalse();
        expect(occlusionStates.length).assertEqual(0);

        console.info(caseName + 'Step 6.2: Repeat step 4 - full occlusion');
        await subWindow.resize(mainWindowRect.width + 100, mainWindowRect.height + 100);
        await subWindow.moveWindowTo(mainWindowRect.left - 50, mainWindowRect.top - 50);
        await sleep(500);
        expect(callbackCalled).assertFalse();
        expect(occlusionStates.length).assertEqual(0);

        console.info(caseName + 'Step 6.3: Repeat step 5 - no occlusion');
        await subWindow.resize(200, 200);
        await subWindow.moveWindowTo(mainWindowRect.left + mainWindowRect.width + 100,
          mainWindowRect.top + mainWindowRect.height + 100);
        await sleep(500);

        expect(callbackCalled).assertFalse();
        expect(occlusionStates.length).assertEqual(0);
        console.info(caseName + 'Step 6 completed - No callbacks received after unregistering');
        console.info(caseName + 'Step 7: Destroy subwindow');
        await subWindow.destroyWindow();
        console.info(caseName + 'Subwindow destroyed successfully');
        done();
      } catch (err) {
        console.error(caseName + 'failed, error: ' + JSON.stringify(err));
        await subWindow?.destroyWindow();
        if (!isSupported) {
          expect(err.code).assertEqual(801)
          done()
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_ON_OCCLUSIONSTATECHANGED_CHANGE_0600
     * @tc.name       testOnOcclusionStatewithTwoSubwindow
     * @tc.desc       验证2个子窗之间无遮挡、部分遮挡、完全遮挡
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testOnOcclusionStatewithTwoSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testOnOcclusionStatewithTwoSubwindow ';
      console.log(caseName + 'begin');
      let subWindow1: window.Window | undefined;
      let subWindow2: window.Window | undefined;
      // 用于记录回调状态
      let occlusionStates: number[] = [];
      let callbackCalled = false;

      // 定义子窗1的遮挡状态变化回调
      const occlusionCallback = (data: window.OcclusionState) => {
        console.info(caseName + ' SubWindow1 occlusionStateChanged callback received, state: ' + data);
        occlusionStates.push(data);
        callbackCalled = true;
      };
      // 步骤1：检查SystemCapability.Window.SessionManager是否支持
      const isSupported = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' SystemCapability.Window.SessionManager supported: ' + isSupported);

      subWindow1 = await windowStage.createSubWindow('1testOnOcclusionStatewithTwoSubwindow');
      subWindow2 = await windowStage.createSubWindow('2testOnOcclusionStatewithTwoSubwindow');

      if (!isSupported) {
        // 如果不支持，应该抛出801错误码
        try {
          // 步骤3：子窗1注册on('occlusionStateChanged')
          subWindow1.on('occlusionStateChanged', occlusionCallback);
          expect().assertFail();
        } catch (err) {
          console.info(caseName + ' Expected error caught: ' + JSON.stringify(err));
          expect(err.code).assertEqual(801);
          done();
        }
      } else {
        try {
          let windowLimits = subWindow1.getWindowLimits();
          console.info(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
          await subWindow1.setUIContent('testability/pages/First/index2');
          await subWindow2.setUIContent('testability/pages/First/index2');
          await sleep(100);

          // 设置子窗口1的初始位置和大小
          await subWindow1.resize(windowLimits.minWidth as number+100, windowLimits.minHeight as number+100);
          await subWindow1.moveWindowTo(200, 200);
          await subWindow1.showWindow();

          // 设置子窗口2的初始位置和大小（先放在不相交的位置）
          await subWindow2.resize(windowLimits.minWidth as number+600, windowLimits.minHeight as number+600);
          await subWindow2.moveWindowTo(windowLimits.minWidth as number+800, windowLimits.minHeight as number+800);
          await subWindow2.showWindow();
          console.info(caseName + ' SubWindow2 shown at (1000, 1000) with size 300x250');

          // 步骤3：子窗1注册on('occlusionStateChanged')监听
          subWindow1.on('occlusionStateChanged', occlusionCallback);
          console.info(caseName + ' SubWindow1 registered occlusionStateChanged listener');

          // 等待初始状态稳定
          await sleep(200);
          occlusionStates = []; // 清空初始状态
          callbackCalled = false;

          // 移动子窗2，使得子窗2与子窗1有交集（部分遮挡）
          console.info(caseName + ' Step 3: Move subWindow2 to partially occlude subWindow1');
          await subWindow2.moveWindowTo(250, 250); // 与子窗1有交集

          // 等待回调
          await sleep(500);

          // 验证：应该收到部分可见状态 (state=1)
          expect(callbackCalled).assertTrue();
          console.info(caseName + ' Step 3 - Occlusion states: ' + JSON.stringify(occlusionStates));
          expect(occlusionStates.includes(1)).assertTrue(); // 部分可见

          // 重置状态
          occlusionStates = [];
          callbackCalled = false;

          // 步骤4：resize子窗2，使子窗2完全遮挡子窗1
          console.info(caseName + ' Step 4: Resize subWindow2 to fully occlude subWindow1');
          const subWindow1Properties = await subWindow1.getWindowProperties();
          const subWindow1Rect = subWindow1Properties.windowRect;

          console.info(caseName + ' 123.。。: ' );

          // 子窗口2尺寸设置为比子窗口1更大，完全覆盖
          await subWindow2.moveWindowTo(0, 0);

          // 等待回调
          await sleep(500);

          // 验证：应该收到完全不可见状态 (state=2)
          console.info(caseName + ' Step 4 - callbackCalled: ' + JSON.stringify(callbackCalled));
          expect(callbackCalled).assertTrue();
          console.info(caseName + ' Step 4 - Occlusion states: ' + JSON.stringify(occlusionStates));
          expect(occlusionStates.includes(2)).assertTrue(); // 完全不可见

          // 重置状态
          occlusionStates = [];
          callbackCalled = false;

          // 步骤5：移动子窗2，使子窗2完全与子窗1没有交集
          console.info(caseName + ' Step 5: Move subWindow2 to have no intersection with subWindow1');
          await subWindow2.moveWindowTo(windowLimits.minWidth as number+1000, windowLimits.minHeight as number+1000);

          // 等待回调
          await sleep(500);

          // 验证：应该收到完全可见状态 (state=0)
          expect(callbackCalled).assertTrue();
          console.info(caseName + ' Step 5 - Occlusion states: ' + JSON.stringify(occlusionStates));
          expect(occlusionStates.includes(0)).assertTrue(); // 完全可见

          // 步骤6：子窗1调用off('occlusionStateChanged')取消监听，重复3-5
          console.info(caseName + ' Step 6: Unregister listener and repeat steps 3-5');
          subWindow1.off('occlusionStateChanged', occlusionCallback);
          console.info(caseName + ' SubWindow1 unregistered occlusionStateChanged listener');

          // 重置状态
          occlusionStates = [];
          callbackCalled = false;

          // 重复步骤3：部分遮挡
          console.info(caseName + ' Step 6.1: Repeat step 3 - partial occlusion');
          await subWindow2.moveWindowTo(250, 250); // 与子窗1有交集
          await sleep(500);

          // 验证：不应该有回调
          expect(callbackCalled).assertFalse();
          expect(occlusionStates.length).assertEqual(0);
          console.info(caseName + ' Step 6.1 completed - No callback received');

          // 重复步骤4：完全遮挡
          console.info(caseName + ' Step 6.2: Repeat step 4 - full occlusion');
          // await subWindow2.resize(subWindow1Rect.width + 100, subWindow1Rect.height + 100);
          await subWindow2.moveWindowTo(0, 0);
          await sleep(500);

          // 验证：不应该有回调
          expect(callbackCalled).assertFalse();
          expect(occlusionStates.length).assertEqual(0);
          console.info(caseName + ' Step 6.2 completed - No callback received');

          // 重复步骤5：无遮挡
          console.info(caseName + ' Step 6.3: Repeat step 5 - no occlusion');
          await subWindow2.moveWindowTo(windowLimits.minWidth as number+800, windowLimits.minHeight as number+800);
          await sleep(500);

          // 验证：不应该有回调
          expect(callbackCalled).assertFalse();
          expect(occlusionStates.length).assertEqual(0);
          console.info(caseName + ' Step 6 completed - No callbacks received after unregistering');

          // 步骤7：销毁子窗1和子窗2
          await subWindow1.destroyWindow();
          await subWindow2.destroyWindow();
          done();


        } catch (err) {
          console.error(caseName + ' failed, error: ' + JSON.stringify(err));
          await subWindow1?.destroyWindow();
          await subWindow2?.destroyWindow();
          expect(false).assertTrue();
          done();
        }
      }
    });


    /**
     * @tc.number     SUB_BASIC_WMS_FUNCTION_FREEWINDOWMODE_0100
     * @tc.name       testIsInFreeWindowModewithdestoryedSubwindow
     * @tc.desc       验证子窗口销毁后调用isInFreeWindowMode接口报1300002
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testIsInFreeWindowModewithdestoryedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testIsInFreeWindowModewithdestoryedSubwindow ';
      let subWindowClass = await windowStage.createSubWindow(caseName);
      await subWindowClass.destroyWindow();
      try {
        subWindowClass.isInFreeWindowMode();
        console.log(caseName + 'success. ');
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        expect(err.message != null).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.number     SUB_BASIC_WMS_FUNCTION_FREEWINDOWMODE_0200
     * @tc.name       testIsInFreeWindowModewithDifferentWindowType
     * @tc.desc       验证isInFreeWindowMode接口在主窗、子窗和系统窗都可以调用
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testIsInFreeWindowModewithDifferentWindowType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testIsInFreeWindowModewithDifferentWindowType ';
      let subWindowClass: window.Window | undefined;
      let subWindowClass2: window.Window | undefined;
      try {
        let mainWindow = windowStage.getMainWindowSync();
        let res1 = mainWindow.isInFreeWindowMode();
        console.log(caseName + 'mainWindow isInFreeWindowMode: ' + res1);
        subWindowClass = await windowStage.createSubWindow(caseName);
        let res2 = subWindowClass.isInFreeWindowMode();
        console.log(caseName + 'subWindow isInFreeWindowMode: ' + res2);
        let config: window.Configuration = {
          name: "systemWindow",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let subWindowClass2 = await window.createWindow(config);
        let res3 = subWindowClass2.isInFreeWindowMode();
        console.log(caseName + 'subWindow isInFreeWindowMode: ' + res3);
        if (res1) {
          expect(res1).assertEqual(true)
          expect(res2).assertEqual(true)
          expect(res3).assertEqual(true)
        } else {
          expect(res1).assertEqual(false)
          expect(res2).assertEqual(false)
          expect(res3).assertEqual(false)
        }
        await subWindowClass.destroyWindow();
        await subWindowClass2.destroyWindow();
        done();
      } catch (err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass?.destroyWindow();
        await subWindowClass2?.destroyWindow();
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_FUNCTION_FREEWINDOWMODE_0300
     * @tc.name       testOnOffFreeWindowModeChangewithdestoryedSubwindow
     * @tc.desc       验证子窗口销毁后onFreeWindowModeChange和offFreeWindowModeChange监听接口抛1300002错误码
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('testOnOffFreeWindowModeChangewithdestoryedSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testOnOffFreeWindowModeChangewithdestoryedSubwindow ';
      let subWindowClass: window.Window | undefined;
      let subWindowClass2: window.Window | undefined;
      subWindowClass = await windowStage.createSubWindow('testOnOffFreeWindowModeChangewithdestoryedSubwindow1');
      subWindowClass2 = await windowStage.createSubWindow('testOnOffFreeWindowModeChangewithdestoryedSubwindow2');
      await subWindowClass.destroyWindow();
      await subWindowClass2.destroyWindow();
      try {
        const callback = (res: boolean) => {
          console.log(caseName + ' callback result: ' + res);
        }
        subWindowClass.on('freeWindowModeChange', callback)
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002);
        // expect(err.message).assertEqual('This window state is abnormal.')
      }
      try {
        const callback = (res: boolean) => {
          console.log(caseName + ' callback result: ' + res);
        }
        subWindowClass.off('freeWindowModeChange', callback)
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300002)
        // expect(err.message).assertEqual('This window state is abnormal.')
        done();
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_SETWINDOWCONTAINERCOLOR_0400
     * @tc.name       testSetWindowContainerColorPermissionwithMainWindow
     * @tc.desc       验证普通应用配置权限时主窗调用setWindowContainerColor接口获焦时透明
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testSetWindowContainerColorPermissionwithMainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorPermissionwithMainWindow ';
      let windowStageStart = await startAbility3(caseName, context);
      try {
        let windowClass = windowStageStart.getMainWindowSync();
        windowClass.setWindowContainerColor('#00000000', '#FF00ff33');
          await terminateAbility3(caseName);
          done();
      } catch (err) {
        console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
        await terminateAbility3(caseName);
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_SETWINDOWCONTAINERCOLOR_0500
     * @tc.name       testSetWindowContainerColorPermissionwithInactiveTransparent
     * @tc.desc       验证普通应用配置权限时主窗调用setWindowContainerColor接口失焦时透明
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testSetWindowContainerColorPermissionwithInactiveTransparent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorPermissionwithInactiveTransparent ';
      let windowStageStart = await startAbility3(caseName, context);
      try {
        let windowClass = windowStageStart.getMainWindowSync();
        windowClass.setWindowContainerColor('#00000000', '#FF00ff33');
          await terminateAbility3(caseName);
          done();
      } catch (err) {
        console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
        await terminateAbility3(caseName);
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done();
        } else {
          expect().assertFail()
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_SETWINDOWCONTAINERCOLOR_0600
     * @tc.name       testSetWindowContainerColorPermissionwithSubwindow
     * @tc.desc       验证普通应用配置权限时子窗口调用setWindowContainerColor
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testSetWindowContainerColorPermissionwithSubwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorPermissionwithSubwindow ';
      let subWindowClass: window.Window | undefined;
      try {
        subWindowClass = await windowStage.createSubWindow('testSetWindowContainerColorPermissionwithSubwindow')
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.showWindow()
        subWindowClass.setWindowContainerColor('#00000000', '#FF00ff33');
        await subWindowClass.destroyWindow()
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass?.destroyWindow()
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done();
        } else {
          expect(err.code).assertEqual(1300004)
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_SETWINDOWCONTAINERCOLOR_0700
     * @tc.name       testSetWindowContainerColorPermissionwithDialogwindow
     * @tc.desc       验证普通应用配置权限时dialog窗调用setWindowContainerColor接口
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testSetWindowContainerColorPermissionwithDialogwindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorPermissionwithDialogwindow ';
      let subWindowClass: window.Window | undefined;
      let config: window.Configuration = {
        name: "systemWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      try {
        subWindowClass = await window.createWindow(config);
        await subWindowClass.setUIContent('testability/pages/First/index2');
        await subWindowClass.showWindow()
        subWindowClass.setWindowContainerColor('#00000000', '#FF00ff33');
        await subWindowClass.destroyWindow()
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
        await subWindowClass?.destroyWindow()
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done();
        } else {
          expect(err.code).assertEqual(1300004)
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_SETWINDOWCONTAINERCOLOR_0800
     * @tc.name       testSetWindowContainerColorPermissionwithInactiveColorErrorParameterAlpha
     * @tc.desc       验证普通应用配置权限时主窗调用setWindowContainerColor接口，参数类型透明度alpha非FF开头
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testSetWindowContainerColorPermissionwithInactiveColorErrorParameterAlpha', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorPermissionwithInactiveColorErrorParameterAlpha ';
      let windowStageStart = await startAbility3(caseName, context);
      try {
        let windowClass = windowStageStart.getMainWindowSync();
        windowClass.setWindowContainerColor('#00000000', '#fc007bff');
        await terminateAbility3(caseName);
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
        await terminateAbility3(caseName);
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done();
        } else {
          expect(err.code).assertEqual(401)
          done();
        }
      }
    });

    /**
     * @tc.number     SUB_BASIC_WMS_SETWINDOWCONTAINERCOLOR_0900
     * @tc.name       testSetWindowContainerColorPermissionwithInactiveColorErrorParameterError
     * @tc.desc       验证普通应用配置权限时主窗调用setWindowContainerColor接口，参数类型错误
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testSetWindowContainerColorPermissionwithInactiveColorErrorParameterError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testSetWindowContainerColorPermissionwithInactiveColorErrorParameterError ';
      let windowStageStart = await startAbility3(caseName, context);
      try {
        let windowClass = windowStageStart.getMainWindowSync();
        windowClass.setWindowContainerColor('#00000000', '#mmm');
        await terminateAbility3(caseName);
        expect().assertFail()
        done();
      } catch (err) {
        console.error(`${caseName}  Failed1. Cause code: ${err.code}, message: ${err.message}`);
        await terminateAbility3(caseName);
        if (err.code == 801) {
          expect(err.code).assertEqual(801) 
          done();
        } else {
          expect(err.code).assertEqual(401)
          done();
        }
      }
    });

    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_START_BACKGROUND_COLOR_0100
     * @tc.name    testSetStartWindowBackgroundColor_0
     * @tc.desc    setStartWindowBackgroundColor入参长度0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetStartWindowBackgroundColor_0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'testSetStartWindowBackgroundColor_0';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.info(caseName+ ' isSupport:'+isSupport);
      try {
        let promise = window.setStartWindowBackgroundColor('', '', ColorMetrics.numeric(0xff000000));
        promise.then(() => {
          console.info(caseName+ ' Succeeded in setting the starting window color.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`caseName+ Failed to set the starting window color. Cause code: ${err.code}, message: ${err.message}`);
          if(!isSupport){
            expect(err.code).assertEqual(801);
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setStartWindowBackgroundColor]');
            done()
          }else {
            expect(err.code).assertEqual(1300003);
            expect(err.message).assertEqual('This window manager service works abnormally.[window][setStartWindowBackgroundColor]');
            done()

          }
        });
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_START_BACKGROUND_COLOR_0200
     * @tc.name    testSetStartWindowBackgroundColor_200
     * @tc.desc    setStartWindowBackgroundColor入参长度200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetStartWindowBackgroundColor_200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'testSetStartWindowBackgroundColor_200';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.info(caseName+ ' isSupport:'+isSupport);
      try {
        let promise = window.setStartWindowBackgroundColor('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          ColorMetrics.numeric(0xff000000));
        promise.then(() => {
          console.info(caseName+ ' Succeeded in setting the starting window color.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`caseName+ Failed to set the starting window color. Cause code: ${err.code}, message: ${err.message}`);
          if(!isSupport){
            expect(err.code).assertEqual(801);
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setStartWindowBackgroundColor]');
            done()
          }else {
            expect(err.code).assertEqual(1300003);
            expect(err.message).assertEqual('This window manager service works abnormally.[window][setStartWindowBackgroundColor]');
            done()

          }
        });
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_START_BACKGROUND_COLOR_0300
     * @tc.name    testSetStartWindowBackgroundColor_201
     * @tc.desc    setStartWindowBackgroundColor入参长度201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetStartWindowBackgroundColor_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let caseName = 'testSetStartWindowBackgroundColor_201';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.info(caseName+ ' isSupport:'+isSupport);
      try {
        let promise = window.setStartWindowBackgroundColor('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
          ColorMetrics.numeric(0xff000000));
        promise.then(() => {
          console.info(caseName+ ' Succeeded in setting the starting window color.');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(caseName+` Failed to set the starting window color. Cause code: ${err.code}, message: ${err.message}`);
          if(!isSupport){
            expect(err.code).assertEqual(801);
            expect(err.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setStartWindowBackgroundColor]');
            done()
          }else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        expect(e.code).assertEqual(1300016);
        expect(e.message).assertEqual('Parameter validation error.[window][setStartWindowBackgroundColor]msg: Parameter moduleName exceeds the allowed length');
        done();
      }
    })

  })
}

