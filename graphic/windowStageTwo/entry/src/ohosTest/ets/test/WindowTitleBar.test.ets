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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError, settings } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { ConfigurationConstant, StartOptions, bundleManager } from '@kit.AbilityKit';
import { ColorMetrics } from '@kit.ArkUI';
import MyAbilityStage from '../myabilitystage/MyAbilityStage';
import display from '@ohos.display'

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

async function assertMaximizeComponentExist() {
  let driver = Driver.create()
  let test = true
  await driver.assertComponentExist(ON.id('EnhanceMaximizeBtn')).then(() => {
    test = true
  }).catch((err: BusinessError) => {
    if (err.code == 17000003) {
      test = false
    }
  })
  return test
}

export default function windowTitleBarTest() {
  describe('windowTitleBarTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    let isPCStatus: string = '';
    let isFreeWindowMode = false;
    let driver: Driver;
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      driver = Driver.create();
    });
    beforeEach(() => {
    });
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
    });
    /**
     * @tc.name   test_setStatusBarColor_401
     * @tc.number SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_0100
     * @tc.desc   setStatusBarColor接口验证401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setStatusBarColor_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setStatusBarColor_401!'
      try {
        let mainWindowClass = windowStage.getMainWindowSync();
        let promise = mainWindowClass.setStatusBarColor(null);
        promise.then(() => {
          console.info(`${message} succeed setStatusBarColor`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   test_setStatusBarColor_801
     * @tc.number SUB_BASIC_WMS_SetStatusBarColor_ErrorCode_0200
     * @tc.desc   setStatusBarColor接口验证801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setStatusBarColor_801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      const message = 'test_setStatusBarColor_801!'
      try {
        let mainWindowClass = windowStage.getMainWindowSync();
        let promise = mainWindowClass.setStatusBarColor(ColorMetrics.rgba(1, 1, 1));
        promise.then(() => {
          console.info(`${message} succeed setStatusBarColor`);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${message} promise Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
          expect(err.code).assertEqual(801);
          done();
        })
      } catch (err) {
        console.error(`${message} Failed to setStatusBarColor, Cause code ${err.code}, message ${err.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_null
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0100
     * @tc.desc   test_setDecorButtonStyle_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_null';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.setDecorButtonStyle(null);
        console.info(msgStr+ ' Succeeded in setting the style of button.');
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_getDecorButtonStyle_undifined
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0200
     * @tc.desc   test_getDecorButtonStyle_undifined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_getDecorButtonStyle_undifined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_getDecorButtonStyle_undifined';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(28);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(12);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(20);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_colorMode_-2
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0300
     * @tc.desc   test_setDecorButtonStyle_colorMode_-2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_colorMode_-2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_-2';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
        try {
          let colorMode : ConfigurationConstant.ColorMode = -2;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
          };
          windowClass.setDecorButtonStyle(style);
          console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
          expect(false).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
          if(exception.code = 801){
            done();
          }else if(exception.code = 401){
            expect(true).assertTrue();
            done();
          }else {
            expect(false).assertTrue();
            done();
          }
        }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_colorMode_-1
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0400
     * @tc.desc   test_setDecorButtonStyle_colorMode_-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_colorMode_-1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_-1';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_colorMode_1
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0500
     * @tc.desc   test_setDecorButtonStyle_colorMode_1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_colorMode_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_1';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_colorMode_0
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0600
     * @tc.desc   test_setDecorButtonStyle_colorMode_0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_colorMode_0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_0';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0700
     * @tc.desc   test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          buttonBackgroundSize: 10,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0800
     * @tc.desc   test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          buttonBackgroundSize: 50,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0900
     * @tc.desc   test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          buttonBackgroundSize: 20,
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(20);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1000
     * @tc.desc   test_setDecorButtonStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 20
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(20);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_12
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1100
     * @tc.desc   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_12';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 12
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(12);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_24
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1200
     * @tc.desc   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_24';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 24
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(24);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_7
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1300
     * @tc.desc   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_7';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 7
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_25
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1400
     * @tc.desc   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_25';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 25
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_20
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1500
     * @tc.desc   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_20';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 20
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_18.5
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1600
     * @tc.desc   test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_18.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_18.5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_18.5';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 18.5
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_8
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1700
     * @tc.desc   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_8';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          closeButtonRightMargin: 8
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(8);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_22
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1800
     * @tc.desc   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_22';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          closeButtonRightMargin: 22
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(22);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_5
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1900
     * @tc.desc   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_5';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          closeButtonRightMargin: 5
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_23
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2000
     * @tc.desc   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_23';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          closeButtonRightMargin: 23
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        expect(false).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else if(exception.code = 401){
          expect(true).assertTrue();
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_20
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2100
     * @tc.desc   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_20';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          closeButtonRightMargin: 20
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(20);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_18.5
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2200
     * @tc.desc   test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_18.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_18.5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_18.5';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          closeButtonRightMargin: 18.5
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_spacingBetweenButtons_closeButtonRightMargin
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2300
     * @tc.desc   test_setDecorButtonStyle_spacingBetweenButtons_closeButtonRightMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_closeButtonRightMargin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_spacingBetweenButtons_closeButtonRightMargin';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_colorMode_spacingBetweenButtons_closeButtonRightMargin
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2400
     * @tc.desc   test_setDecorButtonStyle_colorMode_spacingBetweenButtons_closeButtonRightMargin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_colorMode_spacingBetweenButtons_closeButtonRightMargin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_colorMode_spacingBetweenButtons_closeButtonRightMargin';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          spacingBetweenButtons: 23,
          closeButtonRightMargin: 21
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(23);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(21);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_stylenull
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2500
     * @tc.desc   test_setDecorButtonStyle_stylenull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_stylenull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_stylenull';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        let style1: window.DecorButtonStyle = {
        };
        windowClass.setDecorButtonStyle(style1);
        console.info(msgStr+ ' Succeeded in setting the style1 of button. Data: ' + JSON.stringify(style1));
        let decorButtonStyle1 = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style1 of button. Data: ' + JSON.stringify(decorButtonStyle1));
        expect(decorButtonStyle1.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle1.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle1.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle1.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_setTitleAndDockHoverShown_hide
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2600
     * @tc.desc   test_setDecorButtonStyle_setTitleAndDockHoverShown_hide
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_setTitleAndDockHoverShown_hide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_setTitleAndDockHoverShown_hide';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        windowClass.setTitleAndDockHoverShown(false, false);
        let decorButtonStyle1 = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle1.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle1.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle1.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle1.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_setTitleAndDockHoverShown_show
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2700
     * @tc.desc   test_setDecorButtonStyle_setTitleAndDockHoverShown_show
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setDecorButtonStyle_setTitleAndDockHoverShown_show', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_setTitleAndDockHoverShown_show';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        windowClass.setTitleAndDockHoverShown(true, true);
        let decorButtonStyle1 = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle1.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle1.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle1.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle1.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_on_windowTitleButtonRectChange
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2800
     * @tc.desc   test_setDecorButtonStyle_on_windowTitleButtonRectChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_on_windowTitleButtonRectChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_on_windowTitleButtonRectChange';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        windowClass.setDecorButtonStyle(style);
        windowClass.on('windowTitleButtonRectChange', (titleButtonRect) => {
          console.info(msgStr+ ` Succeeded in enabling the listener for window title buttons area changes. Data: ` + JSON.stringify(titleButtonRect));
          expect(titleButtonRect.right).assertEqual(0);
          windowClass.off('windowTitleButtonRectChange');
          done();
        });
        windowClass.off('windowTitleButtonRectChange');
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          windowClass.off('windowTitleButtonRectChange');
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_setWindowTitleButtonVisible_true_true
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2900
     * @tc.desc   test_setDecorButtonStyle_setWindowTitleButtonVisible_true_true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_setWindowTitleButtonVisible_true_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_setWindowTitleButtonVisible_true_true';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      let driver = await Driver.create();
      let windowPoint = windowClass.getWindowProperties().windowRect;
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        windowClass.setWindowTitleButtonVisible(true, true);
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_setWindowTitleButtonVisible_false_false
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3000
     * @tc.desc   test_setDecorButtonStyle_setWindowTitleButtonVisible_false_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_setWindowTitleButtonVisible_false_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_setWindowTitleButtonVisible_false_false';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      let driver = await Driver.create();
      let windowPoint = windowClass.getWindowProperties().windowRect;
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        windowClass.setWindowTitleButtonVisible(false, false);
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_setWindowTitleButtonVisible_true_false
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3100
     * @tc.desc   test_setDecorButtonStyle_setWindowTitleButtonVisible_true_false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_setWindowTitleButtonVisible_true_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_setWindowTitleButtonVisible_true_false';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      let driver = await Driver.create();
      let windowPoint = windowClass.getWindowProperties().windowRect;
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        windowClass.setWindowTitleButtonVisible(true, false);
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setWindowDecorHeight_setDecorButtonStyle
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3200
     * @tc.desc   test_setWindowDecorHeight_setDecorButtonStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowDecorHeight_setDecorButtonStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setWindowDecorHeight_setDecorButtonStyle';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      let driver = await Driver.create();
      let windowPoint = windowClass.getWindowProperties().windowRect;
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        let height = 50;
        windowClass.setWindowDecorHeight(height);
        console.info(msgStr+ `Succeeded in setting the height of window decor: ${height}`);
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_setWindowDecorHeight
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3300
     * @tc.desc   test_setDecorButtonStyle_setWindowDecorHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_setWindowDecorHeight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_setWindowDecorHeight';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      let driver = await Driver.create();
      let windowPoint = windowClass.getWindowProperties().windowRect;
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        let height = 50;
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        windowClass.setWindowDecorHeight(height);
        console.info(msgStr+ `Succeeded in setting the height of window decor: ${height}`);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });
    /**
     * @tc.name   test_setDecorButtonStyle_30_setWindowDecorHeight_20
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3400
     * @tc.desc   test_setDecorButtonStyle_30_setWindowDecorHeight_20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setDecorButtonStyle_30_setWindowDecorHeight_20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_30_setWindowDecorHeight_20';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      let driver = await Driver.create();
      let windowPoint = windowClass.getWindowProperties().windowRect;
      try {
        let colorMode : ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
        let style: window.DecorButtonStyle = {
          colorMode: colorMode,
          buttonBackgroundSize: 30,
          spacingBetweenButtons: 20,
          closeButtonRightMargin: 18
        };
        let height = 20;
        windowClass.setDecorButtonStyle(style);
        console.info(msgStr+ ' Succeeded in setting the style of button. Data: ' + JSON.stringify(style));
        let decorButtonStyle = windowClass.getDecorButtonStyle();
        console.info(msgStr+ ' Succeeded in getting the style of button. Data: ' + JSON.stringify(decorButtonStyle));
        expect(decorButtonStyle.colorMode).assertEqual(ConfigurationConstant.ColorMode.COLOR_MODE_DARK);
        expect(decorButtonStyle.buttonBackgroundSize).assertEqual(30);
        expect(decorButtonStyle.spacingBetweenButtons).assertEqual(20);
        expect(decorButtonStyle.closeButtonRightMargin).assertEqual(18);
        windowClass.setWindowDecorHeight(height);
        console.info(msgStr+ `Succeeded in setting the height of window decor: ${height}`);
        done();
      } catch (exception) {
        console.error(msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
        if(exception.code = 801){
          done();
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.name   test_setWindowTitle_null
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_TITLE_0100
     * @tc.desc   test_setWindowTitle_null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowTitle_null', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_null';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        mainWindow.setWindowTitle(null).then(() => {
          console.info(`${caseName} :Succeeded in setting the window title.`);
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          expect(true).assertTrue();
          done();
        }else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_setWindowTitle_no_title
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_TITLE_0200
     * @tc.desc   test_setWindowTitle_no_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowTitle_no_title', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_no_title';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        let options : window.SubWindowOptions = {
          title: 'test_setWindowTitle_no_title',
          decorEnabled: false,
          isModal: false
        };
        windowStage.createSubWindowWithOptions('test_setWindowTitle_no_title', options).then(async (data) => {
          console.info(`${caseName} :Succeeded in creating the subwindow. Data:  `+ JSON.stringify(data));
          await data.setUIContent('testability/pages/First/index2');
          await data.showWindow();
          data.setWindowTitle('subWindowTitle').then(() => {
            console.info(`${caseName} :Succeeded in setting the window title.`);
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
            await data.destroyWindow();
            if(err.code == 801){
              done();
            }else {
              expect(false).assertTrue();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 1300002){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_setWindowTitle_window_destroy
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_TITLE_0300
     * @tc.desc   test_setWindowTitle_window_destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowTitle_window_destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_window_destroy';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        let promise1 = windowStage.createSubWindow('test_setWindowTitle_window_destroy');
        promise1.then(async (data) => {
          let subWindowClass = data;
          console.info(caseName+ ' Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await data.setUIContent('testability/pages/First/index2');
          await data.showWindow();
          await data.destroyWindow();
          data.setWindowTitle('subWindowTitle').then(() => {
            console.info(`${caseName} :Succeeded in setting the window title.`);
            expect().assertFail();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
            if(err.code == 801){
              done();
            }else {
              expect(err.code).assertEqual(1300002);
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_setWindowTitle_mainWindow
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_TITLE_0400
     * @tc.desc   test_setWindowTitle_mainWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setWindowTitle_mainWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        mainWindow.setWindowTitle('test_setWindowTitle_mainWindow').then(() => {
          console.info(`${caseName} :Succeeded in setting the window title.`);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else if(err.code == 1300002){
            done();
          }
          else {
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   test_setWindowTitle_subWindow_title
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_TITLE_0500
     * @tc.desc   test_setWindowTitle_subWindow_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowTitle_subWindow_title', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_subWindow_title';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try{
        let options : window.SubWindowOptions = {
          title: 'test_setWindowTitle_subWindow_title',
          decorEnabled: true,
          isModal: false
        };
        windowStage.createSubWindowWithOptions('test_setWindowTitle_subWindow_title', options).then(async (data) => {
          console.info(`${caseName} :Succeeded in creating the subwindow. Data:  `+ JSON.stringify(data));
          await data.setUIContent('testability/pages/First/index2');
          await data.showWindow();
          data.setWindowTitle('test_setWindowTitle_subWindow_title1').then(async () => {
            console.info(`${caseName} :Succeeded in setting the window title1.`);
            await data.minimize();
            data.setWindowTitle('test_setWindowTitle_subWindow_title2');
            await data.showWindow();
            await data.destroyWindow();
            expect(true).assertTrue();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
            await data.destroyWindow();
            if(err.code == 801){
              done();
            }else if(err.code == 1300002){
              done();
            }
            else {
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 1300002){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_setWindowTitle_dialogWindow_title
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_TITLE_0600
     * @tc.desc   test_setWindowTitle_dialogWindow_title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_setWindowTitle_dialogWindow_title', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_dialogWindow_title';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try{
        let config: window.Configuration = {
          name: "test",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context,
          decorEnabled:true,
          title:'dialog Window'
        };
        let promise1 = window.createWindow(config);
        promise1.then(async (data) => {
          console.info(`${caseName} :Succeeded in creating the dialogwindow. Data:  `+ JSON.stringify(data));
          await data.setUIContent('testability/pages/First/index2');
          await data.showWindow();
          data.setWindowTitle('test_setWindowTitle_dialogWindow_title').then(async () => {
            console.info(`${caseName} :Succeeded in setting the window title.`);
            await data.destroyWindow();
            expect(true).assertTrue();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
            await data.destroyWindow();
            if(err.code == 801){
              done();
            }else if(err.code == 1300002){
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   test_setWindowTitle_mainWindow_hide_titlebar
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_TITLE_0700
     * @tc.desc   test_setWindowTitle_mainWindow_hide_titlebar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setWindowTitle_mainWindow_hide_titlebar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_mainWindow_hide_titlebar';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        mainWindow.setWindowDecorVisible(false);
        mainWindow.setWindowTitle('test_setWindowTitle_mainWindow').then(() => {
          console.info(`${caseName} :Succeeded in setting the window title.`);
          mainWindow.setWindowDecorVisible(true);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else if(err.code == 1300002){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 801){
          done();
        }else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_setWindowTitle_mainWindow_Too_long_parameter
     * @tc.number SUB_BASIC_WMS_SET_WINDOW_TITLE_0800
     * @tc.desc   test_setWindowTitle_mainWindow_Too_long_parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_setWindowTitle_mainWindow_Too_long_parameter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_mainWindow_Too_long_parameter';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        mainWindow.setWindowTitle('test_setWindowTitle_mainWindow_Too_long_parameter test_setWindowTitle_mainWindow_Too_long_parameter test_setWindowTitle_mainWindow_Too_long_parameter').then(() => {
          console.info(`${caseName} :Succeeded in setting the window title.`);
          expect(true).assertTrue();
          mainWindow.setWindowTitle('test label');
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else if(err.code == 1300002){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      }catch(err){
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 801){
          done();
        }else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   test_getWindowDecorVisible_1300002
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_getWindowDecorVisible_0100
     * @tc.desc   test_getWindowDecorVisible_1300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("test_getWindowDecorVisible_1300002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "test_getWindowDecorVisible_1300002";
      console.log(msgStr + "begin");
      let subWindowClass: window.Window;
      try {
        let promise = windowStage.createSubWindow('test_getWindowDecorVisible_1300002');
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.destroyWindow();
          subWindowClass.getWindowDecorVisible();
          expect(false).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to getWindowDecorVisible. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持');
            done();
          } else if(err.code == 1300002){
            expect(true).assertTrue();
            done();
          }else {
            console.log(msgStr + 'Failed to setWindowMask');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        console.log(msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   test_getWindowDecorVisible_subWindow
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_getWindowDecorVisible_0200
     * @tc.desc   test_getWindowDecorVisible_subWindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_getWindowDecorVisible_subWindow", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "test_getWindowDecorVisible_subWindow";
      console.log(msgStr + "begin");
      let subWindowClass: window.Window;
      let options: window.SubWindowOptions = {
        title: 'testDialogTargetTouch_OnSubWindowWithOps',
        decorEnabled: true
      };
      let isVisible:boolean = false;
      try {
        let promise = windowStage.createSubWindowWithOptions('test_getWindowDecorVisible_subWindow',options);
        promise.then(async (data) => {
          subWindowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await subWindowClass.setUIContent('testability/pages/Index2');
          await subWindowClass.showWindow();
          await sleep(300);
          isVisible =  subWindowClass.getWindowDecorVisible();
          console.info(msgStr + 'Succeeded in getWindowDecorVisible. Data: ' + isVisible);
          if(!isFreeWindowMode){
            expect(isVisible).assertEqual(false);
          }else{
            expect(isVisible).assertEqual(true);
          }
          subWindowClass.setWindowDecorVisible(false);
          isVisible =  subWindowClass.getWindowDecorVisible();
          console.info(msgStr + 'Succeeded in getWindowDecorVisible. Data: ' + isVisible);
          expect(isVisible).assertEqual(false);
          await subWindowClass.destroyWindow();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(msgStr + `Failed to getWindowDecorVisible. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.log(msgStr + '此设备不支持');
            done();
          } else if(err.code == 1300002){
            done();
          }else {
            console.log(msgStr + 'Failed to setWindowMask');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (error) {
        console.log(msgStr + 'Failed. Cause code:' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   testSetDecorButtonStyle_buttonIconSize_0100
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3500
     * @tc.desc   testSetDecorButtonStyle_buttonIconSize_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSetDecorButtonStyle_buttonIconSize_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testSetDecorButtonStyle_buttonIconSize_0100";
      console.log(msgStr + "begin");
      let windowClass = windowStage.getMainWindowSync();
      try {
        let param: window.DecorButtonStyle = {
          buttonIconSize: 15
        }
        windowClass.setDecorButtonStyle(param);
        console.error(`${msgStr} setDecorButtonStyle success.`);
      } catch (error) {
        console.error(msgStr + ' Failed. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          expect(error.code).assertEqual(401);
          let result = windowClass.getDecorButtonStyle();
          console.log(`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
          expect(result.buttonIconSize).assertEqual(20);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetDecorButtonStyle_buttonIconSize_0200
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3600
     * @tc.desc   testSetDecorButtonStyle_buttonIconSize_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSetDecorButtonStyle_buttonIconSize_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testSetDecorButtonStyle_buttonIconSize_0200";
      console.log(msgStr + "begin");
      let windowClass = windowStage.getMainWindowSync();
      try {
        let param: window.DecorButtonStyle = {
          buttonIconSize: 25
        }
        windowClass.setDecorButtonStyle(param);
        console.error(`${msgStr} setDecorButtonStyle success.`);
      } catch (error) {
        console.error(msgStr + ' Failed. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          expect(error.code).assertEqual(401);
          let result = windowClass.getDecorButtonStyle();
          console.log(`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
          expect(result.buttonIconSize).assertEqual(20);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetDecorButtonStyle_buttonIconSize_0300
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3700
     * @tc.desc   testSetDecorButtonStyle_buttonIconSize_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSetDecorButtonStyle_buttonIconSize_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testSetDecorButtonStyle_buttonIconSize_0300";
      console.log(msgStr + "begin");
      let windowClass = windowStage.getMainWindowSync();
      try {
        let param: window.DecorButtonStyle = {
          buttonIconSize: 16
        }
        windowClass.setDecorButtonStyle(param);
        console.log(`${msgStr} setDecorButtonStyle success.`);
        let result = windowClass.getDecorButtonStyle();
        console.log(`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
        expect(result.buttonIconSize).assertEqual(16);
        done();
      } catch (error) {
        console.error(msgStr + ' Failed. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetDecorButtonStyle_buttonIconSize_0400
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3800
     * @tc.desc   testSetDecorButtonStyle_buttonIconSize_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSetDecorButtonStyle_buttonIconSize_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testSetDecorButtonStyle_buttonIconSize_0400";
      console.log(msgStr + "begin");
      let windowClass = windowStage.getMainWindowSync();
      try {
        let param: window.DecorButtonStyle = {
          buttonIconSize: 24
        }
        windowClass.setDecorButtonStyle(param);
        console.log(`${msgStr} setDecorButtonStyle success.`);
        let result = windowClass.getDecorButtonStyle();
        console.log(`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
        expect(result.buttonIconSize).assertEqual(24);
        done();
      } catch (error) {
        console.error(msgStr + ' Failed. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetDecorButtonStyle_buttonBackgroundCornerRadius_0100
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3900
     * @tc.desc   testSetDecorButtonStyle_buttonBackgroundCornerRadius_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSetDecorButtonStyle_buttonBackgroundCornerRadius_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testSetDecorButtonStyle_buttonBackgroundCornerRadius_0100";
      console.log(msgStr + "begin");
      let windowClass = windowStage.getMainWindowSync();
      try {
        let param: window.DecorButtonStyle = {
          buttonBackgroundCornerRadius: 3
        }
        windowClass.setDecorButtonStyle(param);
        console.error(`${msgStr} setDecorButtonStyle success.`);
      } catch (error) {
        console.error(msgStr + ' Failed. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          expect(error.code).assertEqual(401);
          let result = windowClass.getDecorButtonStyle();
          console.log(`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
          expect(result.buttonBackgroundCornerRadius).assertEqual(4);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetDecorButtonStyle_buttonBackgroundCornerRadius_0200
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_4000
     * @tc.desc   testSetDecorButtonStyle_buttonBackgroundCornerRadius_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testSetDecorButtonStyle_buttonBackgroundCornerRadius_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let msgStr = "testSetDecorButtonStyle_buttonBackgroundCornerRadius_0200";
      console.log(msgStr + "begin");
      let windowClass = windowStage.getMainWindowSync();
      try {
        let param: window.DecorButtonStyle = {
          buttonBackgroundCornerRadius: 9
        }
        windowClass.setDecorButtonStyle(param);
        console.error(`${msgStr} setDecorButtonStyle success.`);
      } catch (error) {
        console.error(msgStr + ' Failed. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          expect(error.code).assertEqual(401);
          let result = windowClass.getDecorButtonStyle();
          console.log(`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
          expect(result.buttonBackgroundCornerRadius).assertEqual(4);
          done();
        }
      }
    })

    /**
     * @tc.name   testSetDecorButtonStyle_buttonBackgroundCornerRadius_0300
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_4100
     * @tc.desc   testSetDecorButtonStyle_buttonBackgroundCornerRadius_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSetDecorButtonStyle_buttonBackgroundCornerRadius_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testSetDecorButtonStyle_buttonBackgroundCornerRadius_0300";
      console.log(msgStr + "begin");
      let windowClass = windowStage.getMainWindowSync();
      try {
        let param: window.DecorButtonStyle = {
          buttonBackgroundCornerRadius: 4
        }
        windowClass.setDecorButtonStyle(param);
        console.log(`${msgStr} setDecorButtonStyle success.`);
        let result = windowClass.getDecorButtonStyle();
        console.log(`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
        expect(result.buttonBackgroundCornerRadius).assertEqual(4);
        done();
      } catch (error) {
        console.error(msgStr + ' Failed. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetDecorButtonStyle_buttonBackgroundCornerRadius_0400
     * @tc.number SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_4200
     * @tc.desc   testSetDecorButtonStyle_buttonBackgroundCornerRadius_0400
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSetDecorButtonStyle_buttonBackgroundCornerRadius_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let msgStr = "testSetDecorButtonStyle_buttonBackgroundCornerRadius_0400";
      console.log(msgStr + "begin");
      let windowClass = windowStage.getMainWindowSync();
      try {
        let param: window.DecorButtonStyle = {
          buttonBackgroundCornerRadius: 8
        }
        windowClass.setDecorButtonStyle(param);
        console.log(`${msgStr} setDecorButtonStyle success.`);
        let result = windowClass.getDecorButtonStyle();
        console.log(`${msgStr} getDecorButtonStyle result: ${JSON.stringify(result)}`);
        expect(result.buttonBackgroundCornerRadius).assertEqual(8);
        done();
      } catch (error) {
        console.error(msgStr + ' Failed. Cause:' + JSON.stringify(error));
        if (error.code == 801) {
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   testSetSupportedWindowModeswithIncorrectParameters
     * @tc.number SUB_BASIC_WMS_SETSUPPORTEDWINDOWMODES_GRAYOUTMAXIMIZEBUTTON_0100
     * @tc.desc   验证setSupportedWindowModes接口传入错误入参抛1300016错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testSetSupportedWindowModeswithIncorrectParameters", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "testSetSupportedWindowModeswithIncorrectParameters";
      console.log(caseName + "begin");
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      let displaylength = await display.getAllDisplayPhysicalResolution();
      console.log(caseName + ' displaylength.length:' + displaylength.length);
      let foldStatus:display.FoldStatus = display.getFoldStatus();
      console.log(caseName + ' foldStatus:' + foldStatus);
      try {
        let windowStage1 = await startAbility(caseName + 'Test1', context, options);
        await sleep(200);
        await windowStage1.setSupportedWindowModes([], true);
        await sleep(200);
        await terminateAbility(caseName + 'Test1');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(caseName + ' Test1 Failed. Cause:' + JSON.stringify(error));
        await terminateAbility(caseName + 'Test1');
        if (error.code == 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(1300016);
        }
      }

      try {
        let windowStage2 = await startAbility(caseName + 'Test2', context, options);
        await sleep(200);
        let floating: bundleManager.SupportWindowMode = bundleManager.SupportWindowMode.FLOATING;
        await windowStage2.setSupportedWindowModes([floating,floating,floating,floating,floating], true);
        await sleep(200);
        await terminateAbility(caseName + 'Test2');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(caseName + ' Test2 Failed. Cause:' + JSON.stringify(error));
        await terminateAbility(caseName + 'Test2');
        if (error.code == 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(1300016);
        }
      }

      try {
        let windowStage3 = await startAbility(caseName + 'Test3', context, options);
        await sleep(200);
        await windowStage3.setSupportedWindowModes([ bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.SPLIT, bundleManager.SupportWindowMode.FLOATING], true);
        await sleep(200);
        await terminateAbility(caseName + 'Test3');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(caseName + ' Test3 Failed. Cause:' + JSON.stringify(error));
        await terminateAbility(caseName + 'Test3');
        if (error.code == 801) {
          expect(error.code).assertEqual(801);
        } else {
          expect(error.code).assertEqual(1300016);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreen
     * @tc.number SUB_BASIC_WMS_SETSUPPORTEDWINDOWMODES_GRAYOUTMAXIMIZEBUTTON_0200
     * @tc.desc   验证setSupportedWindowModes接口传入错误入参抛1300016错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreen", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreen";
      console.log(caseName + "begin");
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      try {
        let windowStage = await startAbility(caseName, context, options);
        await sleep(200);
        let promise = windowStage.setSupportedWindowModes([ bundleManager.SupportWindowMode.FLOATING,
          bundleManager.SupportWindowMode.SPLIT,bundleManager.SupportWindowMode.FULL_SCREEN,], true);
        promise.then(() => {
          console.info(caseName + ' Succeeded in setting window support modes');
          expect().assertFail();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(caseName + `Failed to set window support modes. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else{
            expect(err.code).assertEqual(1300016)
            await terminateAbility(caseName);
            done();
          }

        });
      } catch (error) {
        console.error(caseName + ' Failed. Cause:' + JSON.stringify(error));
        await terminateAbility(caseName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreenandSplit
     * @tc.number SUB_BASIC_WMS_SETSUPPORTEDWINDOWMODES_GRAYOUTMAXIMIZEBUTTON_0300
     * @tc.desc   验证setSupportedWindowModes接口配置([FLOATING], true)，最大化按钮灰显
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreenandSplit", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testSetSupportedWindowModeswithGrayOutMaximizeButtonTrueNotSupportFullScreenandSplit";
      console.log(caseName + "begin");
      let test = false;
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      try {
        let windowStageStart = await startAbility(caseName, context, options);
        await sleep(200);
        let mainWindow = windowStage.getMainWindowSync();
        let windowClass = windowStageStart.getMainWindowSync();
        let windowRect = mainWindow.getWindowProperties().windowRect;
        console.log(`${caseName} windowRect: ${JSON.stringify(windowRect)}`);
        windowClass.moveWindowToAsync(windowRect.left,windowRect.top);
        await windowStageStart.setSupportedWindowModes([ bundleManager.SupportWindowMode.FLOATING], true);
        await sleep(200);
        if (isFreeWindowMode == true) {
          // let test = await assertMaximizeComponentExist();
          let button = await driver.findComponent(ON.id('EnhanceMaximizeBtn'))
          await sleep(200);
          console.log(`${caseName} button: ${button}`);
          if(button){
            test = true
          }else{
            test = false
          }
          console.log(`${caseName} test: ${test}`);
          expect(test).assertTrue();

          await windowClass.maximize();
          await sleep(200);
          console.log(`${caseName} maximize success`);

          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }else{
          done();
        }
      } catch (error) {
        console.error(caseName + ' Failed. Cause:' + JSON.stringify(error));
        await terminateAbility(caseName);
        if (isFreeWindowMode == true) {
          expect(error.code).assertEqual(1300002)
        } else {
          expect(error.code).assertEqual(801)
        }
        done();
      }
    })
    /**
     * @tc.name   testSetSupportedWindowModeswithGrayOutMaximizeButtonFalseNotSupportFullScreen
     * @tc.number SUB_BASIC_WMS_SETSUPPORTEDWINDOWMODES_GRAYOUTMAXIMIZEBUTTON_0400
     * @tc.desc   验证setSupportedWindowModes接口配置([FLOATING，SPLIT], false)，最大化按钮不显示
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testSetSupportedWindowModeswithGrayOutMaximizeButtonFalseNotSupportFullScreen", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let caseName = "testSetSupportedWindowModeswithGrayOutMaximizeButtonFalseNotSupportFullScreen";
      console.log(caseName + "begin");
      let test = true;
      let mainWindow = windowStage.getMainWindowSync();
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      try {
        let windowStageStart = await startAbility(caseName, context, options);
        await sleep(200);
        await windowStageStart.setSupportedWindowModes([ bundleManager.SupportWindowMode.FLOATING, bundleManager.SupportWindowMode.SPLIT], false);
        await sleep(200);
        if (isFreeWindowMode == true) {
          mainWindow.setWindowTitleButtonVisible(false,true,true);
          let windowClass = windowStageStart.getMainWindowSync();
          let windowRect = mainWindow.getWindowProperties().windowRect;
          console.log(`${caseName} windowRect: ${JSON.stringify(windowRect)}`);
          windowClass.moveWindowToAsync(windowRect.left,windowRect.top);
          await sleep(1000);
          let button = await driver.findComponent(ON.id('EnhanceMaximizeBtn'))
          await sleep(200);
          console.log(`${caseName} button: ${button}`);
          if(button){
            test = true
          }else{
            test = false
          }
          console.log(`${caseName} test: ${test}`);
          expect(test).assertFalse();
          await windowClass.maximize();
          await sleep(200);
          console.log(`${caseName} maximize success`);
          mainWindow.setWindowTitleButtonVisible(true,true,true);
          await terminateAbility(caseName);
          expect(false).assertTrue();
          done();
        }else{
          let button = await driver.findComponent(ON.id('EnhanceMaximizeBtn'))
          await sleep(200);
          console.log(`${caseName} button: ${button}`);
          if(button){
            test = true
          }else{
            test = false
          }
          console.log(`${caseName} test: ${test}`);
          expect(test).assertFalse();
          await terminateAbility(caseName);
          done();
        }
      } catch (error) {
        console.error(caseName + ' Failed. Cause:' + JSON.stringify(error));
        await terminateAbility(caseName);
        if (isFreeWindowMode == true) {
          expect(error.code).assertEqual(1300002)
          mainWindow.setWindowTitleButtonVisible(true,true,true);
        } else {
          expect(error.code).assertEqual(801)
        }
        done();
      }
    })

    /**
     * @tc.name   testSetSupportedWindowModeswithInvisibleMaximizeButtonhGrayOutMaximizeButtonTrueNotSupportFullScreen
     * @tc.number SUB_BASIC_WMS_SETSUPPORTEDWINDOWMODES_GRAYOUTMAXIMIZEBUTTON_0500
     * @tc.desc   验证隐藏最大化按钮后，最大化按钮依然可以灰显成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testSetSupportedWindowModeswithInvisibleMaximizeButtonhGrayOutMaximizeButtonTrueNotSupportFullScreen", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "testSetSupportedWindowModeswithInvisibleMaximizeButtonhGrayOutMaximizeButtonTrueNotSupportFullScreen";
      console.log(caseName + "begin");
      let mainWindow = windowStage.getMainWindowSync();
      let windowStageStart:window.WindowStage|undefined = undefined
      let test = true;
      let options: StartOptions = {
        supportWindowModes: [
          bundleManager.SupportWindowMode.SPLIT,
          bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.FLOATING
        ]
      };
      if (isFreeWindowMode == true) {
        try {
          mainWindow.setWindowTitleButtonVisible(false,true,true);
          let windowStageStart = await startAbility(caseName, context, options);        
          let windowClass = windowStageStart.getMainWindowSync();
          let windowRect = mainWindow.getWindowProperties().windowRect;
          console.log(`${caseName} windowRect: ${JSON.stringify(windowRect)}`);
          windowClass.moveWindowToAsync(windowRect.left,windowRect.top);
          windowClass.setWindowTitleButtonVisible(false,true,true);
          await sleep(1000);
          let button = await driver.findComponent(ON.id('EnhanceMaximizeBtn'))
          await sleep(200);
          console.log(`${caseName} button: ${button}`);
          if(button){
            test = true
          }else{
            test = false
          }
          console.log(`${caseName} test1: ${test}`);
          expect(test).assertFalse();
         
          await windowStageStart.setSupportedWindowModes([ bundleManager.SupportWindowMode.FLOATING, bundleManager.SupportWindowMode.SPLIT], true);
          await sleep(200);
  
          let button2 = await driver.findComponent(ON.id('EnhanceMaximizeBtn'))
          await sleep(200);
          console.log(`${caseName} button: ${button2}`);
          if(button2){
            test = true
          }else{
            test = false
          }
          console.log(`${caseName} test2: ${test}`);
          expect(test).assertTrue();
          mainWindow.setWindowTitleButtonVisible(true,true,true);
          await windowClass.maximize();
          await sleep(200);
          console.log(`${caseName} maximize success`);
          
          await terminateAbility(caseName);
          expect(false).assertTrue();
  
          done();
          
        } catch (error) {
          console.error(caseName + ' Failed. Cause:' + JSON.stringify(error));
          await terminateAbility(caseName);
          expect(error.code).assertEqual(1300002)
          done();
        }
      }else{
        done();
      }
      
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_WINDOW_DECORHEIGHT_0100
     * @tc.name    testSetWindowDecorHeight_36
     * @tc.desc    SetWindowDecorHeight入参36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetWindowDecorHeight_36', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowDecorHeight_36';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.info(caseName+ ' isSupport:'+isSupport);
      let mainWindow =  windowStage.getMainWindowSync();
      try {
        mainWindow.setWindowDecorHeight(36);
        console.info(caseName+ ' Succeeded in setting the height');
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
          expect(e.code).assertEqual(401);
          expect(e.message).assertEqual('Parameter error.[window][setWindowDecorHeight]msg: Height should greater than 37 or smaller than 112.');
          done();
      }
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_WINDOW_DECORHEIGHT_0200
     * @tc.name    testSetWindowDecorHeight_37
     * @tc.desc    SetWindowDecorHeight入参37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetWindowDecorHeight_37', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowDecorHeight_37';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.info(caseName+ ' isSupport:'+isSupport);
      let mainWindow =  windowStage.getMainWindowSync();
      try {
        mainWindow.setWindowDecorHeight(37);
        console.info(caseName+ ' Succeeded in setting the height');
        expect(true).assertTrue();
        done();
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        if(!isSupport){
          expect(e.code).assertEqual(801);
          expect(e.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setWindowDecorHeight]msg: Set window decor height failed.');
          done()
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_WINDOW_DECORHEIGHT_0300
     * @tc.name    testSetWindowDecorHeight_112
     * @tc.desc    SetWindowDecorHeight入参112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetWindowDecorHeight_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowDecorHeight_112';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.info(caseName+ ' isSupport:'+isSupport);
      let mainWindow =  windowStage.getMainWindowSync();
      try {
        mainWindow.setWindowDecorHeight(112);
        console.info(caseName+ ' Succeeded in setting the height');
        expect(true).assertTrue();
        done();
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        if(!isSupport){
          expect(e.code).assertEqual(801);
          expect(e.message).assertEqual('Capability not supported. Failed to call the API due to limited device capabilities.[window][setWindowDecorHeight]msg: Set window decor height failed.');
          done()
        }else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.number  SUB_BASIC_WMS_FUNCTION_SET_WINDOW_DECORHEIGHT_0400
     * @tc.name    testSetWindowDecorHeight_113
     * @tc.desc    SetWindowDecorHeight入参113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetWindowDecorHeight_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = 'testSetWindowDecorHeight_113';
      let isSupport = canIUse('SystemCapability.Window.SessionManager')
      console.info(caseName+ ' isSupport:'+isSupport);
      let mainWindow =  windowStage.getMainWindowSync();
      try {
        mainWindow.setWindowDecorHeight(113);
        console.info(caseName+ ' Succeeded in setting the height');
      } catch(e) {
        console.error( caseName+  `Failed. Cause:${e.code}, message:${e.message}`);
        expect(e.code).assertEqual(401);
        expect(e.message).assertEqual('Parameter error.[window][setWindowDecorHeight]msg: Height should greater than 37 or smaller than 112.');
        done();
      }
    })

  })
}