/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import CommonFunc from '../../MainAbility/common/Common';
import { promptAction, uiMaterial } from '@kit.ArkUI';

export default function ShowToastOptionsTest() {
  describe('ShowToastOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ShowToastOptionsTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/dialogSystemMaterial/ShowToastOptionsTestPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ShowToastOptionsTest state pages:' + JSON.stringify(pages));
        if (!('ShowToastOptionsTestPage' == pages.name)) {
          console.info('get ShowToastOptionsTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2500);
          console.info('push ShowToastOptionsTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ShowToastOptionsTest page error:' + err);
      }
      console.info('ShowToastOptionsTest beforeEach end');
      done();
    });

	/**
     * @tc.name   ShowToastOptionsTest_Message_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Message_0100
     * @tc.desc   Test ShowToastOptions message parameter with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Message_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Message_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_message_string'));
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));     
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Message_0100 result: ' + text);

      console.info('ShowToastOptionsTest_Message_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Message_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Message_0200
     * @tc.desc   Test ShowToastOptions message parameter with Resource type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Message_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Message_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_message_resource'));
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Message_0200 result: ' + text);

      console.info('ShowToastOptionsTest_Message_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Duration_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Duration_0100
     * @tc.desc   Test ShowToastOptions duration min value 1500ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Duration_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Duration_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_duration_min'));
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Duration_0100 result: ' + text);

      console.info('ShowToastOptionsTest_Duration_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Duration_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Duration_0200
     * @tc.desc   Test ShowToastOptions duration max value 10000ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Duration_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Duration_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_duration_max'));
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Duration_0200 result: ' + text);

      console.info('ShowToastOptionsTest_Duration_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Bottom_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Bottom_0100
     * @tc.desc   Test ShowToastOptions bottom parameter with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Bottom_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Bottom_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_bottom_string'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Bottom_0100 result: ' + text);

      console.info('ShowToastOptionsTest_Bottom_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Bottom_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Bottom_0200
     * @tc.desc   Test ShowToastOptions bottom parameter with number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Bottom_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Bottom_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_bottom_number'));
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Bottom_0200 result: ' + text);

      console.info('ShowToastOptionsTest_Bottom_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Alignment_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Alignment_0100
     * @tc.desc   Test ShowToastOptions alignment parameter Alignment.Top
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Alignment_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Alignment_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_align_top'));
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Alignment_0100 result: ' + text);

      console.info('ShowToastOptionsTest_Alignment_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Alignment_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Alignment_0200
     * @tc.desc   Test ShowToastOptions alignment parameter Alignment.Center
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Alignment_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Alignment_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);


      let btn = await driver.findComponent(ON.id('btn_align_center'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Alignment_0200 result: ' + text);

      console.info('ShowToastOptionsTest_Alignment_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Alignment_0300
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Alignment_0300
     * @tc.desc   Test ShowToastOptions alignment parameter Alignment.Bottom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Alignment_0300', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Alignment_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);


      let btn = await driver.findComponent(ON.id('btn_align_bottom'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Alignment_0300 result: ' + text);

      console.info('ShowToastOptionsTest_Alignment_0300 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Alignment_0400
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Alignment_0400
     * @tc.desc   Test ShowToastOptions alignment parameter Alignment.TopStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Alignment_0400', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Alignment_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_align_topstart'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Alignment_0400 result: ' + text);

      console.info('ShowToastOptionsTest_Alignment_0400 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Offset_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Offset_0100
     * @tc.desc   Test ShowToastOptions offset parameter with positive values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Offset_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Offset_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_offset_positive'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Offset_0100 result: ' + text);

      console.info('ShowToastOptionsTest_Offset_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Offset_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Offset_0200
     * @tc.desc   Test ShowToastOptions offset parameter with negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Offset_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Offset_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_offset_negative'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Offset_0200 result: ' + text);

      console.info('ShowToastOptionsTest_Offset_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_ShowMode_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_ShowMode_0100
     * @tc.desc   Test ShowToastOptions showMode parameter ToastShowMode.DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_ShowMode_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_ShowMode_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(promptAction.ToastShowMode.DEFAULT).assertEqual(0);

      let btn = await driver.findComponent(ON.id('btn_showmode_default'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_ShowMode_0100 result: ' + text);

      console.info('ShowToastOptionsTest_ShowMode_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_ShowMode_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_ShowMode_0200
     * @tc.desc   Test ShowToastOptions showMode parameter ToastShowMode.TOP_MOST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_ShowMode_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_ShowMode_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      expect(promptAction.ToastShowMode.TOP_MOST).assertEqual(1);

      let btn = await driver.findComponent(ON.id('btn_showmode_topmost'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_ShowMode_0200 result: ' + text);

      console.info('ShowToastOptionsTest_ShowMode_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_BackgroundColor_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_BackgroundColor_0100
     * @tc.desc   Test ShowToastOptions backgroundColor parameter with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_BackgroundColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_BackgroundColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_bgcolor_red'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_BackgroundColor_0100 result: ' + text);

      console.info('ShowToastOptionsTest_BackgroundColor_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_TextColor_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_TextColor_0100
     * @tc.desc   Test ShowToastOptions textColor parameter with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_TextColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_TextColor_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_textcolor_white'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_TextColor_0100 result: ' + text);

      console.info('ShowToastOptionsTest_TextColor_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_BackgroundBlurStyle_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_BackgroundBlurStyle_0100
     * @tc.desc   Test ShowToastOptions backgroundBlurStyle parameter BlurStyle.NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_BackgroundBlurStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_BackgroundBlurStyle_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_blur_none'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_BackgroundBlurStyle_0100 result: ' + text);

      console.info('ShowToastOptionsTest_BackgroundBlurStyle_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_BackgroundBlurStyle_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_BackgroundBlurStyle_0200
     * @tc.desc   Test ShowToastOptions backgroundBlurStyle parameter BlurStyle.THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_BackgroundBlurStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_BackgroundBlurStyle_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);


      let btn = await driver.findComponent(ON.id('btn_blur_thin'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_BackgroundBlurStyle_0200 result: ' + text);

      console.info('ShowToastOptionsTest_BackgroundBlurStyle_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Shadow_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Shadow_0100
     * @tc.desc   Test ShowToastOptions shadow parameter with ShadowStyle type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Shadow_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Shadow_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_shadow_style'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Shadow_0100 result: ' + text);

      console.info('ShowToastOptionsTest_Shadow_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_Shadow_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_Shadow_0200
     * @tc.desc   Test ShowToastOptions shadow parameter with ShadowOptions type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_Shadow_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_Shadow_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_shadow_options'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_Shadow_0200 result: ' + text);

      console.info('ShowToastOptionsTest_Shadow_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_EnableHoverMode_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_EnableHoverMode_0100
     * @tc.desc   Test ShowToastOptions enableHoverMode parameter false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_EnableHoverMode_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_EnableHoverMode_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_hover_false'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_EnableHoverMode_0100 result: ' + text);

      console.info('ShowToastOptionsTest_EnableHoverMode_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_EnableHoverMode_0200
     * @tc.number SUB_ARKUI_API_ShowToastOptions_EnableHoverMode_0200
     * @tc.desc   Test ShowToastOptions enableHoverMode parameter true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_EnableHoverMode_0200', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_EnableHoverMode_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_hover_true'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_EnableHoverMode_0200 result: ' + text);

      console.info('ShowToastOptionsTest_EnableHoverMode_0200 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_SystemMaterial_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_SystemMaterial_0100
     * @tc.desc   Test ShowToastOptions systemMaterial parameter with ImmersiveMaterial
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_SystemMaterial_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_SystemMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let material = new uiMaterial.ImmersiveMaterial({ style: uiMaterial.ImmersiveStyle.ULTRA_THIN });
      expect(material instanceof uiMaterial.ImmersiveMaterial).assertTrue();
      console.info('ShowToastOptionsTest_SystemMaterial_0100 ImmersiveMaterial created');

      let btn = await driver.findComponent(ON.id('btn_system_material'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_SystemMaterial_0100 result: ' + text);

      console.info('ShowToastOptionsTest_SystemMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_AllParameters_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_AllParameters_0100
     * @tc.desc   Test ShowToastOptions with all parameters combined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_AllParameters_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_AllParameters_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btn = await driver.findComponent(ON.id('btn_all_params'));
      
      await btn.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);
      console.info('ShowToastOptionsTest_AllParameters_0100 result: ' + text);

      console.info('ShowToastOptionsTest_AllParameters_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_CloseToast_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_CloseToast_0100
     * @tc.desc   Test closeToast function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_CloseToast_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_CloseToast_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let btnOpen = await driver.findComponent(ON.id('btn_message_string'));
      expect(btnOpen).not().assertUndefined();
      await btnOpen.click();
      await CommonFunc.sleep(500);

      let resultText = await driver.findComponent(ON.id('result_text'));
      
      let text = await resultText.getText();
      expect(text.indexOf('ToastId')).assertLarger(-1);

      let btnClose = await driver.findComponent(ON.id('btn_close'));
      expect(btnClose).not().assertUndefined();
      await btnClose.click();
      await CommonFunc.sleep(500);

      text = await resultText.getText();
      expect(text.indexOf('Closed')).assertLarger(-1);
      console.info('ShowToastOptionsTest_CloseToast_0100 result: ' + text);

      console.info('ShowToastOptionsTest_CloseToast_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_OpenToastReturn_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_OpenToastReturn_0100
     * @tc.desc   Test openToast returns Promise<number> toastId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_OpenToastReturn_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_OpenToastReturn_0100 START');

      let toastId = await promptAction.openToast({ message: 'Return Test' });
      expect(typeof toastId).assertEqual('number');
      expect(toastId).assertLarger(0);
      console.info('ShowToastOptionsTest_OpenToastReturn_0100 toastId type: ' + typeof toastId + ', value: ' + toastId);

      promptAction.closeToast(toastId);
      console.info('ShowToastOptionsTest_OpenToastReturn_0100 END');
      done();
    });

    /**
     * @tc.name   ShowToastOptionsTest_ImmersiveStyle_0100
     * @tc.number SUB_ARKUI_API_ShowToastOptions_ImmersiveStyle_0100
     * @tc.desc   Test uiMaterial.ImmersiveStyle enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ShowToastOptionsTest_ImmersiveStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('ShowToastOptionsTest_ImmersiveStyle_0100 START');

      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
      expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
      expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      console.info('ShowToastOptionsTest_ImmersiveStyle_0100 ImmersiveStyle enum values verified');

      console.info('ShowToastOptionsTest_ImmersiveStyle_0100 END');
      done();
    });
    

  })
}