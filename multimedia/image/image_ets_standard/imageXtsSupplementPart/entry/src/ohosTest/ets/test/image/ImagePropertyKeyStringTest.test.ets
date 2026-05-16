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
import { BusinessError } from '@ohos.base';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import { LOG_TAG, sleep } from '../common';

const TAG = LOG_TAG + 'ImageXts.ImagePropertyKeyString';
let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd
}
let webpImageSourceApi: image.ImageSource;
let jpgImageSourceApi: image.ImageSource;
let pngImageSourceApi: image.ImageSource;
async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}
export default function  ImageSourcePropertyKeyStringTest() {
  describe('ImageSourcePropertyKeyStringTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      webpImageSourceApi = await getImageSource('test_exif_v2.webp');
      jpgImageSourceApi = await getImageSource('test_exif_v2.jpg');
      pngImageSourceApi = await getImageSource('test_exif_v2.png');
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await webpImageSourceApi.release();
      await jpgImageSourceApi.release();
      await pngImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_001
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_001
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_002
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_002
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_003
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_003
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = 's';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_004
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_004
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = '1024';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_005
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_005
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_006
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_006
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_007
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_007
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = 's';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_008
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_008
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = '1024';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_009
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_009
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_010
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_010
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_011
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_011
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = 's';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_012
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_012
     * @tc.desc       ImageWriteImageMetadata cover normal TransferFunction
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = '1024';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.transferFunction);
        let firType = resultFir.exifMetadata?.transferFunction;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.transferFunction);
        expect(result.exifMetadata?.transferFunction).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_013
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_013
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'Software name and version';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual('Software name and version');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_014
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_014
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_015
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_015
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_016
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_016
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_017
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_017
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'Software name and version';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual('Software name and version');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_018
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_018
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_019
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_019
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_019';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_020
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_020
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_020';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await webpImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_021
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_021
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_021';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'Software name and version';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual('Software name and version');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_022
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_022
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_022';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_023
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_023
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_023';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_024
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_024
     * @tc.desc       ImageWriteImageMetadata cover normal Software
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_024';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.software);
        let firType = resultFir.exifMetadata?.software;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.software);
        expect(result.exifMetadata?.software).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_025
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_025
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_025';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = '2024:07:07 13:45:59';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual('2024:07:07 13:45:59');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_026
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_026
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_026';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = '2024:07:07';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual('2024:07:07');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_027
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_027
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_027';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
        let firType = resultFir.exifMetadata?.dateTime;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_028
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_028
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_028';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
        let firType = resultFir.exifMetadata?.dateTime;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_029
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_029
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_029';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
        let firType = resultFir.exifMetadata?.dateTime;
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_030
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_030
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_030';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = '2024:07:07 13:45:59';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual('2024:07:07 13:45:59');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_031
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_031
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_031';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = '2024:07:07';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual('2024:07:07');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_032
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_032
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_032';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
        let firType = resultFir.exifMetadata?.dateTime;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_033
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_033
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_033';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = undefined;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
        let firType = resultFir.exifMetadata?.dateTime;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_034
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_034
     * @tc.desc       ImageWriteImageMetadata cover normal DateTime
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_034';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.dateTime = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
        let firType = resultFir.exifMetadata?.dateTime;
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
        expect(result.exifMetadata?.dateTime).assertEqual(firType);
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_037
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_037
       * @tc.desc       ImageWriteImageMetadata cover normal Artist
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_037', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_037';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.artist = '';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await pngImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await pngImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.artist);
          let firType = resultFir.exifMetadata?.artist;
          await pngImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await pngImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
          expect(result.exifMetadata?.artist).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_038
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_038
       * @tc.desc       ImageWriteImageMetadata cover normal Artist
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_038', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_038';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.artist = undefined;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await pngImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await pngImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.artist);
          let firType = resultFir.exifMetadata?.artist;
          await pngImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await pngImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
          expect(result.exifMetadata?.artist).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_039
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_039
       * @tc.desc       ImageWriteImageMetadata cover normal Artist
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_039', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_039';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.artist = 'name';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await jpgImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await jpgImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
          expect(result.exifMetadata?.artist).assertEqual('name');
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_040
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_040
       * @tc.desc       ImageWriteImageMetadata cover normal Artist
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_040', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_040';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.artist = 'NANAMI';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await jpgImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await jpgImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
          expect(result.exifMetadata?.artist).assertEqual('NANAMI');
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect().assertFail();
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_041
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_041
       * @tc.desc       ImageWriteImageMetadata cover normal Artist
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_041', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_041';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.artist = '';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await jpgImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await jpgImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.artist);
          let firType = resultFir.exifMetadata?.artist;
          await jpgImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await jpgImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
          expect(result.exifMetadata?.artist).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_042
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_042
       * @tc.desc       ImageWriteImageMetadata cover normal Artist
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_042', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_042';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.artist = undefined;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await jpgImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await jpgImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.artist);
          let firType = resultFir.exifMetadata?.artist;
          await jpgImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await jpgImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
          expect(result.exifMetadata?.artist).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_045
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_045
       * @tc.desc       ImageWriteImageMetadata cover normal Artist
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_045', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_045';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.artist = '';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.artist);
          let firType = resultFir.exifMetadata?.artist;
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
          expect(result.exifMetadata?.artist).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_046
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_046
       * @tc.desc       ImageWriteImageMetadata cover normal Artist
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_046', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_046';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.artist = undefined;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.artist);
          let firType = resultFir.exifMetadata?.artist;
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.artist);
          expect(result.exifMetadata?.artist).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_047
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_047
       * @tc.desc       ImageWriteImageMetadata cover normal DateTime
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_047', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_047';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.dateTime = '2024:07:07 13:45:59';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
          expect(result.exifMetadata?.dateTime).assertEqual('2024:07:07 13:45:59');
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_048
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_048
       * @tc.desc       ImageWriteImageMetadata cover normal DateTime
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_048', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_048';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.dateTime = '2024:07:07';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
          expect(result.exifMetadata?.dateTime).assertEqual('2024:07:07');
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_049
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_049
       * @tc.desc       ImageWriteImageMetadata cover normal DateTime
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_049', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_049';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.dateTime = '';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
          let firType = resultFir.exifMetadata?.dateTime;
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
          expect(result.exifMetadata?.dateTime).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_050
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_050
       * @tc.desc       ImageWriteImageMetadata cover normal DateTime
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_050', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_050';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.dateTime = undefined;
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
          let firType = resultFir.exifMetadata?.dateTime;
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
          expect(result.exifMetadata?.dateTime).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
      /**
       * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_051
       * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_051
       * @tc.desc       ImageWriteImageMetadata cover normal DateTime
       * @tc.size       MEDIUM
       * @tc.type       Function
       * @tc.level      Level 1
       */
      it('SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_051', Level.LEVEL1, async (done: Function) => {
        const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_DATETIME_051';
        let testExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.dateTime = 'S';
        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        try {
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let resultFir = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata resultFir is:`, resultFir.exifMetadata?.dateTime);
          let firType = resultFir.exifMetadata?.dateTime;
          await webpImageSourceApi.writeImageMetadata(imageMetadata);
          let result = await webpImageSourceApi.readImageMetadata()
          console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.dateTime);
          expect(result.exifMetadata?.dateTime).assertEqual(firType);
        } catch (err) {
          console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
          expect(err.code).assertEqual('7700202');
        }
        done();
      })
    })
}
