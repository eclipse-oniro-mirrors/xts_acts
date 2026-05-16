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
import { image } from '@kit.ImageKit';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';

const TAG = 'ImageXts.GetImageInfo';

let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}
async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

export default function GetImageInfoSupp() {
  describe('GetImageInfoSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_001
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_001
     * @tc.desc       getImageInfo cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_001';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        const imageInfo = await imageSourceApi.getImageInfo(null);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != null).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_002
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_002
     * @tc.desc       getImageInfo cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_002';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        const imageInfo = await imageSourceApi.getImageInfo(undefined);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_003
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_003
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_003';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.size.width);
        expect(imageInfo.size.width).assertEqual(472);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_004
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_004
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_004';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.size.height);
        expect(imageInfo.size.height).assertEqual(226);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_005
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_005
     * @tc.desc       getImageInfo cover return alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_005';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.alphaType);
        expect(imageInfo.alphaType).assertEqual(0);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_006
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_006
     * @tc.desc       getImageInfo cover return pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_006';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
        expect(imageInfo.pixelFormat).assertEqual(0);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_007
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_007
     * @tc.desc       getImageInfo cover return density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_007';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.density);
        expect(imageInfo.density).assertUndefined();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_008
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_008
     * @tc.desc       getImageInfo cover return UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_008';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
        expect(imageInfo.pixelFormat).assertEqual(image.PixelMapFormat.UNKNOWN);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_009
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_009
     * @tc.desc       getImageInfoSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_009';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync(null);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != null).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_010
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_010
     * @tc.desc       getImageInfoSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_010';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync(undefined);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_011
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_011
     * @tc.desc       getImageInfoSync cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_011';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync();
        console.info(TAG, testName, 'imageInfo.size.height:' + imageInfo.size.height);
        expect(imageInfo.size.height).assertEqual(226);
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_012
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_012
     * @tc.desc       getImageInfoSync cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_012';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync();
        console.info(TAG, testName, 'imageInfo.size.height:' + imageInfo.size.width);
        expect(imageInfo.size.width).assertEqual(472);
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_013
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_013
     * @tc.desc       getImageInfo cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_013';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        const imageInfo = await imageSourceApi.getImageInfo(null);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != null).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_014
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_014
     * @tc.desc       getImageInfo cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_014';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        const imageInfo = await imageSourceApi.getImageInfo(undefined);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_015
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_015
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_015';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.size.width);
        expect(imageInfo.size.width).assertEqual(472);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_016
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_016
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_016';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.size.height);
        expect(imageInfo.size.height).assertEqual(75);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_017
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_017
     * @tc.desc       getImageInfo cover return alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_017';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.alphaType);
        expect(imageInfo.alphaType).assertEqual(0);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_018
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_018
     * @tc.desc       getImageInfo cover return pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_018';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
        expect(imageInfo.pixelFormat).assertEqual(0);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_019
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_019
     * @tc.desc       getImageInfo cover return density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_019';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.density);
        expect(imageInfo.density).assertUndefined();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_020
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_020
     * @tc.desc       getImageInfo cover return UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_020';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
        expect(imageInfo.pixelFormat).assertEqual(image.PixelMapFormat.UNKNOWN);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_021
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_021
     * @tc.desc       getImageInfoSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_021';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync(null);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != null).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_022
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_022
     * @tc.desc       getImageInfoSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_022';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync(undefined);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_023
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_023
     * @tc.desc       getImageInfoSync cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_023';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync();
        console.info(TAG, testName, 'imageInfo.size.height:' + imageInfo.size.height);
        expect(imageInfo.size.height).assertEqual(75);
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_024
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_024
     * @tc.desc       getImageInfoSync cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_024';
      const imageSourceApi = await getImageSource('test_exif_v2.png');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync();
        console.info(TAG, testName, 'imageInfo.size.height:' + imageInfo.size.width);
        expect(imageInfo.size.width).assertEqual(472);
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_025
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_025
     * @tc.desc       getImageInfo cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_025';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        const imageInfo = await imageSourceApi.getImageInfo(null);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != null).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_026
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_026
     * @tc.desc       getImageInfo cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_026';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        const imageInfo = await imageSourceApi.getImageInfo(undefined);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_027
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_027
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_027';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.size.width);
        expect(imageInfo.size.width).assertEqual(286);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_028
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_028
     * @tc.desc       getImageInfo cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_028';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.size.height);
        expect(imageInfo.size.height).assertEqual(221);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_029
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_029
     * @tc.desc       getImageInfo cover return alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_029';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.alphaType);
        expect(imageInfo.alphaType).assertEqual(0);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_030
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_030
     * @tc.desc       getImageInfo cover return pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_030';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
        expect(imageInfo.pixelFormat).assertEqual(0);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_031
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_031
     * @tc.desc       getImageInfo cover return density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_031';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.density);
        expect(imageInfo.density).assertUndefined();
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_032
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_032
     * @tc.desc       getImageInfo cover return UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_032';
      const imageSourceApi = await getImageSource('test_exif_v2.jpg');
      imageSourceApi.getImageInfo().then((imageInfo: image.ImageInfo) => {
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
        expect(imageInfo.pixelFormat).assertEqual(image.PixelMapFormat.UNKNOWN);
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_033
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_033
     * @tc.desc       getImageInfoSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_033';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync(null);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != null).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_034
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_034
     * @tc.desc       getImageInfoSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_034';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync(undefined);
        console.info(TAG, testName, 'Succeeded in obtaining the image information.', imageInfo);
        expect(imageInfo != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_035
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_035
     * @tc.desc       getImageInfoSync cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_035';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync();
        console.info(TAG, testName, 'imageInfo.size.height:' + imageInfo.size.height);
        expect(imageInfo.size.height).assertEqual(221);
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_036
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_036
     * @tc.desc       getImageInfoSync cover return size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_SYNC_TEST_036';
      const imageSourceApi = await getImageSource('test_exif_v2.webp');
      try {
        let imageInfo = imageSourceApi.getImageInfoSync();
        console.info(TAG, testName, 'imageInfo.size.height:' + imageInfo.size.width);
        expect(imageInfo.size.width).assertEqual(286);
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_037
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_037
     * @tc.desc       getImageInfo cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_037';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(null, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo);
            expect(imageInfo != null).assertTrue();
          }
        });
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_038
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_038
     * @tc.desc       getImageInfo cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_038';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(undefined, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo);
            expect(imageInfo != null).assertTrue();
          }
        });
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_039
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_039
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_039', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_039';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.density);
            expect(imageInfo.density).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_040
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_040
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_040', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_040';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.stride);
            expect(imageInfo.stride).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_041
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_041
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_041', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_041';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
            expect(imageInfo.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_042
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_042
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_042', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_042';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.alphaType);
            expect(imageInfo.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_043
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_043
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_043';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.size.height);
            expect(imageInfo.size.height).assertEqual(226);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_044
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_044
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_044', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_044';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.size.width);
            expect(imageInfo.size.width).assertEqual(472);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_045
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_045
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_045', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_045';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.density);
            expect(imageInfo.density).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_046
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_046
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_046', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_046';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.stride);
            expect(imageInfo.stride).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_047
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_047
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_047', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_047';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
            expect(imageInfo.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_048
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_048
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_048', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_048';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.jpg');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.alphaType);
            expect(imageInfo.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_049
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_049
     * @tc.desc       getImageInfo cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_049', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_049';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(null, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo);
            expect(imageInfo != null).assertTrue();
          }
        });
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_050
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_050
     * @tc.desc       getImageInfo cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_050', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_050';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(undefined, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo);
            expect(imageInfo != null).assertTrue();
          }
        });
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_051
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_051
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_051', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_051';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.density);
            expect(imageInfo.density).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_052
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_052
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_052', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_052';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.stride);
            expect(imageInfo.stride).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_053
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_053
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_053', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_053';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
            expect(imageInfo.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_054
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_054
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_054', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_054';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.alphaType);
            expect(imageInfo.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_055
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_055
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_055', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_055';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.size.height);
            expect(imageInfo.size.height).assertEqual(75);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_056
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_056
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_056', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_056';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.size.width);
            expect(imageInfo.size.width).assertEqual(472);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_057
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_057
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_057', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_057';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.density);
            expect(imageInfo.density).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_058
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_058
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_058', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_058';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.stride);
            expect(imageInfo.stride).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_059
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_059
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_059', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_059';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
            expect(imageInfo.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_060
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_060
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_060', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_060';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.png');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.alphaType);
            expect(imageInfo.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_061
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_061
     * @tc.desc       getImageInfo cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_061', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_061';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(null, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo);
            expect(imageInfo != null).assertTrue();
          }
        });
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_062
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_062
     * @tc.desc       getImageInfo cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_062', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_062';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(undefined, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo);
            expect(imageInfo != null).assertTrue();
          }
        });
        done();
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_063
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_063
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_063', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_063';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.density);
            expect(imageInfo.density).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_064
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_064
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_064', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_064';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.stride);
            expect(imageInfo.stride).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_065
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_065
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_065', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_065';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
            expect(imageInfo.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_066
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_066
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_066', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_066';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo(0, (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.alphaType);
            expect(imageInfo.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_067
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_067
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_067', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_067';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.size.height);
            expect(imageInfo.size.height).assertEqual(221);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_068
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_068
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_068', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_068';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.size.width);
            expect(imageInfo.size.width).assertEqual(286);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_069
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_069
     * @tc.desc       getImageInfo cover density
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_069', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_069';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.density);
            expect(imageInfo.density).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_070
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_070
     * @tc.desc       getImageInfo cover stride
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_070', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_070';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.stride);
            expect(imageInfo.stride).assertUndefined();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_071
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_071
     * @tc.desc       getImageInfo cover pixelFormat
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_071', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_071';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.pixelFormat);
            expect(imageInfo.pixelFormat).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_072
     * @tc.name       SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_072
     * @tc.desc       getImageInfo cover alphaType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_072', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_GET_IMAGE_INFO_TEST_072';
      try {
        const imageSourceApi = await getImageSource('test_exif_v2.webp');
        imageSourceApi.getImageInfo((err: BusinessError, imageInfo: image.ImageInfo) => {
          if (err) {
            console.error(TAG,testName,`Failed to obtain the image information.code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG,testName,'Succeeded in obtaining the image information.', imageInfo.alphaType);
            expect(imageInfo.alphaType).assertEqual(0);
            done();
          }
        });
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image information.code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}








