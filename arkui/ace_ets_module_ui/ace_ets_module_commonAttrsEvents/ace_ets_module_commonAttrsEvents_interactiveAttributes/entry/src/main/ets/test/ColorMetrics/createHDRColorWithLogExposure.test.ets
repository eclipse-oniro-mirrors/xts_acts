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

export default function createHDRColorWithLogExposureTest() {
  describe('createHDRColorWithLogExposureTest', () => {
    beforeAll(async () => {
      console.info("[createHDRColorWithLogExposureTest] beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ColorMetrics/createHDRColorWithLogExposure',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("[createHDRColorWithLogExposureTest] get state success " + JSON.stringify(pages));
        if (!("createHDRColorWithLogExposure" == pages.name)) {
          console.info("[createHDRColorWithLogExposureTest] page name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("[createHDRColorWithLogExposureTest] push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("[createHDRColorWithLogExposureTest] push page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.number    SUB_ArkUI_Graphics_LogExposure_0100
     * @tc.name      logExposure_NaN_DisplayP3_test
     * @tc.desc      Test createHDRColorWithLogExposure with NaN exposure and DISPLAY_P3 colorSpace.
     * @tc.level:    LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('logExposure_NaN_DisplayP3_test', Level.LEVEL1, async () => {
      console.info('[SUB_ArkUI_Graphics_LogExposure_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let presetBtn1 = await driver.findComponent(ON.id('logPresetBtn1'));
      await presetBtn1.click();
      await CommonFunc.sleep(1000);
      
      let strJsonImage = getInspectorByKey('logTestImage');
      let objImage: ESObject = JSON.parse(strJsonImage);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0100] logTestImage: ' + JSON.stringify(objImage));
      console.info('[SUB_ArkUI_Graphics_LogExposure_0100] fillColor: ' + objImage.$attrs.fillColor);
      
      let strJsonColorSpace = getInspectorByKey('logColorSpaceText');
      let objColorSpace: ESObject = JSON.parse(strJsonColorSpace);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0100] logColorSpaceText: ' + JSON.stringify(objColorSpace));
      
      let strJsonRgb = getInspectorByKey('logRgbText');
      let objRgb: ESObject = JSON.parse(strJsonRgb);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0100] logRgbText: ' + JSON.stringify(objRgb));
      
      let strJsonAlpha = getInspectorByKey('logAlphaText');
      let objAlpha: ESObject = JSON.parse(strJsonAlpha);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0100] logAlphaText: ' + JSON.stringify(objAlpha));
      
      let strJsonExposure = getInspectorByKey('logExposureText');
      let objExposure: ESObject = JSON.parse(strJsonExposure);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0100] logExposureText: ' + JSON.stringify(objExposure));
      
      expect(objImage.$attrs.fillColor).assertContain('#FF000000');
      
      expect(objColorSpace.$attrs.content).assertEqual('DISPLAY_P3');
      expect(objRgb.$attrs.content).assertContain('0.00');
      expect(objAlpha.$attrs.content).assertContain('1.00');
      expect(objExposure.$attrs.content).assertContain('NaN');
      
      console.info('[SUB_ArkUI_Graphics_LogExposure_0100] END');
    });

    /**
     * @tc.number    SUB_ArkUI_Graphics_LogExposure_0200
     * @tc.name      logExposure_0_SRGB_test
     * @tc.desc      Test createHDRColorWithLogExposure with exposure=0 and SRGB colorSpace.
     * @tc.level:    LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('logExposure_0_SRGB_test', Level.LEVEL1, async () => {
      console.info('[SUB_ArkUI_Graphics_LogExposure_0200] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let presetBtn2 = await driver.findComponent(ON.id('logPresetBtn2'));
      await presetBtn2.click();
      await CommonFunc.sleep(1000);
      
      let strJsonImage = getInspectorByKey('logTestImage');
      let objImage: ESObject = JSON.parse(strJsonImage);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0200] logTestImage: ' + JSON.stringify(objImage));
      console.info('[SUB_ArkUI_Graphics_LogExposure_0200] fillColor: ' + objImage.$attrs.fillColor);
      
      let strJsonColorSpace = getInspectorByKey('logColorSpaceText');
      let objColorSpace: ESObject = JSON.parse(strJsonColorSpace);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0200] logColorSpaceText: ' + JSON.stringify(objColorSpace));
      
      let strJsonRgb = getInspectorByKey('logRgbText');
      let objRgb: ESObject = JSON.parse(strJsonRgb);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0200] logRgbText: ' + JSON.stringify(objRgb));
      
      let strJsonAlpha = getInspectorByKey('logAlphaText');
      let objAlpha: ESObject = JSON.parse(strJsonAlpha);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0200] logAlphaText: ' + JSON.stringify(objAlpha));
      
      let strJsonExposure = getInspectorByKey('logExposureText');
      let objExposure: ESObject = JSON.parse(strJsonExposure);
      console.info('[SUB_ArkUI_Graphics_LogExposure_0200] logExposureText: ' + JSON.stringify(objExposure));
      
      expect(objImage.$attrs.fillColor).assertContain('#FF000000');
      
      expect(objColorSpace.$attrs.content).assertEqual('SRGB');
      expect(objRgb.$attrs.content).assertContain('1.10');
      expect(objRgb.$attrs.content).assertContain('0.30');
      expect(objRgb.$attrs.content).assertContain('-1.00');
      expect(objAlpha.$attrs.content).assertContain('1.00');
      expect(objExposure.$attrs.content).assertEqual('Exposure: 0');
      
      console.info('[SUB_ArkUI_Graphics_LogExposure_0200] END');
    });
  })
}