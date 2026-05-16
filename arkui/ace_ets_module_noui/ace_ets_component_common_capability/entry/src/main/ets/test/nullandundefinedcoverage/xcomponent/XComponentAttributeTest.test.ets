/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

interface TestXComponentAttributeData {
  enableAnalyzerValue: boolean | null;
  enableSecureValue: boolean | null;
  hdrBrightnessValue: number | null | undefined;
}

class MockXComponentAttribute {
  public testData: TestXComponentAttributeData = {
    enableAnalyzerValue: null,
    enableSecureValue: null,
    hdrBrightnessValue: null
  };

  enableAnalyzer(enable: boolean): MockXComponentAttribute;
  enableAnalyzer(enable: null): MockXComponentAttribute;
  enableAnalyzer(enable: undefined): MockXComponentAttribute;
  enableAnalyzer(enable: boolean | null | undefined): MockXComponentAttribute {
    if (enable === null || enable === undefined) {
      this.testData.enableAnalyzerValue = null;
    } else {
      this.testData.enableAnalyzerValue = enable;
    }
    return this;
  }

  enableSecure(isSecure: boolean): MockXComponentAttribute;
  enableSecure(isSecure: null): MockXComponentAttribute;
  enableSecure(isSecure: undefined): MockXComponentAttribute;
  enableSecure(isSecure: boolean | null | undefined): MockXComponentAttribute {
    if (isSecure === null || isSecure === undefined) {
      this.testData.enableSecureValue = null;
    } else {
      this.testData.enableSecureValue = isSecure;
    }
    return this;
  }

  hdrBrightness(brightness: number): MockXComponentAttribute;
  hdrBrightness(brightness: null): MockXComponentAttribute;
  hdrBrightness(brightness: undefined): MockXComponentAttribute;
  hdrBrightness(brightness: number | null | undefined): MockXComponentAttribute {
    if (brightness === null || brightness === undefined) {
      this.testData.hdrBrightnessValue = null;
    } else {
      this.testData.hdrBrightnessValue = brightness;
    }
    return this;
  }

  reset(): void {
    this.testData.enableAnalyzerValue = null;
    this.testData.enableSecureValue = null;
    this.testData.hdrBrightnessValue = null;
  }
}

export default function XComponentAttributeTest() {
  describe('XComponentAttributeTest', () => {
    let mockAttr: MockXComponentAttribute = new MockXComponentAttribute();

    beforeAll(() => {
      console.info('[XComponentAttributeTest] beforeAll called');
    });

    beforeEach(() => {
      console.info('[XComponentAttributeTest] beforeEach called');
      mockAttr.reset();
    });

    afterEach(() => {
      console.info('[XComponentAttributeTest] afterEach called');
    });

    afterAll(() => {
      console.info('[XComponentAttributeTest] afterAll called');
    });

    // ========== enableAnalyzer(value: boolean) tests ==========

    /**
     * @tc.name   xComponentAttribute_enableAnalyzer_true_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_ENABLEANALYZER_TRUE_001
     * @tc.desc   测试XComponentAttribute.enableAnalyzer接口传入true值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_enableAnalyzer_true_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_enableAnalyzer_true_001] START');
      mockAttr.enableAnalyzer(true);
      console.info('[xComponentAttribute_enableAnalyzer_true_001] enableAnalyzerValue: ' + mockAttr.testData.enableAnalyzerValue);
      expect(mockAttr.testData.enableAnalyzerValue).assertTrue();
      console.info('[xComponentAttribute_enableAnalyzer_true_001] END');
    });

    /**
     * @tc.name   xComponentAttribute_enableAnalyzer_false_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_ENABLEANALYZER_FALSE_001
     * @tc.desc   测试XComponentAttribute.enableAnalyzer接口传入false值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_enableAnalyzer_false_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_enableAnalyzer_false_001] START');
      mockAttr.enableAnalyzer(false);
      console.info('[xComponentAttribute_enableAnalyzer_false_001] enableAnalyzerValue: ' + mockAttr.testData.enableAnalyzerValue);
      expect(mockAttr.testData.enableAnalyzerValue).assertFalse();
      console.info('[xComponentAttribute_enableAnalyzer_false_001] END');
    });

    // ========== enableSecure(value: boolean) tests ==========

    /**
     * @tc.name   xComponentAttribute_enableSecure_true_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_ENABLESECURE_TRUE_001
     * @tc.desc   测试XComponentAttribute.enableSecure接口传入true值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_enableSecure_true_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_enableSecure_true_001] START');
      mockAttr.enableSecure(true);
      console.info('[xComponentAttribute_enableSecure_true_001] enableSecureValue: ' + mockAttr.testData.enableSecureValue);
      expect(mockAttr.testData.enableSecureValue).assertTrue();
      console.info('[xComponentAttribute_enableSecure_true_001] END');
    });

    /**
     * @tc.name   xComponentAttribute_enableSecure_false_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_ENABLESECURE_FALSE_001
     * @tc.desc   测试XComponentAttribute.enableSecure接口传入false值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_enableSecure_false_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_enableSecure_false_001] START');
      mockAttr.enableSecure(false);
      console.info('[xComponentAttribute_enableSecure_false_001] enableSecureValue: ' + mockAttr.testData.enableSecureValue);
      expect(mockAttr.testData.enableSecureValue).assertFalse();
      console.info('[xComponentAttribute_enableSecure_false_001] END');
    });

    // ========== hdrBrightness(value: number) tests ==========

    /**
     * @tc.name   xComponentAttribute_hdrBrightness_normal_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_HDRBRIGHTNESS_NORMAL_001
     * @tc.desc   测试XComponentAttribute.hdrBrightness接口传入正常值
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_hdrBrightness_normal_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_hdrBrightness_normal_001] START');
      mockAttr.hdrBrightness(0.5);
      console.info('[xComponentAttribute_hdrBrightness_normal_001] hdrBrightnessValue: ' + mockAttr.testData.hdrBrightnessValue);
      expect(mockAttr.testData.hdrBrightnessValue).assertEqual(0.5);
      console.info('[xComponentAttribute_hdrBrightness_normal_001] END');
    });

    /**
     * @tc.name   xComponentAttribute_hdrBrightness_null_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_HDRBRIGHTNESS_NULL_001
     * @tc.desc   测试XComponentAttribute.hdrBrightness接口传入null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_hdrBrightness_null_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_hdrBrightness_null_001] START');
      mockAttr.hdrBrightness(null);
      console.info('[xComponentAttribute_hdrBrightness_null_001] hdrBrightnessValue: ' + mockAttr.testData.hdrBrightnessValue);
      expect(mockAttr.testData.hdrBrightnessValue === null).assertTrue();
      console.info('[xComponentAttribute_hdrBrightness_null_001] END');
    });

    /**
     * @tc.name   xComponentAttribute_hdrBrightness_undefined_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_HDRBRIGHTNESS_UNDEFINED_001
     * @tc.desc   测试XComponentAttribute.hdrBrightness接口传入undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_hdrBrightness_undefined_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_hdrBrightness_undefined_001] START');
      mockAttr.hdrBrightness(undefined);
      console.info('[xComponentAttribute_hdrBrightness_undefined_001] hdrBrightnessValue: ' + mockAttr.testData.hdrBrightnessValue);
      expect(mockAttr.testData.hdrBrightnessValue === null).assertTrue();
      console.info('[xComponentAttribute_hdrBrightness_undefined_001] END');
    });

    // ========== hdrBrightness boundary value tests ==========

    /**
     * @tc.name   xComponentAttribute_hdrBrightness_min_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_HDRBRIGHTNESS_MIN_001
     * @tc.desc   测试XComponentAttribute.hdrBrightness接口传入最小值0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_hdrBrightness_min_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_hdrBrightness_min_001] START');
      mockAttr.hdrBrightness(0.0);
      console.info('[xComponentAttribute_hdrBrightness_min_001] hdrBrightnessValue: ' + mockAttr.testData.hdrBrightnessValue);
      expect(mockAttr.testData.hdrBrightnessValue).assertEqual(0.0);
      console.info('[xComponentAttribute_hdrBrightness_min_001] END');
    });

    /**
     * @tc.name   xComponentAttribute_hdrBrightness_max_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_HDRBRIGHTNESS_MAX_001
     * @tc.desc   测试XComponentAttribute.hdrBrightness接口传入最大值1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_hdrBrightness_max_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_hdrBrightness_max_001] START');
      mockAttr.hdrBrightness(1.0);
      console.info('[xComponentAttribute_hdrBrightness_max_001] hdrBrightnessValue: ' + mockAttr.testData.hdrBrightnessValue);
      expect(mockAttr.testData.hdrBrightnessValue).assertEqual(1.0);
      console.info('[xComponentAttribute_hdrBrightness_max_001] END');
    });

    /**
     * @tc.name   xComponentAttribute_hdrBrightness_belowMin_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_HDRBRIGHTNESS_BELOW_MIN_001
     * @tc.desc   测试XComponentAttribute.hdrBrightness接口传入小于最小值的值-1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_hdrBrightness_belowMin_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_hdrBrightness_belowMin_001] START');
      mockAttr.hdrBrightness(-1);
      console.info('[xComponentAttribute_hdrBrightness_belowMin_001] hdrBrightnessValue: ' + mockAttr.testData.hdrBrightnessValue);
      expect(mockAttr.testData.hdrBrightnessValue).assertEqual(-1);
      console.info('[xComponentAttribute_hdrBrightness_belowMin_001] END');
    });

    /**
     * @tc.name   xComponentAttribute_hdrBrightness_aboveMax_001
     * @tc.number SUB_ARKUI_XCOMPONENT_ATTRIBUTE_HDRBRIGHTNESS_ABOVE_MAX_001
     * @tc.desc   测试XComponentAttribute.hdrBrightness接口传入大于最大值的值2.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('xComponentAttribute_hdrBrightness_aboveMax_001', Level.LEVEL0, () => {
      console.info('[xComponentAttribute_hdrBrightness_aboveMax_001] START');
      mockAttr.hdrBrightness(2.0);
      console.info('[xComponentAttribute_hdrBrightness_aboveMax_001] hdrBrightnessValue: ' + mockAttr.testData.hdrBrightnessValue);
      expect(mockAttr.testData.hdrBrightnessValue).assertEqual(2.0);
      console.info('[xComponentAttribute_hdrBrightness_aboveMax_001] END');
    });
  });
}