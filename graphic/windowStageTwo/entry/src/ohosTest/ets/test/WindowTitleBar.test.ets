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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import { ConfigurationConstant } from '@kit.AbilityKit';

export default function windowTitleBarTest() {
  describe('windowTitleBarTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0100
     * @tc.name      : test_setDecorButtonStyle_null
     * @tc.desc      : test_setDecorButtonStyle_null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_null', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0200
     * @tc.name      : test_getDecorButtonStyle_undifined
     * @tc.desc      : test_getDecorButtonStyle_undifined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_getDecorButtonStyle_undifined', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0300
     * @tc.name      : test_setDecorButtonStyle_colorMode_-2
     * @tc.desc      : test_setDecorButtonStyle_colorMode_-2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_-2', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0400
     * @tc.name      : test_setDecorButtonStyle_colorMode_-1
     * @tc.desc      : test_setDecorButtonStyle_colorMode_-1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_-1', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0500
     * @tc.name      : test_setDecorButtonStyle_colorMode_1
     * @tc.desc      : test_setDecorButtonStyle_colorMode_1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_1', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0600
     * @tc.name      : test_setDecorButtonStyle_colorMode_0
     * @tc.desc      : test_setDecorButtonStyle_colorMode_0
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_0', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0700
     * @tc.name      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10
     * @tc.desc      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_10', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0800
     * @tc.name      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50
     * @tc.desc      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_50', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_0900
     * @tc.name      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20
     * @tc.desc      : test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_buttonBackgroundSize_20vp_40vp_20', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1000
     * @tc.name      : test_setDecorButtonStyle
     * @tc.desc      : test_setDecorButtonStyle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1100
     * @tc.name      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_12
     * @tc.desc      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_12
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_12', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1200
     * @tc.name      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_24
     * @tc.desc      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_24
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_24', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1300
     * @tc.name      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_11
     * @tc.desc      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_11
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_11', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_11';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          spacingBetweenButtons: 11
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1400
     * @tc.name      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_25
     * @tc.desc      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_25
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_25', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1500
     * @tc.name      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_20
     * @tc.desc      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_20
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_20', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1600
     * @tc.name      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_18.5
     * @tc.desc      : test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_18.5
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_12vp_24vp_18.5', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1700
     * @tc.name      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_8
     * @tc.desc      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_8
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_8', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1800
     * @tc.name      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_22
     * @tc.desc      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_22
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_22', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_1900
     * @tc.name      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_7
     * @tc.desc      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_7
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_7', 0, async (done: Function) => {
      let caseName: string = 'test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_7';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = await windowStage.getMainWindow();
      try {
        let style: window.DecorButtonStyle = {
          closeButtonRightMargin: 7
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2000
     * @tc.name      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_23
     * @tc.desc      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_23
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_23', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2100
     * @tc.name      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_20
     * @tc.desc      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_20
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_20', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2200
     * @tc.name      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_18.5
     * @tc.desc      : test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_18.5
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_closeButtonRightMargin_8vp_22vp_18.5', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2300
     * @tc.name      : test_setDecorButtonStyle_spacingBetweenButtons_closeButtonRightMargin
     * @tc.desc      : test_setDecorButtonStyle_spacingBetweenButtons_closeButtonRightMargin
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_spacingBetweenButtons_closeButtonRightMargin', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2400
     * @tc.name      : test_setDecorButtonStyle_colorMode_spacingBetweenButtons_closeButtonRightMargin
     * @tc.desc      : test_setDecorButtonStyle_colorMode_spacingBetweenButtons_closeButtonRightMargin
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_colorMode_spacingBetweenButtons_closeButtonRightMargin', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2500
     * @tc.name      : test_setDecorButtonStyle_stylenull
     * @tc.desc      : test_setDecorButtonStyle_stylenull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_stylenull', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2600
     * @tc.name      : test_setDecorButtonStyle_setTitleAndDockHoverShown_hide
     * @tc.desc      : test_setDecorButtonStyle_setTitleAndDockHoverShown_hide
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_setTitleAndDockHoverShown_hide', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2700
     * @tc.name      : test_setDecorButtonStyle_setTitleAndDockHoverShown_show
     * @tc.desc      : test_setDecorButtonStyle_setTitleAndDockHoverShown_show
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_setTitleAndDockHoverShown_show', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2800
     * @tc.name      : test_setDecorButtonStyle_on_windowTitleButtonRectChange
     * @tc.desc      : test_setDecorButtonStyle_on_windowTitleButtonRectChange
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_on_windowTitleButtonRectChange', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_2900
     * @tc.name      : test_setDecorButtonStyle_setWindowTitleButtonVisible_true_true
     * @tc.desc      : test_setDecorButtonStyle_setWindowTitleButtonVisible_true_true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_setWindowTitleButtonVisible_true_true', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3000
     * @tc.name      : test_setDecorButtonStyle_setWindowTitleButtonVisible_false_false
     * @tc.desc      : test_setDecorButtonStyle_setWindowTitleButtonVisible_false_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_setWindowTitleButtonVisible_false_false', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3100
     * @tc.name      : test_setDecorButtonStyle_setWindowTitleButtonVisible_true_false
     * @tc.desc      : test_setDecorButtonStyle_setWindowTitleButtonVisible_true_false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_setWindowTitleButtonVisible_true_false', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3200
     * @tc.name      : test_setWindowDecorHeight_setDecorButtonStyle
     * @tc.desc      : test_setWindowDecorHeight_setDecorButtonStyle
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowDecorHeight_setDecorButtonStyle', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3300
     * @tc.name      : test_setDecorButtonStyle_setWindowDecorHeight
     * @tc.desc      : test_setDecorButtonStyle_setWindowDecorHeight
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_setWindowDecorHeight', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3400
     * @tc.name      : test_setDecorButtonStyle_30_setWindowDecorHeight_20
     * @tc.desc      : test_setDecorButtonStyle_30_setWindowDecorHeight_20
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setDecorButtonStyle_30_setWindowDecorHeight_20', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_TITLE_0100
     * @tc.name      : test_setWindowTitle_null
     * @tc.desc      : test_setWindowTitle_null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowTitle_null', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_TITLE_0200
     * @tc.name      : test_setWindowTitle_no_title
     * @tc.desc      : test_setWindowTitle_no_title
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowTitle_no_title', 0, async (done: Function) => {
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
            expect().assertFail();
            done();
          }).catch(async (err: BusinessError) => {
            console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
            await data.destroyWindow();
            if(err.code == 801){
              done();
            }else {
              expect(err.code).assertEqual(1300002);
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_TITLE_0300
     * @tc.name      : test_setWindowTitle_window_destroy
     * @tc.desc      : test_setWindowTitle_window_destroy
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowTitle_window_destroy', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_TITLE_0400
     * @tc.name      : test_setWindowTitle_mainWindow
     * @tc.desc      : test_setWindowTitle_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowTitle_mainWindow', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_TITLE_0500
     * @tc.name      : test_setWindowTitle_subWindow_title
     * @tc.desc      : test_setWindowTitle_subWindow_title
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowTitle_subWindow_title', 0, async (done: Function) => {
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
            }else {
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_TITLE_0600
     * @tc.name      : test_setWindowTitle_dialogWindow_title
     * @tc.desc      : test_setWindowTitle_dialogWindow_title
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowTitle_dialogWindow_title', 0, async (done: Function) => {
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
            }else {
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_TITLE_0700
     * @tc.name      : test_setWindowTitle_mainWindow_hide_titlebar
     * @tc.desc      : test_setWindowTitle_mainWindow_hide_titlebar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowTitle_mainWindow_hide_titlebar', 0, async (done: Function) => {
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
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_TITLE_0800
     * @tc.name      : test_setWindowTitle_mainWindow_Too_long_parameter
     * @tc.desc      : test_setWindowTitle_mainWindow_Too_long_parameter
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_setWindowTitle_mainWindow_Too_long_parameter', 0, async (done: Function) => {
      let caseName: string = 'test_setWindowTitle_mainWindow_Too_long_parameter';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWindow = windowStage.getMainWindowSync();
      try{
        mainWindow.setWindowTitle('test_setWindowTitle_mainWindow_Too_long_parameter test_setWindowTitle_mainWindow_Too_long_parameter test_setWindowTitle_mainWindow_Too_long_parameter').then(() => {
          console.info(`${caseName} :Succeeded in setting the window title.`);
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to set the window title. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
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

  })
}