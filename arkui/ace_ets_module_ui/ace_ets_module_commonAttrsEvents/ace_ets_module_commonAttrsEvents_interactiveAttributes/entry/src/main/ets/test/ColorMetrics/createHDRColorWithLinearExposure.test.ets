/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function createHDRColorWithLinearExposureTest() {
  describe('createHDRColorWithLinearExposureTest', () => {
    beforeAll(async () => {
      console.info("[createHDRColorWithLinearExposureTest] beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ColorMetrics/createHDRColorWithLinearExposure',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("[createHDRColorWithLinearExposureTest] get state success " + JSON.stringify(pages));
        if (!("createHDRColorWithLinearExposure" == pages.name)) {
          console.info("[createHDRColorWithLinearExposureTest] page name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("[createHDRColorWithLinearExposureTest] push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("[createHDRColorWithLinearExposureTest] push page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.number    SUB_ArkUI_Graphics_LinearExposure_0100
     * @tc.name      linearExposure_Undefined_DisplayP3_test
     * @tc.desc      Test createHDRColorWithLinearExposure with undefined linearExposure and DISPLAY_P3 colorSpace.
     * @tc.level:    LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('linearExposure_Undefined_DisplayP3_test', Level.LEVEL1, async () => {
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let presetBtn1 = await driver.findComponent(ON.id('linearPresetBtn1'));
      await presetBtn1.click();
      await CommonFunc.sleep(1000);
      
      let strJsonImage = getInspectorByKey('linearTestImage');
      let objImage: ESObject = JSON.parse(strJsonImage);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0100] linearTestImage: ' + JSON.stringify(objImage));
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0100] fillColor: ' + objImage.$attrs.fillColor);
      
      let strJsonColorSpace = getInspectorByKey('linearColorSpaceText');
      let objColorSpace: ESObject = JSON.parse(strJsonColorSpace);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0100] linearColorSpaceText: ' + JSON.stringify(objColorSpace));
      
      let strJsonRgb = getInspectorByKey('linearRgbText');
      let objRgb: ESObject = JSON.parse(strJsonRgb);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0100] linearRgbText: ' + JSON.stringify(objRgb));
      
      let strJsonAlpha = getInspectorByKey('linearAlphaText');
      let objAlpha: ESObject = JSON.parse(strJsonAlpha);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0100] linearAlphaText: ' + JSON.stringify(objAlpha));
      
      let strJsonExposure = getInspectorByKey('linearExposureText');
      let objExposure: ESObject = JSON.parse(strJsonExposure);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0100] linearExposureText: ' + JSON.stringify(objExposure));
      
      expect(objImage.$attrs.fillColor).assertContain('#FF000000');
      
      expect(objColorSpace.$attrs.content).assertEqual('DISPLAY_P3');
      expect(objRgb.$attrs.content).assertContain('0.00');
      expect(objAlpha.$attrs.content).assertEqual('Alpha: undefined');
      expect(objExposure.$attrs.content).assertEqual('LinearExposure: undefined');
      
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0100] END');
    });

    /**
     * @tc.number    SUB_ArkUI_Graphics_LinearExposure_0200
     * @tc.name      linearExposure_100_SRGB_test
     * @tc.desc      Test createHDRColorWithLinearExposure with linearExposure=100.22 and SRGB colorSpace.
     * @tc.level:    LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('linearExposure_100_SRGB_test', Level.LEVEL1, async () => {
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let presetBtn2 = await driver.findComponent(ON.id('linearPresetBtn2'));
      await presetBtn2.click();
      await CommonFunc.sleep(1000);
      
      let strJsonImage = getInspectorByKey('linearTestImage');
      let objImage: ESObject = JSON.parse(strJsonImage);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0200] linearTestImage: ' + JSON.stringify(objImage));
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0200] fillColor: ' + objImage.$attrs.fillColor);
      
      let strJsonColorSpace = getInspectorByKey('linearColorSpaceText');
      let objColorSpace: ESObject = JSON.parse(strJsonColorSpace);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0200] linearColorSpaceText: ' + JSON.stringify(objColorSpace));
      
      let strJsonRgb = getInspectorByKey('linearRgbText');
      let objRgb: ESObject = JSON.parse(strJsonRgb);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0200] linearRgbText: ' + JSON.stringify(objRgb));
      
      let strJsonAlpha = getInspectorByKey('linearAlphaText');
      let objAlpha: ESObject = JSON.parse(strJsonAlpha);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0200] linearAlphaText: ' + JSON.stringify(objAlpha));
      
      let strJsonExposure = getInspectorByKey('linearExposureText');
      let objExposure: ESObject = JSON.parse(strJsonExposure);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0200] linearExposureText: ' + JSON.stringify(objExposure));
      
      expect(objImage.$attrs.fillColor).assertContain('#FF000000');
      
      expect(objColorSpace.$attrs.content).assertEqual('SRGB');
      expect(objRgb.$attrs.content).assertContain('1.10');
      expect(objRgb.$attrs.content).assertContain('0.30');
      expect(objRgb.$attrs.content).assertContain('-1.00');
      expect(objAlpha.$attrs.content).assertContain('0.50');
      expect(objExposure.$attrs.content).assertContain('100.22');
      
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0200] END');
    });

    /**
     * @tc.number    SUB_ArkUI_Graphics_LinearExposure_0300
     * @tc.name      linearExposure_Negative_DisplayP3_test
     * @tc.desc      Test createHDRColorWithLinearExposure with linearExposure=-1 and DISPLAY_P3 colorSpace.
     * @tc.level:    LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('linearExposure_Negative_DisplayP3_test', Level.LEVEL1, async () => {
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0300] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let presetBtn3 = await driver.findComponent(ON.id('linearPresetBtn3'));
      await presetBtn3.click();
      await CommonFunc.sleep(1000);
      
      let strJsonImage = getInspectorByKey('linearTestImage');
      let objImage: ESObject = JSON.parse(strJsonImage);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0300] linearTestImage: ' + JSON.stringify(objImage));
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0300] fillColor: ' + objImage.$attrs.fillColor);
      
      let strJsonColorSpace = getInspectorByKey('linearColorSpaceText');
      let objColorSpace: ESObject = JSON.parse(strJsonColorSpace);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0300] linearColorSpaceText: ' + JSON.stringify(objColorSpace));
      
      let strJsonRgb = getInspectorByKey('linearRgbText');
      let objRgb: ESObject = JSON.parse(strJsonRgb);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0300] linearRgbText: ' + JSON.stringify(objRgb));
      
      let strJsonAlpha = getInspectorByKey('linearAlphaText');
      let objAlpha: ESObject = JSON.parse(strJsonAlpha);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0300] linearAlphaText: ' + JSON.stringify(objAlpha));
      
      let strJsonExposure = getInspectorByKey('linearExposureText');
      let objExposure: ESObject = JSON.parse(strJsonExposure);
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0300] linearExposureText: ' + JSON.stringify(objExposure));
      
      expect(objImage.$attrs.fillColor).assertContain('#FF000000');
      
      expect(objColorSpace.$attrs.content).assertEqual('DISPLAY_P3');
      expect(objRgb.$attrs.content).assertContain('1.00');
      expect(objAlpha.$attrs.content).assertContain('0.80');
      expect(objExposure.$attrs.content).assertEqual('LinearExposure: -1');
      
      console.info('[SUB_ArkUI_Graphics_LinearExposure_0300] END');
    });
  })
}