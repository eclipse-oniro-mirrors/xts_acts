/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll,afterAll,it, expect , TestType, Size, Level} from '@ohos/hypium';
import ohosWindow from '@ohos.window';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import settings from '@ohos.settings';
import window from '@ohos.window';

function expectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function, code: number) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  if (error.code == code) {
    expect(TRUE_FLAG).assertTrue();
  }
  done();
}

function unexpectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  expect(TRUE_FLAG).assertFail();
  done();
}

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise < string > (resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

export default function windowEventTest() {
  describe('windowEvent_test', () => {
    console.log('describe window_api_test start!!!')
    let systemWindowTypeArr: Array<string> = [];
    let systemWindowTypeDicArr: Array<string> = [];
    let systemWindowTypeDic: Record<string, number> = {
      'TYPE_FLOAT': 8,
    }
    let context: common.UIAbilityContext;
    let windowStage: ohosWindow.WindowStage;
    let windowClass: window.Window;
    let isPCStatus:string = '';
    let isAutoWindow:string = '';
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      windowClass = windowStage.getMainWindowSync();
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType.TYPE_FLOAT));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsUnittest beforeAll systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      isPCStatus = settings.getValueSync(context,'isStatusBarExist','',settings.domainName.USER_PROPERTY)
      isAutoWindow = settings.getValueSync(context,'window_pcmode_switch_status','',settings.domainName.USER_PROPERTY);
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
    })
    afterAll(async () => {
      
      await windowClass.setPreferredOrientation(window.Orientation.PORTRAIT);
    })
/**
     * @tc.number    : SUB_BASIC_WMS_TOUCHOUTSIDE_0100
     * @tc.name      : testTouchOutSide_0100
     * @tc.desc      : 验证子窗在主窗内，点击子窗，主窗可监听到touchoutside回调
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testTouchOutSide_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTouchOutSide_0100 ';
      console.log(caseName + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      let subWindowClass = await windowStage.createSubWindow('testTouchOutSide_0100');
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await sleep(1000);
      try {

        let timer = 0;

        let windowLimits = subWindowClass.getWindowLimits();
        console.info(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        await subWindowClass.resize(windowLimits.minWidth as number, windowLimits.minHeight as number);
        await sleep(1000);
        let displayInfo = display.getDefaultDisplaySync();
        console.info(`${caseName} :display.getDefaultDisplaySync. info: ${JSON.stringify(displayInfo)}`);
        await subWindowClass.moveWindowTo(displayInfo.width/2, displayInfo.height/2);

        await subWindowClass.showWindow();
        await sleep(1000);
        let windowProperties = subWindowClass.getWindowProperties();
        console.log(`${caseName} windowProperties: ${JSON.stringify(windowProperties)}`);
        const callback = async () => {
          timer++;
          console.log(`${caseName} timer: ${timer}`);
          expect(timer).assertEqual(1);
          await sleep(300);
          mainWindow.off('touchOutside');

          await subWindowClass.destroyWindow();
          done();
        }
        mainWindow.on('touchOutside', callback);
        let driver: Driver = Driver.create();
        await sleep(200);
        await driver.click(Math.round(windowProperties.windowRect.left as number+10), Math.round(windowProperties.windowRect.top as number+10));
        await sleep(300);

      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await subWindowClass.destroyWindow();
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    /**
     * @tc.number : SUB_BASIC_WMS_TOUCHOUTSIDE_TOPBAR_0100
     * @tc.name : testTouchOutSide_TopBar_0100
     * @tc.desc : 验证点击窗口范围内的topbar区域不触发touchOutside回调
     * @tc.size : MediumTest
     * @tc.type : Function
     * @tc.level : Level 0
     */
    it('testTouchOutSide_TopBar_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'testTouchOutSide_TopBar_0100 ';
      console.log(caseName + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      let subWindowClass = await windowStage.createSubWindow('testTouchOutSide_TopBar_0100');
      await subWindowClass.setUIContent('testability/pages/First/index2');
      await sleep(1000);
      let timer = 0;
      try {
        let windowLimits = subWindowClass.getWindowLimits();
        console.info(`${caseName} windowLimits: ${JSON.stringify(windowLimits)}`);
        await subWindowClass.resize(windowLimits.minWidth as number+200, windowLimits.minHeight as number);
        await subWindowClass.moveWindowTo(200, 0);
        await subWindowClass.showWindow();
        await sleep(1000);
        
        const callback = () => {
          timer++;
          console.log(`${caseName} timer: ${timer}`);
        }
        subWindowClass.on('touchOutside', callback);
        await mainWindow.setPreferredOrientation(window.Orientation.LANDSCAPE);
        await mainWindow.setSpecificSystemBarEnabled('status', false);
        await sleep(3000);
        let windowProperties = subWindowClass.getWindowProperties();
        console.log(`${caseName} windowProperties: ${JSON.stringify(windowProperties)}`);
        let driver: Driver = Driver.create();
        await sleep(200);
        // await driver.click(Math.round((windowLimits.minWidth as number+200)/2), 0);
        await driver.click(Math.round((windowProperties.windowRect.left as number+10)), 0);
        await sleep(300);
        console.log(`${caseName} timer1: ${timer}`);
        expect(timer).assertEqual(0);
        // await driver.click(((windowLimits.minWidth as number+200)+10) , 0);
        await driver.click(((windowProperties.windowRect.left as number)-10) , 0);
        await sleep(300);
        console.log(`${caseName} timer2: ${timer}`);
        expect(timer).assertEqual(1);
        await mainWindow.setPreferredOrientation(window.Orientation.PORTRAIT);
        await sleep(1000);
        subWindowClass.off('touchOutside');
        await subWindowClass.destroyWindow();
        await mainWindow.setSpecificSystemBarEnabled('status', true);
        done();
      } catch (e) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        await subWindowClass.destroyWindow();
        await mainWindow.setSpecificSystemBarEnabled('status', true);
        if (e.code === 801) {
          done()
        } else {
          expect().assertFail();
          done()
        }
      }
    });

    
  })
}