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

import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextShaderStyleTest() {
  describe('TextShaderStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextShaderStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextShaderStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextShaderStyleTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(1000);
        if (!("TextShaderStyle" == pages.name)) {
          console.info("get TextShaderStyleTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextShaderStyleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextShaderStyleTest page error: " + err);
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TextShaderStyleTest after each called");
    });

    /**
     * @tc.name   TextShaderStyleTest_0010
     * @tc.number SUB_ACE_BASIC_ETS_API_TextShaderStyleTest_0010
     * @tc.desc   test Text shaderStyle: LinearGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextShaderStyleTest_0010', Level.LEVEL2, async (done: Function) => {
      console.info('[TextShaderStyleTest_0010] START');
      let strJson = getInspectorByKey('Text_linearGradientStyle');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextShaderStyleTest_0010] linearGradient: ' + JSON.stringify(obj.$attrs.linearGradient));
      expect(obj.$attrs.linearGradient.angle).assertEqual('45.00px');
      expect(obj.$attrs.linearGradient.direction).assertEqual('GradientDirection.LeftTop');
      expect(obj.$attrs.linearGradient.colors+'').assertEqual('#FFFF0000,0.000000,#FF0000FF,0.300000,#FF008000,0.500000');
      expect(obj.$attrs.linearGradient.repeating).assertEqual('false');
      console.info("[TextShaderStyleTest_0010] END");
      done();
    });

    /**
     * @tc.name   TextShaderStyleTest_0020
     * @tc.number SUB_ACE_BASIC_ETS_API_TextShaderStyleTest_0020
     * @tc.desc   test Text shaderStyle: radialGradientStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextShaderStyleTest_0020', Level.LEVEL2, async (done: Function) => {
      console.info('[TextShaderStyleTest_0020] START');
      let strJson = getInspectorByKey('Text_radialGradientStyle');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[TextShaderStyleTest_0020] radialGradient: ' + JSON.stringify(obj.$attrs.radialGradient));
      expect(obj.$attrs.radialGradient.center+'').assertEqual('50.00vp,50.00vp');
      expect(obj.$attrs.radialGradient.radius).assertEqual('20.00vp');
      expect(obj.$attrs.radialGradient.colors+'').assertEqual('#FFFF0000,0.000000,#FF0000FF,0.300000,#FF008000,0.500000');
      expect(obj.$attrs.radialGradient.repeating).assertEqual('true');
      console.info("[TextShaderStyleTest_0020] END");
      done();
    });
  })
}