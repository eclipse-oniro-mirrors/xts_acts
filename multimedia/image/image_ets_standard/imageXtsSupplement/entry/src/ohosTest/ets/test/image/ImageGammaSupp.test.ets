/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'Xts.ImageNewSubFileType';
const IMAGE_UNSUPPORTED_METADATA = '7700202';
const UNSUPPORTED_METADATA = '7600202';
let fdNumber: number;
let jpgImageSourceApi: image.ImageSource;
let pngImageSourceApi: image.ImageSource;
let webpImageSourceApi: image.ImageSource;

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

export default function ImageGammaSupp() {
  describe('ImageGammaSupp', () => {
    beforeAll(async () => {
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
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
      await webpImageSourceApi.release();
      console.info('afterAll case');
    });
    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_001
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 1.5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gamma);
        expect(result.exifMetadata?.gamma).assertEqual(1.5);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_002
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gamma);
        expect(result.exifMetadata?.gamma).assertEqual(0);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_003
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_004
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_005
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_006
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_006
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_JPG_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.gamma);
        expect(result.exifMetadata?.gamma).assertEqual(1);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_001
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 1.5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_002
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_003
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_004
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_005
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_006
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_006
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_PNG_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_001
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sourceExposureTimesOfCompositeImage;
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
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_002
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sourceExposureTimesOfCompositeImage;
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
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_003
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sourceExposureTimesOfCompositeImage;
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
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_004
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();
        const resultBuffer = result.exifMetadata?.sourceExposureTimesOfCompositeImage;
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
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_005
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_JPG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata();

        const resultBuffer = result.exifMetadata?.sourceExposureTimesOfCompositeImage;
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
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_001
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_002
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_003
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_004
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_005
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_PNG_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_002
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_002';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([""]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_003
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_003';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([null]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_004
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_004';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([undefined]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_005
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_PNG_005';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties(["abc"]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_002
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_002';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([""]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_003
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_003';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([null]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_004
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_004';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([undefined]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_005
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_JPG_005';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties(["abc"]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_002
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_002';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([""]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_003
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_003';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([null]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_004
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_004';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([undefined]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_005
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_JPG_005';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties(["abc"]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_002
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_002';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([""]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_003
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_003';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([null]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_004
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_004';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([undefined]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_005
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_PNG_005';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties(["abc"]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_002
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_002
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_002';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "": "" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_004
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_004
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_004';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": undefined });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_006
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_006
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_006';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": null });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_005
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_005
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_005';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "abc": "1" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_003
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_003
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_PNG_003';
      try {
        let metaData: image.ImageMetadata = await pngImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": "允许" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_002
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_002
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_002';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "": "" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })


    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_005
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_005
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_005';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "abc": "1" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_003
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_003
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_003';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": "允许" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_006
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_006
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_006';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": undefined });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_004
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_004
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_JPG_004';
      try {
        let metaData: image.ImageMetadata = await jpgImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": null });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_001
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 1.5;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_002
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 0;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_003
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = -1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_004
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_005
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_006
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_006
     * @tc.desc       ImageSourceWriteImageMetadata -gamma -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GAMMA_WEBP_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.gamma = 1;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_001
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_001
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 255;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_002
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_003
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 0;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_004
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_005
     * @tc.desc       ImageSourceWriteImageMetadata -sourceExposureTimesOfCompositeImage -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE_WEBP_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 2;
      view[1] = 3;
      testExifMetadata.sourceExposureTimesOfCompositeImage = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(IMAGE_UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_002
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_002
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_002';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([""]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_003
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_003
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_003';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([null]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_004
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_004
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_004';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties([undefined]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_005
     * @tc.name       SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_005
     * @tc.desc       ExifMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_SOURCE_GET_PROPERTIES_WEBP_005';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          await metaData.exifMetadata.getProperties(["abc"]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_002
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_002
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_002';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([""]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_003
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_003
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_003';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([null]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_004
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_004
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_004';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties([undefined]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_005
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_005
     * @tc.desc       MakerNoteHuaweiMetadata -getProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_GET_PROPERTIES_WEBP_005';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties(["abc"]);
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_002
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_002
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_002';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "": "" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_004
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_004
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_004';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": undefined });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_006
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_006
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_006';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": null });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_005
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_005
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_005';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "abc": "1" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })

    /**
     * @tc.number     SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_003
     * @tc.name       SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_003
     * @tc.desc       MakerNoteHuaweiMetadata -setProperties -Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_METADATA_IMAGE_MAKER_NOTE_METADATA_SET_PROPERTIES_WEBP_003';
      try {
        let metaData: image.ImageMetadata = await webpImageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.setProperties({ "Gamma": "允许" });
        } else {
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual(UNSUPPORTED_METADATA);
      }
      done();
    })
  });
}