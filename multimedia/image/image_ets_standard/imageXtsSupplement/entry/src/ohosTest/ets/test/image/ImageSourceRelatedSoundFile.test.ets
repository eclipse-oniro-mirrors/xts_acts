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
import common from '@ohos.app.ability.common';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility } from '@kit.AbilityKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


const TAG = 'Xts.ImageSourcerelatedSoundFile';
let fdNumber: number;
async function getFd(fileName: string) {
  const ability: UIAbility = await delegator.getCurrentTopAbility();
  let testContext: common.UIAbilityContext = ability.context;
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

let jpgImageSourceApi:image.ImageSource;
let pngImageSourceApi:image.ImageSource;

export default function ImageSourceRelatedSoundFileSupp() {
  describe('ImageSourceRelatedSoundFileSupp', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
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
      await jpgImageSourceApi.release();
      await pngImageSourceApi.release();
    });
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_001
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = 'place';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect(result.exifMetadata?.relatedSoundFile).assertContain('place');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_002
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_003
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = 'abc';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.relatedSoundFile);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect(result.exifMetadata?.relatedSoundFile).assertContain('abc');
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_004
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.relatedSoundFile);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_005
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.relatedSoundFile);
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_006
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = 'place for user comments';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_007
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = 'abc';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_008
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = '';
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.relatedSoundFile);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_009
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = undefined as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.relatedSoundFile);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_010
     * @tc.desc       ImageWriteImageMetadata cover normal relatedSoundFile
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_RELATED_SOUND_FILE_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.relatedSoundFile = null as ESObject;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        let resultFir = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,resultFir.exifMetadata?.relatedSoundFile);
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.relatedSoundFile);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })


  });
}