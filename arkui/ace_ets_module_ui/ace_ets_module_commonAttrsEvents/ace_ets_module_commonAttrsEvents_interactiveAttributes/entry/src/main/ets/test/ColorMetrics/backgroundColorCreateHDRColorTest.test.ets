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

export default function backgroundColorCreateHDRColorTest() {
  describe('backgroundColorCreateHDRColorTest', () => {
    beforeAll(async () => {
      console.info("[backgroundColorCreateHDRColorTest] beforeAll start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ColorMetrics/backgroundColorCreateHDRColorTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("[backgroundColorCreateHDRColorTest] get state success " + JSON.stringify(pages));
        if (!("backgroundColorCreateHDRColorTest" == pages.name)) {
          console.info("[backgroundColorCreateHDRColorTest] page name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("[backgroundColorCreateHDRColorTest] push page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("[backgroundColorCreateHDRColorTest] push page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.number    SUB_ArkUI_Graphics_CreateHDRColor_0100
     * @tc.name      createHDRColor_SRGB_test
     * @tc.desc      Test createHDRColor with ColorSpace.SRGB for backgroundColor and fillColor.
     * @tc.level:    LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('createHDRColor_SRGB_test', Level.LEVEL1, async () => {
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] START');
      let driver: Driver = Driver.create();
      let presetBtn1 = await driver.findComponent(ON.id('presetBtn1'));
      await presetBtn1.click();
      await CommonFunc.sleep(1000);
      
      let strJsonBg = getInspectorByKey('colorDisplayBg');
      let objBg: ESObject = JSON.parse(strJsonBg);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] colorDisplayBg: ' + JSON.stringify(objBg));
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] backgroundColor: ' + objBg.$attrs.backgroundColor);
      
      let strJsonImage = getInspectorByKey('testImage');
      let objImage: ESObject = JSON.parse(strJsonImage);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] testImage: ' + JSON.stringify(objImage));
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] fillColor: ' + objImage.$attrs.fillColor);
      
      let strJsonColorSpace = getInspectorByKey('colorSpaceText');
      let objColorSpace: ESObject = JSON.parse(strJsonColorSpace);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] colorSpaceText: ' + JSON.stringify(objColorSpace));
      
      let strJsonRgb = getInspectorByKey('rgbText');
      let objRgb: ESObject = JSON.parse(strJsonRgb);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] rgbText: ' + JSON.stringify(objRgb));
      
      let strJsonAlpha = getInspectorByKey('alphaText');
      let objAlpha: ESObject = JSON.parse(strJsonAlpha);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] alphaText: ' + JSON.stringify(objAlpha));
      
      expect(objBg.$attrs.backgroundColor).assertContain('#FF000000');
      expect(objImage.$attrs.fillColor).assertContain('#FF000000');
      
      expect(objColorSpace.$attrs.content).assertEqual('SRGB');
      expect(objRgb.$attrs.content).assertContain('0.00');
      expect(objRgb.$attrs.content).assertContain('2.00');
      expect(objAlpha.$attrs.content).assertContain('0.50');
      
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0100] END');
    });

    /**
     * @tc.number    SUB_ArkUI_Graphics_CreateHDRColor_0200
     * @tc.name      createHDRColor_DisplayP3_test
     * @tc.desc      Test createHDRColor with ColorSpace.DISPLAY_P3 for backgroundColor and fillColor.
     * @tc.level:    LEVEL1
     * @tc.type :    FUNCTION
     * @tc.size :    MEDIUMTEST
     */
    it('createHDRColor_DisplayP3_test', Level.LEVEL1, async () => {
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] START');
      let driver: Driver = Driver.create();
      let presetBtn2 = await driver.findComponent(ON.id('presetBtn2'));
      await presetBtn2.click();
      await CommonFunc.sleep(1000);
      
      let strJsonBg = getInspectorByKey('colorDisplayBg');
      let objBg: ESObject = JSON.parse(strJsonBg);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] colorDisplayBg: ' + JSON.stringify(objBg));
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] backgroundColor: ' + objBg.$attrs.backgroundColor);
      
      let strJsonImage = getInspectorByKey('testImage');
      let objImage: ESObject = JSON.parse(strJsonImage);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] testImage: ' + JSON.stringify(objImage));
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] fillColor: ' + objImage.$attrs.fillColor);
      
      let strJsonColorSpace = getInspectorByKey('colorSpaceText');
      let objColorSpace: ESObject = JSON.parse(strJsonColorSpace);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] colorSpaceText: ' + JSON.stringify(objColorSpace));
      
      let strJsonRgb = getInspectorByKey('rgbText');
      let objRgb: ESObject = JSON.parse(strJsonRgb);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] rgbText: ' + JSON.stringify(objRgb));
      
      let strJsonAlpha = getInspectorByKey('alphaText');
      let objAlpha: ESObject = JSON.parse(strJsonAlpha);
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] alphaText: ' + JSON.stringify(objAlpha));
      
      expect(objBg.$attrs.backgroundColor).assertContain('#FF000000');
      expect(objImage.$attrs.fillColor).assertContain('#FF000000');
      
      expect(objColorSpace.$attrs.content).assertEqual('DISPLAY_P3');
      expect(objRgb.$attrs.content).assertContain('0.00');
      expect(objRgb.$attrs.content).assertContain('10.00');
      expect(objAlpha.$attrs.content).assertEqual('Alpha: undefined');
      
      console.info('[SUB_ArkUI_Graphics_CreateHDRColor_0200] END');
    });
  })
}