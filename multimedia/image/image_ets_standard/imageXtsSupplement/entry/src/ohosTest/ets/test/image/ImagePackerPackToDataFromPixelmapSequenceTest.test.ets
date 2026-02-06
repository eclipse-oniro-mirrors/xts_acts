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
import { image, sendableImage } from '@kit.ImageKit';
import { common } from '@kit.AbilityKit';
import fileio from '@ohos.fileio'


const TAG = 'packToDataFromPixelmapSequenceSupp'
let fdNumber: number;

async function getFd(fileName: string) {
  let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let basePath = context.filesDir;
  let filePath = basePath + '/' + fileName;
  console.info(TAG, 'image case filePath is ' + filePath);
  await fileio.open(filePath).then((data) => {
    fdNumber = data;
    console.info(TAG, "image case open fd success " + fdNumber);
  }, (err: BusinessError) => {
    console.info(TAG, "image case open fd fail" + err)
  }).catch((err: BusinessError) => {
    console.info(TAG, "image case open fd err " + err);
  })
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function imagePackerPackToDataFromPixelmapSequenceTest() {
  describe('imagePackerPackToDataFromPixelmapSequenceTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_001
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_001
     * @tc.desc   第一个参数非空数组覆盖，gif格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_001';
      const path ='moving_test.gif';
      try {
        const imageSourceApi = await getImageSource(path);
        let pixelMapList = await imageSourceApi.createPixelMapList();
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        let buffer = await packer.packToDataFromPixelmapSequence(pixelMapList, ops)
        console.info(TAG, testName, 'packToDataFromPixelmapSequence', buffer);
        expect(buffer.byteLength > 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        // expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_002
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_002
     * @tc.desc   第一个参数空数组覆盖，gif格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_002';
      const path ='moving_test.gif';
      try {let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        await packer.packToDataFromPixelmapSequence([], ops)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_003
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_003
     * @tc.desc   第一个参数null覆盖，gif格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_003';
      const path ='moving_test.gif';
      try {
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let packer = image.createImagePacker();
        await packer.packToDataFromPixelmapSequence(null, ops)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_004
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_004
     * @tc.desc   第二个参数null覆盖，gif格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_004';
      const path ='moving_test.gif';
      try {
        const imageSourceApi = await getImageSource(path);
        let pixelMapList = await imageSourceApi.createPixelMapList();
        let packer = image.createImagePacker();
        await packer.packToDataFromPixelmapSequence(pixelMapList, null)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_005
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_005
     * @tc.desc   第二个参数undefined覆盖，gif格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_005';
      const path ='moving_test.gif';
      try {
        const imageSourceApi = await getImageSource(path);
        let pixelMapList = await imageSourceApi.createPixelMapList();
        let packer = image.createImagePacker();
        await packer.packToDataFromPixelmapSequence(pixelMapList, undefined)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_006
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_006
     * @tc.desc   第二个参数空覆盖，gif格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_006';
      const path ='moving_test.gif';
      try {
        const imageSourceApi = await getImageSource(path);
        let pixelMapList = await imageSourceApi.createPixelMapList();
        let packer = image.createImagePacker();
        await packer.packToDataFromPixelmapSequence(pixelMapList,{} as ESObject)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_007
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_007
     * @tc.desc   第二个参数null覆盖，webp格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_007';
      const path ='test_large.webp';
      try {
        const imageSourceApi = await getImageSource(path);
        let pixelMapList = await imageSourceApi.createPixelMapList();
        let packer = image.createImagePacker();
        await packer.packToDataFromPixelmapSequence(pixelMapList, null)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_008
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_008
     * @tc.desc   第二个参数undefined覆盖，webp格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_008';
      const path ='test_large.webp';
      try {
        const imageSourceApi = await getImageSource(path);
        let pixelMapList = await imageSourceApi.createPixelMapList();
        let packer = image.createImagePacker();
        await packer.packToDataFromPixelmapSequence(pixelMapList, undefined)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
    /**
     * @tc.name   IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_009
     * @tc.number IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_009
     * @tc.desc   第二个参数空覆盖，webp格式图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PACKER_PACK_TO_DATA_SEQUENCE_TEST_009';
      const path ='test_large.webp';
      try {
        const imageSourceApi = await getImageSource(path);
        let pixelMapList = await imageSourceApi.createPixelMapList();
        let packer = image.createImagePacker();
        await packer.packToDataFromPixelmapSequence(pixelMapList, {} as ESObject)
        expect().assertFail();
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        done();
      }
    })
  })
}
