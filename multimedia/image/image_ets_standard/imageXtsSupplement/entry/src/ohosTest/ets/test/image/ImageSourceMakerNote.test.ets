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


const TAG = 'Xts.ImageSourcemakerNote';
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

export default function ImageSourceMakerNoteSupp() {
  describe('ImageSourceMakerNoteSupp', () => {
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
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_001
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_001
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_001';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_002
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_002
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_002';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = -1;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_003
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_003
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_003';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 45;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(45);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_004
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_004
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_004';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = null as ESObject;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_005
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_005
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_005';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = undefined as ESObject;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await jpgImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await jpgImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_006
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_006
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_006';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 1;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(1);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_007
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_007
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_007';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = -1;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(255);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_008
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_008
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_008';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = 45;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(45);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_009
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_009
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_009';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = null as ESObject;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

    /**
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_010
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_010
     * @tc.desc       ImageWriteImageMetadata cover normal makerNote
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_MAKER_NOTE_010';
      let testExifMetadata = image.ExifMetadata.createInstance();
      const buffer = new ArrayBuffer(1024);
      const view = new Uint8Array(buffer);
      view[0] = undefined as ESObject;
      testExifMetadata.makerNote = buffer;
      const imageMetadata: image.ImageMetadata = {
        exifMetadata: testExifMetadata
      };
      try {
        await pngImageSourceApi.writeImageMetadata(imageMetadata);
        let result = await pngImageSourceApi.readImageMetadata()
        console.info(TAG,testName,`testWriteImageMetadata result is:`,result.exifMetadata?.makerNote);
        const resultBuffer = result.exifMetadata?.makerNote;
        if (resultBuffer) {
          const resultView = new Uint8Array(resultBuffer);
          expect(resultView[0]).assertEqual(0);
        } else {
          expect().assertFail();
        }
      }catch (err) {
        console.error(TAG,testName,`Failed to create object, error code is ${err},${err.code}`);
        expect(err.code).assertEqual('7700202');
      }
      done();
    })

  });
}