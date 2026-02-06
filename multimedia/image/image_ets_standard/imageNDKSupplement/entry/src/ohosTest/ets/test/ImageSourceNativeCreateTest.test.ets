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
import { JSON } from '@kit.ArkTS';
const IMAGE_SUCCESS = 0;
const IMAGE_BAD_PARAMETER = 401;
const IMAGE_TOO_LARGE = 7600103;
const IMAGE_BAD_SOURCE = 7700101;
const CASE_INDEX_1 = 1
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;

const TAG = 'imageFrameworkImageSourceNativeCreateSuppXts';
export default function imageFrameworkImageSourceNativeCreateSuppTest() {
  describe('imageFrameworkImageSourceNativeCreateSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_URI_SUPP_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_URI_SUPP_001
     * @tc.desc    OHSourceNativeCreateFromUriSupp-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_URI_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_URI_SUPP_001'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeCreateFromUriSupp(CASE_INDEX_2)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_URI_SUPP_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_URI_SUPP_002
     * @tc.desc    OHSourceNativeCreateFromUriSupp-空字符串IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_URI_SUPP_002', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_URI_SUPP_002'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeCreateFromUriSupp(CASE_INDEX_3)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_FD_SUPP_001
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_FD_SUPP_001
     * @tc.desc    OHSourceNativeCreateFromFdSupp-IMAGE_SUCCESS
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_FD_SUPP_001', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_FD_SUPP_001'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeCreateFromFdSupp(CASE_INDEX_1)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_SUCCESS);
    })

    /**
     * @tc.number  SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_FD_SUPP_002
     * @tc.name    SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_FD_SUPP_002
     * @tc.desc    OHSourceNativeCreateFromFdSupp-IMAGE_BAD_PARAMETER
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_FD_SUPP_002', Level.LEVEL1, () => {
      const testName ='SUB_IMAGE_SOURCE_NATIVE_CREATE_FROM_FD_SUPP_002'
      console.info(TAG,'Start',);
      let result: number = testNapi.OHImageSourceNativeCreateFromFdSupp(CASE_INDEX_2)
      console.info(TAG,testName,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_BAD_PARAMETER);
    })
  });
}
