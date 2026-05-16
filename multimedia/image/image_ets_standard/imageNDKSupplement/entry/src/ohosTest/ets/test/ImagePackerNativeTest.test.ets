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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import testNapi from 'libimageEffect.so'
import { image } from "@kit.ImageKit";
import { common } from "@kit.AbilityKit";
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import fileio from '@ohos.fileio'
import { indexSurfaceId } from "../testability/pages/Index";

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const TAG = 'ImageNdk.PackerNativeTest'
let fdNumber: number;
async function getFd(path: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + path;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image cese open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}
let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}
export default function ImagePackerNativeTest() {
  describe('ImagePackerNativeTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await sleep(1000);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });
    /**
     * @tc.number    SUB_IMAGE_PACKER_NATIVE_TEST_003
     * @tc.name      SUB_IMAGE_PACKER_NATIVE_TEST_003
     * @tc.desc      OH_DecodingOptions_Release-IMAGE_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_NATIVE_TEST_003", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.DecodingOptionsReleaseTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(401);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_NATIVE_TEST_005
     * @tc.name      SUB_IMAGE_PACKER_NATIVE_TEST_005
     * @tc.desc      OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation-IMAGE_GET_IMAGE_DATA_FAILED
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_NATIVE_TEST_005", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelmapFromSurfaceWithTransformationTest(CASE_INDEX_1,indexSurfaceId);
      console.info(TAG,'indexSurfaceId为：', indexSurfaceId)
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7600104);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_NATIVE_TEST_006
     * @tc.name      SUB_IMAGE_PACKER_NATIVE_TEST_006
     * @tc.desc      OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation-IMAGE_GET_IMAGE_DATA_FAILED
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_NATIVE_TEST_006", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelmapFromSurfaceWithTransformationTest(CASE_INDEX_2,indexSurfaceId);
      console.info(TAG,'indexSurfaceId为：', indexSurfaceId)
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7600104);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_NATIVE_TEST_007
     * @tc.name      SUB_IMAGE_PACKER_NATIVE_TEST_007
     * @tc.desc      OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation-IMAGE_INVALID_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_NATIVE_TEST_007", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelmapFromSurfaceWithTransformationTest(CASE_INDEX_3,indexSurfaceId);
      console.info(TAG,'indexSurfaceId为：', indexSurfaceId)
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7600206);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_NATIVE_TEST_008
     * @tc.name      SUB_IMAGE_PACKER_NATIVE_TEST_008
     * @tc.desc      OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation-IMAGE_INVALID_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_NATIVE_TEST_008", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelmapFromSurfaceWithTransformationTest(CASE_INDEX_4,indexSurfaceId);
      console.info(TAG,'indexSurfaceId为：', indexSurfaceId)
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7600206);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_NATIVE_TEST_009
     * @tc.name      SUB_IMAGE_PACKER_NATIVE_TEST_009
     * @tc.desc      OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation-IMAGE_INVALID_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_NATIVE_TEST_009", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.CreatePixelmapFromSurfaceWithTransformationTest(CASE_INDEX_5,indexSurfaceId);
      console.info(TAG,'indexSurfaceId为：', indexSurfaceId)
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(7600206);
    })
  })
}