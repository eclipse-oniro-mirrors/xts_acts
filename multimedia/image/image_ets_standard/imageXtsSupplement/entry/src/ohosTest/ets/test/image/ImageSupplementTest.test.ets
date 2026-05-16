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

import { image } from '@kit.ImageKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { isEmpty } from '../common';

const TAG = 'Xts.ImageSupplementTest'
let fdNumber: number;
let imageSourceApi: image.ImageSource;

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

async function createPictureSUPP(context : Context): Promise<image.Picture> {
  let array = new ArrayBuffer(300000000);
  let pathUri = 'test_exif_v2.jpg'
  let path = `file://${context.filesDir}/${pathUri}`;
  const fd = await fs.open(path, fs.OpenMode.READ_ONLY);
  let readLength = await fs.read(fd.fd, array);
  let ops: image.SourceOptions = {
    sourceDensity: 98,
  }
  let imageSource: image.ImageSource = image.createImageSource(array, ops);
  let pixelMap: image.PixelMap = await imageSource.createPixelMap();
  let pictureObj: image.Picture = image.createPicture(pixelMap);
  return pictureObj;
}

export default function ImageSupplementTest() {
  describe('ImageSupplementTest', () => {
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
     * @tc.number    IMAGE_AUXILIARY_PICTURE_GET_METADATA_TEST_002
     * @tc.name      IMAGE_AUXILIARY_PICTURE_GET_METADATA_TEST_002
     * @tc.desc      getMetadata cover HEIFS_METADATA
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('IMAGE_AUXILIARY_PICTURE_GET_METADATA_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_GET_METADATA_TEST_002';
      let auxBuffer: ArrayBuffer = new ArrayBuffer(10000);
      let auxSize: Size = { height: 50, width: 50 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        let res = await auxiliaryPicture.getMetadata(metadataType);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        await auxiliaryPicture?.release();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_METADATA_GET_PROPERTIES_TEST_001
     * @tc.number IMAGE_METADATA_GET_PROPERTIES_TEST_001
     * @tc.desc   getProperties the first parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  Level 1
     */
    it('IMAGE_METADATA_GET_PROPERTIES_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_METADATA_GET_PROPERTIES_TEST_001';
      console.info(TAG, testName, 'metadataType');
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let pictureObj = await createPictureSUPP(context);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      let metaData: image.Metadata | null = await pictureObj.getMetadata(metadataType);
      try {
        await metaData.getProperties(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        await pictureObj?.release();
        done();
      }
    });
    /**
     * @tc.name   IMAGE_METADATA_GET_PROPERTIES_TEST_002
     * @tc.number IMAGE_METADATA_GET_PROPERTIES_TEST_002
     * @tc.desc   getProperties the first parameter is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUM
     * @tc.level  Level 1
     */
    it('IMAGE_METADATA_GET_PROPERTIES_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_METADATA_GET_PROPERTIES_TEST_002';
      console.info(TAG, testName, 'metadataType');
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let pictureObj = await createPictureSUPP(context);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      let metaData: image.Metadata | null = await pictureObj.getMetadata(metadataType);
      try {
        await metaData.getProperties(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        await pictureObj?.release();
        done();
      }
    });
    /**
     * @tc.number     SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_PROPERTIES_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_PROPERTIES_TEST_001
     * @tc.desc       Metadata -makerNoteHuaweiMetadata -getProperties -null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_PROPERTIES_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_PROPERTIES_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      imageSourceApi = await getImageSource(path);
      try {
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties(null);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'makerNoteHuaweiMetadata getProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    });
    /**
     * @tc.number     SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_PROPERTIES_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_PROPERTIES_TEST_002
     * @tc.desc       Metadata -makerNoteHuaweiMetadata -getProperties -undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_PROPERTIES_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_PROPERTIES_TEST_002';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      imageSourceApi = await getImageSource(path);
      try {
        let metaData = await imageSourceApi.readImageMetadata();
        if (metaData != undefined && metaData.makerNoteHuaweiMetadata != undefined) {
          await metaData.makerNoteHuaweiMetadata.getProperties(undefined);
          expect().assertFail();
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'makerNoteHuaweiMetadata getProperties error', error.message, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    });
    /**
     * @tc.number     SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_ALL_PROPERTIES_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_ALL_PROPERTIES_TEST_001
     * @tc.desc       Metadata -makerNoteHuaweiMetadata -getAllProperties -返回值不为空
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_ALL_PROPERTIES_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_MAKER_NOTE_META_DATA_GET_ALL_PROPERTIES_TEST_001';
      let metadata: image.MakerNoteHuaweiMetadata = image.MakerNoteHuaweiMetadata.createInstance();
      try {
        let res = await metadata.getAllProperties();
        expect(isEmpty(res)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_001
     * @tc.name       SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_001
     * @tc.desc       Metadata -ExifMetadata -getAllProperties -返回值不为空
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_001';
      const path = 'test_exif_v2.jpg';
      let testExifMetadata = image.ExifMetadata.createInstance();
      testExifMetadata.imageWidth = 0;
      imageSourceApi = await getImageSource(path);
      try {
        let metaData = await imageSourceApi.readImageMetadata(["ImageWidth", "ImageLength"]);
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          let res = await metaData.exifMetadata.getAllProperties();
          expect(res != undefined).assertTrue();
        } else {
          console.error(TAG, testName, 'metadata is null. ');
          expect().assertFail();
        }
      } catch (error) {
        console.error(TAG, testName, 'ExifMetadata getProperties error', error.message, error.code);
        expect().assertFail();
        done();
      } finally {
        await imageSourceApi?.release();
        done();
      }
    });
    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_002
     * @tc.name       SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_002
     * @tc.desc       Metadata -ExifMetadata -getAllProperties -返回值为undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_TEST_002';
      let testExifMetadata: image.ExifMetadata = image.ExifMetadata.createInstance();
      try {
        let res = await testExifMetadata.getAllProperties();
        expect(res).assertUndefined();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
  });
}