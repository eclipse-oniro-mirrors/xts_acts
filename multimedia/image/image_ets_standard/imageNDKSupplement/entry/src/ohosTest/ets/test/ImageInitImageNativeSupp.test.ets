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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';

const IMAGE_SUCCESS = 0;
const IMAGE_BAD_PARAMETER =401
const IMAGE_INVALID_PARAMETER = 7600206;
const IMAGE_UNSUPPORTED_METADATA = 7600202
const IMAGE_DMA_NOT_EXIST = 7600173
const IMAGE_DMA_OPERATION_FAILED= 7600174
const IMAGE_ALLOC_FAILED = 7600301
const IMAGE_COPY_FAILED = 7600302
const CASE_INDEX_1 = 1
const CASE_INDEX_2 = 2
const CASE_INDEX_3 = 3
const CASE_INDEX_4 = 4
const CASE_INDEX_5 = 5
const TAG = 'imageInitImageNativeSuppXts';
export default function ImageInitImageNativeSuppTest() {
  describe('ImageInitImageNativeSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_INIT_IMAGE_NATIVE_SUPP_001
     * @tc.name    SUB_IMAGE_INIT_IMAGE_NATIVE_SUPP_001
     * @tc.desc    OH_Image_InitImageNative-空指针检查
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_INIT_IMAGE_NATIVE_SUPP_001', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_INIT_IMAGE_NATIVE_SUPP_001'
      let result:undefined = testNapi.OHImageInitImageNativeSupp();
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertUndefined();
    });
    /**
     * @tc.number  SUB_IMAGE_COMMON_PICTURE_METADATA_GET_PROPERTY_WITH_NULL_SUPP_001
     * @tc.name    SUB_IMAGE_COMMON_PICTURE_METADATA_GET_PROPERTY_WITH_NULL_SUPP_001
     * @tc.desc    OH_PictureMetadata_GetPropertyWithNull-IMAGE_INVALID_PARAMETER情况
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_COMMON_PICTURE_METADATA_GET_PROPERTY_WITH_NULL_SUPP_001', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_COMMON_PICTURE_METADATA_GET_PROPERTY_WITH_NULL_SUPP_001'
      let result: number = testNapi.OHPictureMetadataGetPropertyWithNullSupp(CASE_INDEX_1);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
    });
    /**
     * @tc.number  SUB_IMAGE_COMMON_PICTURE_METADATA_GET_PROPERTY_WITH_NULL_SUPP_002
     * @tc.name    SUB_IMAGE_COMMON_PICTURE_METADATA_GET_PROPERTY_WITH_NULL_SUPP_002
     * @tc.desc    OH_PictureMetadata_GetPropertyWithNull-IMAGE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_COMMON_PICTURE_METADATA_GET_PROPERTY_WITH_NULL_SUPP_002', Level.LEVEL1, () => {
      console.info(TAG,'Start',);
      const testName = 'SUB_IMAGE_COMMON_PICTURE_METADATA_GET_PROPERTY_WITH_NULL_SUPP_002'
      let result: number = testNapi.OHPictureMetadataGetPropertyWithNullSupp(CASE_INDEX_2);
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_IMAGE_FRAMEWORK_PACKING_OPTIONS_CREATE_SUPP_001
     * @tc.name    SUB_IMAGE_FRAMEWORK_PACKING_OPTIONS_CREATE_SUPP_001
     * @tc.desc    OH_PackingOptions_Create-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_FRAMEWORK_PACKING_OPTIONS_CREATE_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_FRAMEWORK_PACKING_OPTIONS_CREATE_SUPP_001'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHPackingOptionsCreateSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_001
     * @tc.name    SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_001
     * @tc.desc    OH_PixelmapNative_GetMetadata-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_001'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPixelmapNativeGetMetadataSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS)
    })
    /**
     * @tc.number  SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_002
     * @tc.name    SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_002
     * @tc.desc    OH_PixelmapNative_GetMetadata-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_002', Level.LEVEL1, () => {
      const testName ='SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_002'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPixelmapNativeGetMetadataSupp(CASE_INDEX_2)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER)
    })
    /**
     * @tc.number  SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_003
     * @tc.name    SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_003
     * @tc.desc    OH_PixelmapNative_GetMetadata-IMAGE_COPY_FAILED
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_003', Level.LEVEL1, () => {
      const testName ='SUB_PIXELMAP_NATIVE_GET_METADATA_SUPP_003'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPixelmapNativeGetMetadataSupp(CASE_INDEX_3)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_COPY_FAILED)
    })
    /**
     * @tc.number  SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_001
     * @tc.name    SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_001
     * @tc.desc    OH_PixelmapNative_SetMetadata-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_001'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPixelmapNativeSetMetadataSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS)
    })
    /**
     * @tc.number  SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_002
     * @tc.name    SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_002
     * @tc.desc    OH_PixelmapNative_SetMetadata-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_002', Level.LEVEL1, () => {
      const testName ='SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_002'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPixelmapNativeSetMetadataSupp(CASE_INDEX_2)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER)
    })
    /**
     * @tc.number  SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_003
     * @tc.name    SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_003
     * @tc.desc    OH_PixelmapNative_SetMetadata-IMAGE_DMA_NOT_EXIST
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_003', Level.LEVEL1, () => {
      const testName ='SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_003'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPixelmapNativeSetMetadataSupp(CASE_INDEX_3)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_DMA_NOT_EXIST)
    })
    /**
     * @tc.number  SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_005
     * @tc.name    SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_005
     * @tc.desc    OH_PixelmapNative_SetMetadata-IMAGE_COPY_FAILED
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_005', Level.LEVEL1, () => {
      const testName ='SUB_PIXELMAP_NATIVE_SET_METADATA_SUPP_005'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPixelmapNativeSetMetadataSupp(CASE_INDEX_5)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_COPY_FAILED)
    })
    /**
     * @tc.number  SUB_CONVERT_PIXELMAP_NATIVE_FROM_NAPI_SUPP_001
     * @tc.name    SUB_CONVERT_PIXELMAP_NATIVE_FROM_NAPI_SUPP_001
     * @tc.desc    OH_PixelmapNative_ConvertPixelmapNativeFromNapi-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_CONVERT_PIXELMAP_NATIVE_FROM_NAPI_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_CONVERT_PIXELMAP_NATIVE_FROM_NAPI_SUPP_001'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHConvertPixelmapNativeFromNapiSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS)
    })
    /**
     * @tc.number  SUB_PICTURE_NATIVE_GET_METADATA_SUPP_001
     * @tc.name    SUB_PICTURE_NATIVE_GET_METADATA_SUPP_001
     * @tc.desc    OH_PictureNative_GetMetadata-IMAGE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PICTURE_NATIVE_GET_METADATA_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_PICTURE_NATIVE_GET_METADATA_SUPP_001'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let basePath = context.filesDir;
      let filePath = basePath + '/' + 'test_exif_v3.jpg';
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPictureNativeGetMetadataSupp(CASE_INDEX_1,filePath)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_METADATA)
    })
    /**
     * @tc.number  SUB_PICTURE_NATIVE_SET_METADATA_SUPP_001
     * @tc.name    SUB_PICTURE_NATIVE_SET_METADATA_SUPP_001
     * @tc.desc    OH_PictureNative_SetMetadata-IMAGE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_PICTURE_NATIVE_SET_METADATA_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_PICTURE_NATIVE_SET_METADATA_SUPP_001'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let basePath = context.filesDir;
      let filePath = basePath + '/' + 'test_exif_v3.jpg';
      console.info(TAG,'Start',);
      let result:number = testNapi.OHPictureNativeSetMetadataSupp(CASE_INDEX_1,filePath)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_METADATA)
    })
    /**
     * @tc.number  SUB_AUXILIARY_PICTURE_NATIVE_SET_METADATA_SUPP_001
     * @tc.name    SUB_AUXILIARY_PICTURE_NATIVE_SET_METADATA_SUPP_001
     * @tc.desc    OH_AuxiliaryPictureNative_SetMetadata-IMAGE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_AUXILIARY_PICTURE_NATIVE_SET_METADATA_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_AUXILIARY_PICTURE_NATIVE_SET_METADATA_SUPP_001'
      console.info(TAG,'Start',);
      let result:number = testNapi.OHAuxiliaryPictureNativeSetMetadataSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_METADATA)
    })
  });
}