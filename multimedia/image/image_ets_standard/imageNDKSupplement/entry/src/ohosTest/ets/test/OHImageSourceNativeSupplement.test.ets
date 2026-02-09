/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';


const IMAGE_SUCCESS = 0;
const IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE =7700102;
const IMAGE_SOURCE_INVALID_PARAMETER = 7700204;
const IMAGE_SOURCE_UNSUPPORTED_METADATA = 7700202;


const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;

const TAG = 'OHImageSourceNativeSupplementSupp';

export async function getFd(pathName: string) {
  console.info(TAG, 'case come in getFd');
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  pathName = testContext.filesDir + "/" + pathName;
  console.log(TAG, 'pathName =' + pathName);
  let file = await fs.openSync(pathName);
  let fdNumber = file.fd;
  console.info(TAG, 'case getFd number is: ' + fdNumber);
  return fdNumber;
}


export default function OHImageSourceNativeSupplementTest() {
  describe('OHImageSourceNativeSupplementTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_001
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_001
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyIntArray IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_001', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = 'PhotoMode';
      const value = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyIntArraySupp(CASE_INDEX_1, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_002
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_002
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyIntArray IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_002', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = "exifVersion";
      const value = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyIntArraySupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_003
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_003
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyIntArray IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_003', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = "PhotoMode";
      const value = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyIntArraySupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_004
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_004
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyIntArray IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_004', Level.LEVEL0, async () => {
      const fd = await getFd("test8.bmp");
      const key = "datetimeOriginal";
      const value = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyIntArraySupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_005
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_005
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyIntArray IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_005', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v2.heic");
      const key = 'PhotoMode';
      const value = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyIntArraySupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_001
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_001
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDoubleArray IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_001', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = 'PhotoMode';
      const value = 6.6;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDoubleArraySupp(CASE_INDEX_1, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_002
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_002
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDoubleArray IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_002', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = "exifVersion";
      const value = 6.6;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDoubleArraySupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_003
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_003
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDoubleArray IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_003', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = "FNumber";
      const value = 6.0;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDoubleArraySupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_004
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_004
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDoubleArray IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_004', Level.LEVEL0, async () => {
      const fd = await getFd("test8.bmp");
      const key = "datetimeOriginal";
      const value = 0.0;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDoubleArraySupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_005
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_005
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDoubleArray IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_ARRAY_005', Level.LEVEL0, async () => {
      const fd = await getFd("test.jpg");
      const key = 'makerNote';
      const value = 6.0;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDoubleArraySupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_001
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_001
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyLong IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_001', Level.LEVEL1, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = 'fNumber';
      const value = 6;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start');
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyLongSupp(CASE_INDEX_1, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_002
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_002
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyLong IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_002', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v3.heic");
      const key = "imageQuality";
      const value = 6;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyLongSupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_003
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_003
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyLong IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_003', Level.LEVEL0, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = "PhotoMode";
      const value = 6;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyLongSupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_004
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_004
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyLong IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_004', Level.LEVEL0, async () => {
      const fd = await getFd("test8.bmp");
      const key = "orientation ";
      const value = 6;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyLongSupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    });
    /**
     * @tc.number  SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_005
     * @tc.name    SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_005
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyLong IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_OH_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_LONG_005', Level.LEVEL0, async () => {
      const fd = await getFd("test.jpg");
      const key = "PhotoMode";
      const value = 6;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG, 'Start')
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyLongSupp(CASE_INDEX_2, fd, key, value);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_ERROR_CODE_001
     * @tc.name    SUB_IMAGE_ERROR_CODE_001
     * @tc.desc    ImageErrCodeSupp IMAGE_GET_IMAGE_DATA_FAILED
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_ERROR_CODE_001', Level.LEVEL0, async () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.ImageErrCodeSupp(CASE_INDEX_1);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(7600104);
    });
    /**
     * @tc.number  SUB_IMAGE_ERROR_CODE_002
     * @tc.name    SUB_IMAGE_ERROR_CODE_002
     * @tc.desc    ImageErrCodeSupp IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_ERROR_CODE_002', Level.LEVEL0, async () => {
      console.info(TAG, 'Start',);
      let result: number = testNapi.ImageErrCodeSupp(CASE_INDEX_2);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(7700202);
    });
  })
}