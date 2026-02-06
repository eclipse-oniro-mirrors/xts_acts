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

const TAG = LOG_TAG + 'ImageXts.ImagePropertyKeyArray';
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
export default function ImagePropertyKeyArrayTest() {
  describe('ImagePropertyKeyArrayTest', () => {
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
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_001
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_001
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'name';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_002
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_002
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'NANAMI';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_003
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_003
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'name';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_004
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_004
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'NANAMI';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_005
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_005
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_006
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_006
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_007
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_007
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_008
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_008
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_009
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_009
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = -999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_010
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_010
     * @tc.desc       ImageWriteImageMetadata - ResolutionUnit - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_RESOLUTIONUNIT_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.resolutionUnit = 999;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_011
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_011
     * @tc.desc       ImageWriteImageMetadata - Artist - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_011';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
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
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_012
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_012
     * @tc.desc       ImageWriteImageMetadata - Artist - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_012';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'TOM';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
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
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_013
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_013
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_013', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_013';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();;
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_014
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_014
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_014';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'TOM';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_015
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_015
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_015';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'S';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_016
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_016
     * @tc.desc       ImageWriteImageMetadata - Artist - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_ARTIST_016';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.artist = 'TOM';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_017
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_017
     * @tc.desc       ImageReadImageMetadata - TransferFunction - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_017';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = 'N';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
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
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_018
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_018
     * @tc.desc       ImageWriteImageMetadata - TransferFunction - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_018';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = 'N';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_019
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_019
     * @tc.desc       ImageWriteImageMetadata - TransferFunction - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_TRANSFERFUNCTION_019';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.transferFunction = 'N';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_070
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_070
     * @tc.desc       ImageReadImageMetadata -Software - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_070', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_070';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'NA';
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
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_069
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_069
     * @tc.desc       ImageWriteImageMetadata - Software - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_069', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_069';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'NA';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_072
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_072
     * @tc.desc       ImageWriteImageMetadata - Software - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_072', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_072';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'NA';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG,testName,'start');
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_068
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_068
     * @tc.desc       ImageReadImageMetadata - Software - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_068', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_068';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'error';
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
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_071
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_071
     * @tc.desc       ImageWriteImageMetadata - Software - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_071', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_071';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'error';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_025
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_025
     * @tc.desc       ImageWriteImageMetadata - Software - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_SOFTWARE_025';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.software = 'error';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_026
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_026
     * @tc.desc       ImageReadImageMetadata - WHITEPOINT - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_026', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_026';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.whitePoint);
        let resultStr = JSON.stringify(result.exifMetadata?.whitePoint);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[1,2]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_027
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_027
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_027';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_028
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_028
     * @tc.desc       ImageReadImageMetadata - WHITEPOINT - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_028';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.whitePoint);
        let resultStr = JSON.stringify(result.exifMetadata?.whitePoint);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[1,1]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_029
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_029
     * @tc.desc       ImageReadImageMetadata - WHITEPOINT - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_029';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.whitePoint);
        let resultStr = JSON.stringify(result.exifMetadata?.whitePoint);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[1,3]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_030
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_030
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_030';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_031
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_031
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_031';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_032
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_032
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_032';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_033
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_033
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_033';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_034
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_034
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_034';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_035
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_035
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_035';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_036
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_036
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_036';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_037
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_037
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_037';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_038
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_038
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_038';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_039
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_039
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_039', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_039';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_040
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_040
     * @tc.desc       ImageWriteImageMetadata - WHITEPOINT - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_040', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_WHITEPOINT_040';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.whitePoint = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_042
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_042
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_042', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_042';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_043
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_043
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_043';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_044
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_044
     * @tc.desc       ImageReadImageMetadata - PrimaryChromaticities - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_044', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_044';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1/2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.primaryChromaticities);
        let resultStr = JSON.stringify(result.exifMetadata?.primaryChromaticities);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[0.5]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_045
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_045
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_045', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_045';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1/2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_046
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_046
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_046', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_046';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_047
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_047
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_047', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_047';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_048
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_048
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_048', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_048';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_049
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_049
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_049', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_049';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1/2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_050
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_050
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_050', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_050';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1/2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_051
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_051
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_051', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_051';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_052
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_052
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_052', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_052';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_053
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_053
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_053', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_053';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_054
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_054
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_054', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_054';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [1/2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_055
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_055
     * @tc.desc       ImageWriteImageMetadata - PrimaryChromaticities - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_055', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_PRIMARYCHROMATICITIES_055';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.primaryChromaticities = [-1/2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_056
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_056
     * @tc.desc       ImageReadImageMetadata - YCbCrCoefficients - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_056', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_056';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.299, 0.587, 0.114];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.yCbCrCoefficients);
        let resultStr = JSON.stringify(result.exifMetadata?.yCbCrCoefficients);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[0.299,0.587,0.114]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_057
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_057
     * @tc.desc       ImageReadImageMetadata - YCbCrCoefficients - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_057', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_057';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.35, 0.35, 0.3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.yCbCrCoefficients);
        let resultStr = JSON.stringify(result.exifMetadata?.yCbCrCoefficients);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[0.35,0.35,0.3]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_058
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_058
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_058', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_058';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_059
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_059
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_059', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_059';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_060
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_060
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_060', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_060';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.299, 0.587, 0.114];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_061
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_061
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_061', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_061';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.35, 0.35, 0.3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_062
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_062
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_062', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_062';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_063
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_063
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_063', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_063';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_064
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_064
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_064', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_064';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.299, 0.587, 0.114];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_065
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_065
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_065', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_065';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [0.35, 0.35, 0.3];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_066
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_066
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_066', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_066';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_067
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_067
     * @tc.desc       ImageWriteImageMetadata - YCbCrCoefficients - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_067', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRCOEFFICIENTS_067';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrCoefficients = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_068
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_068
     * @tc.desc       ImageReadImageMetadata - YCbCrSubSampling - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_068', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_068';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [2,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.yCbCrSubSampling);
        let resultStr = JSON.stringify(result.exifMetadata?.yCbCrSubSampling);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[2,2]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_069
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_069
     * @tc.desc       ImageReadImageMetadata - YCbCrSubSampling - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_069', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_069';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.yCbCrSubSampling);
        let resultStr = JSON.stringify(result.exifMetadata?.yCbCrSubSampling);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[1,1]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_070
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_070
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_070', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_070';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_071
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_071
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_071', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_071';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_072
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_072
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_072', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_072';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [2,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_073
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_073
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_073', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_073';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_074
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_074
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_074', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_074';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_075
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_075
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_075', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_075';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_076
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_076
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_076', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_076';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [2,2];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_077
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_077
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_077', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_077';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [1,1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_078
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_078
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_078', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_078';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_079
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_079
     * @tc.desc       ImageWriteImageMetadata - YCbCrSubSampling - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_079', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_YCBCRSUBSAMPLING_079';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.yCbCrSubSampling = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_080
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_080
     * @tc.desc       ImageReadImageMetadata - ReferenceBlackWhite - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_080', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_080';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [1,255,0,255,0,255];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.referenceBlackWhite);
        let resultStr = JSON.stringify(result.exifMetadata?.referenceBlackWhite);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[1,255,0,255,0,255]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_081
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_081
     * @tc.desc       ImageReadImageMetadata - ReferenceBlackWhite - Success
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_081', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_081';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [0.25,0.25,0,25,0,25];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG, testName, `testWriteImageMetadata result is:`, result.exifMetadata?.referenceBlackWhite);
        let resultStr = JSON.stringify(result.exifMetadata?.referenceBlackWhite);
        console.info(TAG, testName, `resultStr:`, resultStr);
        expect(resultStr).assertEqual('[0.25,0.25,0,25,0,25]');
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_082
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_082
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_082', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_082';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_083
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_083
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_083', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_083';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_084
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_084
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_084', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_084';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [1,255,0,255,0,255];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_085
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_085
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_085', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_085';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [0.25,0.25,0,25,0,25];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_086
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_086
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_086', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_086';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_087
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_087
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_087', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_087';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_088
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_088
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_088', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_088';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [1,255,0,255,0,255];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_089
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_089
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_089', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_089';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [0.25,0.25,0,25,0,25];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_090
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_090
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_090', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_090';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [ ];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
    /**
     * @tc.number     SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_091
     * @tc.name       SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_091
     * @tc.desc       ImageWriteImageMetadata - ReferenceBlackWhite - Unsupported metadata
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_091', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_SOURCE_PROPERTY_KEY_REFERENCEBLACKWHITE_091';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.referenceBlackWhite = [-1];
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        console.info(TAG, testName, `start`);
        await webpImageSourceApi.writeImageMetadata(imageMetadata);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, testName, `Failed to create object, error code is ${err},${err.code}`);
        expect(Number(err.code)).assertEqual(7700202);
      }
      done();
    })
  })
}