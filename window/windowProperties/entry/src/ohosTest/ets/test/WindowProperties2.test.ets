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
     * @tc.number    : SUB_BASIC_WMS_STATUS_BAR_CONTENT_COLOR_0100
     * @tc.name      : testStatusBarContentColor
     * @tc.desc      : test_statusBarContentColor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
     * @tc.number    : SUB_BASIC_WMS_DRAWABLE_RECT_0100
     * @tc.name      : testWindowPropertiesDrawableRect
     * @tc.desc      : test_WindowProperties_drawableRect
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level2
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
     * @tc.number     : SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_0100
     * @tc.name       : test_setStatusBarColor_401
     * @tc.desc       : test_setStatusBarColor_401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_0200
     * @tc.name       : test_setStatusBarColor_1300002
     * @tc.desc       : test_setStatusBarColor_1300002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_SetStatusBarColor_0300
     * @tc.name       : test_setStatusBarColor_normal1
     * @tc.desc       : 验证设置正常状态栏颜色
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
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
     * @tc.number     : SUB_BASIC_WMS_SetStatusBarColor_0400
     * @tc.name       : test_setStatusBarColor_normal2
     * @tc.desc       : 验证横屏设置状态栏颜色
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
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
     * @tc.number     : SUB_BASIC_WMS_getStatusBarProperty_ErrorCode_0100
     * @tc.name       : test_getStatusBarProperty_1300002
     * @tc.desc       : test_getStatusBarProperty_1300002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowBackgroundColor_0100
     * @tc.name       : test_setWindowBackgroundColor_ColorMetrics_mainWindow
     * @tc.desc       : test_setWindowBackgroundColor_ColorMetrics_mainWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
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
     * @tc.number     : SUB_BASIC_WMS_setWindowBackgroundColor_0200
     * @tc.name       : test_setWindowBackgroundColor_ColorMetrics_subWindow
     * @tc.desc       : test_setWindowBackgroundColor_ColorMetrics_subWindow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0100
     * @tc.name       : test_setWindowShadowRadius_401
     * @tc.desc       : test_setWindowShadowRadius_401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0200
     * @tc.name       : test_setWindowShadowRadius_1300002
     * @tc.desc       : test_setWindowShadowRadius_1300002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0300
     * @tc.name       : test_setWindowShadowRadius_1300004
     * @tc.desc       : test_setWindowShadowRadius_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0400
     * @tc.name       : test_setWindowShadowRadius_negative1
     * @tc.desc       : test_setWindowShadowRadius_negative1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_0100
     * @tc.name       : test_setWindowShadowRadius_0100
     * @tc.desc       : 验证子窗设置没有阴影
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_0200
     * @tc.name       : test_setWindowShadowRadius_0200
     * @tc.desc       : 验证子窗设置阴影为4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_0300
     * @tc.name       : test_setWindowShadowRadius_0300
     * @tc.desc       : 验证子窗设置阴影为超大值
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_0400
     * @tc.name       : testSetWindowShadowRadiusTYPE_FLOAT0
     * @tc.desc       : 验证悬浮窗设置阴影为0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_0500
     * @tc.name       : testSetWindowShadowRadiusTYPE_FLOAT4
     * @tc.desc       : 验证悬浮窗设置阴影为4
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0100
     * @tc.name       : test_setWindowCornerRadius_401
     * @tc.desc       : test_setWindowCornerRadius_401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0200
     * @tc.name       : test_setWindowCornerRadius_negative1
     * @tc.desc       : test_setWindowCornerRadius_-1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0300
     * @tc.name       : test_setWindowCornerRadius_1300002
     * @tc.desc       : test_setWindowCornerRadius_1300002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0400
     * @tc.name       : test_setWindowCornerRadius_1300004
     * @tc.desc       : test_setWindowCornerRadius_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_ErrorCode_0500
     * @tc.name       : test_setWindowCornerRadius_dialog_1300004
     * @tc.desc       : test_setWindowCornerRadius_dialog_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_0100
     * @tc.name       : test_setWindowCornerRadius_0100
     * @tc.desc       : 验证子窗圆角值为0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_0200
     * @tc.name       : test_setWindowCornerRadius_0200
     * @tc.desc       : 验证子窗圆角值为5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_0300
     * @tc.name       : test_setWindowCornerRadius_0300
     * @tc.desc       : 验证子窗圆角值为10000
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_0400
     * @tc.name       : test_setWindowCornerRadius_0400
     * @tc.desc       : 验证子窗圆角值为5.66666666
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number : SUB_BASIC_WMS_setWindowCornerRadius_0600
     * @tc.name : testSetWindowCornerRadiusTYPE_FLOAT0
     * @tc.desc : 验证悬浮窗圆角值为0
     * @tc.size : MediumTest
     * @tc.type : Function
     * @tc.level : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_0700
     * @tc.name       : testSetWindowCornerRadiusTYPE_FLOAT5
     * @tc.desc       : 验证悬浮窗圆角值为5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_0800
     * @tc.name       : test_setWindowCornerRadius_0800
     * @tc.desc       : 验证子窗多次设置圆角值
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_0100
     * @tc.name       : test_getWindowCornerRadius_1300002
     * @tc.desc       : test_getWindowCornerRadius_1300002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_0200
     * @tc.name       : test_getWindowCornerRadius_1300004
     * @tc.desc       : test_getWindowCornerRadius_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_0300
     * @tc.name       : test_getWindowCornerRadius_dialog_1300004
     * @tc.desc       : test_getWindowCornerRadius_dialog_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : testSnapshotIgnorePrivacyWithNonPrivacyMainWindowPortrait
     * @tc.name       : testSnapshotIgnorePrivacyWithNonPrivacyMainWindowPortrait
     * @tc.desc       : 测试非隐私主窗口竖屏截图
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : testSnapshotIgnorePrivacyWithPrivacyMainWindow
     * @tc.name       : testSnapshotIgnorePrivacyWithPrivacyMainWindow
     * @tc.desc       : 测试隐私主窗口竖屏截图
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : testSnapshotIgnorePrivacyWithNonPrivacyMainWindowLandscape
     * @tc.name       : testSnapshotIgnorePrivacyWithNonPrivacyMainWindowLandscape
     * @tc.desc       : 测试非隐私主窗口横屏
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : testSnapshotIgnorePrivacyWithPrivacySubWindow
     * @tc.name       : testSnapshotIgnorePrivacyWithPrivacySubWindow
     * @tc.desc       : 测试隐私子窗口截图
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : testSnapshotIgnorePrivacyWithMinimizeWindow
     * @tc.name       : testSnapshotIgnorePrivacyWithMinimizeWindow
     * @tc.desc       : 测试主窗口minimize后截图
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_0100
     * @tc.name       : testOnScreenShotAppEventwithDestoryedSubWindow
     * @tc.desc       : 验证子窗销毁后监听on_screenshotAppEvent返回1300002错误码
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_0200
     * @tc.name       : testOffScreenShotAppEventwithDestoryedSubWindow
     * @tc.desc       : 验证子窗销毁后取消监听off_screenshotAppEvent返回1300002错误码
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_0500
     * @tc.name       : testScreenshotEventType
     * @tc.desc       : 验证ScreenshotEventType枚举值
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_0100
     * @tc.name       : testSetWindowShadowEnabledwithPermission
     * @tc.desc       : 验证非2in1设备调用接口报801，2in1设备调用成功
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_0300
     * @tc.name       : testSetWindowShadowEnabledwithUnsupportedSubwindow
     * @tc.desc       : 验证子窗调用接口报1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
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
     * @tc.number     : SUB_BASIC_WMS_CREATE_FLOAT_WINDOW_DEFAULT_DENSITY_ENABLED_0100
     * @tc.name       : testCreateFloatWindowwithDefaultDensityEnabledTrue
     * @tc.desc       : 创建float系统窗配置使用默认density
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
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
     * @tc.number     : SUB_BASIC_WMS_CREATE_FLOAT_WINDOW_DEFAULT_DENSITY_ENABLED_0200
     * @tc.name       : testCreateFloatWindowwithDefaultDensityEnabledFalse
     * @tc.desc       : 创建float窗配置不使用默认density
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
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
     * @tc.number     : SUB_BASIC_WMS_CREATE_DIALOG_WINDOW_DEFAULT_DENSITY_ENABLED_0100
     * @tc.name       : testCreateDialogWindowwithDefaultDensityEnabledTrue
     * @tc.desc       : 创建dialog系统窗配置使用默认density
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_CREATE_DIALOG_WINDOW_DEFAULT_DENSITY_ENABLED_0200
     * @tc.name       : testCreateDialogWindowwithDefaultDensityEnabledFalse
     * @tc.desc       : 创建dialog窗配置不使用默认density
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_SET_CUSTOM_DENSITY_WITH_APPLYTO_SUBWINDOW_TRUE_0100
     * @tc.name       : testSetCustomDensitywithSubwindowApplytoSubwindowTrue
     * @tc.desc       : 主窗调用setcustomdensity修改显示大小同步子窗、系统窗
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_SET_CUSTOM_DENSITY_WITH_APPLYTO_SUBWINDOW_FALSE_0100
     * @tc.name       : testSetCustomDensitywithFloatwindowApplytoSubwindowFalse
     * @tc.desc       : 主窗调用setcustomdensity修改显示大小不同步子窗、系统窗
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number     : SUB_BASIC_WMS_SET_CUSTOM_DENSITY_WITH_APPLYTO_SUBWINDOW_UNDEFINED_0100
     * @tc.name       : testSetCustomDensitywithFloatwindowApplytoSubwindowUndefined
     * @tc.desc       : 主窗调用setcustomdensity修改显示大小默认不同步子窗、系统窗
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITH_SUBWINDOW
     * @tc.name      : testSetWindowContainerColorwithUnsupportedSubwindow
     * @tc.desc      : 验证不支持的子窗调用setwindowcontainercolor接口抛1300004错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITH_DESTROYED_MAINWINDOW
     * @tc.name      : testSetWindowContainerColorwithDestroyedMainWindow
     * @tc.desc      : 验证销毁后的主窗调用setwindowcontainercolor接口抛1300002错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITHOUT_LOADCONTENT
     * @tc.name      : testSetWindowContainerColorwithoutLoadContent
     * @tc.desc      : 验证主窗未loadcontent调用setwindowcontainercolor接口抛1300002错误码
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
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

  })
}

