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
import fileio from '@ohos.fileio'
import { common } from "@kit.AbilityKit";

const CASE_INDEX_1 = 1;
const CASE_INDEX_2 = 2;
const CASE_INDEX_3 = 3;
const CASE_INDEX_4 = 4;
const CASE_INDEX_5 = 5;
const CASE_INDEX_6 = 6;
const TAG = 'ImageNdk.ImagePackerCreateTest'
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

export default function OHImagePackerCreateTest() {
  describe('OHImagePackerCreateTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
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
     * @tc.number    SUB_IMAGE_PACKER_CREATE_TEST_001
     * @tc.name      SUB_IMAGE_PACKER_CREATE_TEST_001
     * @tc.desc      OH_ImagePacker_Create-IMAGE_RESULT_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_CREATE_TEST_001", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImagePackerCreateTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_CREATE_TEST_002
     * @tc.name      SUB_IMAGE_PACKER_CREATE_TEST_002
     * @tc.desc      OH_ImagePacker_Create-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_CREATE_TEST_002", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImagePackerCreateTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_CREATE_TEST_003
     * @tc.name      SUB_IMAGE_PACKER_CREATE_TEST_003
     * @tc.desc      OH_ImagePacker_Create-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_CREATE_TEST_003", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImagePackerCreateTest(CASE_INDEX_3);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_INITNATIVE_TEST_004
     * @tc.name      SUB_IMAGE_PACKER_INITNATIVE_TEST_004
     * @tc.desc      ImagePackerInitNativeTest-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_INITNATIVE_TEST_004", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImagePackerInitNativeTest(CASE_INDEX_1);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_INITNATIVE_TEST_005
     * @tc.name      SUB_IMAGE_PACKER_INITNATIVE_TEST_005
     * @tc.desc      ImagePackerInitNativeTest-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_INITNATIVE_TEST_005", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImagePackerInitNativeTest(CASE_INDEX_2);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_INITNATIVE_TEST_006
     * @tc.name      SUB_IMAGE_PACKER_INITNATIVE_TEST_006
     * @tc.desc      ImagePackerInitNativeTest-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_INITNATIVE_TEST_006", Level.LEVEL0, () => {
      console.info(TAG, 'Start');
      let result: number = testNapi.ImagePackerInitNativeTest(CASE_INDEX_3);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTODATA_TEST_007
     * @tc.name      SUB_IMAGE_PACKER_PACKTODATA_TEST_007
     * @tc.desc      OH_ImagePacker_PackToData-IMAGE_RESULT_SUCCESS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTODATA_TEST_007", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToDataTest(CASE_INDEX_1, fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTODATA_TEST_008
     * @tc.name      SUB_IMAGE_PACKER_PACKTODATA_TEST_008
     * @tc.desc      OH_ImagePacker_PackToData-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTODATA_TEST_008", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToDataTest(CASE_INDEX_2, fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTODATA_TEST_009
     * @tc.name      SUB_IMAGE_PACKER_PACKTODATA_TEST_009
     * @tc.desc      OH_ImagePacker_PackToData-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTODATA_TEST_009", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToDataTest(CASE_INDEX_3, fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTODATA_TEST_010
     * @tc.name      SUB_IMAGE_PACKER_PACKTODATA_TEST_010
     * @tc.desc      OH_ImagePacker_PackToData-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTODATA_TEST_010", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToDataTest(CASE_INDEX_4, fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTODATA_TEST_011
     * @tc.name      SUB_IMAGE_PACKER_PACKTODATA_TEST_011
     * @tc.desc      OH_ImagePacker_PackToData-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTODATA_TEST_011", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToDataTest(CASE_INDEX_5, fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTODATA_TEST_012
     * @tc.name      SUB_IMAGE_PACKER_PACKTODATA_TEST_012
     * @tc.desc      OH_ImagePacker_PackToData-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTODATA_TEST_012", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToDataTest(CASE_INDEX_6, fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
  /**
   * @tc.number    SUB_IMAGE_PACKER_PACKTOFILE_TEST_013
   * @tc.name      SUB_IMAGE_PACKER_PACKTOFILE_TEST_013
   * @tc.desc      OH_ImagePacker_PackToFile-IMAGE_RESULT_SUCCESS
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 0
   */
  it("SUB_IMAGE_PACKER_PACKTOFILE_TEST_013", Level.LEVEL0, async () => {
    console.info(TAG, 'Start');
    await getFd('test_exif_v2.jpg');
    let result: number = testNapi.ImagePackerPackToFileTest(CASE_INDEX_1,fdNumber);
    console.info(TAG, 'Succeed', JSON.stringify(result));
    expect(result).assertEqual(0);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTOFILE_TEST_014
     * @tc.name      SUB_IMAGE_PACKER_PACKTOFILE_TEST_014
     * @tc.desc      OH_ImagePacker_PackToFile-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTOFILE_TEST_014", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToFileTest(CASE_INDEX_2,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTOFILE_TEST_015
     * @tc.name      SUB_IMAGE_PACKER_PACKTOFILE_TEST_015
     * @tc.desc      OH_ImagePacker_PackToFile-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTOFILE_TEST_015", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToFileTest(CASE_INDEX_3,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTOFILE_TEST_016
     * @tc.name      SUB_IMAGE_PACKER_PACKTOFILE_TEST_016
     * @tc.desc      OH_ImagePacker_PackToFile-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTOFILE_TEST_016", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToFileTest(CASE_INDEX_4,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_IMAGE_PACKER_PACKTOFILE_TEST_017
     * @tc.name      SUB_IMAGE_PACKER_PACKTOFILE_TEST_017
     * @tc.desc      OH_ImagePacker_PackToFile-IMAGE_RESULT_BAD_PARAMETER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_IMAGE_PACKER_PACKTOFILE_TEST_017", Level.LEVEL0, async () => {
      console.info(TAG, 'Start');
      await getFd('test_exif_v2.jpg');
      let result: number = testNapi.ImagePackerPackToFileTest(CASE_INDEX_5,fdNumber);
      console.info(TAG, 'Succeed', JSON.stringify(result));
      expect(result).assertEqual(-1);
    })
  })
}