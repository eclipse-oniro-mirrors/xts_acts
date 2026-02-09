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
import testNapi from "libimageEffect.so";
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

const TAG = 'ImageSourceSuppXts';
const IMAGE_RESULT_BAD_PARAMETER = -1;
const IMAGE_RESULT_SUCCESS = 0;
let testContext: common.UIAbilityContext;

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

export default function ImageSourceSuppTest() {
  describe('ImageSourceSuppTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number   SUB_IMAGE_SOURCE_CREAT_SUPP_0001
     * @tc.name     SUB_IMAGE_SOURCE_CREAT_SUPP_0001
     * @tc.desc     OH_ImageSource_Create-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_SOURCE_CREAT_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceCreatTest(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_IMAGE_SOURCE_CREAT_SUCCESS_SUPP_0001
     * @tc.name     SUB_IMAGE_SOURCE_CREAT_SUCCESS_SUPP_0001
     * @tc.desc     OH_ImageSource_Create-IMAGE_RESULT_SUCCESS
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_SOURCE_CREAT_SUCCESS_SUPP_0001', Level.LEVEL0, async () => {
      console.info(TAG,'Start',);
      const fd = await getFd("test.jpg");
      if (fd <= 0) {
        console.error(TAG, 'fd 无效: ' + fd);
        return;
      };
      let result: number = testNapi.ImageSourceCreatSuccessTest(fd);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_SUCCESS);
    });

    /**
     * @tc.number   SUB_IMAGE_SOURCE_GET_SUPPORTED_FORMATS_SUPP_0001
     * @tc.name     SUB_IMAGE_SOURCE_GET_SUPPORTED_FORMATS_SUPP_0001
     * @tc.desc     OH_ImageSource_GetSupportedFormats-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_SOURCE_GET_SUPPORTED_FORMATS_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceGetSupportedFormatsTest(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_IMAGE_SOURCE_CREAT_INCREMENTAL_SUPP_0001
     * @tc.name     SUB_IMAGE_SOURCE_CREAT_INCREMENTAL_SUPP_0001
     * @tc.desc     OH_ImageSource_CreateIncremental-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_SOURCE_CREAT_INCREMENTAL_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: number = testNapi.ImageSourceCreateIncrementalTest(0);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_BAD_PARAMETER);
    });

    /**
     * @tc.number   SUB_IMAGE_SOURCE_INIT_NATIVE_SUPP_0001
     * @tc.name     SUB_IMAGE_SOURCE_INIT_NATIVE_SUPP_0001
     * @tc.desc     OH_ImageSource_InitNative-nullptr
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_SOURCE_INIT_NATIVE_SUPP_0001', Level.LEVEL0, () => {
      console.info(TAG,'Start',);
      let result: undefined = testNapi.ImageSourceInitNativeSuppTest();
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertUndefined();
    });

    /**
     * @tc.number   SUB_IMAGE_SOURCE_CREATE_SUPP_0001
     * @tc.name     SUB_IMAGE_SOURCE_CREATE_SUPP_0001
     * @tc.desc     OH_ImageSource_Create-IMAGE_RESULT_SUCCESS
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level 1
     */
    it('SUB_IMAGE_SOURCE_CREATE_SUPP_0001', Level.LEVEL0, async () => {
      console.info(TAG,'Start',);
      const fd = await getFd("test.jpg");
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const pathName = testContext.filesDir + "/" + "test.jpg";
      let result:number = testNapi.ImageSourceCreate(fd,pathName);
      console.info(TAG,'Success',JSON.stringify(result));
      expect(result).assertEqual(IMAGE_RESULT_SUCCESS);
    });

  });
}