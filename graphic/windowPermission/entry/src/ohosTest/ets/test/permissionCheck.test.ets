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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { BusinessError } from '@ohos.base';
import { Callback } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { StartOptions } from '@kit.AbilityKit';
import window from "@ohos.window";
import { settings } from "@kit.BasicServicesKit";

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility',
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest') as window.WindowStage;
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

export default function windowPromiseTest(context: common.UIAbilityContext) {
  describe('windowPermissionCheck_test', () => {
    console.log('describe windowPermissionCheck_test start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;  
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0010
     * @tc.name      : testCreateFloatWindowPermission_Promise
     * @tc.desc      : create Floating window permission check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testCreateFloatWindowPermission_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
      let caseName = 'testCreateFloatWindowPermission_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testCreateFloatWindowPermission_Promise",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      try {
        await ohosWindow.createWindow(windowConfig).then((data) => {
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to create the Window. Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(201);
      }
    })
    /**
     /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0020
     * @tc.name      : testCreateFloatWindowPermission_Callback
     * @tc.desc      : create Floating window permission check
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateFloatWindowPermission_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: Function) => {
      let caseName = 'testCreateFloatWindowPermission_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testCreateFloatWindowPermission_Callback",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      try {
        ohosWindow.createWindow(windowConfig, (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in creating the window. Data: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(201);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0030
     * @tc.name      : testSetWindowPrivacyModePermission_Callback
     * @tc.desc      : Sets whether the window is in private mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSetWindowPrivacyModePermission_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let caseName = 'testSetWindowPrivacyModePermission_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowPrivacyModePermission_Callback",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      try {
        win!.setWindowPrivacyMode(true, async (err: BusinessError) => {
          await win!.destroyWindow()
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(201);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(201);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0040
     * @tc.name      : testSetWindowPrivacyModePermission_Promise
     * @tc.desc      : Sets whether the window is in private mode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSetWindowPrivacyModePermission_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
      let caseName = 'testSetWindowPrivacyModePermission_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetWindowPrivacyModePermission_Promise",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win: ohosWindow.Window | undefined = undefined;
      try {
        win = await ohosWindow.createWindow(windowConfig);
        expect(!!win).assertTrue();
      } catch (err) {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      try {
        await win!.setWindowPrivacyMode(true).then(async () => {
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
          expect().assertFail();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + 'Failed to set the window to privacy mode. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        });
        await win!.destroyWindow()
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
        await win!.destroyWindow()
        expect(exception.code).assertEqual(201);
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_GET_VISIBLEWINDOWINFO_0200
     * @tc.name      : test_GET_VISIBLEWINDOWINFO_0200
     * @tc.desc      : test_GET_VISIBLEWINDOWINFO_0200
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_GET_VISIBLEWINDOWINFO_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'test_GET_VISIBLEWINDOWINFO_0200 ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility(caseName, context);
      try {
        let windowClass2 = windowStageStart.getMainWindowSync();
        let res = windowClass2.getWindowProperties()
        window.getVisibleWindowInfo().then(async (infos: Array<window.WindowInfo>) => {
          console.info(caseName + 'Succeeded in calling getVisibleWindowInfo.');
          expect().assertFail()
          await terminateAbility(caseName);
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + 'Failed to call getVisibleWindowInfo. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          await terminateAbility(caseName);
          done()
        });
      } catch (err) {
        console.error(caseName + 'Failed2 to call getVisibleWindowInfo. Cause: ' + JSON.stringify(err));
        await terminateAbility(caseName);
        if(err.code == 801 || err.code == 201){
          done();
        }else{
          expect().assertFail()
          done();
        }
      }
    });

    /**
     * @tc.number     : SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_0200
     * @tc.name       : testSetWindowShadowEnabledwithoutPermission
     * @tc.desc       : testSetWindowShadowEnabledwithoutPermission
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testSetWindowShadowEnabledwithoutPermission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testSetWindowShadowEnabledwithoutPermission";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        windowClass.setWindowShadowEnabled(true).then(() => {
          console.info(`${caseName} Succeeded in calling setWindowShadowEnabled.`);
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          console.error(`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code === 801) {
            done();
          } else {
            expect(err.code).assertEqual(201);
            done()
          }
        });
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    
    /**
     * @tc.number    : SUB_BASIC_WMS_SETWINDOWCONTAINERCOLOR_0700
     * @tc.name      : testMainwindowSetWindowContainerColorNoPermissonCorrectParam
     * @tc.desc      : testMainwindowSetWindowContainerColorNoPermissonCorrectParam
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testMainwindowSetWindowContainerColorNoPermissonCorrectParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testMainwindowSetWindowContainerColorNoPermissonCorrectParam ';
      console.log(caseName + 'begin');
      let windowStageStart = await startAbility(caseName, context);
      try {
        let windowClass = windowStageStart.getMainWindowSync();
        windowClass.setWindowContainerColor("#0099FF","#CCCCCC");
        await terminateAbility(caseName);
        expect().assertFail()
        done();
      } catch (err) {
        console.error(caseName + 'Failed. Cause: ' + JSON.stringify(err));
        await terminateAbility(caseName);
        if (isPCStatus == '') {
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(201);
        }
        done()
      }
    });

  })
}