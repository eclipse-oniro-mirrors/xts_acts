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
const IMAGE_SOURCE_INVALID_PARAMETER = 7700204;
const IMAGE_SOURCE_UNSUPPORTED_METADATA = 7700202;
const IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE  = 7700102;
const CASE_INDEX_1 = 1
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;

const TAG = 'imageFrameworkImageSourceNativeModifySuppXts';

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

export default function imageFrameworkImageSourceNativeModifySuppTest() {
  describe('imageFrameworkImageSourceNativeModifySuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_001
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDouble-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_001', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_001'
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyDoubleSupp(CASE_INDEX_1,fd,key)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER );
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_002
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDouble-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_002', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_002'
      const fd = await getFd("test8.bmp");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyDoubleSupp(CASE_INDEX_2,fd,key)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_003
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDouble-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_003', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_003'
      const fd = await getFd("test.jpg");
      const key = 'exifVersion';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyDoubleSupp(CASE_INDEX_3,fd,key)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_004
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDouble-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_004', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_004'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'FNumber';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyDoubleSupp(CASE_INDEX_4,fd,key)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_005
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_005
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDouble-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_005', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_SUPP_005'
      const fd = await getFd("test.jpg");
      const key = 'FNumber';
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyDoubleSupp(CASE_INDEX_4,fd,key)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_001
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyIntArray-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_001', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_001'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'PhotoMode';
      const valueArray = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyIntArraySupp(CASE_INDEX_1,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_002
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyIntArray-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_002', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_002'
      const fd = await getFd("test_exif_v2.png");
      const key = 'exifVersion';
      const valueArray = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyIntArraySupp(CASE_INDEX_2,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_003
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyIntArray-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_003', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_003'
      const fd = await getFd("test8.bmp");
      const key = 'FNumber';
      const valueArray = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyIntArraySupp(CASE_INDEX_2,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_004
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyIntArray-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_004', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_004'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'PhotoMode';
      const valueArray = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyIntArraySupp(CASE_INDEX_2,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_005
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_005
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyIntArray-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_005', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_INT_ARRAY_SUPP_005'
      const fd = await getFd("test.jpg");
      const key = 'PhotoMode';
      const valueArray = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyIntArraySupp(CASE_INDEX_2,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_001
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDoubleArray-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_001', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_001'
      const fd = await getFd("test8.bmp");
      const key = 'PhotoMode';
      const valueArray = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyDoubleArraySupp(CASE_INDEX_1,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_002
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDoubleArray-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_002', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_002'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'PhotoMode';
      const valueArray = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyDoubleArraySupp(CASE_INDEX_2,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_003
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDoubleArray-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_003', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_003'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'exifVersion';
      const valueArray = [1];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyDoubleArraySupp(CASE_INDEX_1,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_004
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDoubleArray-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_004', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_004'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'PhotoMode';
      const valueArray = [1.0];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyDoubleArraySupp(CASE_INDEX_1,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_005
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_005
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyDoubleArray-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_005', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_DOUBLE_ARRAY_SUPP_005'
      const fd = await getFd("test.jpg");
      const key = 'PhotoMode';
      const valueArray = [1.0];
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyDoubleArraySupp(CASE_INDEX_1,fd,key,valueArray)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_001
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyBlob-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_001', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_001'
      const fd = await getFd("test8.bmp");
      const key = 'oecf';
      const binaryArr = [1, 0, 8, 16];
      const valueArrayBuffer = new Uint8Array(binaryArr).buffer;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyBlobSupp(CASE_INDEX_1,fd,key,valueArrayBuffer)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_002
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyBlob-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_002', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_002'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'PhotoMode';
      const binaryArr = [1, 0, 8, 16];
      const valueArrayBuffer = new Uint8Array(binaryArr).buffer;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyBlobSupp(CASE_INDEX_2,fd,key,valueArrayBuffer)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_003
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyBlob-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_003', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_003'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'PhotoMode';
      const binaryArr = [1, 0, 8, 16];
      const valueArrayBuffer = new Uint8Array(binaryArr).buffer;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyBlobSupp(CASE_INDEX_1,fd,key,valueArrayBuffer)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_004
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyBlob-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_004', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_004'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'oecf';
      const binaryArr = [1, 0, 8, 16];
      const valueArrayBuffer = new Uint8Array(binaryArr).buffer;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyBlobSupp(CASE_INDEX_1,fd,key,valueArrayBuffer)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_005
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_005
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyBlob-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_005', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_BLOB_SUPP_005'
      const fd = await getFd("test.jpg");
      const key = 'makerNote';
      const binaryArr = [1, 0, 8];
      const valueArrayBuffer = new Uint8Array(binaryArr).buffer;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeModifyImagePropertyBlobSupp(CASE_INDEX_1,fd,key,valueArrayBuffer)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_001
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyShort-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_001', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_001'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'PixelXDimension';
      const value = 1024;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyShortSupp(CASE_INDEX_2,fd,key,value)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_002
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyShort-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_002', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_002'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'ColorSpace';
      const value = 1024;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyShortSupp(CASE_INDEX_1,fd,key,value)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_003
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyShort-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_003', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_003'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'ColorSpace';
      const value = 1024;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyShortSupp(CASE_INDEX_2,fd,key,value)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_004
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyShort-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_004', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_004'
      const fd = await getFd("test8.bmp");
      const key = 'ColorSpace';
      const value = 1024;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyShortSupp(CASE_INDEX_2,fd,key,value)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_005
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_005
     * @tc.desc    OH_ImageSourceNative_ModifyImagePropertyShort-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_005', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_MODIFY_IMAGE_PROPERTY_SHORT_SUPP_005'
      const fd = await getFd("test.jpg");
      const key = 'FocalPlaneXResolution';
      const value = 1;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageModifyImagePropertyShortSupp(CASE_INDEX_2,fd,key,value)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_003
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyBlob-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_003', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_003'
      const fd = await getFd("test8.bmp");
      const key = 'oecf';
      const binaryArr = [101,120,99,99,22,11,12,23];
      const valueArrayBuffer = new Uint8Array(binaryArr).buffer;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyBlobSupp(CASE_INDEX_1, fd, key, valueArrayBuffer)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_004
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyBlob-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_004', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_004'
      const fd = await getFd("test.jpg");
      const key = 'PhotoMode';
      const binaryArr = [101,120,99,99,22,11,12,23];
      const valueArrayBuffer = new Uint8Array(binaryArr).buffer;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyBlobSupp(CASE_INDEX_1, fd, key, valueArrayBuffer)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_005
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_005
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyBlob-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_005', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_BLOB_SUPP_005'
      const fd = await getFd("test.jpg");
      const key = 'oecf';
      const binaryArr = [101,120,99,99,22,11,12,23];
      const valueArrayBuffer = new Uint8Array(binaryArr).buffer;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyBlobSupp(CASE_INDEX_2, fd, key, valueArrayBuffer)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_002
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyString-IMAGE_SOURCE_UNSUPPORTED_METADATA
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_002', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_002'
      const fd = await getFd("test_exif_v3.heic");
      const key = 'oecf';
      const bufSize = 256;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyStringSupp(CASE_INDEX_1, fd, key, bufSize)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_METADATA);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_003
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_003
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyString-IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_003', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_003'
      const fd = await getFd("test8.bmp");
      const key = 'oecf';
      const bufSize = 256;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyStringSupp(CASE_INDEX_1, fd, key, bufSize)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_UNSUPPORTED_MIME_TYPE);
    })
    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_004
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_004
     * @tc.desc    OH_ImageSourceNative_GetImagePropertyString-IMAGE_SOURCE_INVALID_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_004', Level.LEVEL1, async () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_GET_IMAGE_PROPERTY_STRING_SUPP_004'
      const fd = await getFd("test8.bmp");
      const key = 'oecf';
      const bufSize = 256;
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeGetImagePropertyStringSupp(CASE_INDEX_2, fd, key, bufSize)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SOURCE_INVALID_PARAMETER);
    })
  });
}
