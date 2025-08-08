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
import { ColorMetrics } from '@kit.ArkUI';
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

export default function windowPropertiesTest2() {
  describe('windowProperties_test2', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let isAutoWindow: string = '';
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      isAutoWindow =
        settings.getValueSync(context, 'window_pcmode_switch_status', '', settings.domainName.DEVICE_SHARED);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
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
        console.error(msgStr + 'Failed2 to set the call setStatusBarColor. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
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
          console.error(msgStr + 'Failed to call setStatusBarColor. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
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
        console.error(msgStr + 'Failed2 to set the call getStatusBarProperty. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
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
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401)
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
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
        done()
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0200
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
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004)
        done()
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_ErrorCode_0300
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
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401)
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
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
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
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
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
        console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    // /**
    //  * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_0400
    //  * @tc.name       : test_setWindowShadowRadius_0400
    //  * @tc.desc       : 验证悬浮窗设置阴影为0
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('test_setWindowShadowRadius_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    //   let caseName = "test_setWindowShadowRadius_0400";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //   let windowClass: window.Window | null = null;
    //   let config: window.Configuration = {
    //     name: "floatWindow", windowType: window.WindowType.TYPE_FLOAT, ctx: context
    //   };
    //   try {
    //     windowClass = await ohosWindow.createWindow(config);
    //     expect(!!windowClass).assertTrue();
    //   } catch (err) {
    //     console.error(msgStr + 'ohosWindow.createWindow ' + 'caught, err: ' + JSON.stringify(err));
    //     expect().assertFail();
    //     done()
    //   }
    //
    //   try {
    //     windowClass!.setWindowShadowRadius(0)
    //     expect(true).assertTrue();
    //     console.info(msgStr + 'Succeeded in calling setWindowShadowRadius.');
    //     await windowClass!.destroyWindow();
    //     done()
    //   } catch (exception) {
    //     console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
    //     await windowClass!.destroyWindow();
    //     // if (exception.code == 801) {
    //     //   console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
    //     //   done();
    //     // } else {
    //     //   expect().assertFail();
    //     //   done();
    //     // }
    //     expect().assertFail();
    //     done();
    //   }
    // })

    // /**
    //  * @tc.number     : SUB_BASIC_WMS_setWindowShadowRadius_0500
    //  * @tc.name       : test_setWindowShadowRadius_0500
    //  * @tc.desc       : 验证悬浮窗设置阴影为4
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('test_setWindowShadowRadius_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    //   let caseName = "test_setWindowShadowRadius_0500";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //   let windowClass: window.Window | null = null;
    //   let config: window.Configuration = {
    //     name: "floatWindow", windowType: window.WindowType.TYPE_FLOAT, ctx: context
    //   };
    //   try {
    //     windowClass = await ohosWindow.createWindow(config);
    //     expect(!!windowClass).assertTrue();
    //   } catch (err) {
    //     console.error(msgStr + 'ohosWindow.createWindow ' + 'caught, err: ' + JSON.stringify(err));
    //     expect().assertFail();
    //     done()
    //   }
    //
    //   try {
    //     windowClass!.setWindowShadowRadius(4)
    //     expect(true).assertTrue();
    //     console.info(msgStr + 'Succeeded in calling setWindowShadowRadius.');
    //     await windowClass!.destroyWindow();
    //     done()
    //   } catch (exception) {
    //     console.error(msgStr + 'Failed2 to set the call setWindowShadowRadius. Cause:' + JSON.stringify(exception));
    //     await windowClass!.destroyWindow();
    //     // if (exception.code == 801) {
    //     //   console.info(`${caseName} The current device type does not support to setWindowShadowRadius`);
    //     //   done();
    //     // } else {
    //     //   expect().assertFail();
    //     //   done();
    //     // }
    //     expect().assertFail();
    //     done();
    //   }
    // })

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
        console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401)
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
        console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass.destroyWindow();
        expect(exception.code).assertEqual(401)
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
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
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
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          } else {
            expect(err.code).assertEqual(1300004)
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
        } else {
          expect().assertFail();
        }
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
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          } else {
            expect(err.code).assertEqual(1300004)
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
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
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          } else {
            expect().assertFail();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
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
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          } else {
            expect().assertFail();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
        } else {
          expect().assertFail();
        }
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
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          } else {
            expect().assertFail();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
        } else {
          expect().assertFail();
        }
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
          console.error(msgStr + 'Failed to call setWindowCornerRadius. Cause: ' + JSON.stringify(err));
          await subWindowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
          } else {
            expect().assertFail();
          }
        });
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
        } else {
          expect().assertFail();
        }
      }
    })

    // /**
    //  * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_0600
    //  * @tc.name       : test_setWindowCornerRadius_0600
    //  * @tc.desc       : 验证悬浮窗圆角值为0
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('test_setWindowCornerRadius_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    //   let caseName = "test_setWindowCornerRadius_0600";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //   let windowClass: window.Window | null = null;
    //   let config: window.Configuration = {
    //     name: "floatWindow", windowType: window.WindowType.TYPE_FLOAT, ctx: context
    //   };
    //   try {
    //     windowClass = await ohosWindow.createWindow(config);
    //     expect(!!windowClass).assertTrue();
    //   } catch (err) {
    //     console.error(msgStr + 'ohosWindow.createWindow ' + 'caught, err: ' + JSON.stringify(err));
    //     expect().assertFail();
    //     done()
    //   }
    //
    //   try {
    //     windowClass!.setWindowCornerRadius(0)
    //     let result = windowClass!.getWindowCornerRadius()
    //     expect(result).assertEqual(0)
    //     console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
    //     await windowClass!.destroyWindow();
    //     done()
    //   } catch (exception) {
    //     console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
    //     await windowClass!.destroyWindow();
    //     // if (exception.code == 801) {
    //     //   console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
    //     //   done();
    //     // } else {
    //     //   expect().assertFail();
    //     //   done();
    //     // }
    //     expect().assertFail();
    //     done();
    //   }
    // })

    // /**
    //  * @tc.number     : SUB_BASIC_WMS_setWindowCornerRadius_0700
    //  * @tc.name       : test_setWindowCornerRadius_0700
    //  * @tc.desc       : 验证悬浮窗圆角值为5
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 3
    //  */
    // it('test_setWindowCornerRadius_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
    //   let caseName = "test_setWindowCornerRadius_0700";
    //   let msgStr = 'jsunittest ' + caseName + ' ';
    //   console.log(msgStr + 'begin.');
    //   let windowClass: window.Window | null = null;
    //   let config: window.Configuration = {
    //     name: "floatWindow", windowType: window.WindowType.TYPE_FLOAT, ctx: context
    //   };
    //   try {
    //     windowClass = await ohosWindow.createWindow(config);
    //     expect(!!windowClass).assertTrue();
    //   } catch (err) {
    //     console.error(msgStr + 'ohosWindow.createWindow ' + 'caught, err: ' + JSON.stringify(err));
    //     expect().assertFail();
    //     done()
    //   }
    //
    //   try {
    //     windowClass!.setWindowCornerRadius(5)
    //     let result = windowClass!.getWindowCornerRadius()
    //     expect(result).assertEqual(5)
    //     console.info(msgStr + 'Succeeded in calling setWindowCornerRadius.');
    //     await windowClass!.destroyWindow();
    //     done()
    //   } catch (exception) {
    //     console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
    //     await windowClass!.destroyWindow();
    //     // if (exception.code == 801) {
    //     //   console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
    //     //   done();
    //     // } else {
    //     //   expect().assertFail();
    //     //   done();
    //     // }
    //     expect().assertFail();
    //     done();
    //   }
    // })

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
        console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        await subWindowClass!.destroyWindow();
        if (exception.code == 801) {
          console.info(`${caseName} The current device type does not support to setWindowCornerRadius`);
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
        console.error(msgStr + 'Failed2 to set the call setWindowCornerRadius. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
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
        console.error(msgStr + 'Failed2 to set the call getWindowCornerRadius. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004)
        done()
      }
    })

    /**
     * @tc.number     : SUB_BASIC_WMS_getWindowCornerRadius_ErrorCode_0200
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
        console.error(msgStr + 'Failed2 to set the call getWindowCornerRadius. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004)
        await (subWindowClass! as ohosWindow.Window).destroyWindow();
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
          console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err));
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
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
          console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err));
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
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
          console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err));
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
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
      } catch (err) {
        console.error(msgStr + 'createSubWindow ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
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
          console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err));
          await windowClass!.destroyWindow();
          if (err.code == 801) {
            console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
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
    })

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
                done();
              }).catch(async (err: BusinessError) => {
                console.error(msgStr + 'Failed to call snapshotIgnorePrivacy. Cause: ' + JSON.stringify(err));
                if (err.code == 801) {
                  console.info(`${caseName} The current device type does not support to snapshotIgnorePrivacy`);
                } else {
                  expect().assertFail();
                }
                await terminateAbility(caseName);
                done()
              });
              done()
            } catch (exception) {
              console.error(msgStr + 'Failed2 to set the call snapshotIgnorePrivacy. Cause:' + JSON.stringify(exception));
              expect().assertFail();
              await terminateAbility(caseName);
              done()
            }
          }
        }
        windowStageStart.on('windowStageEvent', callback)
      } catch (err) {
        console.error(msgStr + 'failed, ' + 'caught, err: ' + JSON.stringify(err));
        await terminateAbility(caseName);
        expect().assertFail();
        done()
      }
      // 3、被拉起的主窗minimize
      try {
        await windowClass.minimize();
      } catch (err) {
        console.error(msgStr + 'minimize ' + 'caught, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })
  })
}

