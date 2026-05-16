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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import * as LoadContentByName from '../testability/pages/WindowTest/LoadContentByName';
import {Want, StartOptions } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import { display } from '@kit.ArkUI';
import deviceInfo from '@ohos.deviceInfo';

let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));

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



export default function NoParentSubWindowFocusZLevel() {
  describe('NoParentSubWindowFocusZLevel', async () => {
    let sleep = (sleepMs: number) => new Promise < string > (resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let isAutoWindow: string = '';
    let windowclassArr: Array<window.Window>;
    let isFreeWindowMode = false;
    let isPCMode: boolean = false;
    let deviceType: string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      let promise = windowClass.getWindowStateSnapshot();
      promise.then((data) => {
        let jsonObj: object = JSON.parse(data);
        console.info(`beforeAll: Succeeded. data=${data}, isPcMod=${jsonObj["isPcMode"]},isSupportFreeWindowMode=${jsonObj["isSupportFreeWindowMode"]}`);
        isPCMode = jsonObj["isPcMode"];
      }).catch((err: BusinessError) => {
        console.error(`beforeAll: getWindowStateSnapshot Failed. Cause code: ${err.code}, cancel message: ${err.message}`);
      });
      console.info(`beforeAll: isPCMode=${isPCMode}`);
    });
    beforeEach(() => {
    });
    afterEach(async () => {
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
        console.log('afterEach fail cause' + error)
      }
    })
    afterAll(() => {
    });
    
   /**
 * @tc.number   SUB_WINDOW_NoParentSubWindow_getLastWindow_0100
 * @tc.name     SUB_WINDOW_NoParentSubWindow_getLastWindow_0100
 * @tc.desc     SUB_WINDOW_NoParentSubWindow_getLastWindow_0100
 * @tc.size     MediumTest
 * @tc.type     Function
 * @tc.level    LEVEL1
 */
it('SUB_WINDOW_NoParentSubWindow_getLastWindow_0100',
  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
    const caseName = 'SUB_WINDOW_NoParentSubWindow_getLastWindow_0100';
    let msgStr = 'jsunittest ' + caseName + ' ';
    console.log(msgStr + 'begin');
    let subWindowOptions: window.SubWindowOptions = {
      title: 'SUB_WINDOW_NoParentSubWindow_getLastWindow_0100',
      decorEnabled: true,
      zLevelAboveParentLoosened: true
    };
    let mainWindow: window.Window = windowStage.getMainWindowSync();
    windowStage.createSubWindowWithOptions('SUB_WINDOW_NoParentSubWindow_getLastWindow_0100', subWindowOptions)
      .then(async (data) => {
        let subWindow: window.Window = data;
        console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        expect(!!subWindow).assertTrue();
        await subWindow.showWindow();
        await sleep(500)
        let topWindow: window.Window = await window.getLastWindow(context);
        let mainWindowId = mainWindow.getWindowProperties().id;
        let subWindowId = subWindow.getWindowProperties().id;
        let topWindowId = topWindow.getWindowProperties().id;
        console.info(`${msgStr},mainWindowId：${mainWindowId},subWindowId:${subWindowId},topWindowId:${topWindowId}`);
        if (isFreeWindowMode) {
          expect(topWindowId).assertEqual(mainWindowId);
        } else {
          expect(topWindowId).assertEqual(subWindowId);
        }
        await subWindow.destroyWindow();
        done();
      }).catch((err: BusinessError) => {
      console.error(msgStr +
        `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
      expect(false).assertTrue();
      done();
    });
  }
)


  })

}