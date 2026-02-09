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
import testNapi from 'libimageEffect.so';
import { JSON } from '@kit.ArkTS';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

const IMAGE_SOURCE_INVALID_PARAMETER = 7700204;
const IMAGE_SUCCESS = 0;
const IMAGE_SOURCE_UNSUPPORTED_METADATA = 7700202;
const IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE = 7700102;
const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const TAG = 'Xts.ImageSourceNativeGetImagePropertyTest';
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
export default function OHImageSourceNativeSupp() {
  describe('OHImageSourceNativeSupp', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_001
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyLong-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_001', Level.LEVEL1, async () => {
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyLong(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_002
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyLong-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_002', Level.LEVEL1, async () => {
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyLong(CASE_INDEX_2,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_003
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyLong-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_003', Level.LEVEL1, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = 'PhotoMode';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyLong(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_004
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyLong-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_LONG_004', Level.LEVEL1, async () => {
      const fd = await getFd("test8.bmp");
      const key = 'imageHeight';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyLong(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_001
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyShort-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_001', Level.LEVEL1, async () => {
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyShort(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_002
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyShort-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_002', Level.LEVEL1, async () => {
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyShort(CASE_INDEX_2,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_003
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyShort-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_003', Level.LEVEL1, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = 'PhotoMode';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyShort(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_004
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyShort-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_SHORT_004', Level.LEVEL1, async () => {
      const fd = await getFd("test8.bmp");
      const key = 'imageHeight';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyShort(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_001
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDouble-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_001', Level.LEVEL1, async () => {
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDouble(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_002
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDouble-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_002', Level.LEVEL1, async () => {
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDouble(CASE_INDEX_2,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_003
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDouble-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_003', Level.LEVEL1, async () => {
      const fd = await getFd("test_exif_v2.png");
      const key = 'FNumber';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDouble(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_004
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyDouble-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_DOUBLE_004', Level.LEVEL1, async () => {
      const fd = await getFd("test8.bmp");
      const key = 'imageHeight';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceNativeGetImagePropertyDouble(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_001
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyArraySize-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_001', Level.LEVEL1, async () => {
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceGetImagePropertyArraySize(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_002
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyArraySize-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_002', Level.LEVEL1, async () => {
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceGetImagePropertyArraySize(CASE_INDEX_2,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_003
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyArraySize-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_003', Level.LEVEL1, async () => {
      const fd = await getFd("test_exif_v2.jpg");
      const key = 'PhotoMode';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceGetImagePropertyArraySize(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    });
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_004
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyArraySize-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_ARRAY_SIZE_004', Level.LEVEL1, async () => {
      const fd = await getFd("test8.bmp");
      const key = 'imageHeight';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceGetImagePropertyArraySize(CASE_INDEX_1,fd,key);
      console.info(TAG, 'Success', JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    });
  });
}