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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import settings from '@ohos.settings';
import { StartOptions } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import { Driver, ON } from '@kit.TestKit';

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartAbility',
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
  let windowStageStart = AppStorage.get('windowStageStart') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('contextStart') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function startabilityWindowRect() {
  describe('startabilityWindowRect', () => {
    console.log('describe startabilityWindowRect start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = ''

    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
      try {
          let driver = Driver.create();
          let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.log('findComponent allowed: ' + JSON.stringify(allowed));
          if(allowed){
            await allowed.click();
          }
        } catch (err) {
          console.error('findComponent allowed failed: ' + JSON.stringify(err));
        }
    })

    /**
     * @tc.name   testWindow_StartAbility_Size_Location_0100
     * @tc.number SUB_BASIC_WMS_WINDOW_STARTABILITY_SIZE_LOCATION_0100
     * @tc.desc   testWindow_StartAbility_Size_Location_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindow_StartAbility_Size_Location_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindow_StartAbility_Size_Location_0100';
      console.log(caseName + 'begin');
      try{
        let options1: StartOptions = {
          windowLeft: -10
        }
        console.error(caseName + ' start ability test1 begin.');
        let windowStageStart1: window.WindowStage = await startAbility(caseName, context, options1);
        let windowClass1 = windowStageStart1.getMainWindowSync();
        let windowRect1 = windowClass1.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect1: ' + JSON.stringify(windowRect1));
        expect(windowRect1.left).assertEqual(0);
        await terminateAbility(caseName);

        console.error(caseName + ' start ability test2 begin.');
        let options2: StartOptions = {
          windowLeft: 0
        }
        let windowStageStart2: window.WindowStage = await startAbility(caseName, context, options2);
        let windowClass2 = windowStageStart2.getMainWindowSync();
        let windowRect2 = windowClass2.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect2: ' + JSON.stringify(windowRect2));
        expect(windowRect2.left).assertEqual(0);
        await terminateAbility(caseName);

        console.error(caseName + ' start ability test3 begin.');
        let options3: StartOptions = {
          windowLeft: 100
        }
        let windowStageStart3: window.WindowStage = await startAbility(caseName, context, options3);
        let windowClass3 = windowStageStart3.getMainWindowSync();
        let windowRect3 = windowClass3.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect3: ' + JSON.stringify(windowRect3));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect3.left).assertEqual(0);
        } else {
          expect(Math.abs(windowRect3.left-100)).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        done();
      } catch(err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        await terminateAbility(caseName);
        expect(err.message!=null).assertTrue();
        expect().assertFail()
        done()
      }
    });

    /**
     * @tc.name   testWindow_StartAbility_Size_Location_0200
     * @tc.number SUB_BASIC_WMS_WINDOW_STARTABILITY_SIZE_LOCATION_0200
     * @tc.desc   testWindow_StartAbility_Size_Location_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindow_StartAbility_Size_Location_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindow_StartAbility_Size_Location_0200';
      console.log(caseName + 'begin');
      try{
        let displayDisplay1: display.Display = display.getDefaultDisplaySync()
        let displayRect1: display.Rect = await displayDisplay1.getAvailableArea();
        let availableTop1 = displayRect1.top
        console.error(`${caseName} availableTop1: ${availableTop1}`);
        let options1: StartOptions = {
          windowTop: availableTop1-10
        }
        console.error(caseName + ' start ability test1 begin.');
        let windowStageStart1: window.WindowStage = await startAbility(caseName, context, options1);
        let windowClass1 = windowStageStart1.getMainWindowSync();
        let windowRect1 = windowClass1.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect1: ' + JSON.stringify(windowRect1));
        expect(Math.abs(windowRect1.top-availableTop1)).assertLessOrEqual(1);
        await terminateAbility(caseName);

        let displayDisplay2: display.Display = display.getDefaultDisplaySync()
        let displayRect2: display.Rect = await displayDisplay2.getAvailableArea();
        let availableTop2 = displayRect2.top
        console.error(`${caseName} availableTop2: ${availableTop2}`);
        let options2: StartOptions = {
          windowTop: availableTop2
        }
        console.error(caseName + ' start ability test2 begin.');
        let windowStageStart2: window.WindowStage = await startAbility(caseName, context, options2);
        let windowClass2 = windowStageStart2.getMainWindowSync();
        let windowRect2 = windowClass2.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect2: ' + JSON.stringify(windowRect2));
        expect(Math.abs(windowRect2.top-availableTop2)).assertLessOrEqual(1);
        await terminateAbility(caseName);

        let displayDisplay3: display.Display = display.getDefaultDisplaySync()
        let displayRect3: display.Rect = await displayDisplay3.getAvailableArea();
        let availableTop3 = displayRect3.top
        console.error(`${caseName} availableTop3: ${availableTop3}`);
        let options3: StartOptions = {
          windowTop: availableTop3+10
        }
        console.error(caseName + ' start ability test3 begin.');
        let windowStageStart3: window.WindowStage = await startAbility(caseName, context, options3);
        let windowClass3 = windowStageStart3.getMainWindowSync();
        let windowRect3 = windowClass3.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect3: ' + JSON.stringify(windowRect3));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect3.top).assertEqual(0);
        } else {
          expect(Math.abs(windowRect3.top-(availableTop3+10))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        done();
      } catch(err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.message!=null).assertTrue();
        if (err.code === 801) {
          done()
        } else {
          await terminateAbility(caseName);
          expect().assertFail()
          done()
        }
      }
    });

    /**
     * @tc.name   testWindow_StartAbility_Size_Location_0300
     * @tc.number SUB_BASIC_WMS_WINDOW_STARTABILITY_SIZE_LOCATION_0300
     * @tc.desc   testWindow_StartAbility_Size_Location_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindow_StartAbility_Size_Location_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindow_StartAbility_Size_Location_0300';
      console.log(caseName + 'begin');
      try{
        let displayDisplay1: display.Display = display.getDefaultDisplaySync()
        let displayRect1: display.Rect = await displayDisplay1.getAvailableArea();
        let availableTop1 = displayRect1.top
        console.error(`${caseName} availableTop1: ${availableTop1}`);
        let options1: StartOptions = {
          windowLeft: -10,
          windowTop: availableTop1+10
        }
        console.error(caseName + ' start ability test1 begin.');
        let windowStageStart1: window.WindowStage = await startAbility(caseName, context, options1);
        let windowClass1 = windowStageStart1.getMainWindowSync();
        let windowRect1 = windowClass1.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect1: ' + JSON.stringify(windowRect1));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect1.left).assertEqual(0);
          expect(windowRect1.top).assertEqual(0);
        } else {
          expect(Math.abs(windowRect1.left-(-10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect1.top-(availableTop1+10))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let displayDisplay2: display.Display = display.getDefaultDisplaySync()
        let displayRect2: display.Rect = await displayDisplay2.getAvailableArea();
        let availableTop2 = displayRect2.top
        console.error(`${caseName} availableTop2: ${availableTop2}`);
        let options2: StartOptions = {
          windowLeft: 10,
          windowTop: availableTop2-10
        }
        console.error(caseName + ' start ability test2 begin.');
        let windowStageStart2: window.WindowStage = await startAbility(caseName, context, options2);
        let windowClass2 = windowStageStart2.getMainWindowSync();
        let windowRect2 = windowClass2.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect2: ' + JSON.stringify(windowRect2));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect2.left).assertEqual(0);
          expect(windowRect2.top).assertEqual(0);
        } else {
          expect(Math.abs(windowRect2.left-10)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-availableTop2)).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay3: display.Display = display.getDefaultDisplaySync()
        let displayRect3: display.Rect = await displayDisplay3.getAvailableArea();
        let availableTop3 = displayRect3.top
        console.error(`${caseName} availableTop3: ${availableTop3}`);
        let options3: StartOptions = {
          windowLeft: -10,
          windowTop: availableTop3-10
        }
        console.error(caseName + ' start ability test3 begin.');
        let windowStageStart3: window.WindowStage = await startAbility(caseName, context, options3);
        let windowClass3 = windowStageStart3.getMainWindowSync();
        let windowRect3 = windowClass3.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect3: ' + JSON.stringify(windowRect3));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect3.left).assertEqual(0);
          expect(windowRect3.top).assertEqual(0);
        } else {
          expect(Math.abs(windowRect3.left- (-10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect3.top-availableTop3)).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay4: display.Display = display.getDefaultDisplaySync()
        let displayRect4: display.Rect = await displayDisplay4.getAvailableArea();
        let availableTop4 = displayRect4.top
        console.error(`${caseName} availableTop4: ${availableTop4}`);
        let options4: StartOptions = {
          windowLeft: 10,
          windowTop: availableTop4+10
        }
        console.error(caseName + ' start ability test4 begin.');
        let windowStageStart4: window.WindowStage = await startAbility(caseName, context, options4);
        let windowClass4 = windowStageStart4.getMainWindowSync();
        let windowRect4 = windowClass4.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect4: ' + JSON.stringify(windowRect4));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect4.left).assertEqual(0);
          expect(windowRect4.top).assertEqual(0);
        } else {
          expect(Math.abs(windowRect4.left-10)).assertLessOrEqual(1);
          expect(Math.abs(windowRect4.top-(availableTop4+10))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        done();
      } catch(err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.message!=null).assertTrue();
        if (err.code === 801) {
          done()
        } else {
          await terminateAbility(caseName);
          expect().assertFail()
          done()
        }
      }
    });

    /**
     * @tc.name   testWindow_StartAbility_Size_Location_0400
     * @tc.number SUB_BASIC_WMS_WINDOW_STARTABILITY_SIZE_LOCATION_0400
     * @tc.desc   testWindow_StartAbility_Size_Location_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindow_StartAbility_Size_Location_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindow_StartAbility_Size_Location_0400';
      console.log(caseName + 'begin');
      try{
        let windowClass: window.Window = windowStage.getMainWindowSync();
        let windowLimits = await windowClass.getWindowLimits();
        console.error(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`)
        let curMaxWidth = windowLimits.maxWidth;
        let curMinWidth = windowLimits.minWidth;
        let options1: StartOptions = {
          windowWidth: curMinWidth as number -10
        }
        console.error(caseName + ' start ability test1 begin.');
        let windowStageStart1: window.WindowStage = await startAbility(caseName, context, options1);
        let windowClass1 = windowStageStart1.getMainWindowSync();
        let windowRect1 = windowClass1.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect1: ' + JSON.stringify(windowRect1));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect1.width).assertEqual(displayInfo.width);
        } else {
          expect(Math.abs(windowRect1.width - (curMinWidth as number))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let options2: StartOptions = {
          windowWidth: curMinWidth as number
        }
        console.error(caseName + ' start ability test2 begin.');
        let windowStageStart2: window.WindowStage = await startAbility(caseName, context, options2);
        let windowClass2 = windowStageStart2.getMainWindowSync();
        let windowRect2 = windowClass2.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect2: ' + JSON.stringify(windowRect2));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect2.width).assertEqual(displayInfo.width);
        } else {
          expect(Math.abs(windowRect2.width-(curMinWidth as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let options3: StartOptions = {
          windowWidth: curMaxWidth as number
        }
        console.error(caseName + ' start ability test3 begin.');
        let windowStageStart3: window.WindowStage = await startAbility(caseName, context, options3);
        let windowClass3 = windowStageStart3.getMainWindowSync();
        let windowRect3 = windowClass3.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect3: ' + JSON.stringify(windowRect3));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect3.width).assertEqual(displayInfo.width);
        } else {
          expect(Math.abs(windowRect3.width-(curMaxWidth as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let options4: StartOptions = {
          windowWidth: curMaxWidth as number + 10
        }
        console.error(caseName + ' start ability test4 begin.');
        let windowStageStart4: window.WindowStage = await startAbility(caseName, context, options4);
        let windowClass4 = windowStageStart4.getMainWindowSync();
        let windowRect4 = windowClass4.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect4: ' + JSON.stringify(windowRect4));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect4.width).assertEqual(displayInfo.width);
        } else {
          expect(Math.abs(windowRect4.width-(curMaxWidth as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        done();
      } catch(err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.message!=null).assertTrue();
        if (err.code === 801) {
          done()
        } else {
          await terminateAbility(caseName);
          expect().assertFail()
          done()
        }
      }
    });

    /**
     * @tc.name   testWindow_StartAbility_Size_Location_0500
     * @tc.number SUB_BASIC_WMS_WINDOW_STARTABILITY_SIZE_LOCATION_0500
     * @tc.desc   testWindow_StartAbility_Size_Location_0500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindow_StartAbility_Size_Location_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindow_StartAbility_Size_Location_0500';
      console.log(caseName + 'begin');

      try{
        let windowClass: window.Window = windowStage.getMainWindowSync();
        let windowLimits = await windowClass.getWindowLimits();
        console.error(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`)
        let curMaxHeight = windowLimits.maxHeight;
        let curMinHeight = windowLimits.minHeight;
        let options1: StartOptions = {
          windowHeight: curMinHeight as number -10
        }
        console.error(caseName + ' start ability test1 begin.');
        let windowStageStart1: window.WindowStage = await startAbility(caseName, context, options1);
        let windowClass1 = windowStageStart1.getMainWindowSync();
        let windowRect1 = windowClass1.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect1: ' + JSON.stringify(windowRect1));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect1.height).assertEqual(displayInfo.height);
        } else {
          expect(Math.abs(windowRect1.height-(curMinHeight as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let options2: StartOptions = {
          windowHeight: curMinHeight as number
        }
        console.error(caseName + ' start ability test2 begin.');
        let windowStageStart2: window.WindowStage = await startAbility(caseName, context, options2);
        let windowClass2 = windowStageStart2.getMainWindowSync();
        let windowRect2 = windowClass2.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect2: ' + JSON.stringify(windowRect2));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect2.height).assertEqual(displayInfo.height);
        } else {
          expect(Math.abs(windowRect2.height-(curMinHeight as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let options3: StartOptions = {
          windowHeight: curMaxHeight as number
        }
        console.error(caseName + ' start ability test3 begin.');
        let windowStageStart3: window.WindowStage = await startAbility(caseName, context, options3);
        let windowClass3 = windowStageStart3.getMainWindowSync();
        let windowRect3 = windowClass3.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect3: ' + JSON.stringify(windowRect3));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect3.height).assertEqual(displayInfo.height);
        } else {
          expect(Math.abs(windowRect3.height-(curMaxHeight as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let options4: StartOptions = {
          windowHeight: curMaxHeight as number + 10
        }
        console.error(caseName + ' start ability test4 begin.');
        let windowStageStart4: window.WindowStage = await startAbility(caseName, context, options4);
        let windowClass4 = windowStageStart4.getMainWindowSync();
        let windowRect4 = windowClass4.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect4: ' + JSON.stringify(windowRect4));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect4.height).assertEqual(displayInfo.height);
        } else {
          expect(Math.abs(windowRect4.height-(curMaxHeight as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        done();
      } catch(err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.message!=null).assertTrue();
        if (err.code === 801) {
          done()
        } else {
          await terminateAbility(caseName);
          expect().assertFail()
          done()
        }
      }
    });

    /**
     * @tc.name   testWindow_StartAbility_Size_Location_0600
     * @tc.number SUB_BASIC_WMS_WINDOW_STARTABILITY_SIZE_LOCATION_0600
     * @tc.desc   testWindow_StartAbility_Size_Location_0600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWindow_StartAbility_Size_Location_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testWindow_StartAbility_Size_Location_0600';
      console.log(caseName + 'begin');
      try{
        let windowClass: window.Window = windowStage.getMainWindowSync();
        let windowLimits = await windowClass.getWindowLimits();
        console.error(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`)
        let curMaxHeight = windowLimits.maxHeight;
        let curMinHeight = windowLimits.minHeight;
        let curMaxWidth = windowLimits.maxWidth;
        let curMinWidth = windowLimits.minWidth;
        let options1: StartOptions = {
          windowHeight: curMinHeight as number -10,
          windowWidth: curMinWidth as number -10
        }
        console.error(caseName + ' start ability test1 begin.');
        let windowStageStart1: window.WindowStage = await startAbility(caseName, context, options1);
        let windowClass1 = windowStageStart1.getMainWindowSync();
        let windowRect1 = windowClass1.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect1: ' + JSON.stringify(windowRect1));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect1.height).assertEqual(displayInfo.height);
          expect(windowRect1.width).assertEqual(displayInfo.width);
        } else {
          expect(Math.abs(windowRect1.height-(curMinHeight as number))).assertLessOrEqual(1);
          expect(Math.abs(windowRect1.width-(curMinWidth as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let options2: StartOptions = {
          windowHeight: curMinHeight as number,
          windowWidth: curMinWidth as number
        }
        console.error(caseName + ' start ability test2 begin.');
        let windowStageStart2: window.WindowStage = await startAbility(caseName, context, options2);
        let windowClass2 = windowStageStart2.getMainWindowSync();
        let windowRect2 = windowClass2.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect2: ' + JSON.stringify(windowRect2));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect2.height).assertEqual(displayInfo.height);
          expect(windowRect2.width).assertEqual(displayInfo.width);
        } else {
          expect(Math.abs(windowRect2.height-(curMinHeight as number))).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-(curMinWidth as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let options3: StartOptions = {
          windowHeight: curMaxHeight as number,
          windowWidth: curMaxWidth as number
        }
        console.error(caseName + ' start ability test3 begin.');
        let windowStageStart3: window.WindowStage = await startAbility(caseName, context, options3);
        let windowClass3 = windowStageStart3.getMainWindowSync();
        let windowRect3 = windowClass3.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect3: ' + JSON.stringify(windowRect3));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect3.height).assertEqual(displayInfo.height);
          expect(windowRect3.width).assertEqual(displayInfo.width);
        } else {
          expect(Math.abs(windowRect3.height-(curMaxHeight as number))).assertLessOrEqual(1);
          expect(Math.abs(windowRect3.width-(curMaxWidth as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        let options4: StartOptions = {
          windowHeight: curMaxHeight as number + 10,
          windowWidth: curMaxWidth as number +10
        }
        console.error(caseName + ' start ability test4 begin.');
        let windowStageStart4: window.WindowStage = await startAbility(caseName, context, options4);
        let windowClass4 = windowStageStart4.getMainWindowSync();
        let windowRect4 = windowClass4.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect4: ' + JSON.stringify(windowRect4));

        if (isPCStatus == '' || isAutoWindow == 'false') {
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect4.height).assertEqual(displayInfo.height);
          expect(windowRect4.width).assertEqual(displayInfo.width);
        } else {
          expect(Math.abs(windowRect4.height-(curMaxHeight as number))).assertLessOrEqual(1);
          expect(Math.abs(windowRect4.width-(curMaxWidth as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);

        done();
      } catch(err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.message!=null).assertTrue();
        if (err.code === 801) {
          done()
        } else {
          await terminateAbility(caseName);
          expect().assertFail()
          done()
        }
      }
    });

    /**
     * @tc.name   testWindow_StartAbility_Size_Location_0700
     * @tc.number SUB_BASIC_WMS_WINDOW_STARTABILITY_SIZE_LOCATION_0700
     * @tc.desc   testWindow_StartAbility_Size_Location_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindow_StartAbility_Size_Location_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testWindow_StartAbility_Size_Location_0700';
      console.log(caseName + 'begin');
      try{
        let windowClass: window.Window = windowStage.getMainWindowSync();
        let windowLimits = await windowClass.getWindowLimits();
        console.error(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`)
        let curMaxHeight = windowLimits.maxHeight;
        let curMinHeight = windowLimits.minHeight;
        let curMaxWidth = windowLimits.maxWidth;
        let curMinWidth = windowLimits.minWidth;
        let displayDisplay1: display.Display = display.getDefaultDisplaySync()
        let displayRect1: display.Rect = await displayDisplay1.getAvailableArea();
        let availableTop1 = displayRect1.top
        console.error(`${caseName} availableTop1: ${availableTop1}`);
        let options1: StartOptions = {
          windowLeft: -10,
          windowTop: availableTop1+10,
          windowHeight: curMinHeight as number +10,
          windowWidth: curMinWidth as number +10
        }
        console.error(caseName + ' start ability test1 begin.');
        let windowStageStart1: window.WindowStage = await startAbility(caseName, context, options1);
        let windowClass1 = windowStageStart1.getMainWindowSync();
        let windowRect1 = windowClass1.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect1: ' + JSON.stringify(windowRect1));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect1.left).assertEqual(0);
          expect(windowRect1.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect1.height).assertEqual(displayInfo.height as number);
          expect(windowRect1.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect1.left - (-10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect1.top-(availableTop1 + 10 ))).assertLessOrEqual(1);
          expect(Math.abs(windowRect1.height-(curMinHeight as number + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect1.width-(curMinWidth as number  + 10))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay2: display.Display = display.getDefaultDisplaySync()
        let displayRect2: display.Rect = await displayDisplay2.getAvailableArea();
        let availableTop2 = displayRect2.top
        console.error(`${caseName} availableTop2: ${availableTop2}`);
        let options2: StartOptions = {
          windowLeft: 10,
          windowTop: availableTop2 - 10,
          windowHeight: curMinHeight as number + 10,
          windowWidth: curMinWidth as number + 10
        }
        console.error(caseName + ' start ability test2 begin.');
        let windowStageStart2: window.WindowStage = await startAbility(caseName, context, options2);
        let windowClass2 = windowStageStart2.getMainWindowSync();
        let windowRect2 = windowClass2.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect2: ' + JSON.stringify(windowRect2));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect2.left).assertEqual(0);
          expect(windowRect2.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect2.height).assertEqual(displayInfo.height as number);
          expect(windowRect2.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect2.left- 10)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-availableTop2)).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-(curMinHeight as number + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-(curMinWidth as number  + 10))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay3: display.Display = display.getDefaultDisplaySync()
        let displayRect3: display.Rect = await displayDisplay3.getAvailableArea();
        let availableTop3 = displayRect3.top
        console.error(`${caseName} availableTop3: ${availableTop3}`);
        let options3: StartOptions = {
          windowLeft: 10,
          windowTop: availableTop3 + 10,
          windowHeight: curMinHeight as number - 10,
          windowWidth: curMinWidth as number + 10
        }
        console.error(caseName + ' start ability test3 begin.');
        let windowStageStart3: window.WindowStage = await startAbility(caseName, context, options3);
        let windowClass3 = windowStageStart3.getMainWindowSync();
        let windowRect3 = windowClass3.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect3: ' + JSON.stringify(windowRect3));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect3.left).assertEqual(0);
          expect(windowRect3.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect3.height).assertEqual(displayInfo.height as number);
          expect(windowRect3.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect3.left- 10)).assertLessOrEqual(1);
          expect(Math.abs(windowRect3.top-(availableTop3 + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect3.height-(curMinHeight as number))).assertLessOrEqual(1);
          expect(Math.abs(windowRect3.width-(curMinWidth as number  + 10))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay4: display.Display = display.getDefaultDisplaySync()
        let displayRect4: display.Rect = await displayDisplay4.getAvailableArea();
        let availableTop4 = displayRect4.top
        console.error(`${caseName} availableTop4: ${availableTop4}`);
        let options4: StartOptions = {
          windowLeft: 10,
          windowTop: availableTop4 + 10,
          windowHeight: curMinHeight as number + 10,
          windowWidth: curMinWidth as number - 10
        }
        console.error(caseName + ' start ability test4 begin.');
        let windowStageStart4: window.WindowStage = await startAbility(caseName, context, options4);
        let windowClass4 = windowStageStart4.getMainWindowSync();
        let windowRect4 = windowClass4.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect4: ' + JSON.stringify(windowRect4));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect4.left).assertEqual(0);
          expect(windowRect4.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect4.height).assertEqual(displayInfo.height as number);
          expect(windowRect4.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect4.left- 10)).assertLessOrEqual(1);
          expect(Math.abs(windowRect4.top-(availableTop4 + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect4.height-(curMinHeight as number + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect4.width-(curMinWidth as number))).assertLessOrEqual(1);
        }
        await terminateAbility(caseName);
        done();
      } catch(err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.message!=null).assertTrue();
        if (err.code === 801) {
          done()
        } else {
          await terminateAbility(caseName);
          expect().assertFail()
          done()
        }
      }
    });

    /**
     * @tc.name   testWindow_StartAbility_Size_Location_0800
     * @tc.number SUB_BASIC_WMS_WINDOW_STARTABILITY_SIZE_LOCATION_0800
     * @tc.desc   testWindow_StartAbility_Size_Location_0800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWindow_StartAbility_Size_Location_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName: string = 'testWindow_StartAbility_Size_Location_0800';
      console.log(caseName + 'begin');

      try{
        let windowClass: window.Window = windowStage.getMainWindowSync();
        let windowLimits = await windowClass.getWindowLimits();
        console.error(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`)
        let curMaxHeight = windowLimits.maxHeight;
        let curMinHeight = windowLimits.minHeight;
        let curMaxWidth = windowLimits.maxWidth;
        let curMinWidth = windowLimits.minWidth;
        let displayDisplay1: display.Display = display.getDefaultDisplaySync()
        let displayRect1: display.Rect = await displayDisplay1.getAvailableArea();
        let availableTop1 = displayRect1.top
        console.error(`${caseName} availableTop1: ${availableTop1}`);
        let options1: StartOptions = {
          windowLeft: -10,
          windowTop: availableTop1 - 10,
          windowHeight: curMinHeight as number +10,
          windowWidth: curMinWidth as number +10
        }
        console.error(caseName + ' start ability test1 begin.');
        let windowStageStart1: window.WindowStage = await startAbility(caseName, context, options1);
        let windowClass1 = windowStageStart1.getMainWindowSync();
        let windowRect1 = windowClass1.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect1: ' + JSON.stringify(windowRect1));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect1.left).assertEqual(0);
          expect(windowRect1.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect1.height).assertEqual(displayInfo.height as number);
          expect(windowRect1.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect1.left- (-10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect1.top-availableTop1)).assertLessOrEqual(1);
          expect(Math.abs(windowRect1.height-(curMinHeight as number + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect1.width-(curMinWidth as number+10))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay2: display.Display = display.getDefaultDisplaySync()
        let displayRect2: display.Rect = await displayDisplay2.getAvailableArea();
        let availableTop2 = displayRect2.top
        console.error(`${caseName} availableTop2: ${availableTop2}`);
        let options2: StartOptions = {
          windowLeft: -10,
          windowTop: availableTop2 + 10,
          windowHeight: curMinHeight as number - 10,
          windowWidth: curMinWidth as number + 10
        }
        console.error(caseName + ' start ability test2 begin.');
        let windowStageStart2: window.WindowStage = await startAbility(caseName, context, options2);
        let windowClass2 = windowStageStart2.getMainWindowSync();
        let windowRect2 = windowClass2.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect2: ' + JSON.stringify(windowRect2));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect2.left).assertEqual(0);
          expect(windowRect2.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect2.height).assertEqual(displayInfo.height as number);
          expect(windowRect2.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect2.left- (-10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.top-(availableTop2 + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.height-(curMinHeight as number))).assertLessOrEqual(1);
          expect(Math.abs(windowRect2.width-(curMinWidth as number + 10))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay3: display.Display = display.getDefaultDisplaySync()
        let displayRect3: display.Rect = await displayDisplay3.getAvailableArea();
        let availableTop3 = displayRect3.top
        console.error(`${caseName} availableTop3: ${availableTop3}`);
        let options3: StartOptions = {
          windowLeft: -10,
          windowTop: availableTop3 + 10,
          windowHeight: curMinHeight as number + 10,
          windowWidth: curMinWidth as number - 10
        }
        console.error(caseName + ' start ability test3 begin.');
        let windowStageStart3: window.WindowStage = await startAbility(caseName, context, options3);
        let windowClass3 = windowStageStart3.getMainWindowSync();
        let windowRect3 = windowClass3.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect3: ' + JSON.stringify(windowRect3));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect3.left).assertEqual(0);
          expect(windowRect3.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect3.height).assertEqual(displayInfo.height as number);
          expect(windowRect3.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect3.left - (-10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect3.top-(availableTop3 + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect3.height-(curMinHeight as number + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect3.width- (curMinWidth as number))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay4: display.Display = display.getDefaultDisplaySync()
        let displayRect4: display.Rect = await displayDisplay4.getAvailableArea();
        let availableTop4 = displayRect4.top
        console.error(`${caseName} availableTop4: ${availableTop4}`);
        let options4: StartOptions = {
          windowLeft: 10,
          windowTop: availableTop4 - 10,
          windowHeight: curMinHeight as number - 10,
          windowWidth: curMinWidth as number + 10
        }
        console.error(caseName + ' start ability test4 begin.');
        let windowStageStart4: window.WindowStage = await startAbility(caseName, context, options4);
        let windowClass4 = windowStageStart4.getMainWindowSync();
        let windowRect4 = windowClass4.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect4: ' + JSON.stringify(windowRect4));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect4.left).assertEqual(0);
          expect(windowRect4.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect4.height).assertEqual(displayInfo.height as number);
          expect(windowRect4.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect4.left-10)).assertLessOrEqual(1);
          expect(Math.abs(windowRect4.top-availableTop4)).assertLessOrEqual(1);
          expect(Math.abs(windowRect4.height-(curMinHeight as number))).assertLessOrEqual(1);
          expect(Math.abs(windowRect4.width-(curMinWidth as number + 10))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay5: display.Display = display.getDefaultDisplaySync()
        let displayRect5: display.Rect = await displayDisplay5.getAvailableArea();
        let availableTop5 = displayRect5.top
        console.error(`${caseName} availableTop5: ${availableTop5}`);
        let options5: StartOptions = {
          windowLeft: 10,
          windowTop: availableTop5 - 10,
          windowHeight: curMinHeight as number + 10,
          windowWidth: curMinWidth as number - 10
        }
        console.error(caseName + ' start ability test5 begin.');
        let windowStageStart5: window.WindowStage = await startAbility(caseName, context, options5);
        let windowClass5 = windowStageStart5.getMainWindowSync();
        let windowRect5 = windowClass5.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect5: ' + JSON.stringify(windowRect5));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect5.left).assertEqual(0);
          expect(windowRect5.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect5.height).assertEqual(displayInfo.height as number);
          expect(windowRect5.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect5.left-10)).assertLessOrEqual(1);
          expect(Math.abs(windowRect5.top-availableTop5)).assertLessOrEqual(1);
          expect(Math.abs(windowRect5.height-(curMinHeight as number + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect5.width-(curMinWidth as number))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        let displayDisplay6: display.Display = display.getDefaultDisplaySync()
        let displayRect6: display.Rect = await displayDisplay6.getAvailableArea();
        let availableTop6 = displayRect6.top
        console.error(`${caseName} availableTop6: ${availableTop6}`);
        let options6: StartOptions = {
          windowLeft: 10,
          windowTop: availableTop6 + 10,
          windowHeight: curMinHeight as number - 10,
          windowWidth: curMinWidth as number - 10
        }
        console.error(caseName + ' start ability test5 begin.');
        let windowStageStart6: window.WindowStage = await startAbility(caseName, context, options6);
        let windowClass6 = windowStageStart6.getMainWindowSync();
        let windowRect6 = windowClass6.getWindowProperties().windowRect;
        console.info(caseName + 'getWindowProperties.windowRect6: ' + JSON.stringify(windowRect6));
        if (isPCStatus == '' || isAutoWindow == 'false') {
          expect(windowRect6.left).assertEqual(0);
          expect(windowRect6.top).assertEqual(0);
          let displayInfo = display.getDefaultDisplaySync();
          expect(windowRect6.height).assertEqual(displayInfo.height as number);
          expect(windowRect6.width).assertEqual(displayInfo.width as number);
        } else {
          expect(Math.abs(windowRect6.left-10)).assertLessOrEqual(1);
          expect(Math.abs(windowRect6.top-(availableTop6 + 10))).assertLessOrEqual(1);
          expect(Math.abs(windowRect6.width-(curMinWidth as number))).assertLessOrEqual(1);
          expect(Math.abs(windowRect6.height-(curMinHeight as number))).assertLessOrEqual(1);
        }

        await terminateAbility(caseName);

        done();
      } catch(err) {
        console.error(`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.message!=null).assertTrue();
        if (err.code === 801) {
          done()
        } else {
          await terminateAbility(caseName);
          expect().assertFail()
          done()
        }
      }
    });

  })
}