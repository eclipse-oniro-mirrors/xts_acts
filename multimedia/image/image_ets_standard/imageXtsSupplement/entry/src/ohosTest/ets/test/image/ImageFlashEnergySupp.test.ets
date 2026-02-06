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
import { image } from '@kit.ImageKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { sleep } from '../common';
import common from '@ohos.app.ability.common';
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'Xts.ImageNewSubFileType';
let fdNumber: number;
let jpgImageSourceApi: image.ImageSource;
let pngImageSourceApi: image.ImageSource;

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

export default function ImageFlashEnergySupp() {
  describe('ImageFlashEnergySupp', () => {
    beforeAll(async () => {
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
      console.info('beforeAll case');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      await jpgImageSourceApi.release();
      await pngImageSourceApi.release();
      console.info('afterAll case');
    });
    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.flashEnergy);
        expect(result.exifMetadata?.flashEnergy).assertEqual(100);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.flashEnergy);
        expect(result.exifMetadata?.flashEnergy).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.flashEnergy);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.flashEnergy);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.flashEnergy);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneXResolution);
        expect(result.exifMetadata?.focalPlaneXResolution).assertEqual(100);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneXResolution);
        expect(result.exifMetadata?.focalPlaneXResolution).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneXResolution);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneXResolution);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneXResolution);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneYResolution);
        expect(result.exifMetadata?.focalPlaneYResolution).assertEqual(100);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneYResolution);
        expect(result.exifMetadata?.focalPlaneYResolution).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneYResolution);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneYResolution);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneYResolution);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneResolutionUnit);
        expect(result.exifMetadata?.focalPlaneResolutionUnit).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneResolutionUnit);
        expect(result.exifMetadata?.focalPlaneResolutionUnit).assertEqual(3);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`,
          resultFir.exifMetadata?.focalPlaneResolutionUnit);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`,
          resultFir.exifMetadata?.focalPlaneResolutionUnit);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`,
          resultFir.exifMetadata?.focalPlaneResolutionUnit);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = [100, 100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectLocation);
        expect(result.exifMetadata?.subjectLocation).assertContain('100');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = [0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectLocation);
        expect(result.exifMetadata?.subjectLocation).assertContain('0');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectLocation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectLocation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectLocation);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureIndex);
        expect(result.exifMetadata?.exposureIndex).assertEqual(100);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureIndex);
        expect(result.exifMetadata?.exposureIndex).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureIndex);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureIndex);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureIndex);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = 8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sensingMethod);
        expect(result.exifMetadata?.sensingMethod).assertEqual(8);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sensingMethod);
        expect(result.exifMetadata?.sensingMethod).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sensingMethod);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sensingMethod);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sensingMethod);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.customRendered);
        expect(result.exifMetadata?.customRendered).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.customRendered);
        expect(result.exifMetadata?.customRendered).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.customRendered);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.customRendered);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.customRendered);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureMode);
        expect(result.exifMetadata?.exposureMode).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureMode);
        expect(result.exifMetadata?.exposureMode).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureMode);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureMode);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureMode);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_006
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_006
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_JPG_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureMode);
        expect(result.exifMetadata?.exposureMode).assertEqual(2);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.whiteBalance);
        expect(result.exifMetadata?.whiteBalance).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.whiteBalance);
        expect(result.exifMetadata?.whiteBalance).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.whiteBalance);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.whiteBalance);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.whiteBalance);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.digitalZoomRatio);
        expect(result.exifMetadata?.digitalZoomRatio).assertEqual(100);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.digitalZoomRatio);
        expect(result.exifMetadata?.digitalZoomRatio).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.digitalZoomRatio);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.digitalZoomRatio);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.digitalZoomRatio);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[1]));
          expect(resultView[1]).assertEqual(3);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[1]));
          expect(resultView[1]).assertEqual(3);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[1]));
          expect(resultView[1]).assertEqual(3);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_001
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_002
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_003
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_004
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[1]));
          expect(resultView[1]).assertEqual(3);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_005
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();

        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.flashEnergy);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.flashEnergy);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.flashEnergy);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.flashEnergy);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal flashEnergy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FLASH_ENERGY_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.flashEnergy = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.flashEnergy);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneXResolution);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneXResolution);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneXResolution);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneXResolution);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneXResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_X_RESOLUTION_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneXResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneXResolution);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneYResolution);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneYResolution);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneYResolution);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneYResolution);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneYResolution
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_Y_RESOLUTION_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneYResolution = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.focalPlaneYResolution);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneResolutionUnit);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = 3;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.focalPlaneResolutionUnit);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`,
          resultFir.exifMetadata?.focalPlaneResolutionUnit);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`,
          resultFir.exifMetadata?.focalPlaneResolutionUnit);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal focalPlaneResolutionUnit
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FOCAL_PLANE_RESOLUTION_UNIT_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.focalPlaneResolutionUnit = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`,
          resultFir.exifMetadata?.focalPlaneResolutionUnit);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = [100, 100];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectLocation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = [0, 0];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.subjectLocation);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectLocation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectLocation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal subjectLocation
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SUBJECT_LOCATION_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.subjectLocation = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.subjectLocation);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureIndex);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureIndex);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureIndex);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureIndex);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal exposureIndex
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_INDEX_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureIndex = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureIndex);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = 8;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sensingMethod);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.sensingMethod);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sensingMethod);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sensingMethod);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal sensingMethod
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SENSING_METHOD_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.sensingMethod = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.sensingMethod);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.customRendered);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.customRendered);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.customRendered);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.customRendered);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal customRendered
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CUSTOM_RENDERED_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.customRendered = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.customRendered);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureMode);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureMode);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureMode);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureMode);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.exposureMode);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_006
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_006
     * @tc.desc       ImageWriteImageMetadata cover normal exposureMode
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_MODE_PNG_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.exposureMode = 2;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.exposureMode);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.whiteBalance);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.whiteBalance);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.whiteBalance);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.whiteBalance);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal whiteBalance
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_WHITE_BALANCE_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whiteBalance = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.whiteBalance);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = 100;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.digitalZoomRatio);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.digitalZoomRatio);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.digitalZoomRatio);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.digitalZoomRatio);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal digitalZoomRatio
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_DIGITAL_ZOOM_RATIO_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.digitalZoomRatio = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, resultFir.exifMetadata?.digitalZoomRatio);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[1]));
          expect(resultView[1]).assertEqual(3);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal spatialFrequencyResponse
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SPATIAL_FREQUENCY_RESPONSE_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.spatialFrequencyResponse = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.spatialFrequencyResponse;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[1]));
          expect(resultView[1]).assertEqual(3);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal fileSource
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_FILE_SOURCE_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.fileSource = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.fileSource;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[1]));
          expect(resultView[1]).assertEqual(3);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal sceneType
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_SCENE_TYPE_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sceneType = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sceneType;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_001
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_002
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_003
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_004
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[1]));
          expect(resultView[1]).assertEqual(3);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_005
     * @tc.desc       ImageWriteImageMetadata cover normal cfaPattern
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_CFA_PATTERN_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.cfaPattern = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata();

        const resultBuffer = result.exifMetadata?.cfaPattern;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          console.info(TAG, testName, `testWriteImageMetadata result is:`, JSON.stringify(resultView[0]));
          expect(resultView[0]).assertEqual(2);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
  });
}