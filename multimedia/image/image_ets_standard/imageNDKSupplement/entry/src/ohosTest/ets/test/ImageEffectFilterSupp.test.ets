/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import testNapi from 'libimageEffect.so'
import { ImageUtils } from './ImageUtils.test';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { JSON } from '@kit.ArkTS';

// 操作成功;
const EFFECT_SUCCESS = 0;
// 无效参数;
const EFFECT_ERROR_PARAM_INVALID = 401;
// 未知错误;
const EFFECT_ERROR_29000199 = 29000199;
// key 密钥错误;
const EFFECT_ERROR_29000122 = 29000122;
// 参数错误;
const EFFECT_ERROR_29000121 = 29000121;
const EFFECT_PARAM_ERROR = 401;
const CASE_INDEX_1 = 1
const  CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;

const TAG = 'imageEffectFilterSuppXts';

export default function ImageEffectFilterSuppTest() {
  describe('ImageEffectFilterSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_CREATE_SUPP_001
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_CREATE_SUPP_001
     * @tc.desc    OHEffectFilterCreateSupp——EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_CREATE_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_CREATE_SUPP_001'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectFilterCreateSupp(CASE_INDEX_3);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_CREATE_SUPP_002
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_CREATE_SUPP_002
     * @tc.desc    OHEffectFilterCreateSupp——空指针EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_CREATE_SUPP_002', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_CREATE_SUPP_002'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHEffectFilterCreateSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOK_UP_FILTERS_SUPP_003
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOK_UP_FILTERS_SUPP_003
     * @tc.desc    OHEffectFilterLookUpFiltersSupp——EFFECT_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOK_UP_FILTERS_SUPP_003', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOK_UP_FILTERS_SUPP_003'
      let result: number = testNapi.OHEffectFilterLookUpFiltersSupp(CASE_INDEX_3);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

   /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOK_UP_FILTERS_SUPP_004
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOK_UP_FILTERS_SUPP_004
     * @tc.desc    OHEffectFilterLookUpFiltersSupp-空指针检查
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
   it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOK_UP_FILTERS_SUPP_004', Level.LEVEL1, () => {
    console.info(TAG,'Start',);
    const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOK_UP_FILTERS_SUPP_004'
    let result: undefined = testNapi.OHEffectFilterLookUpFiltersNullptrSupp();
    console.info(TAG,testName,'Success',JSON.stringify(result));
    expect(result).assertUndefined();
  });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_005
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_005
     * @tc.desc    OHEffectFilterSetValueSupp空字符串——EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_005', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_005'
      let result: number = testNapi.OHEffectFilterSetValueSupp(CASE_INDEX_3);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_006
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_006
     * @tc.desc    OHEffectFilterSetValueSupp——EFFECT_PARAM_ERROR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_006', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_006'
      let result: number = testNapi.OHEffectFilterSetValueSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_PARAM_ERROR);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_007
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_007
     * @tc.desc    OHEffectFilterSetValueSupp——EFFECT_ERROR_PARAM_INVALID
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_007', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_SET_VALUE_SUPP_007'
      let result: number = testNapi.OHEffectFilterSetValueSupp(CASE_INDEX_4);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_008
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_008
     * @tc.desc    OHEffectFilterGetValueSupp——EFFECT_SUCCESS情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_008', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_008'
      let result: number = testNapi.OHEffectFilterGetValueSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_009
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_009
     * @tc.desc    OHEffectFilterGetValueSupp——空字符串EFFECT_ERROR_29000122情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_009', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_009'
      let result: number = testNapi.OHEffectFilterGetValueSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_29000122);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_0010
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_0010
     * @tc.desc    OHEffectFilterGetValueSupp的EFFECT_ERROR_PARAM_INVALID情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_0010', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_GET_VALUE_SUPP_0010'
      let result: number = testNapi.OHEffectFilterGetValueSupp(CASE_INDEX_3);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_REGISTER_SUPP_0011
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_REGISTER_SUPP_0011
     * @tc.desc    OHEffectFilterRegisterSupp的EFFECT_SUCCESS情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_REGISTER_SUPP_0011', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_REGISTER_SUPP_0011'
      let result: number = testNapi.OHEffectFilterRegisterSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_REGISTER_SUPP_0012
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_REGISTER_SUPP_0012
     * @tc.desc    OHEffectFilterRegisterSupp的EFFECT_ERROR_PARAM_INVALID情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_REGISTER_SUPP_0012', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_REGISTER_SUPP_0012'
      let result: number = testNapi.OHEffectFilterRegisterSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0013
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0013
     * @tc.desc    OHEffectFilterLookupFilterInfoSupp的EFFECT_SUCCESS情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0013', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0013'
      let result: number = testNapi.OHEffectFilterLookupFilterInfoSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0014
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0014
     * @tc.desc    OHEffectFilterLookupFilterInfoSupp的EFFECT_ERROR_PARAM_INVALID情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0014', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0014'
      let result: number = testNapi.OHEffectFilterLookupFilterInfoSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0015
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0015
     * @tc.desc    OHEffectFilterLookupFilterInfoSupp的空字符串情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0015', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_LOOKUP_FILTER_INFO_SUPP_0015'
      let result: number = testNapi.OHEffectFilterLookupFilterInfoSupp(CASE_INDEX_3);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RELEASE_SUPP_0016
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RELEASE_SUPP_0016
     * @tc.desc    OHEffectFilterReleaseSupp的EFFECT_SUCCESS情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RELEASE_SUPP_0016', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RELEASE_SUPP_0016'
      let result: number = testNapi.OHEffectFilterReleaseSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_SUCCESS);
    });

    /**
     * @tc.number  SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RELEASE_SUPP_0017
     * @tc.name    SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RELEASE_SUPP_0017
     * @tc.desc    OHEffectFilterReleaseSupp的EFFECT_ERROR_PARAM_INVALID情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RELEASE_SUPP_0017', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_EFFECT_FILTER_OH_EFFECT_FILTER_RELEASE_SUPP_0017'
      let result: number = testNapi.OHEffectFilterReleaseSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(EFFECT_ERROR_PARAM_INVALID);
    });
  });
  }